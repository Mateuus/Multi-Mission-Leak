#include "..\..\script_macros.hpp"
/*
*	File: fn_keyHandler.sqf
*	Author: Bryan "Tonic" Boardwine
*
*	Description:
*	Main key handler for event 'keyDown'
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = SEL(_this,0);
_code = SEL(_this,1);
_shift = SEL(_this,2);
_ctrlKey = SEL(_this,3);
_alt = SEL(_this,4);
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if((EQUAL(count (actionKeys "User10"),0))) then {219} else {(actionKeys "User10") select 0};
_mapKey = SEL(actionKeys "ShowMap",0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player GVAR ["restrained",false]) || (player GVAR ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(!(EQUAL(count (actionKeys "User10"),0)) && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn {
			private "_handle";
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

if (life_container_active) then {
	switch (_code) do {
		//space key
		case 57: {
			[life_container_activeObj] spawn life_fnc_placedefinestorage;
		};
	};
	true;
};

switch (_code) do {
	//Space key for Jumping
	case 57: 
	{
		if (!_shift) then
			{ // Case für Setzen von Objekten mit Leertaste!
			if ((playerSide == west || playerSide == independent) && life_barrier_active) then 
			{
				[] spawn life_fnc_setzenGetan;
				_handled = true;
			};
		}
		else 
		{
				if(isNil "jumpActionTime") then {jumpActionTime = 0;};
				if(_shift && {!(EQUAL(animationState player,"AovrPercMrunSrasWrflDf"))} && {isTouchingGround 	player} && {EQUAL(stance player,"STAND")} && {speed player > 2} && {!life_is_arrested} && {SEL((velocity player),2) < 2.5} && {time - jumpActionTime > 1.5}) then 
			{
				jumpActionTime = time; //Update the time.
				[player,true] spawn life_fnc_jumpFnc; //Local execution
				[player,false] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
				_handled = true;
			};
		};
	};
	
	// Key: Numpad 8
	// Objekte Setzen Menü
	case 72: 
	{
		if(_shift) then 
		{
			if(playerside == west && (FETCH_CONST(life_coplevel) >= 3)) then 
			{
				[] spawn life_fnc_setzenMenue;
				_handled = true;
			};
			if(playerside == independent && (FETCH_CONST(life_mediclevel) >= 2)) then 
			{
				[] spawn life_fnc_setzenMenue;
				_handled = true;
			};
			
		};
	};
	
	//Marker Polizei 
	case 73: 
	{
		if(_shift) then 
		{
			if(playerside == west && (FETCH_CONST(life_coplevel) >= 3)) then 
			{
				[] spawn life_fnc_cop_zoneMenu;
				_handled = true;
			};
		};
	};

	//Surrender (Shift + B)
	case 48: {
		if(_shift) then {
			if(player GVAR ["playerSurrender",false]) then {
				player SVAR ["playerSurrender",false,true];
			} else {
				[] spawn life_fnc_surrender;
			};
			_handled = true;
		};
	};
	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Transport_01_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };
	
	//Zirkumflex ^ - Taste  FUNKTIONIERT EINWANDFREI
	case 41:
    {
        _handled = true;
    };	

	// O, gate opener
	case 24:
    {

        if(playerSide in [west,independent,east] && vehicle 
		player != player && ((driver vehicle player) == player)) then 
        {
            [] call life_fnc_Opener;
        };
	};	
	
	//Map Key
	case _mapKey: {
		switch (playerSide) do {
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_civMarkers;}};
		};
	};
	
	case 46: {
		if(playerSide in [west] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				life_siren_active = true;
				sleep 8.0;
				life_siren_active = false;
			};

			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["life_fnc_copSiren2",RCLIENT];
				
				};
			};
		};
	};
	

	
	case 47: {
		if(playerSide in [west] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
			[] spawn {
				life_siren_active = true;
				sleep 10.0;
				life_siren_active = false;
			};

			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["life_fnc_copSiren1",RCLIENT];
				
				};
			};
		};
	};
	
	//Taste 1-4 Key, Hilfe
	//Taste 1
	case 2: {
		if(!_alt && !_ctrlKey) then {
		[] spawn life_fnc_infoTastenbelegung;
		};
	};

	//Holster / recall weapon. (Shift + H)
	case 35: {
		if(_shift && !_ctrlKey && !(EQUAL(currentWeapon player,""))) then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchCamera cameraView;
		};

		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(EQUAL(life_curWep_h,""))}) then {
			if(life_curWep_h in [RIFLE,LAUNCHER,PISTOL]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};

	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	case _interactionKey: {
		if(!life_action_inUse) then {
			[] spawn  {
				private "_handle";
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};

	//Restraining (Shift + R)
	case 19: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [west,civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1}) then 
		{
			[] call life_fnc_restrainAction;
		};
		if(_shift && playerSide == civilian && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [west,civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1}) then  {
			[] call life_fnc_civRestrainAction;
		};
		if(_shift && playerSide == independent && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [west,civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1}) then {
			[] call life_fnc_medicrestrainAction;
		};
	};
	
	
	// Shift + Ä, mobile banking FUNKTIONIERT EINWANDFREI
    case 40: {
		if (_shift && !_alt && !_ctrlKey && ((playerSide == west) || (playerSide == independent) || (playerSide == east))) then {
			[] call life_fnc_gateOpener;[] spawn life_fnc_atmMenu;
			_handled = true;
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then {
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player GVAR ["restrained",false]) && !life_istazed && !life_isknocked) then {
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !dialog && {!life_action_inUse}) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] spawn life_fnc_openInventory;
				};
			} else {
				private "_list";
				_containers = [getPosATL player, ["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5] call life_fnc_nearestObjects;
				if (count _containers > 0) then {
					_container = _containers select 0;
					[_container] spawn life_fnc_openInventory;
				} else {
					_list = ["landVehicle","Air","Ship"];
					if(KINDOF_ARRAY(cursorTarget,_list) && {player distance cursorTarget < 7} && {vehicle player == player} && {alive cursorTarget} && {!life_action_inUse}) then {
						if(cursorTarget in life_vehicles) then {
							[cursorTarget] spawn life_fnc_openInventory;
						};
					};
				};
			};
		};
	};

	//L Key?
	case 38: {
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent]) then {
			if(vehicle player != player && (typeOf vehicle player) in [
							"C_Offroad_01_F",
							"B_MRAP_01_F",
							"C_Offroad_01_F",
							"O_MRAP_02_F",
							"C_SUV_01_F",
							"B_Quadbike_01_F",
							"B_Heli_Light_01_F",
							"C_Heli_Light_01_civil_F",
							"B_Heli_Transport_01_F",
							"I_Heli_light_03_unarmed_F",
							"I_MRAP_03_hmg_F",
							"I_MRAP_03_F",
							"B_APC_Wheeled_01_cannon_F",
							"B_MRAP_01_hmg_F",
							"C_Hatchback_01_F",
							"C_Hatchback_01_sport_F",
							"B_Quadbike_01_F",
							"B_APC_Tracked_01_CRV_F",
							"C_Van_01_box_F",
							"C_Van_01_transport_F",
							"O_Heli_Light_02_unarmed_F"]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if(playerSide == west) then {
						[vehicle player] call life_fnc_sirenLights;
					} else {
						[vehicle player] call life_fnc_medicSirenLights;
					};
					_handled = true;
				};
			};
		};

		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	
	//Ü Key
	case 26: {
		//Shift: Spikestrip or show Licences
		if(_shift && !_alt && !_ctrlKey) then {
			if(playerSide == west && (vehicle player == player)) then {
				if(!isNull life_spikestrip) exitWith {hint "Du hast bereits ein Nagelband gelegt"};
					if(([false,"spikeStrip",1] call life_fnc_handleInv)) then {
						[] spawn life_fnc_spikeStrip;
					};
			} else {
				[] spawn life_fnc_showLicenses;
			};
		};
		//Alt:CIV ID for Kripo
		if (!_shift && _alt && !_ctrlKey) then {
			if(playerside == west && (FETCH_CONST(life_coplevel) >= 4)) then 
			[true] spawn life_fnc_showID;
		};
	};
	
	

	//Y Player Menu
	case 21: {
		if(!_alt && !_ctrlKey && !dialog && !(player GVAR ["restrained",false]) && {!life_action_inUse}) then {
			if(!_shift) then {
				[] call life_fnc_p_openMenu;
			} else {
				[] call life_fnc_altisPhone;
			};
		};
	};

	//F Key
	case 33: {
		if(playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
		_veh = vehicle player;
		if(_shift) then {	
			[] spawn {
				life_siren_active = true;
				sleep 8.0;
				life_siren_active = false;
			};

			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["life_fnc_copSiren3",RCLIENT];
				} else {
					[_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
				};
			};
			} else {
			if (playerSide == west) then {
			[] spawn {
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};

			_veh = vehicle player;
			if(isNil {_veh GVAR "siren"}) then {_veh SVAR ["siren",false,true];};
			if((_veh GVAR "siren")) then {
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh SVAR ["siren",false,true];
			} else {
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh SVAR ["siren",true,true];
				if(playerSide == west) then {
					[_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
				
				};
				};
			
			};
		};
	};
};

	//verdeckter ermittler FUNKTIONIERT EINWANDFREI
	case 71: 
	{
		if(_shift) then 
		{
			if(playerside == west && (FETCH_CONST(life_coplevel) >= 5)) then 
			{
				createDialog "setDeckname_dialog";
			};
		};
	};

	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};

			if(_veh isKindOf "House_F" && {playerSide == civilian}) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(EQUAL(_door,0)) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh GVAR [format["bis_disabled_Door_%1",_door],0];

					if(EQUAL(_locked,0)) then {
						_veh SVAR [format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh SVAR [format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if(_veh in life_vehicles && player distance _veh < 8) then {
					if(EQUAL(_locked,2)) then {
						if(local _veh) then {
							_veh lock 0;

							// BI
							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						} else {
							[_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",1];
							_veh animateDoor ["door_back_L",1];
							_veh animateDoor ['door_R',1];
							_veh animateDoor ['door_L',1];
							_veh animateDoor ['Door_L_source',1];
							_veh animateDoor ['Door_rear',1];
							_veh animateDoor ['Door_rear_source',1];
							_veh animateDoor ['Door_1_source',1];
							_veh animateDoor ['Door_2_source',1];
							_veh animateDoor ['Door_3_source',1];
							_veh animateDoor ['Door_LM',1];
							_veh animateDoor ['Door_RM',1];
							_veh animateDoor ['Door_LF',1];
							_veh animateDoor ['Door_RF',1];
							_veh animateDoor ['Door_LB',1];
							_veh animateDoor ['Door_RB',1];
							_veh animateDoor ['DoorL_Front_Open',1];
							_veh animateDoor ['DoorR_Front_Open',1];
							_veh animateDoor ['DoorL_Back_Open',1];
							_veh animateDoor ['DoorR_Back_Open ',1];
						};
						hint composeText [ image "icons\system\unlock.paa", "  Fahrzeug aufgeschlossen" ];
						[_veh,"unlock",50] remoteExec ["life_fnc_playSound",RCLIENT];
						systemChat localize "STR_MISC_VehUnlock";
						/*[_veh,"unlock"] call life_fnc_arsenalsounds;*/
					} else {
						if(local _veh) then {
							_veh lock 2;

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						} else {
							[_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];

							_veh animateDoor ["door_back_R",0];
							_veh animateDoor ["door_back_L",0];
							_veh animateDoor ['door_R',0];
							_veh animateDoor ['door_L',0];
							_veh animateDoor ['Door_L_source',0];
							_veh animateDoor ['Door_rear',0];
							_veh animateDoor ['Door_rear_source',0];
							_veh animateDoor ['Door_1_source',0];
							_veh animateDoor ['Door_2_source',0];
							_veh animateDoor ['Door_3_source',0];
							_veh animateDoor ['Door_LM',0];
							_veh animateDoor ['Door_RM',0];
							_veh animateDoor ['Door_LF',0];
							_veh animateDoor ['Door_RF',0];
							_veh animateDoor ['Door_LB',0];
							_veh animateDoor ['Door_RB',0];
							_veh animateDoor ['DoorL_Front_Open',0];
							_veh animateDoor ['DoorR_Front_Open',0];
							_veh animateDoor ['DoorL_Back_Open',0];
							_veh animateDoor ['DoorR_Back_Open ',0];
						};
						hint composeText [ image "icons\system\lock.paa", "  Fahrzeug abgeschlossen" ];
						//player say3D "car_lock";
						systemChat localize "STR_MISC_VehLock";
						/*[_veh,"car_lock"] call life_fnc_arsenalsounds;*/
						[_veh,"car_lock",50] remoteExec ["life_fnc_playSound",RCLIENT];
					};
				};
			};
		};
	};
};

_handled;
