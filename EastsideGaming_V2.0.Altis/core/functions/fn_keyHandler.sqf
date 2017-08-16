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
_tacView = (actionKeys "tacticalView" select 0);


//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "SitDown") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || life_isknocked || (player getVariable ["istazed",false]))) exitWith {
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
        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(!_shift && ESG_sitzen) then {
			[]spawn ESG_fnc_aufstehen;
		};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")} && {isTouchingGround player} && {stance player isEqualTo "STAND"} && {speed player > 2} && {!life_is_arrested} && {((velocity player) select 2) < 2.5} && {time - jumpActionTime > 3.5}) then {
            jumpActionTime = time; //Update the time.
            [player] remoteExec ["life_fnc_jumpFnc",RANY]; //Global execution
            _handled = true;
        };
    };

    //Surrender (Shift + B)
    case 48: {
        if (_shift) then {
			if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        };
    };

    //Map Key
    case _mapKey: {
		if(player getVariable ["esg_bewusstlos",false])exitWith{_handled = true;};
        switch (playerSide) do {
            //case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[]spawn life_fnc_medMarkers; []spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
    };
	
	case _tacView: {
		_handled = true;
		systemchat "Diese Ansicht ist deaktiviert!";
	};

    //Holster / recall weapon. (Shift + H)
    case 35: {
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
			if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
            life_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
            if (life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
                player selectWeapon life_curWep_h;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if (!life_action_inUse) then {
			if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
            [] spawn  {
                private "_handle";
                _handle = [] spawn life_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                life_action_inUse = false;
            };
        };
    };
	
	//Tore öffnen
	case 40: {
		if(_shift && (vehicle player != player) && playerside in [west,independent] && ((driver vehicle player) isEqualTo player) && (count ((nearestObjects [vehicle player, ["Land_BarGate_F", "Land_Net_Fence_Gate_F"], 10])) > 0)) then {
			{
				if (_x animationPhase "Door_1_rot" == 1) then {
					_x animate ["Door_1_rot", 0];
					_x animate ["Door_2_rot", 0];
				} else {
					_x animate ["Door_1_rot", 1];
					_x animate ["Door_2_rot", 1];
				};
			} forEach (nearestObjects [vehicle player, ["Land_BarGate_F", "Land_Net_Fence_Gate_F"], 25]);
		};
	};
	
	//SOS Auslöser für Cops
	case 39: {
		if(_alt && playerside isEqualTo west && !(player getVariable ["restrained",false]) && !(player getVariable ["esg_bewusstlos",false])) then {
			[]spawn ESG_fnc_sosbutton;
		};
	};

    //Restraining (Shift + R)
    case 19: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo west && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {(side cursorObject in [civilian,independent])} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable "Escorting")} && {!(cursorObject getVariable "restrained")} && {speed cursorObject < 1}) then {
			if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
            [] call life_fnc_restrainAction;
        };
    };
	
	case 37: {
		if(_shift && (vehicle player != player) && (playerside IsEqualTo west) && (vehicle player isKindOf "Air")) then {
			[]spawn ESG_fnc_openFuelKiller;
		};
	};

    //Knock out, this is experimental and yeah... (Shift + G)
    case 34: {
        if (_shift) then {_handled = true;};
		if (_shift && playerSide isEqualTo west && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 8 && speed cursorObject < 20) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player isEqualTo primaryWeapon player || currentWeapon player isEqualTo handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable ["restrained",false]) && !(player getVariable ["istazed",false]) && !life_isknocked) then {
				if(side cursortarget isEqualTo independent) exitWith {hint "Medics werden nicht niedergeschlagen!";};
                [cursorObject] spawn life_fnc_knockoutAction;
            };
        };
		
        if (_shift && playerSide isEqualTo civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player isEqualTo primaryWeapon player || currentWeapon player isEqualTo handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable ["restrained",false]) && !(player getVariable ["istazed",false]) && !life_isknocked) then {
				if(side cursortarget isEqualTo independent) exitWith {hint "Medics werden nicht niedergeschlagen!";};
                [cursorObject] spawn life_fnc_knockoutAction;
            };
        };
    };

    //T Key (Trunk)
    case 20: {
        if (!_alt && !_ctrlKey && !dialog && {!life_action_inUse}) then {
            if (vehicle player != player && alive vehicle player) then {
				if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
                if ((vehicle player) in life_vehicles) then {
                    [vehicle player] spawn life_fnc_openInventory;
                };
            } else {
				if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
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
                    if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7} && {isNull objectParent player} && {alive cursorObject} && {!life_action_inUse}) then {
                        if (cursorObject in life_vehicles || {locked cursorObject isEqualTo 0}) then {
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
        if (_shift && playerSide in [west,independent]) then {
            if (vehicle player != player && ((driver vehicle player) isEqualTo player) && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_02_unarmed_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","B_MRAP_01_hmg_F","B_T_LSV_01_unarmed_F","B_Quadbike_01_F","I_MRAP_03_F","O_MRAP_02_F","B_Heli_Light_01_F","I_Heli_light_03_unarmed_F","C_Plane_Civil_01_racing_F","B_Heli_Transport_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Attack_01_F","B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F"]) then {
                if (!isNil {vehicle player getVariable "lights"}) then {
                    if (playerSide in [west,independent]) then {
                        [vehicle player] call life_fnc_sirenLights;
                    };
                    _handled = true;
                };
            };
        };

        if (!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
    };

    //Y Player Menu
    case 21: {
        if (!_alt && !_ctrlKey && !dialog && !(player getVariable ["restrained",false]) && {!life_action_inUse}) then {
            [] call life_fnc_p_openMenu;
        };
    };

    //F Key
    case 33: {
        if (playerSide in [west,independent] && {vehicle player != player} && {!life_siren_active} && {((driver vehicle player) isEqualTo player)}) then {
			if(!_shift) then {
				[] spawn {
					life_siren_active = true;
					sleep 5;
					life_siren_active = false;
				};
				_veh = vehicle player;
				if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
				if ((_veh getVariable "siren")) then {
					if(_veh getVariable ["copcar",false]) then {
						titleText ["= Stadtsirene Aus =","PLAIN"];
					}else {
						titleText ["= Martinshorn Aus =","PLAIN"];
					};
					_veh setVariable ["siren",false,true];
				} else {
					_veh setVariable ["siren",true,true];
					if (playerSide isEqualTo west) then {
						titleText ["= Stadtsirene An =","PLAIN"];
						[_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
					} else {
						titleText ["= Martinshorn An =","PLAIN"];
						[_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
					};
				};
			} else {
				[] spawn {
					life_siren_active = true;
					sleep 5;
					life_siren_active = false;
				};
				_veh = vehicle player;
				if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
				if ((_veh getVariable "siren")) then {
					if(_veh getVariable ["copcar",false]) then {
						titleText ["= Landsirene Aus =","PLAIN"];
					}else {
						titleText ["= Sirene Aus =","PLAIN"];
					};
					_veh setVariable ["siren",false,true];
				} else {
					_veh setVariable ["siren",true,true];
					if (playerSide isEqualTo west) then {
						titleText ["= Landsirene An =","PLAIN"];
						[_veh] remoteExec ["life_fnc_copSiren2",RCLIENT];
					} else {
						titleText ["= Sirene An =","PLAIN"];
						[_veh] remoteExec ["life_fnc_medicSiren2",RCLIENT];
					};
				};
			};
        };
    };
	
	//C - Yelp
	case 46: {
		if (_shift && playerSide isEqualTo civilian && {!isNull cursorObject} && {cursorObject isKindOf "Man"} && {(isPlayer cursorObject)} && {alive cursorObject} && {cursorObject distance player < 3.5} && {!(cursorObject getVariable ["Escorting",false])} && {!(cursorObject getVariable ["restrained",false])} && {speed cursorObject < 1}) then {
			if(player getVariable ["esg_bewusstlos",false])exitWith{hint "Du bist Verwundet!";};
			if ([false,"kabelbinder",1] call life_fnc_handleInv) then {
				[] call life_fnc_restrainAction;
			};
        };
		if (playerSide in [west,independent] && {vehicle player != player} && {!life_yelp_active} && {((driver vehicle player) isEqualTo player)}) then {
            [] spawn {
                life_yelp_active = true;
                sleep 1;
                life_yelp_active = false;
            };
			_veh = vehicle player;
			[_veh, "yelp"] remoteExec ["life_fnc_globalSound",0];
		};
	};

    //O Key
    case 24: {
        if (_shift) then {
            switch (player getVariable["Earplugs",0]) do {
				case 0: {titleText["90% leiser","PLAIN DOWN"]; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; };
				case 10: {titleText["60% leiser","PLAIN DOWN"]; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; };
				case 40: {titleText["30% leiser","PLAIN DOWN"]; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; };
				case 70: {titleText["Ohrstöpsel rausgenommen","PLAIN DOWN"]; 1 fadeSound 1; player setVariable ["Earplugs", 0]; };
			};
        };
    };
	
	case 62: {
		if(_shift && (getplayeruid player in ["76561198208681004","76561198141060999"])) then {
			if(!ESG_aim) then {
				ESG_aim = true;
				totmitdir = {
					_nearobjects = nearestObjects[screenToWorld [0.5,0.5],["Man"],20,true];
					_kill = (_nearobjects select 0);
					if((_kill != vehicle player) && (_kill != ObjNull) && isPlayer _kill) then {
						[]spawn {
							_ragdoll = "Land_Can_V1_F" createVehicleLocal [0,0,0];
							_ragdoll setMass 1e10;
							_ragdoll attachTo [_kill, [0,0,0], "Spine3"];
							_ragdoll setVelocity [0,0,6];
							_kill allowDamage false;
							detach _ragdoll;
							0 = [_ragdoll,_kill] spawn 
							{
								deleteVehicle (_this select 1);
								(_this select 1) allowDamage true;
							};
						};
					};
				};
				aim_evh = (findDisplay 46) displayAddEventHandler ["MouseButtonDown", {if(primaryWeapon player != "") then {[]call totmitdir;};}];
				titletext["Tazer-Aimhack aktiviert!","PLAIN"];
			} else {
				ESG_aim = false;
				(findDisplay 46) displayRemoveEventHandler ["MouseButtonDown", aim_evh];
				titletext["Tazer-Aimhack deaktiviert!","PLAIN"];
			};
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
                        _veh animateSource [format ["Door_%1_source", _door], 0];
                        systemChat localize "STR_House_Door_Lock";
                    } else {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
                        _veh animateSource [format ["Door_%1_source", _door], 1];
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
						[_veh, "unlockCarSound"] remoteExec ["life_fnc_globalSound",0];
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
						[_veh, "lockCarSound"] remoteExec ["life_fnc_globalSound",0];
                    };
                };
            };
        };
    };
};

_handled;
