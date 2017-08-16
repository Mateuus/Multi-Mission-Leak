private["_handled", "_shift", "_alt", "_code", "_ctrl", "_alt", "_ctrlKey", "_veh", "_locked", "_interactionKey", "_mapKey", "_interruptionKeys", "_player", "_blinkerLinks", "_blinkerRechts", "_blinkerWarn"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;
_player = player;
_interactionKey =
    if (count(actionKeys " User10") == 0) then {
        219
    } else {
        (actionKeys " User10") select 0
    };
_mapKey = actionKeys " ShowMap"
select 0;
_interruptionKeys = [17, 30, 31, 32];
if ((_code in (actionKeys " GetOver") || _code in (actionKeys " salute")) && {
        (player getVariable["restrained", false])
    }) exitWith {
    true;
};
if (life_action_inUse) exitWith {
    if (!life_interrupted && _code in _interruptionKeys) then {
        life_interrupted = true;
    };
    _handled;
};
if (count(actionKeys " User10") != 0 && {
        (inputAction " User10" > 0)
    }) exitWith {
    if (!life_action_inUse && !life_action_gathering) then {
        [] spawn {
            private["_handle"];
            _handle = [] spawn life_fnc_actionKeyHandler;
            waitUntil {
                sleep 0.1;
                scriptDone _handle
            };
            life_action_inUse = false;
        };
    };
    true;
};
switch (_code) do {
    case 199:{
            if (_shift && license_civ_radio && !dialog) then {
                createdialog " radio";
            };
        };
    case 57:{
            if (isNil " jumpActionTime") then {
                jumpActionTime = 0;
            };
            if (_shift && {
                    animationState player != "AovrPercMrunSrasWrflDf"
                } && {
                    isTouchingGround player
                } && {
                    stance player == "STAND"
                } && {
                    speed player > 2
                } && {!life_is_arrested
                } && {
                    (velocity player) select 2 < 2.5
                } && {
                    time - jumpActionTime > 1.5
                }) then {
                jumpActionTime = time;
                [player, false] remoteExec["life_fnc_jumpFnc", 0];
                _handled = true;
            };
        };
    case _mapKey:{
            switch (playerSide) do {
                case west:{
                        if (!visibleMap) then {
                            [] spawn life_fnc_copMarkers;
                            hudactive = false;
                            2 cutFadeOut 1;
                            3 cutfadeout 1
                        } else {
                            hudactive = true;
                            [] call life_fnc_hudSetup;
                        }
                    };
                case independent:{
                        if (!visibleMap) then {
                            [] spawn life_fnc_medMarkers;
                            hudactive = false;
                            2 cutFadeOut 1;
                            3 cutfadeout 1
                        } else {
                            hudactive = true;
                            [] call life_fnc_hudSetup;
                        }
                    };
                case civilian:{
                        if (!visibleMap) then {
                            [] spawn life_fnc_gangMarkers;
                            [] spawn life_fnc_npcMarker;
                            hudactive = false;
                            2 cutFadeOut 1;
                            3 cutfadeout 1
                        } else {
                            hudactive = true;
                            [] call life_fnc_hudSetup;
                        }
                    };
                case east:{
                        if (!visibleMap) then {
                            [] spawn life_fnc_adacMarkers;
                            hudactive = false;
                            2 cutFadeOut 1;
                            3 cutfadeout 1
                        } else {
                            hudactive = true;
                            [] call life_fnc_hudSetup;
                        }
                    };
            };
        };
    case 46:{
            if (!_ctrlKey && !_alt && _shift && !life_action_sitzt) then {
                player reveal cursortarget;
                [] spawn life_fnc_sitdown;
            };
            if (!_ctrlKey && !_alt && _shift && life_action_sitzt) then {
                [] spawn life_fnc_standup;
            };
        };
    case 35:{
            if (!alive player || dialog) exitWith {};
            if (!_shift && !_ctrlKey && !_alt) then {
                if (!dialog) then {
                    createdialog " tastatur";
                } else {
                    closedialog 0;
                };
            };
            if (_alt && hudactive) exitwith {
                hudactive = false;
                2 cutFadeOut 1;
            };
            if (_alt && !hudactive) exitwith {
                hudactive = true;
                [] call life_fnc_hudSetup;
            };
            if (_shift && !_ctrlKey && currentWeapon player != "") then {
                life_curWep_h = currentWeapon player;
                player action["SwitchWeapon", player, player, 100];
                player switchcamera cameraView;
            };
            if (!_shift && _ctrlKey && !isNil " life_curWep_h" && {
                    (life_curWep_h != "")
                }) then {
                if (life_curWep_h in [primaryWeapon player, secondaryWeapon player, handgunWeapon player]) then {
                    player selectWeapon life_curWep_h;
                };
            };
        };
    case _interactionKey:{
            if (!life_action_inUse) then {
                [] spawn {
                    private["_handle"];
                    _handle = [] spawn life_fnc_actionKeyHandler;
                    waitUntil {
                        sleep 0.1;
                        scriptDone _handle
                    };
                    life_action_inUse = false;
                };
            };
        };
    case 2:{
            if (cursorTarget getVariable " noob") exitWith {
                hint " Dieser Bürger hat noch einen Jetlag von seiner Anreise und benötigt Ruhe!"
            };
            if (_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf " Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then {
                if ((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained", false]) && !life_istazed && !(player getVariable["surrender", false])) then {
                    [cursorTarget] spawn life_fnc_knockoutAction;
                };
            };
        };
    case 3:{
            if (_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf " Man" && (isPlayer cursorTarget) && alive cursorTarget && player distance cursorTarget < 5 && animationState cursorTarget == "Incapacitated" && !(cursorTarget getVariable " Escorting") && !(cursorTarget getVariable " restrained") && life_inv_kabelbinder > 0 && (side cursorTarget in [civilian, west])) then {
                [] spawn life_fnc_restrainAction;
                [true, "kabelbinderkey", 1] call life_fnc_handleinv;
                [false, "kabelbinder", 1] call life_fnc_handleinv;
            };
            if (_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf " Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian, independent, east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable " Escorting") && !(cursorTarget getVariable " restrained") && speed cursorTarget < 1) then {
                [] spawn life_fnc_restrainAction;
            };
        };
    case 24:{
            if (!_shift && !_alt && !_ctrlKey && !(isNull objectParent player) && playerSide in [west, independent, east]) then {
                [] call life_fnc_copOpener;
            };
        };
    case 39:{
            if (player getVariable["surrender", false]) exitWith {
                hint " Du kannst jetzt nicht farmen!"
            };
            if (playerside == east && (!life_action_gathering)) exitWith {
                [] spawn life_fnc_adacgather;
            };
            if (playerside == independent && (!life_action_gathering)) exitWith {
                [] spawn life_fnc_medicgather;
            };
            if (playerSide == civilian && (!life_action_gathering)) then {
                if !(surfaceIsWater position player) then {
                    [] spawn life_fnc_gather;
                };
                if (surfaceIsWater position player) then {
                    [] spawn life_fnc_gatherwasser;
                };
            };
            if (playerSide == civilian && (!life_action_gathering)) then {
                if (life_inv_pressluft > 0 && life_level >= 11) then {
                    [1] spawn life_fnc_pickAxeUse;
                };
            };
            if (playerSide == civilian && (!life_action_gathering)) then {
                if (life_inv_pickaxe == 0) exitWith {};
                if (life_inv_pressluft > 0 && life_level >= 12) exitWith {};
                [0] spawn life_fnc_pickAxeUse;
            };
            if (playerSide == civilian && (!life_action_gathering)) then {
                if (life_inv_pumpe == 0) exitWith {};
                [] spawn life_fnc_pumpe;
            };
            if (playerSide == civilian && (!life_action_gathering)) then {
                if (life_inv_axt == 0) exitWith {};
                [] spawn life_fnc_axeUse;
            };
        };
    case 20:{
            if (!_alt && !_ctrlKey && !life_is_processing && !life_action_gathering) then {
                if (!(isNull objectParent player) && alive vehicle player) then {
                    if ((vehicle player) in life_vehicles) then {
                        [vehicle player] call life_fnc_openInventory;
                    };
                } else {
                    if ((cursorObject isKindOf " Car"
                            OR cursorObject isKindOf " Air"
                            OR cursorObject isKindOf " Ship"
                            OR cursorObject isKindOf " House_F"
                            OR cursorObject isKindOf " Land_Cargo40_military_green_F"
                            OR cursorObject isKindOf " Land_Suitcase_F") && player distance cursorObject < 7 && isNull objectParent player && alive cursorObject) then {
                        if (cursorObject in life_vehicles OR!(cursorObject getVariable["locked", true])) then {
                            [cursorObject] call life_fnc_openInventory;
                        } else {
                            if (cursorobject isKindOf " Land_Suitcase_F") then {
                                [cursorObject] call life_fnc_openInventory;
                            };
                        };
                    };
                };
            };
        };
    case 38:{
            if (playerside == west) then {
                [] call life_fnc_radar
            };
            if (_shift) then {
                if (isNull objectParent player && !(player getVariable["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then {
                    if (player getVariable["surrender", false]) then {
                        player setVariable["surrender", false, true];
                    } else {
                        [] spawn life_fnc_surrender;
                    };
                };
            };
            if (_shift && playerSide in [west, independent]) then {
                if (!isNull objectParent player) then {
                    if (playerSide == west) then {
                        [vehicle player] call life_fnc_sirenLights;
                    } else {
                        [vehicle player] call life_fnc_medicSirenLights;
                    };
                    _handled = true;
                };
            };
        };
    case 21:{
            if (!alive player || dialog) exitWith {};
            if (!_alt && !_ctrlKey && !dialog && !life_is_processing) then {
                [] call life_fnc_tablet;
            } else {
                if (!dialog && !life_is_processing && _ctrlKey) then {
                    playsound " reissverschluss";
                    [] call life_fnc_inventory;
                } else {
                    if (dialog) then {
                        closedialog 0;
                    };
                };
            };
        };
    case 23:{
            if (!dialog && !life_is_processing) then {
                playsound " reissverschluss";
            };
        };
    case 33:{
            if (!_ctrlKey) then {
                if (playerSide in [west, independent] && !(isNull objectParent player) && !life_siren_active && ((driver vehicle player) == player)) then {
                    [] spawn {
                        life_siren_active = true;
                        sleep 4;
                        life_siren_active = false;
                    };
                    _veh = vehicle player;
                    if (isNil {
                            _veh getVariable " siren"
                        }) then {
                        _veh setVariable["siren", false, true];
                    };
                    if ((_veh getVariable " siren")) then {
                        _veh setVariable["siren", false, true];
                    } else {
                        if (playerSide == west) then {
                            _veh setVariable["siren", true, true];
                            [_veh] spawn life_fnc_copSiren;
                        };
                        if (playerSide == independent) then {
                            _veh setVariable["siren", true, true];
                            [_veh] spawn life_fnc_medicSiren;
                        };
                    };
                };
            };
            if (_ctrlKey) then {
                if (playerSide in [west, independent] && !(isNull objectParent player) && !life_siren2_active && ((driver vehicle player) == player)) then {
                    [] spawn {
                        life_siren2_active = true;
                        sleep 3;
                        life_siren2_active = false;
                    };
                    _veh = vehicle player;
                    if (isNil {
                            _veh getVariable " siren2"
                        }) then {
                        _veh setVariable["siren2", false, true];
                    };
                    if ((_veh getVariable " siren2")) then {
                        _veh setVariable["siren2", false, true];
                    } else {
                        if (playerSide == west) then {
                            _veh setVariable["siren2", true, true];
                            [_veh] spawn life_fnc_copSiren2;
                        };
                        if (playerSide == independent) then {
                            _veh setVariable["siren2", true, true];
                            [_veh] spawn life_fnc_medicSiren2;
                        };
                    };
                };
            };
        };
    case 22:{
            if (!_alt && !_ctrlKey) then {
                if (isNull objectParent player) then {
                    _veh = cursorTarget;
                } else {
                    _veh = vehicle player;
                };
                if (_veh isKindOf " House" && playerSide == civilian) then {
                    if (_veh in life_vehicles && player distance _veh < 8) then {
                        _door = [_veh] call life_fnc_nearestDoor;
                        if (_door == 0) exitWith {
                            hint localize " STR_House_Door_NotNear"
                        };
                        _locked = _veh getVariable[format["bis_disabled_Door_ % 1", _door], 0];
                        if (_locked == 0) then {
                            _veh setVariable[format["bis_disabled_Door_ % 1", _door], 1, true];
                            _veh animate[format["door_ % 1 _rot", _door], 0];
                            systemChat localize " STR_House_Door_Lock";
                        } else {
                            _veh setVariable[format["bis_disabled_Door_ % 1", _door], 0, true];
                            _veh animate[format["door_ % 1 _rot", _door], 1];
                            systemChat localize " STR_House_Door_Unlock";
                        };
                    };
                } else {
                    _locked = locked _veh;
                    if (_veh in life_vehicles && player distance _veh < 8) then {
                        if (_locked == 2) then {
                            if (local _veh) then {
                                _veh lock 0;
                                _veh animateDoor["door_back_R", 1];
                                _veh animateDoor["door_back_L", 1];
                                _veh animateDoor['door_R', 1];
                                _veh animateDoor['door_L', 1];
                                _veh animateDoor['Door_rear', 1];
                                _veh animateDoor['Door_LM', 1];
                                _veh animateDoor['Door_RM', 1];
                                _veh animateDoor['Door_LF', 1];
                                _veh animateDoor['Door_RF', 1];
                                _veh animateDoor['Door_LB', 1];
                                _veh animateDoor['Door_RB', 1];
                                _veh animate['DoorL_Front_Open', 1];
                                _veh animate['DoorR_Front_Open', 1];
                                _veh animate['DoorL_Back_Open', 1];
                                _veh animate['DoorR_Back_Open', 1];
                            } else {
                                [_veh, 0] remoteExecCall["lock", _veh];
                                _veh animateDoor["door_back_R", 1];
                                _veh animateDoor["door_back_L", 1];
                                _veh animateDoor['door_R', 1];
                                _veh animateDoor['door_L', 1];
                                _veh animateDoor['Door_rear', 1];
                                _veh animateDoor['Door_LM', 1];
                                _veh animateDoor['Door_RM', 1];
                                _veh animateDoor['Door_LF', 1];
                                _veh animateDoor['Door_RF', 1];
                                _veh animateDoor['Door_LB', 1];
                                _veh animateDoor['Door_RB', 1];
                                _veh animate['DoorL_Front_Open', 1];
                                _veh animate['DoorR_Front_Open', 1];
                                _veh animate['DoorL_Back_Open', 1];
                                _veh animate['DoorR_Back_Open', 1];
                            };
                            hint composeText[image " icons\ unlock.paa", "Fahrzeug aufgeschlossen"];
                            _veh say3D " car_unlock";
                        } else {
                            if (local _veh) then {
                                _veh lock 2;
                                _veh animateDoor["door_back_R", 0];
                                _veh animateDoor["door_back_L", 0];
                                _veh animateDoor['door_R', 0];
                                _veh animateDoor['door_L', 0];
                                _veh animateDoor['Door_rear', 0];
                                _veh animateDoor['Door_LM', 0];
                                _veh animateDoor['Door_RM', 0];
                                _veh animateDoor['Door_LF', 0];
                                _veh animateDoor['Door_RF', 0];
                                _veh animateDoor['Door_LB', 0];
                                _veh animateDoor['Door_RB', 0];
                                _veh animate['DoorL_Front_Open', 0];
                                _veh animate['DoorR_Front_Open', 0];
                                _veh animate['DoorL_Back_Open', 0];
                                _veh animate['DoorR_Back_Open', 0];
                            } else {
                                [_veh, 2] remoteExecCall["lock", _veh];
                                _veh animateDoor["door_back_R", 0];
                                _veh animateDoor["door_back_L", 0];
                                _veh animateDoor['door_R', 0];
                                _veh animateDoor['door_L', 0];
                                _veh animateDoor['Door_rear', 0];
                                _veh animateDoor['Door_LM', 0];
                                _veh animateDoor['Door_RM', 0];
                                _veh animateDoor['Door_LF', 0];
                                _veh animateDoor['Door_RF', 0];
                                _veh animateDoor['Door_LB', 0];
                                _veh animateDoor['Door_RB', 0];
                                _veh animate['DoorL_Front_Open', 0];
                                _veh animate['DoorR_Front_Open', 0];
                                _veh animate['DoorL_Back_Open', 0];
                                _veh animate['DoorR_Back_Open', 0];
                            };
                            hint composeText[image " icons\ lock.paa", "Fahrzeug abgeschlossen"];
                            _veh say3D " car_lock";
                        };
                    };
                };
            };
        };
    case 79:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playMove " AmovPercMstpSnonWnonDnon_exerciseKata";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 7;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe1"] remoteExecCall["say3D", 0];
            };
        };
    case 80:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playMove " AmovPercMstpSnonWnonDnon_exercisekneeBendB";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 7;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe2"] remoteExecCall["say3D", 0];
            };
        };
    case 81:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playMove " AmovPercMstpSnonWnonDnon_exercisePushup";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe3"] remoteExecCall["say3D", 0];
            };
        };
    case 75:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playActionNow " gestureHi";
            };
            if ((_shift) && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe4"] remoteExecCall["say3D", 0];
            };
        };
    case 76:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playActionNow " gestureHib";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe5"] remoteExecCall["say3D", 0];
            };
        };
    case 77:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playActionNow " gestureHic";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe6"] remoteExecCall["say3D", 0];
            };
        };
    case 71:{
            if ((_shift) && (isNull objectParent player)) then {
                if (life_toilet == 0) exitWith {
                    hint " Du musst nicht pinkeln."
                };
                if (player getVariable["restrained", FALSE]) exitWith {
                    hint " Du bist gefesselt, du kannst jetzt nicht pinkeln!"
                };
                if (life_pissing) exitWith {
                    hint " Du hast gerade gepinkelt.Für größere Geschäfte suche eine Toilette auf!"
                };
                [] spawn {
                    life_pissing = true;
                    player playMove " Acts_AidlPercMstpSlowWrflDnon_pissing";
                    sleep 8;
                    _veh = "Oil_Spill_F"
                    createvehicle[0, 0, 0];
                    _veh setpos(getpos player);
                    life_toilet = life_toilet - 15;
                    if (life_toilet < 0) then {
                        life_toilet = 0
                    };
                    [] call life_fnc_hudupdate;
                    sleep 120;
                    deletevehicle _veh;
                    sleep 380;
                    life_pissing = false;
                };
            };
            if ((_shift) && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe7"] remoteExecCall["say3D", 0];
            };
        };
    case 72:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playActionNow " gesturenod";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && (typeOf vehicle player) == "C_Van_01_box_F" && alive vehicle player && vehicle player != player && !life_hupe_active && (call life_donator) > 0 && ((driver vehicle player) == player) && (vehicle player getVariable " Life_VEH_color") == 3) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 20;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe8"] remoteExecCall["say3D", 0];
            };
            if ((_shift) && playerside == civilian && (typeOf vehicle player) == "B_Plane_CAS_01_F" && alive vehicle player && vehicle player != player && !life_hupe_active) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "bling"] remoteExecCall["say3D", 0];
            };
        };
    case 73:{
            if (_shift) then {
                _handled = true;
            };
            if ((_shift) && (isNull objectParent player)) then {
                player playActionNow " GestureAgonyCargo";
            };
            if ((_shift) && playerside == civilian && !((vehicle player) iskindof " Air") && alive vehicle player && vehicle player != player && !life_hupe_active && ((driver vehicle player) == player)) then {
                [] spawn {
                    life_hupe_active = true;
                    sleep 5;
                    life_hupe_active = false;
                };
                [vehicle player, "hupe9"] remoteExecCall["say3D", 0];
            };
        };
    case 25:{
            if (_ctrlKey) then {
                [] spawn life_fnc_fadeSound;
                _handled = true;
            };
        };
    case 37:{
            if (!_shift && !_alt && !_ctrlKey && (playerSide == west) && !(isNull objectParent player) && (typeOf vehicle player in ["I_Heli_light_03_unarmed_F", "B_Heli_Transport_01_F"])) then {
                [] call life_fnc_openEmpMenu;
                [_this] call life_fnc_isEmpOperator;
            };
        };
    case 201:{
            if (_shift && _ctrlKey && (call life_adminlevel) > 1) then {
                [4, format[" < img size = '10' color = '#FFFFFF' image = 'images\ time.paa' / > < br / > < br / > < t size = '2.5' > ACHTUNG < / t > < br / > Der Server wird in Kürze neugestartet."]] remoteExecCall["life_fnc_broadcast", 0];
            };
        };
    case 209:{
            if (_shift && _ctrlKey && (call life_adminlevel) > 1 && !snowactive) exitwith {
                [0] remoteExec["life_fnc_snow", 0];
                hint " Leise rieselt der Schnee...";
            };
            if (_shift && _ctrlKey && (call life_adminlevel) > 1 && snowactive) exitwith {
                [1] remoteExec["life_fnc_snow", 0];
                hint " Der Schnee verflüchtigt sich...";
            };
        };
    case 207:{
            [0] spawn life_fnc_MuellCfg;
        };
    case 184:{
            if ((call life_adminlevel) > 0) then {
                if (dialog) exitWith {};
                CreateDialog " life_admin_menu";
            };
        };
    case 40:{
            if (player getVariable["restrained", FALSE]) then {
                _handled = true;
            };
        };
    case 41:{
            _handled = true;
        };
    case 43:{
            if (player getVariable["restrained", FALSE]) then {
                _handled = true;
            };
        };
    case 36:{
            _handled = true;
        };
    case 59:{
            _handled = true;
        };
    case 60:{
            _handled = true;
        };
    case 61:{
            _handled = true;
        };
    case 62:{
            _handled = true;
        };
    case 63:{
            _handled = true;
        };
    case 64:{
            _handled = true;
        };
    case 65:{
            _handled = true;
        };
    case 66:{
            _handled = true;
        };
    case 67:{
            _handled = true;
        };
    case 68:{
            _handled = true;
        };
    case 87:{
            _handled = true;
        };
};
_handled;