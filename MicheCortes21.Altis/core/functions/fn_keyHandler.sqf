#include "..\..\script_macros.hpp"
/*
*    File: fn_keyHandler.sqf
*    Author: Bryan "Tonic" Boardwine
*
*    Description:
*    Main key handler for event 'keyDown'.
*/
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorObject;
_handled = false;

_interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = (actionKeys "ShowMap" select 0);
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
    true;
};

if (life_action_inUse) exitWith {
    if (!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
    _handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if (!life_action_inUse) then {
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
            [] spawn life_fnc_placestorage;
        };
    };
    true;
};

switch (_code) do {
    //Space key for Jumping
     case 57: {
    if (!_shift && life_barrier_active) then {
      0 spawn life_fnc_placeablesPlaceComplete;
    };
      if (isNil "jumpActionTime") then {jumpActionTime = 0;};
      if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!life_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 1.5}) then {
      if (life_barrier_active) then { [true] call life_fnc_placeableCancel; };
      jumpActionTime = time; //Update the time.
      [player] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
      _handled = true;
        };
    };

    //Surrender (Shift + B)
    case 48: {
        if (_shift) then {
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        };
    }; 
	
	//Autosync
	case 1:
	{
		if(playerSide == civilian) then
		{
			[] call SOCK_fnc_updateRequest;
			hint "AKTIVIERT";
		};
	};
	
	//Autosync
	case 62:
	{
		if(_alt && playerSide == civilian) then
		{
			[] call SOCK_fnc_updateRequest;
			hint "AKTIVIERT";
		};
	};

	
	//EMP Konsole - K
    case 37:
    {
        if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && (vehicle player != player && (typeOf vehicle player) in ["B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_light_03_unarmed_F","B_Heli_Transport_03_unarmed_F","B_T_VTOL_01_infantry_F","B_Heli_Attack_01_F","C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","I_Truck_02_covered_F","I_MRAP_03_F","B_MRAP_01_F"])) then
        {
            [] call life_fnc_openEmpMenu; [_this] call life_fnc_isEmpOperator;
        };
    };
	
	
	
    //Map Key
    case _mapKey: {
        switch (playerSide) do {
            case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
    };

    //Holster / recall weapon. (Shift + H)
    case 35: {
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            life_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
            if (life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon life_curWep_h;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if (!life_action_inUse) then {
            [] spawn  {
                private "_handle";
                _handle = [] spawn life_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                life_action_inUse = false;
            };
        };
    };
	
	//Sitdown Script
     if (_code in (actionKeys "MoveForward")) then {
     if (!isNull life_sitting) then {
     [] execVM "mission.map\core\scripts\standup.sqf";
     _handled = true;
    };
 };
	

    //Restraining (Shift + R)
    case 19: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
            [] call life_fnc_restrainAction;
        };
    };

    //Knock out, this is experimental and yeah... (Shift + G)
    case 34: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable ["restrained",false]) && !life_istazed && !life_isknocked) then {
                [cursorObject] spawn life_fnc_knockoutAction;
            };
        };
    };

    //T Key (Trunk)
    case 20: {
        if (!_alt && !_ctrlKey && !dialog && {!life_action_inUse}) then {
            if (vehicle player != player && alive vehicle player) then {
                if ((vehicle player) in life_vehicles) then {
                    [vehicle player] spawn life_fnc_openInventory;
                };
            } else {
                private "_list";
                _list = ((ASLtoATL (getPosASL player)) nearEntities [["Box_IND_Grenades_F","B_supplyCrate_F","Land_WaterTank_F","Land_CargoBox_V1_F","Land_Cargo20_yellow_F"], 2.5]) select 0;
                if (!(isNil "_list")) then {
                    _house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
                    if (_house getVariable ["locked", false]) then {
                        hint localize "STR_House_ContainerDeny";
                    } else {
                        [_list] spawn life_fnc_openInventory;
                    };
                } else {
                    _list = ["landVehicle","Air","Ship"];
                    if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!life_action_inUse}) then {
                        if (cursorObject in life_vehicles || {locked cursorObject isEqualTo 0}) then {
                            [cursorObject] spawn life_fnc_openInventory;
                        };
                    };
                };
            };
        };
    };
	
	
	//Pos1
	case 199: {
		if (soundVolume < 1) then {
			0 fadeSound (ceil(soundVolume * 200)) /100;
                systemChat localize "STR_MISC_soundnormal";
		};
	};
	
	//Ende
	case 207: {
		if (soundVolume > 0) then {
			0 fadeSound (ceil(soundVolume * 50)) /100;
                systemChat localize "STR_MISC_soundfade";
		};
	};

	//Ö-Key
    case 39: {
        if ((isNull(findDisplay 20000)) && (playerSide in ([west,independent]))) then {
           0 spawn life_fnc_placeablesMenu;
            _handled = true;
        };
            _handled = true;
    };
	
	//ENTF-Key
    case 211: {
        if ((playerSide in [west,independent]) && ((typeOf cursorTarget) in life_definePlaceables)) then {
          deleteVehicle cursorTarget;
          hintSilent "Die Absperrung wurde entfernt";
        };
    };
	
	
	//NUM_3 Cop-Liste
	case 81:
	{
		if(playerSide == west && !_shift && !_ctrlKey && !_alt) then
		{
			[] call life_fnc_wantedMenu;
		};
	};
	
//Ö Key
 case 36:
 {
 if (playerSide in [west,civilian] && {(FETCH_CONST(life_adminlevel) == 5)} && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
 [] spawn {
 life_siren_active = true;
 sleep 14;
 life_siren_active = false; 
 };
 _veh = vehicle player;
 if (isNil {_veh getVariable "lul"}) then {_veh setVariable ["lul",false,true];};
 if ((_veh getVariable "lul")) then {
 titleText ["Admin abuse AUS","PLAIN"];
 _veh setVariable ["lul",false,true];
 } else {
 titleText ["Admin abuse AN","PLAIN"];
 _veh setVariable ["lul",true,true];
 if (playerSide isEqualTo civilian) then {
 [_veh] remoteExec ["life_fnc_adminsirene1",RCLIENT];
 } else {
 [_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
 };
 };
 };
 };



    //NUM_7 Key
    case 71: {
        if (playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
            [] spawn {
                life_siren_active = true;
                sleep 4.7;
                life_siren_active = false;
            };

            _veh = vehicle player;
            if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
            if ((_veh getVariable "siren")) then {
                titleText [localize "STR_MISC_SirensOFF","PLAIN"];
                _veh setVariable ["siren",false,true];
            } else {
                titleText [localize "STR_MISC_SirensON","PLAIN"];
                _veh setVariable ["siren",true,true];
                if (playerSide isEqualTo west) then {
                    [_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
                } else {
                    [_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
                };
            };
        };
    };

// NUM_8 Key
case 72: {
if (playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
[] spawn {
life_siren_active = true;
sleep 4.7;
life_siren_active = false;
};


_veh = vehicle player;
if (isNil {_veh getVariable "siren2"}) then {_veh setVariable ["siren2",false,true];};
if ((_veh getVariable "siren2")) then {
titleText ["Anhalte Signal AUS","PLAIN"];
_veh setVariable ["siren2",false,true];
} else {
titleText ["Anhalte Signal AN","PLAIN"];
_veh setVariable ["siren2",true,true];
if (playerSide isEqualTo west) then {
[_veh] remoteExec ["life_fnc_copSiren2",RCLIENT];
} else {
[_veh] remoteExec ["life_fnc_medicSiren2",RCLIENT];
};
};
}; 
};

// NUM_9 Key
case 73: {
if (playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
[] spawn {
life_siren_active = true;
sleep 4.7;
life_siren_active = false;
};


_veh = vehicle player;
if (isNil {_veh getVariable "siren3"}) then {_veh setVariable ["siren3",false,true];};
if ((_veh getVariable "siren3")) then {
titleText ["Polizei Ansage AUS","PLAIN"];
_veh setVariable ["siren3",false,true];
} else {
titleText ["Polizei Ansage AN","PLAIN"];
_veh setVariable ["siren3",true,true];
if (playerSide isEqualTo west) then {
[_veh] remoteExec ["life_fnc_copSiren3",RCLIENT];
} else {
[_veh] remoteExec ["life_fnc_medicSiren3",RCLIENT];
};
};
};
};

    //L Key?
    case 38: {
        private _veh = vehicle player;
        if (_ctrlKey && {!_shift} && {!isNull objectParent player} && {(driver _veh) isEqualTo player} && {playerSide isEqualTo west}) then {
         call bf_fnc_lights;
         _handled = true;
    };
        if (_shift && {!_ctrlKey} && {!isNull objectParent player} && {(driver _veh) isEqualTo player} && {playerSide isEqualTo west}) then {
        if (!isNull (_veh getVariable ["lightObj",objNull])) then {
        if (_veh getVariable ["lights",false]) then {
        _veh setVariable ["lights",false,true];
        } else {
        _veh setVariable ["lights",true,true];
        [_veh] remoteExec ["bf_fnc_lightsOn",0];
    };
        } else {
        if ((typeOf _veh) in ["C_Offroad_01_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_Heli_Light_01_F","B_Heli_Transport_01_F"]) then {
        if (!isNil {_veh getVariable "lights"}) then {
        if (playerSide isEqualTo west) then {
        [_veh] call life_fnc_sirenLights;
        } else {
        [_veh] call life_fnc_medicSirenLights;
    };
        _handled = true;
        };
    };
    };
       _handled = true;
    };
 };

	
    //Y Player Menu
    case 21: {
        if (!_alt && !_ctrlKey && !dialog && !(player getVariable ["restrained",false]) && {!life_action_inUse}) then {
            [] call life_fnc_p_openMenu;
        };
    };
	
	//ShiftNum6
	case 77:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				player playActionNow "gestureHiB";
			};
	};
	
	//ShiftNum7
	case 71:
	{
		if(_shift) then {_handled = true;};
			if ((_shift) && (vehicle player == player)) then
			{
				player playActionNow "gestureHiC";
			};
	};
	
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

    //F Key
    case 33: {
        if (!_shift && !_alt && playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) == player)}) then {
            [] spawn {
                life_siren_active = true;
                sleep 9;
                life_siren_active = false;
            };

            _veh = vehicle player;
            if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
            if ((_veh getVariable "siren")) then {
                titleText [localize "STR_MISC_SirensOFF","PLAIN"];
                _veh setVariable ["siren",false,true];
            } else {
                titleText [localize "STR_MISC_SirensON","PLAIN"];
                _veh setVariable ["siren",true,true];
                if (playerSide isEqualTo west) then {
                    [_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
                } else {
                    [_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
                };
            };
        };
		
		
		
		
		
		
		
		
		if(_shift && !_alt && {((player getVariable "side") == "cop")} && {vehicle player != player} && {((driver vehicle player) == player)}) then
		{
			_veh = vehicle player;
			if(!alive _veh) exitWith {};
			[_veh,"razzia"] call life_fnc_globalSound;
		};
		
		if(!_shift && _alt && {((player getVariable "side") == "cop")} && {vehicle player != player} && {((driver vehicle player) == player)}) then
		{		
			_veh = vehicle player;
			if(!alive _veh) exitWith {};
			player say3d "siren";
			_veh setVariable ["siren",false,true]; 
		};
		
		
		
		
		
		
    };

    //U Key
    case 22: {
        if (!_alt && !_ctrlKey) then {
            if (isNull objectParent player) then {
                _veh = cursorObject;
            } else {
                _veh = vehicle player;
            };

            if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    _door = [_veh] call life_fnc_nearestDoor;
                    if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
                    _locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

                    if (_locked isEqualTo 0) then {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
                        _veh animate [format ["door_%1_rot",_door],0];
                        systemChat localize "STR_House_Door_Lock";
                    } else {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
                        _veh animate [format ["door_%1_rot",_door],1];
                        systemChat localize "STR_House_Door_Unlock";
                    };
                };
            } else {
                _locked = locked _veh;
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    if (_locked isEqualTo 2) then {
                        if (local _veh) then {
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
                        [_veh,"unlockCarSound"] remoteExec ["life_fnc_say3D",RANY];
                    } else {
                        if (local _veh) then {
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
                        [_veh,"lockCarSound"] remoteExec ["life_fnc_say3D",RANY];
                    };
                };
            };
        };
    };
};

_handled;
