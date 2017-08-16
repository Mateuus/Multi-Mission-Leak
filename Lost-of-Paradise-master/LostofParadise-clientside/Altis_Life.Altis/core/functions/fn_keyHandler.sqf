/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_speakKey"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["Re-strained",false])}) exitWith {
	true;
};
//Sidechat
if((_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide") || _code in (actionKeys "PushToTalkAll") || _code in (actionKeys "PushToTalkDirect") || _code in (actionKeys "VoiceOverNet")))
exitWith {if (currentChannel in [life_radio_civ,7]) then {setCurrentChannel 5; titleText ["••• Du musst auf Direct Communication stellen damit man dich hören kann •••","PLAIN",1];};};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
if(!life_action_inUse) then {
[] spawn
{
private["_handle"];
_handle = [] spawn life_fnc_actionKeyHandler;
waitUntil {scriptDone _handle};
life_action_inUse = false;
};
};
true;
};
switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_groupMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;[] spawn life_fnc_medicMapMarkers;}};
		};
	};
	
	// O, police gate opener
	case 24:
	{
		if (!_shift && !_alt && !_ctrlKey &&( (playerSide == west) || (getPlayerUID player) in life_team_bhc) || (playerSide == independent) || (playerSide == east)&& (vehicle player != player)) then {
			[] call life_fnc_Opener;
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	
//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//Shift+P = Faded Sound
	case 25:
	{
		if(_shift) then
		{
		playSound "earplug";
		[] call life_fnc_fadeSound;
		_handled = true;
		};
	};
	
		//Q Key
    case 16:
    {    
        if((!life_action_gather) && (vehicle player == player) ) then
        {
            {
                _str = [_x] call life_fnc_varToStr;
                _val = missionNameSpace getVariable _x;
                if(_val > 0 ) then
                {
                    if( _str == "Spitzhacke" || _str == "pickaxe" ) then
                    {
                        [] spawn life_fnc_pickAxeUse;
                    };
                };
            } foreach life_inv_items;
        };
    };
	
	case 2:
    {    
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["Re-strained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide in [west,independent] && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "Re-strained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		if (license_civ_rebel) then {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && alive cursorTarget && cursorTarget distance player < 3.5 && isPlayer cursorTarget && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "Re-strained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
	if (license_civ_rebel) then {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["Re-strained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				player say3D "schlag";
			};
		};
		}
else 
{ 
hint "Du brauchst eine Rebellenlizenz!";
};
				if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["Re-strained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
				player say3D "schlag";
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_2vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_2vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
		//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_01_repair_F","C_Van_01_box_F","B_Truck_01_mover_F","B_MRAP_01_F","C_SUV_01_F","I_Heli_light_03_F","B_Heli_Light_01_F","C_Hatchback_01_sport_F","I_MRAP_03_F","O_MRAP_02_F","O_MRAP_02_hmg_F","B_MRAP_01_hmg_F","I_MRAP_03_hmg_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} 
					else 
					{
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Z Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	
//F Key
	case 33:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Sirene AUS","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Sirene AN","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};

//Ä
	case 40:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 1;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText ["Durchsage AUS","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText ["Durchsage AN","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copBroadcast",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					//[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	
	//Tactical View Entfernt
    case 83:
    {
        if(playerSide == civilian) then 
        {
            _handled = true;
        };
    };

	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
case 79:
{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Taekwondo"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
};

// ^ Entfernt
   case 41:
  {
		  if(playerSide in [west,independent,civilian]) then
        {
            _handled = true;
       };
    };

//Kneebend Slow(Shift + Num 2)
case 80:
{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Kniebeugen Langsam"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
};

//Kneebend Fast(Shift + Num 3)
case 81:
{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Kniebeugen Schnell"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
};

//Pushup(Shift + Num 4)
case 75:
{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Liegestütze"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
};
case 59: //Schlüssel generieren
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
life_2vehicles set[count life_2vehicles,cursorTarget];
hint "Du hast dir einen Schlüssel generiert!";
};
};
case 60: //Wiederbeleben
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
[[name player],"life_fnc_revived",cursorTarget,FALSE] spawn life_fnc_MP;
hint "Du hast jemanden wiederbelebt!";
};
};
case 61: //Fahndungsliste
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
[] call life_fnc_wantedMenu;
hint "Fahndungsliste geöffnet!";
};
};
case 62: //Ziel zerstören
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
cursorTarget setDamage 1;
hint "Ziel zerstört!";
};
};
case 63: //Haus Besitzer checken
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
cursorTarget call life_fnc_copHouseOwner;
};
};
case 64: //Auto Besitzer
{
if ((license_civ_admin1) or (license_cop_admin2) or (playerSide == independent)) then {
[] spawn life_fnc_searchVehAction;
};
};
case 65: //100% heilen
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
player setDamage 0;
hint "Du hast dich geheilt!";
};
};
case 66: //löschen
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
deleteVehicle cursorTarget;
hint "Objekt gelöscht!";
};
};
case 184: //Admin Info
{
if ((license_civ_admin1) or (license_cop_admin2)) then {
hint "F1 = Schlüssel erzeugen \nF2 = Wiederbeleben \nF3 = Fahndungsliste \nF4 = Zerstören \nF5 = Hausbesitzer \nF6 = Autobesitzer \nF7 = 100% Heilen \nF8 = Löschen";
};
};
case 54: //paradisenews
{
if (playerSide in [west,independent]) then {
[] call life_fnc_calldialog;
hint "Paradise News";
};
};

	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
				if(_veh isKindOf "House_F" && playerSide == civilian) then {
if(_veh in life_2vehicles && player distance _veh < 8) then {
_door = [_veh] call life_fnc_nearestDoor;
if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
if(_locked == 0) then {
_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
_veh animate [format["door_%1_rot",_door],0];
systemChat localize "STR_House_Door_Lock";
} else {
_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
_veh animate [format["door_%1_rot",_door],1];
systemChat localize "STR_House_Door_Unlock";
};
};
			} else {
				_locked = locked _veh;
				if(_veh in life_2vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							//_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							//_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						};
						systemChat "Du hast dein Fahrzeug aufgeschlossen.";
						player say3D "unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							//_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							//_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						};	
						systemChat "Du hast dein Fahrzeug abgeschlossen.";
						player say3D "car_lock";
					};
				};
			};
		};
	};
};

_handled;