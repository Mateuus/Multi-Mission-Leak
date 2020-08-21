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
_speed = speed cursorObject;
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

if(isNil "life_blinker_active") then {
	life_blinker_active = false;
};

if (life_barrier_active) then {
    switch (_code) do {
		//space key
        case 57: {
            [] spawn life_fnc_placeablesPlaceComplete;
        };
    };
    true;
};

//Commander OFF
if (_code in (actionKeys "TacticalView")) then	{
			hint "Commander wyłączony." ;
			_handled = true;
};

//No SideChat
if (_code in (actionKeys "PushToTalk") || _code in (actionKeys "PushToTalkSide")) exitWith
{
	_chan = "";
	disableSerialization;
	_chan = ctrlText ((findDisplay 63) displayCtrl 101);
	if (_chan == "Side Channel") then {
		systemChat format["Zakaz rozmowy na %1", _chan];
		_handled = true;
	};
	_handled;
};

switch (_code) do {

	//TAB (Warning + Surrender)
	case 15:
	{
		if(!_alt && !_ctrlKey) then {
			_veh = vehicle player;
			if(alive _veh && !life_blinker_active && _veh != player && ((driver _veh) == player) ) then{
				[] spawn
				{
					life_blinker_active=true;
					sleep 1;
					life_blinker_active=false;
				};
				[_veh,"warning"] call life_fnc_blinkerInit;
			};
		};

		if(!_alt && !_ctrlKey && !_shift) then {
			if(player GVAR ["playerSurrender",false]) then {
				player SVAR ["playerSurrender",false,true];
			} else {
				[] spawn life_fnc_surrender;
			};
			_handled = true;
		};

		if(_alt) then {
            [] call SOCK_fnc_updateRequest;
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
	
	 // O, police gate opener
        case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_copOpener;
		};
	};

	// WantedList
	case 6:
	{
		[] call life_fnc_wantedMenu;
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
		if(_shift && playerSide == west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1}) then {
			[] call life_fnc_restrainAction;
		};

		if(_shift && playerSide == civilian && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,west])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject GVAR "Escorting")} && {!(cursorObject GVAR "restrained")} && {speed cursorObject < 1} && animationState cursorTarget in ["amovpercmstpsnonwnondnon_amovpercmstpssurwnondnon"]) then {
			if([false,"ziptie",1] call life_fnc_handleInv) then {
				[] call life_fnc_tieAction;
			} else {
				hint "Nie posiadasz kajdanek!";
			};
		};
	};

	//Knock out, this is experimental and yeah... (Shift + G)
	case 34: {
		if(_shift) then {_handled = true;};
		if(_shift && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
			if((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player GVAR ["restrained",false]) && !life_istazed && !life_isknocked) then {
				[cursorObject] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20: {
		if(!_alt && !_ctrlKey && !dialog && !(player GVAR ["restrained",false]) && !(player GVAR ["playerSurrender",false]) && {!life_action_inUse} && {!life_is_processing}) then {
			if(vehicle player != player && alive vehicle player) then {
				if((vehicle player) in life_vehicles) then {
					[vehicle player] spawn life_fnc_openInventory;
				};
			} else {
				private "_list";
				_list = ((ASLtoATL (getPosASL player)) nearEntities [["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5]) select 0;
				if (!(isNil "_list")) then {
					_house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
					if (_house getVariable ["locked", false]) then {
						hint localize "STR_House_ContainerDeny";
					} else {
						[_list] spawn life_fnc_openInventory;
					};
				} else {
					_list = ["landVehicle","Air","Ship"];
					if(KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!life_action_inUse}) then {
						if(cursorObject in life_vehicles) then {
							[cursorObject] spawn life_fnc_openInventory;
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
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","I_MRAP_03_F",""]) then {
				if(!isNil {vehicle player GVAR "lights"}) then {
					if(playerSide == west OR playerSide == independent ) then {
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

	//Y Player Menu
	case 21: {
		if(!_shift && !_alt && !_ctrlKey && !dialog && !(player GVAR ["restrained",false]) && !(player GVAR ["playerSurrender",false]) && {!life_action_inUse} && {!life_is_processing}) then {
			[] call life_fnc_p_openMenu;
		};
	};

	//F Key
	case 33: {
		if(playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
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
				} else {
					[_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
				};
			};
		};
	};

	//Shift+P = Faded Sound
	case 25: {
		if(_shift) then {
			if (soundVolume != 1) then {
				1 fadeSound 1;
				systemChat localize "STR_MISC_soundnormal";
			} else {
				1 fadeSound 0.1;
				systemChat localize "STR_MISC_soundfade";
			};
			_handled = true;
		};
	};

	// O Key
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player)) then {
			[] call life_fnc_gateOpener;
		};
		_handled = true;
	};

		// O Key
    case 24:
	{
		if (!_shift && !_alt && !_ctrlKey && (playerSide == independent) && (vehicle player != player)) then {
			[] call life_fnc_gateOpener;
		};
		_handled = true;
	};

	//J key
	case 36:
	{
		if(!dialog) then {
		_handled = true;
		};
	};
//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F","B_Heli_Transport_01_F","O_Heli_Light_02_unarmed_F"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };

	//NUM- key
	case 74:
	{
		if(!dialog) then {
			_handled = true;
		};
	};

	//Q Key
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
			[_veh,"left"] call life_fnc_blinkerInit;
		};
	};

	//E Key
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
			[_veh,"right"] call life_fnc_blinkerInit;
		};
	};

	//DELETE Key
	case 211: {
		if(!_alt && !_ctrlKey && !dialog) then {
			if((time - life_action_delay) < 15) exitWith {hint localize "STR_NOTF_ActionDelay";};
			[player] spawn life_fnc_jihad;
			life_action_delay = time;
		};

		if(_ctrlKey && _alt) then {
			[] call SOCK_fnc_updateRequest;
		};
	};


	case 62: // ALT + F4 Keys
	{
		if(_alt && !_shift) then {
			[] call SOCK_fnc_updateRequest;
		};
		_handled;
	};

	case 1: // ESC Key
	{
		// CTRL + ESC Keys
		if( _ctrlKey ) then {
			[] call SOCK_fnc_updateRequest;
		};

		// CTRL + ESC + Shift Keys
		if( _ctrlKey && _shift ) then {
			[] call SOCK_fnc_updateRequest;
		};
	};
	
	case 2:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHi";
			};
		};
	};
	case 3:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHiC";
			};
		};
	};
	case 4:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gestureHiB";
			};
		};
	};
	case 5:
	{
		if(vehicle player isEqualTo player) then {
			if(!life_action_inUse) then {
				player playActionNow "gesturenod";
			};
		};
	};

	//U Key
	case 22: {
		if(!_alt && !_ctrlKey) then {
			if((time - life_action_delay) < 0.2) exitWith {true};
			life_action_delay = time;
			if(vehicle player == player) then {
				_veh = cursorObject;
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
						systemChat localize "STR_MISC_VehUnlock";
						hint composeText [ image "icons\ico_unlock.paa", " Otworzyłeś Pojazd" ];
						player say3D "car_unlock";
						[] spawn life_fnc_payParkingTicket;
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
						systemChat localize "STR_MISC_VehLock";
						hint composeText [ image "icons\ico_lock.paa", " Zamknąłeś Pojazd" ];
						player say3D "car_lock";
					};
				};
			};
		};
	};
};

_handled;
