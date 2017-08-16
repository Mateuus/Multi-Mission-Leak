#include <macro.h>
/*
	File: fn_keyHandler.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys","_fedDistance"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_stopEscortingInBuildingTarget = "";

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
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
			_handle = [] spawn tanoarpg_fnc_actionKeyHandler;
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
		if(life_jumpActionTime <= time) then
		{
			if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5}) then {
				life_jumpActionTime = (time + 5); //Update the time.
				[player,true] spawn tanoarpg_fnc_jumpFnc; //Local execution
				[player,false] remoteExec ["tanoarpg_fnc_jumpFnc", -2, FALSE];
				_handled = true;
			};
		} else {
			systemChat "Du kannst nur alle 5 Sekunden springen!";
		};
	};
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn tanoarpg_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn tanoarpg_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn tanoarpg_fnc_gangMarkers;}};
			case east: {if(!visibleMap) then {[] spawn tanoarpg_fnc_imperiumMarkers;}};
		};
	};
	
	case 23:	//Inventory Prevent Doppeln
	{
		[] spawn
		{
			[] call tanoarpg_fnc_saveGear;
			life_tempgear = life_gear;
		
			life_tempput = ["Put:"];
			life_temptake = ["Take:"];
			life_tempputhandler = -1;
			life_temptakehandler = -1;
		
			_waitmaxtime = time + 15;
			waitUntil {((!(isNull (findDisplay 602))) || (_waitmaxtime <= time))};
		
			if(((findDisplay 602) displayAddEventHandler ["Unload", 
				{
					[3] call XAS_fnc_updatePartial;
					player removeEventHandler ["Put", life_tempputhandler];
					player removeEventHandler ["Take", life_temptakehandler];
				
					mvh setVariable[format["InInvTemp%1", getPlayerUid player], nil, true];
					mvh setVariable[format["InInvPut%1", getPlayerUid player], nil, true];
					mvh setVariable[format["InInvTake%1", getPlayerUid player], nil, true];
				}]) != -1) then
			{
				mvh setVariable[format["InInvTemp%1", getPlayerUid player], life_tempgear, true];
				mvh setVariable[format["InInvPut%1", getPlayerUid player], life_tempput, true];
				mvh setVariable[format["InInvTake%1", getPlayerUid player], life_temptake, true];
		
				life_tempputhandler = player addEventHandler ["Put", 
				{
					life_tempput pushBack (_this select 2);
					mvh setVariable[format["InInvPut%1", getPlayerUid player], life_tempput, true];
				}];
				
				life_temptakehandler = player addEventHandler ["Take", 
				{
					life_temptake pushBack (_this select 2);
					mvh setVariable[format["InInvTake%1", getPlayerUid player], life_temptake, true];
				}];
			};
		};
		
		[] spawn
		{
			_waitmaxtime2 = time + 15;
			life_inInventory = true;
			waitUntil {((!(isNull (findDisplay 602))) || (_waitmaxtime2 <= time))};
			if(((findDisplay 602) displayAddEventHandler ["Unload", { life_inInventory = false; }]) != -1) then
			{
				[] spawn
				{
					_maxwhile1 = 10;
					while {life_inInventory && _maxwhile1 > 0} do
					{
						_maxwhile1 = _maxwhile1 - 1;
						if(life_inEsc) then
						{
							[player, player, 1, "[ANTI-DOPPEL-SYSTEM]", "Hat Inv/ESC Menu gleichzeitig offen | BEI DOPPEL FOLGT EXTRA LOG" , "[MÖGLICHES DOPPEL]"] remoteExec ["TEX_FNC_LOGIT", 2];
							_maxwhile1 = 0;
						};
						sleep 0.5;
					};
				};
			} else {
				life_inInventory = false;
			};
		};
	};
	
	case 1:		//ESC
	{
		[] spawn
		{
			_waitmaxtime3 = time + 15;
			life_inEsc = true;
			waitUntil {((!(isNull (findDisplay 49))) || (_waitmaxtime3 <= time))};
			if(((findDisplay 49) displayAddEventHandler ["Unload", { life_inEsc = false; }]) != -1) then
			{
				[] spawn
				{
					_maxwhile2 = 10;
					while {life_inEsc && _maxwhile2 > 0} do
					{
						_maxwhile2 = _maxwhile2 - 1;
						if(life_inInventory) then 
						{
							[player, player, 1, "[ANTI-DOPPEL-SYSTEM]", "Hat ESC/Inv Menu gleichzeitig offen | BEI DOPPEL FOLGT EXTRA LOG" , "[MÖGLICHES DOPPEL]"] remoteExec ["TEX_FNC_LOGIT", 2];
							_maxwhile2 = 0;
						};
						sleep 0.5;
					};
				};
			} else {
				life_inEsc = false;
			};
		};
	};
	
	//Surrender... shift + g
	case 34:
	{
		if(_shift) then {_handled = true;};

		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn tanoarpg_fnc_surrender;
				};
			};
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
	
	//Skip Intro Enter
	/*case 28:
	{
		if(life_intro_playing) then
		{
			diag_log "Intro Video übersprungen";
			[""] spawn BIS_fnc_playVideo;
			life_intro_playing = false;
		};
	};*/
	
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn tanoarpg_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	//V
	case 47:
	{
		if(_shift) then {_handled = true;};
		if(player getVariable ["restrained", false]) exitWith {};
		if(!life_insafezone && !life_isknockedout) then
		{
			if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
			{
				if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
				{
					[cursorTarget] spawn tanoarpg_fnc_knockoutAction;
				};
			};
			if(_shift && playerSide == east && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
			{
				if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
				{
					[cursorTarget] spawn tanoarpg_fnc_knockoutAction;
				};
			};
		};
	};
	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && ((speed cursorTarget) < 1) && (!life_EinsatzschildInUse)) then
		{
			[] call tanoarpg_fnc_restrainAction;
		};
	};

	case 12:
	{
		//Script by cat24max
		_stopEscortingInBuildingTarget = nearestObject [player, "C_man_1"]; //Gets the nearest Civilian
		if(!(playerSide == west) && (isNull _stopEscortingInBuildingTarget))  exitWith {}; //Only for cops to minimize abuse
		[_stopEscortingInBuildingTarget] call tanoarpg_fnc_stopEscorting; //Calls stop escorting for the Cursor Target
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
					[vehicle player] call tanoarpg_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F"
				OR typeof cursorTarget in life_container) && 
				player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call tanoarpg_fnc_openInventory;
					};
					if (cursorTarget isKindOf "Land_Wreck_Traw_F" OR cursorTarget isKindOf "Land_Wreck_Traw2_F") then
					{	
						[cursorTarget] spawn life_fnc_openInventory;
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
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_01_repair_F","C_Van_01_box_F","B_MRAP_01_F","I_MRAP_03_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Hatchback_01_F","C_Van_01_box_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call tanoarpg_fnc_sirenLights;
					} else {
						[vehicle player] call tanoarpg_fnc_sirenLights;
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey && !_shift && (playerSide == west) && ((vehicle player) == player) && ((speed player) == 0) && ((currentWeapon player) == "Rangefinder")) then {
			[] call tanoarpg_fnc_radar;
		};
		
		//Licht für Kart
        if(playerSide == civilian) then {
            if(vehicle player != player && (typeOf vehicle player in ["C_Kart_01_F","C_Kart_01_Fuel_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F"])) then 
			{
				[vehicle player] call tanoarpg_fnc_cartLights;
				_handled = true;
            };
        };
	};
	
	case 48:
	{
		if(!_alt && !_ctrlKey && !_shift && ((driver (vehicle player)) != player) && ((vehicle player) != player) && (playerSide == west)) then {
			[] call tanoarpg_fnc_radar;
		};
	};
	
	//STRG+ A AUFBAUEN COP STATION
	case 30:
	{
		if(!_alt && _ctrlKey && !dialog && !_shift && playerSide == west) then
		{
			if("B_Truck_01_mover_F" == typeOf (vehicle player) && player == driver (vehicle player)) then
			{
				if((speed _vehicle) > 0) exitWith {hint "Fahrzeug muss stillstehen bevor es sich aufbaut !!!"};
				
				[vehicle player] remoteExec ["TEX_fnc_mobileCopStation", 2];
				
				//OPEN T INVENTAR MIT NAGELBÄNDERN UND STRAßENSPERREN
				if(vehicle player != player && (vehicle player) in life_vehicles && alive vehicle player) then
				{
					[vehicle player] call tanoarpg_fnc_openInventory;
				};
				_handled = true;
			};
		};
	};
	
	//Z Player Menu
	case 21:
	{
		if(!_alt && !_ctrlKey && !dialog) then
		{
			[] call tanoarpg_fnc_p_openMenu;
		};
	};
	
	//F Key
	case 33:
	{
		if (vehicle player != player && (typeOf vehicle player) in["B_Truck_01_transport_F"]) exitWith {hint "Sirene nicht verfügbar"};
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.5;
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
					[_veh] remoteExec ["tanoarpg_fnc_copSiren", -2, true];
				} else {
					[_veh] remoteExec ["tanoarpg_fnc_medicSiren", -2, true];
				};
			};
		};
	};
	
	//Überfallnachricht Shift+C
    case 46:
    {
		if(_shift && side player == civilian && !_alt && !_ctrlKey && !life_insafezone) then
		{
			[] call tanoarpg_fnc_ueberfallNachricht;
		};
    };
	
	//P Key
	case 25:
	{
		if (vehicle player != player && (typeOf vehicle player) in["C_Offroad_01_repair_F","B_Truck_01_transport_F"]) exitWith {hint "Sirene nicht verfügbar"};
		if(playerSide in [west] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 3;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "sirenegen"}) then {_veh setVariable["sirenegen",false,true];};
			if((_veh getVariable "sirenegen")) then
			{
				titleText ["Warnton AUS","PLAIN"];
				_veh setVariable["sirenegen",false,true];
			}
				else
			{
				titleText ["Warnton AN","PLAIN"];
				_veh setVariable["sirenegen",true,true];
				if(playerSide == west) then {
					if((__GETC__(life_coplevel)) > 3) then {
						[_veh] remoteExec ["tanoarpg_fnc_copSireneGen", -2, true];
					};
				};
			};
		};
	};
	
	//Ö Key
	case 39:
	{
		if(playerSide in [west] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren2"}) then {_veh setVariable["siren2",false,true];};
			if((_veh getVariable "siren2")) then
			{
				titleText ["Warnung AUS","PLAIN"];
				_veh setVariable["siren2",false,true];
			}
				else
			{
				titleText ["Warnung AN","PLAIN"];
				_veh setVariable["siren2",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["tanoarpg_fnc_copSiren2", -2, true];
				} else {
					[_veh] remoteExec ["tanoarpg_fnc_medicSiren", -2, true];
				};
			};
		};
	};
	
	//Shift+O Zipties
	case 24:
	{
		if(_shift) then {_handled = true;};
		if(playerSide in [west,independent]) exitWith {};
		if(life_insafezone) exitWith {};
		if(life_isknockedout) exitWith {};
		if(player getVariable ["restrained", false]) exitWith {};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,west,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if([false,"zipties",1] call tanoarpg_fnc_handleInv) then
			{
				[] call tanoarpg_fnc_restrainAction;
				hint "Du hast ihn Festgenommen ! Mit dem Interaktionsmenü kannst zu weiter fortfahren.";
			} else {
				hint "Du hast keine Kabelbinder";
			};
		};
		if(_shift && playerSide == east && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,west,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			if([false,"zipties",1] call tanoarpg_fnc_handleInv) then
			{
				[] call tanoarpg_fnc_restrainAction;
				hint "Du hast ihn Festgenommen ! Mit dem Interaktionsmenü kannst zu weiter fortfahren.";
			} else {
				hint "Du hast keine Kabelbinder";
			};
		};
	};
	
	//U Key
	case 22:{
			if(!_alt && !_ctrlKey) then {
				if(vehicle player == player) then {
					_veh = cursorTarget;
				} else {
					_veh = vehicle player;
				};
			if(life_lockingCar <= time) then {
				if(_veh isKindOf "House_F" && playerSide == civilian) then {
					if(_veh in life_vehicles && player distance _veh < 17) then {
						_door = [_veh] call tanoarpg_fnc_nearestDoor;
						if(_door == 0) exitWith {hint "Du befindest dich nicht neben einer Tür"};
						_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
						if(_locked == 0) then {
							_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
							_veh animate [format["door_%1_rot",_door],0];
							systemChat "Du hast die Tür abgesperrt.";
						} else {
							_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
							_veh animate [format["door_%1_rot",_door],1];
							systemChat "Du hast die Tür aufgesperrt.";
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
								[_veh,0] remoteExec ["tanoarpg_fnc_lockVehicle", _veh, false];
								
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
							systemChat "Du hast Dein Fahrzeug aufgeschlossen.";
							[_veh, "unlock"] remoteExec ["tanoarpg_fnc_playSound3D", -2];
							hint composeText [ image "icons\unlock.paa", " Fahrzeug aufgeschlossen" ];
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
								[_veh,2] remoteExec ["tanoarpg_fnc_lockVehicle", _veh, false];
								
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
							systemChat "Du hast Dein Fahrzeug abgeschlossen.";
							[_veh, "car_lock"] remoteExec ["tanoarpg_fnc_playSound3D", -2];
							hint composeText [ image "icons\lock.paa", " Fahrzeug abgeschlossen" ];
						};
					};
				};
				life_lockingCar = (time + 2);	//ERST WIEDER IN 2 SEKUNDNE AUFSPERREN
			} else {
				systemChat "Nicht so schnell!";
			};
		};
	};
	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player) && ((typeOf vehicle player) in ["B_Heli_Light_01_F","O_T_VTOL_02_vehicle_F","I_Heli_light_03_unarmed_F"])) then
        {
            [] call tanoarpg_fnc_openEmpMenu;
        };
    };
	
	//Pickaxe - CIRCULUMFLEX
	case 41:
	{
		if((!life_action_inUse) && (vehicle player == player) ) then
		{
			life_action_inUse = true;
			_bug = 1;
			{
				_str = [_x] call tanoarpg_fnc_varToStr;
				_val = missionNameSpace getVariable _x;
				if(_val > 0 ) then
				{
					if( _str == "Spitzhacke" || _str == "pickaxe" ) then
					{
						[] spawn tanoarpg_fnc_pickAxeUse;
						_bug = 0;
					};
				};
			} foreach life_inv_items;
			if(_bug == 1) then {life_action_inUse = false;};
		}
	};
	
	//SmartPhone  Shift + 1
	case 2:
	{
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] call tanoarpg_fnc_callCellPhone;
			};
		};
	};
	
	//Wanted List Shift + 2
	case 3:
	{
		if(playerSide in [independent,civilian,east]) exitWith {};
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] call tanoarpg_fnc_wantedMenu;
			};
		};
	};
	
	//Wanted List Shift + 3
	case 4:
	{
		if(playerSide in [independent,civilian,east]) exitWith {};
		if(_shift) then {_handled = true;};
		if (_shift) then
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				createDialog "life_wantedadd2";
			};
		};
	};

	// Ä Schranken öffnen
    case 40:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide in [west,independent]) && (vehicle player != player)) then {
			[] call tanoarpg_fnc_copOpener;
		};
	};

	//Ü Nagelbänder
	case 26:
	{	
		if(vehicle player != player) exitWith {hint "Du kannst nicht in einem Fahrzeug Nagelbänder auslegen.."};
		if(playerSide == west) then {
		
		if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
		if(([false,"spikeStrip",1] call tanoarpg_fnc_handleInv)) then
		{
			[] spawn tanoarpg_fnc_spikeStrip;
		};
		
		};
	};
	
	//DANCEMOVES :D
	//ShiftNum1
	case 79:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				cutText [format["Move: Takwondo"], "PLAIN DOWN"];
				player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
			};
	};
	
    case 75:
    {
        if (_alt && (vehicle player == player)) then
        {
            player playAction "gesturePoint";
            hint '"Brofist"';
        };
    };
	
    //GESTURES: "Winken" - ALT + NUM5
    case 76:
    {
        if (_alt && (vehicle player == player)) then
        {
            player playAction "gestureCeaseFire";
            hint '"Hallo!"';
        };
    };
	
	case 77:
    {
        if (_alt && (vehicle player == player)) then
        {
            player playAction "gestureGo";
            hint '"Da lang!"';
        };
    };

	//ShiftNum2
	case 80:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Move: Kniebeugen langsam"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
		};
	};
	
	//ShiftNum3
	case 81:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Move: Kniebeugen schnell"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		};
	};

	//ShiftNum4
	case 75:
	{
		if(_shift) then {_handled = true;};
		if ((_shift) && (vehicle player == player)) then
		{
			cutText [format["Move: Liegestützen"], "PLAIN DOWN"];
			player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
		};
	};
	//SCHADE SCHON WIEDER VORBEI DES DANCEN :D
	
	case 62: // F4 + ALT
	{
		if(_alt && !_shift) then {
			hint "Mit Alt + F4 zu trennen ist Verboten (CombatLog)";
		};
    };
	
	//Shift+ bild hoch = Faded Sound
	case 207:
	{
		if(!_alt && !_ctrlKey) then {
			switch (player getVariable["Earplugs",0]) do {
				case 0: {hintSilent "Ear Plugs 90%"; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; };
				case 10: {hintSilent "Ear Plugs 60%"; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; };
				case 40: {hintSilent "Ear Plugs 30%"; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; };
				case 70: {hintSilent "Ear Plugs Removed"; 1 fadeSound 1; player setVariable ["Earplugs", 0]; };
			};
		};
	};
};
_handled;