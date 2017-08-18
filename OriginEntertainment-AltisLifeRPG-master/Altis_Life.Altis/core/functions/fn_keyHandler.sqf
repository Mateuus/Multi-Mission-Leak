/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
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
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(isNil "life_blinker_active") then {
life_blinker_active = false;
};

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

	// TAB key
	case 15:
	{
		if(!_alt && !_ctrlKey) then {
			
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_isDowned) then
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

	//Q: left signal
	case 16:
	{
		_veh = vehicle player;
		if(!life_blinker_active && alive _veh && _veh != player && ((driver _veh) == player) ) then {		
			[] spawn
			{
			life_blinker_active=true;
			sleep 2;
			life_blinker_active=false;
			};
			[_veh,"left"] call life_fnc_BlinkerInit;
		};
	};
	
	//E: right signal
	case 18:
	{
		_veh = vehicle player;
		
		if(alive _veh && !life_blinker_active && _veh != player && ((driver _veh) == player) ) then{
			[] spawn
			{
				life_blinker_active=true;
				sleep 1;
				life_blinker_active=false;
			};
			[_veh,"right"] call life_fnc_BlinkerInit;
		};
	};
	
	//Open Wanted - Will upgrade this to persistent wanted list
	case 2:
	{
		if (player getVariable["restrained",false]) then
		{
			hint "You cannot open your cell phone when you're restrained!";
		}
		else
		{
			if(dialog) exitWith {};
			[] call life_fnc_wantedMenu;
		};
	};
	
	//2 Cellphone
	case 3:
	{
		if (player getVariable["restrained",false]) then
		{
			hint "You cannot open your cell phone when you're restrained!";
		}
		else
		{
			createDialog "life_my_smartphone";
		};
	};
	
	//3 Market
	case 4:
	{
		if (playerSide == civilian && player getVariable["restrained",false]) then
		{
			hint "You cannot open the market when you're restrained! [ONLY FOR CIVILIAN USE]";
		}
		else
		{
			if(dialog) exitWith {};
			createDialog "life_dynmarket_prices";
		};
	};

	//Takwondo(Traditional Martial arts in korea)(Shift + 2)
	case 4:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Takwondo!!!"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};

	//Kneebend Slow(Shift + 3)
	case 5:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["KneeBend Slow baby~"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};

	//Kneebend Fast(Shift + 4)
	case 6:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["KneeBend more Hard!!!Move!!Move!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

	//Pushup(Shift + 5)
	case 7:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Pushup!!!!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	
	//Scared(Shift + 6)
	case 8:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["YOU SCARED BRUH!!!!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_Scared";
		};
	};
	
	//Scared(Shift + 7)
	case 9:
	{
	if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["YOU REALLY SCARED BRUH!!!!!!"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_Scared2";
		};
	};
	
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
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(currentWeapon player != "") then
		{
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		}else{
			if(!isNil "life_curWep_h" and {(life_curWep_h != "")} and life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
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
	
	//Restraining (Shift + R)
	case 19:
	{
		_veh = vehicle player;
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		if(_shift && playerSide == east && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		if(!life_blinker_active && alive _veh && _veh != player && ((driver _veh) == player) ) then {		
			[] spawn
			{
			life_blinker_active=true;
			sleep 2;
			life_blinker_active=false;
			};
			[_veh,"warning"] call life_fnc_BlinkerInit;
		};
	};

	//Shift+P = Faded Sound
	case 25: {
		if(_shift) then
		{
        [] call life_fnc_earplugs;
        _handled = true;
		};
	};
	
	 // O, police gate opener
	case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && ((playerSide == west) OR (playerSide == independent) OR (playerSide == east)) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		} else {
			if (((playerSide == west) OR (playerSide == east)) && (vehicle player == player)) then 
			{
				if(life_inv_spikeStrip > 0) then 
				{ 
					[false,"spikeStrip",1] call life_fnc_handleInv;
					[] spawn life_fnc_spikeStrip;
				};
			};
		};
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_isDowned) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
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
				if((vehicle player) in life_vehicles) then
				{
					player say3D "trunk_open";
					[vehicle player] call life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						player say3D "trunk_open";
						[cursorTarget] call life_fnc_openInventory;
					};
				};
			};
		};
	};
	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,east,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_01_repair_F","B_MRAP_01_F","I_Truck_02_medical_F","C_SUV_01_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide in [west,east]) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};
	};
	//Y Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call life_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33:
	{	if (!_shift) then
		{
		if(playerSide in [west,east,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
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
				if(playerSide in [west,east]) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
		if (_shift) then
		{
		if(playerSide in [west,independent,east] && vehicle player != player && !life_siren2_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren2_active = true;
				sleep 4.7;
				life_siren2_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if((_veh getVariable "siren2")) then
			{
				titleText ["Yelp Off","PLAIN"];
				_veh setVariable["siren2",false,true];
			}
				else
			{
				titleText ["Yelp On","PLAIN"];
				_veh setVariable["siren2",true,true];
				if(playerSide in [west,east]) then {
					[[_veh],"life_fnc_copSiren2",nil,true] spawn life_fnc_MP;
				} else {
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
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
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
						hint composeText [ image "icons\lock.paa", "House Locked" ];
						_veh say3D "unlock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
						hint composeText [ image "icons\unlock.paa", "House Unlocked" ];
						_veh say3D "unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_rear',1];
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
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
						};
						systemChat localize "STR_MISC_VehUnlock";
						hint composeText [ image "icons\unlock.paa", "Vehicle Unlocked" ];
						_veh say3D "unlock";
					} else {
						if(local _veh) then {
							_veh lock 2;
							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_rear',0];
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
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
						};	
						systemChat localize "STR_MISC_VehLock";
						hint composeText [ image "icons\lock.paa", "Vehicle Locked" ];
						_veh say3D "lock";
					};
				};
			};
		};
	};
};

if ((player getVariable["restrained",false] || player getVariable ["downed", false]) && _code in (actionKeys "Throw")) then
{
	systemChat "You can't throw something with your hands bound!";
	_handled = true;
};

if (_code in (actionKeys "User2")) then {
	if(!_alt && !_ctrlKey) then {
		if(player getVariable ["restrained", false]) then {
			hint "You cannot pick up items while you're restrained!";
		} else {
			closeDialog 0;
			createDialog "life_pickup_items";
			_handled = true;
		};
	};
};

if (_code in (actionKeys "User3")) then {
	if(!_alt && !_ctrlKey) then {
		if(player getVariable ["restrained", false]) then {
			hint "You cannot access your inventory while you're restrained!";
		} else {
			closeDialog 0;
			createDialog "life_inventory_menu";
			_handled = true;
		};
	};
};

if ((player getVariable["restrained",false]) && (_code in (actionKeys "ShowMap") || _code in (actionKeys "MiniMap") || _code in (actionKeys "MiniMapToggle"))) then
{
	systemChat "You can't view maps while restrained!" ;
	_handled = true;
};

if (_code in (actionKeys "TacticalView")) then
{
	hint "TacticalView Mode is disabled on Origin Life" ;
	_handled = true;
};
_handled;