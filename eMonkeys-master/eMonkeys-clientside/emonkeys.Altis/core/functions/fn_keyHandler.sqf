/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_blocked"];

_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];

_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_blocked = ((player getVariable ["gagged",false]) OR (player getVariable ["restrained",false]) OR (player getVariable ["restrainedciv",false]));

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_speakKey = if(count (actionKeys "PushToTalk") == 0) then {58} else {(actionKeys "PushToTalk") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

if(eM_speedblock) exitWith {};

[] spawn EMonkeys_fnc_resetspeedblock;

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])} && {(player getVariable ["restrainedciv",false])}) exitWith {
	true;
	
};

if(eM_action_inUse) exitWith {
	if(!eM_interrupted && _code in _interruptionKeys) then {eM_interrupted = true;};
	_handled;
	eM_speedblock = true;
};

switch (_code) do
{

	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn EMonkeys_fnc_copMarkers; [] spawn EMonkeys_fnc_gpsMarker;}};
			case independent: {if(!visibleMap) then {[] spawn EMonkeys_fnc_medMarkers; [] spawn EMonkeys_fnc_medicMarkers; [] spawn EMonkeys_fnc_gpsMarker;}};
			case civilian: {if(!visibleMap) then {[] spawn EMonkeys_fnc_gpsMarker;}};
			case east: {if(!visibleMap) then {[] spawn EMonkeys_fnc_gpsMarker;}};
		};
	};
	
	case _speakKey:
	{
		if(currentChannel == 6) then 
		{
			setCurrentChannel 5;
		};
		[] call EMonkeys_fnc_speak;
	};
	
	case 1:
	{
		if(side player in [east,civilian]) then
		{
			[0] call SOCK_fnc_updatePartial; eM_speedblock = true;
		};
	};
	
	//4 Quick Wanted List
	case 5:
	{
		if(playerSide == west) then
		{
			[] call EMonkeys_fnc_wantedMenu; eM_speedblock = true;
		};
	};
	
	//Ausweis öffnen
	case 3:
	{	
		if(_blocked) exitWith {};
		if(count eM_ausweis > 0) then 
		{
			[] call EMonkeys_fnc_ausweismein; eM_speedblock = true;
		};
	};
	
	//Ohropax benutzen
	case 4:
	{	
		[] spawn EMonkeys_fnc_Ohropax; eM_speedblock = true;
	};
	
	//1 PlayerTags
	case 2:
	{
		eM_speedblock = true;
		if(!visibleMap && {alive player} && !dialog && !(player getVariable["onkill",FALSE]) && !eM_PlayerTags_active) then {
			[] spawn {
			eM_PlayerTags_active = true;
			EMonkeys_ID_PlayerTags = ["EMonkeys_PlayerTags","onEachFrame","EMonkeys_fnc_playerTags"] call BIS_fnc_addStackedEventHandler;
			uisleep 15;
			[EMonkeys_ID_PlayerTags,"onEachFrame"] call BIS_fnc_removeStackedEventHandler;
			500 cutText["","PLAIN"];
			eM_PlayerTags_active = false;
			};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(playerSide == west && vehicle player != player && !eM_siren3_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
						
                eM_siren3_active = true;
                uisleep 7.3;
                eM_siren3_active = false;
            };
            _veh = vehicle player;
            if(isNil {_veh getVariable "siren3"}) then {_veh setVariable["siren3",false,true];};
            if((!eM_siren3_active)) then
            {
				_veh setVariable["siren3",true,true];
				[[_veh],"EMonkeys_fnc_copWarning",nil,true] call EMonkeys_fnc_mp;
			};                    
        };

		if(playerSide == independent && vehicle player != player && !eM_siren2_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				eM_siren2_active = true;
				uisleep 2.9;
				eM_siren2_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if((_veh getVariable "siren2")) then
			{
				titleText ["Sirene AUS","PLAIN"];
				_veh setVariable["siren2",false,true];
			}
				else
			{
				titleText ["Sirene AN","PLAIN"];
				_veh setVariable["siren2",true,true];
				[[_veh],"EMonkeys_fnc_medsiren2",nil,true] call EMonkeys_fnc_mp;
			};
		};

		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			EMonkeys_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "EMonkeys_curWep_h" && {(EMonkeys_curWep_h != "")}) then {
			if(EMonkeys_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon EMonkeys_curWep_h;
			};
		};
	};
	
	// Inventory open prevent
	case 23:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if (!(isNull (findDisplay 602)) && (isPlayer cursorTarget OR vehicle cursorTarget != cursorTarget OR ((alive cursorTarget) && !( cursorTarget getVariable["onkill",FALSE])))) then
		{
			closeDialog 0;
			closeDialog 0;
		};
	};
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(!eM_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn EMonkeys_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				eM_action_inUse = false;
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
	
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,east,independent]) && ((alive cursorTarget) && !( cursorTarget getVariable["onkill",FALSE])) && cursorTarget distance player < 3.5 && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="AinjPfalMstpSnonWnonDf_carried_fallwc" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && !(cursorTarget getVariable "Escortingciv") && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && !(cursorTarget getVariable "restrainedciv") && speed cursorTarget < 1) then
		{
		
				[] call EMonkeys_fnc_restrainAction;
				hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";

		}
		else
		{
			if(_shift && (side player in [east,civilian]) && (license_civ_rebel) && (license_civ_restrain) && !isNull cursorTarget && cursorTarget isKindOf "Man" && (animationState cursorTarget=="Incapacitated" or animationState cursorTarget=="amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon") && (isPlayer cursorTarget) && ((alive cursorTarget) && !( cursorTarget getVariable["onkill",FALSE])) && cursorTarget distance player < 4 && !(cursorTarget getVariable "Escortingciv") && !(cursorTarget getVariable "restrained") && !(cursorTarget getVariable ["restrainedciv", false]) && !(player getVariable ["restrained", false]) && !(player getVariable ["restrainedciv", false]) && speed cursorTarget < 2  && !eM_paintball) then
			{
	
				if([false,"handcuffs",1] call EMonkeys_fnc_handleInv) then
				{
					[] call EMonkeys_fnc_restrainActionciv;
					hint "Benutze die Action10-Taste, um weitere Aktionen anzuzeigen";
				}
				else
				{
					hint "Du hast keine Kabelbinder dabei!";
				};
			};
		
		};

	};
	
	//Knock out, this is experimental and yeah... G Key
	case 34:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
	
		if(!_shift && _ctrlKey) then {_handled = true;};
		
		if(!_shift && _ctrlKey && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && (!(cursorTarget getVariable "onkill")) && cursorTarget distance player < 4 && speed cursorTarget < 1  && !eM_paintball)  then
		{

			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !eM_knockout && !(player getVariable["restrained",false]) && !(player getVariable["restrainedciv",false]) && !eM_istazed  && !eM_paintball) then
			{
				[cursorTarget] spawn EMonkeys_fnc_knockoutAction;
			};
			
		};
		if(_shift && !_ctrlKey) then 
		{
			_handled = true;
		};
		
		if (_shift && !_ctrlKey) then
		{
		
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["restrainedciv", false]) && (animationState player) != "Incapacitated" && !eM_istazed  && !eM_paintball) then
			{
	
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} 
				else
				{
					[] spawn EMonkeys_fnc_surrender;
				};
		
			};
		};
	};
	
	//Takwondo(Traditional Martial arts in korea)(Shift + Num 1)
	case 79:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Taekwondo"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
		};
	};

	//Kneebend Slow(Shift + Num 2)
	case 80:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Kniebeugen"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};	
	};

	//Kneebend Fast(Shift + Num 3)
	case 81:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Schnelle Kniebeugen"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

	//Pushup(Shift + Num 4)
	case 75:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Liegestütz"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};

	//Pushup(Shift + Num 5)
	case 76:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Pinkeln"], "PLAIN DOWN"];
			player playMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
		};
	};
	
	case 77:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Hi"], "PLAIN DOWN"];
			player playactionnow 'GestureHi';
		};
	};
	
	case 71:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Kopfnicken"], "PLAIN DOWN"];
			player playactionnow 'gestureNod';
		};
	};

	//L Key?
	case 38: 
	{
		eM_speedblock = true;
		
		if(_shift && playerSide in [west,independent]) then 
		{
			if(_shift && playerSide in [west,independent]) then 
			{
			if(vehicle player != player && (typeOf vehicle player) in ["I_MRAP_03_hmg_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_bench_F","B_Quadbike_01_F","C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","I_MRAP_03_F","I_Heli_light_03_unarmed_F","I_Heli_light_03_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","C_Hatchback_01_sport_F","O_Truck_03_transport_F","O_Truck_03_covered_F","O_Truck_03_medical_F","I_Truck_02_medical_F","B_Truck_01_medical_F","B_Truck_01_transport_F","C_Van_01_box_F"]) then {
					if(playerSide == west) then 
					{
						[vehicle player] call EMonkeys_fnc_sirenLights;
					} 
					else 
					{					
						if(playerSide == independent) then 
						{
							[vehicle player] call EMonkeys_fnc_medicSirenLights;
						};
					};
				};
				_handled = true;		
			};
		};
		if(!_alt && !_ctrlKey) then { [] call EMonkeys_fnc_radar; };
	};
	
	// B, police gate opener
    case 48:
	{
		eM_speedblock = true;
		if (!_shift && !_alt && !_ctrlKey && (playerSide in [west,independent] && (vehicle player != player))) then {
			[] call EMonkeys_fnc_copOpener;
		};
	};

	//Y Player Menu
	case 21:
	{
		eM_speedblock = true;
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call EMonkeys_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33:
    { 
		eM_speedblock = true;   
		if(_shift) then
        {
			if(playerSide == west && vehicle player != player && !eM_siren2_active && ((driver vehicle player) == player)) then
			{
				[] spawn
				{
					eM_siren2_active = true;
					uisleep 1.2;
					eM_siren2_active = false;
				};
				_veh = vehicle player;
				if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
				if((!eM_siren2_active)) then
				{
				   _veh setVariable["siren2",true,true];
					[[_veh],"EMonkeys_fnc_copsiren2",nil,true] call EMonkeys_fnc_mp;
					
				};                    
			};	
		};
			
        if (!_shift) then
        {
			if(playerSide in [west,independent] && vehicle player != player && !eM_siren_active && ((driver vehicle player) == player)) then
            {
                [] spawn
                {
                    eM_siren_active = true;
                    uisleep 4.7;
                    eM_siren_active = false;
                };
                _veh = vehicle player;
                if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
                if((_veh getVariable "siren")) then
                {
                    titleText ["Sirens Off","PLAIN"];
                    _veh setVariable["siren",false,true];
                }
                    else
                {
                    titleText ["Sirens On","PLAIN"];
                    _veh setVariable["siren",true,true];
					if(playerSide == west) then 
					{
						[[_veh],"EMonkeys_fnc_copSiren",nil,true] call EMonkeys_fnc_mp;
					} 
					else
					{
						//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
						[[_veh],"EMonkeys_fnc_medicSiren",nil,true] call EMonkeys_fnc_mp;
					};
				};                                            
			};
		};
	};
	
	//V Key
	case 47:
	{	
		eM_speedblock = true;
		if((player getVariable "restrained") OR (player getVariable "transporting") OR (player getVariable "restrainedciv") OR (player getVariable "transportingciv")) then { _handled = true; };
	};
	
	case 40:
	{	
		eM_speedblock = true;
		if((player getVariable "restrained") OR (player getVariable "transporting") OR (player getVariable "restrainedciv") OR (player getVariable "transportingciv")) then { _handled = true; };
	};
	case 43 :
	{
		eM_speedblock = true;
		if((player getVariable "restrained") OR (player getVariable "transporting") OR (player getVariable "restrainedciv") OR (player getVariable "transportingciv")) then { _handled = true; };
	};
	
	//U Key
	case 22:
	{
		if(_blocked) exitWith {};
		eM_speedblock = true;
		
		if(!_alt && !_ctrlKey) then
		{
		
			if(!(player getVariable "restrained") && !(player getVariable "transporting") && !(player getVariable "restrainedciv") && !(player getVariable "transportingciv") && !(player getVariable "Escortingciv") && !(player getVariable "Escorting")) then 
			{
				if(vehicle player == player) then
				{
					_veh = cursorTarget;
				}
					else
				{
					_veh = vehicle player;
				};
			
				_locked = locked _veh;
			
				if(_veh in EMonkeys_vehic164 && player distance _veh < 12 ) then
				{
					if(!(typeOf _veh in _boxType)) then
					{
					if(_locked == 2) then
					{
						if(local _veh) then
						{
							_veh lock 0;
						}
							else
						{
							[[_veh,0], "EMonkeys_fnc_lockVehicle",_veh,false] call EMonkeys_fnc_mp;
						};

							_veh say3D "UnLockCarSound";
			                hintSilent parseText "<img size='1' color='#FFFFFF' image='core\textures\icons\unlock.paa'/><t size='1'> Sie haben Ihr Fahrzeug aufgeschlossen.</t>";
					}
						else
					{
						if(local _veh) then
						{
							_veh lock 2;
						}
							else
						{
							[[_veh,2], "EMonkeys_fnc_lockVehicle",_veh,false] call EMonkeys_fnc_mp;
						};
							_veh say3D "LockCarSound";
							hintSilent parseText "<img size='1' color='#FFFFFF' image='core\textures\icons\lock.paa'/><t size='1'> Sie haben Ihr Fahrzeug abgesperrt.</t>";
						};
					};
				};
			};
			
		};
	};
};

_handled;