// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// based upon Tonics work

private _control = _this select 0;
private _code = _this select 1;
private _shift = _this select 2;
private _ctrlKey = _this select 3;
private _alt = _this select 4;

private _handled = false;

// Block ESC when teargas'ed
if( XY_tearGasActive && _code == 1 ) exitWith { true };

// Default Windows-Key, otherwise assigned key
private _interactionKey = if( count (actionKeys "User10") == 0 ) then { 219 } else {(actionKeys "User10") select 0};
private _interruptionKeys = [17, 30, 31, 32]; //A, S, W, D

private _forbidden = (actionKeys "SelectAll") + (actionKeys "ForceCommandingMode");
private _forbiddenInJail = (actionKeys "GetOver") + (actionKeys "Turbo") + (actionKeys "Crouch") + (actionKeys "Prone") + (actionKeys "moveDown");
private _forbiddenRestrained = _forbiddenInJail + (actionKeys "ReloadMagazine") + (actionKeys "Salute") + (actionKeys "SitDown");

private _vehicle = vehicle player;
private _cursorObject = cursorObject;

if( _code in _forbidden ) exitWith { true };
if( XY_isArrested && { _code in  _forbiddenInJail } ) exitWith { true };
if( (player getVariable ["restrained", false]) && { _code in _forbiddenRestrained  } ) exitWith { true };

if( XY_actionInUse && { !XY_interrupted } && { _code in _interruptionKeys } ) then {
    XY_interrupted = true;
    _handled;
};
if( player getVariable ["restrained", false] ) exitWith {
    _handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)} && {time - XY_cooldown > 1} ) exitWith {
    XY_cooldown = time;
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if( !XY_actionInUse ) then {
        XY_actionInUse = true;
        [] spawn {
            [] call XY_fnc_actionKeyHandler;
            XY_actionInUse = false;
        };
    };
    true;
};

switch (_code) do {

    //Space key for Jumping
    case 57: {
        if(isNil "jumpActionTime") then {
            jumpActionTime = 0;
        };
        if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!XY_isArrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time;
            [player] remoteExec ["XY_fnc_jumpFnc"];
            _handled = true;
        };
    };

    //Holster / recall weapon.
    case 35: {
        if( !XY_actionInUse && (_shift || _ctrlKey) && time - XY_cooldown > 2 ) then {
            if(_shift && !_ctrlKey && currentWeapon player != "") then {
                XY_currentWeaponToRecall = currentWeapon player;
                player action ["SwitchWeapon", player, player, 100];
                player switchcamera cameraView;
                XY_cooldown = time;
            };
            if(!_shift && _ctrlKey && !isNil "XY_currentWeaponToRecall" && {(XY_currentWeaponToRecall != "")}) then {
                if(XY_currentWeaponToRecall in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                    player selectWeapon XY_currentWeaponToRecall;
                };
                XY_cooldown = time;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if( !XY_actionInUse && time - XY_cooldown > 2 ) then {
            XY_cooldown = time;
            XY_actionInUse = true;
            _handled = true;
            [] spawn {
                [] call XY_fnc_actionKeyHandler;
                XY_actionInUse = false;
            };
        };
    };

    case 19: {

        //Restraining (Shift + R)
        if( _shift && !_alt && !_ctrlKey ) then {
            _handled = true;

            if( !(isNull _cursorObject) && _cursorObject isKindOf "Man" && isPlayer _cursorObject && alive _cursorObject && _cursorObject distance player < 4 && !(_cursorObject getVariable "escorting") && !(_cursorObject getVariable "restrained") && speed _cursorObject < 1.5 && time - XY_cooldown > 1 ) then {
                XY_cooldown = time;
                // Some more checks if we are civilian...
                if( ( playerSide == west && side _cursorObject != west ) || (animationState _cursorObject) == "incapacitated" ) then {
                    if( playerSide == west || ([false, "handschellen", 1] call XY_fnc_handleInv) ) then {
                        [] call XY_fnc_restrainAction;
                    } else {
                        hint "Du hast keine Handschellen dabei!";
                    };
                };
            };
        };

        // Red Gull (ALT + R)
        if( !_shift && _alt && !_ctrlKey ) then {
            _handled = true;
            [ "redgull" ] call XY_fnc_useItem;
        };
    };

    //Knock out, this is experimental and yeah...
    case 34: {
        if( _shift && !_alt && !_ctrlKey ) then {
            _handled = true;

        if (playerSide isEqualTo west && side _cursorObject isEqualTo civilian) exitWith { hint "Bist du Korrupt oder bist du Sarflax Jenkins?";};
		
		if( time - XY_cooldown > 2 && !isNull _cursorObject && _cursorObject isKindOf "Man" && isPlayer _cursorObject && alive _cursorObject && _cursorObject distance player < 4 && speed _cursorObject < 1) then {
                if( (animationState player) != "incapacitated" && (animationState _cursorObject) != "incapacitated" && ( currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player ) && currentWeapon player != "" && !XY_isTazed && !(player getVariable["surrender", false]) ) then {
                    XY_cooldown = time;

                    [getPlayerUID player, 8, format ["Hat %1 (%2) niedergeschlagen @ %3", name _cursorObject, getPlayerUID _cursorObject, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
                    [getPlayerUID _cursorObject, 8, format ["Wurde von %1 (%2) niedergeschlagen @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];

                    [_cursorObject] spawn XY_fnc_knockoutAction;
                    [player, "knockout"] remoteExec ["say3D", -2];
            
   			    };
            };
        };
    };

    //T Key (Trunk)
    case 20: {

        if( !_shift && !_alt && !_ctrlKey ) then {
            _handled = true;

            if( !XY_actionInUse && (time - XY_cooldown) > 1 ) then {
                XY_cooldown = time;

                if( _vehicle != player && alive vehicle player ) then {
                    if(_vehicle in XY_vehicles) then {
                        [_vehicle] spawn XY_fnc_openInventory;
                    };
                } else {
                    if((_cursorObject isKindOf "Car" || _cursorObject isKindOf "Air" || _cursorObject isKindOf "Ship" || _cursorObject isKindOf "House_F") && player distance _cursorObject < 7 && _vehicle isEqualTo player && alive _cursorObject) then {
                        if( _cursorObject in XY_vehicles || { !(_cursorObject getVariable ["locked", true]) } || { (( _cursorObject isKindOf "Car" || _cursorObject isKindOf "Air" || _cursorObject isKindOf "Ship") && locked _cursorObject == 0) } ) then {
                            [_cursorObject] spawn XY_fnc_openInventory;
                        };
                    };
                };
            };
        };
    };
    //L Key?
    case 38: {
        // Turn on flashlights
        if( _shift && (_vehicle getVariable[ "side", sideUnknown ]) in [west, east, independent] && _vehicle != player && driver _vehicle == player && time - XY_cooldown > 3 ) then {
            XY_cooldown = time;
            _handled = true;

            // Toggle lights status
            _vehicle setVariable["lights", !(_vehicle getVariable["lights", false]), true];

            // Should it be on?
            if( _vehicle getVariable["lights", false] ) then {
                [_vehicle] remoteExec ["XY_fnc_flashLights", -2];
            };
        };
        if( !_alt && !_ctrlKey ) then {
            [] call XY_fnc_radar;
        };
    };
    //Y Player Menu
    case 21: {
        if( !_alt && !_ctrlKey && !dialog && !XY_actionInUse ) then {
            [] call XY_fnc_p_openMenu;
        };
    };
    // Shift -> Chip tuning boost
    case 42: {

        if( _vehicle != player && { local _vehicle } && { isEngineOn _vehicle } && { _vehicle getVariable["chip.enabled", false] } ) then {
            [_vehicle] call XY_fnc_chipboost;
        };
    };
    case 24: {
        // Shift+O, gate opener
        if( _shift && !_alt && !_ctrlKey ) then {
            _handled = true;
            if ( playerSide != civilian && (time - XY_cooldown) > 2 ) then {
                XY_cooldown = time;
                [] call XY_fnc_copOpener;
            };
        };
        // Alt+O, show cop/med/thw-license / passport(TODO!)
        if ( !_shift && _alt && !_ctrlKey ) then {
            _handled = true;
            if( (time - XY_cooldown) > 5 ) then {
                XY_cooldown = time;
                [] call XY_fnc_showPassport;
            };
        };
    };

    //F Key
    case 33: {

        _side = _vehicle getVariable[ "side", sideUnknown ];

        if( _vehicle != player && { (driver _vehicle) == player } && { _side in [west, east, independent] } && { time - XY_cooldown > 2 } ) then {
            XY_cooldown = time;

            _message = "";
            _duration = 0;
            _sirenSound = "";

             switch ( true ) do {
                // F = Standard Siren
                case( _side == west && !_alt && !_ctrlKey && !_shift ): {
                    _message = "Sirene";
                    _sirenSound = "sirencoplong";
                    _duration = 3.8;
                };
                // Shift+F = Short siren
                case( _side == west && !_alt && !_ctrlKey && _shift ): {
                    _message = "Heulen";
                    _sirenSound = "sirencop";
                    _duration = 3.7;
                };
                // Shift+F = Megaphon voice
                case( _side == west && playerSide == west && !_alt && _ctrlKey && !_shift ): {
                    _message = "Warnung";
                    _sirenSound = "warningcop";
                    _duration = 8;
                };
                case( _side == independent && !_alt && !_ctrlKey && !_shift ): {
                    _message = "Sirene";
                    _sirenSound = "sirenmedic" ;
                    _duration = 3;
                };
                case( _side == independent && !_alt && !_ctrlKey && _shift ): {
                    _message = "Horn";
                    _sirenSound = "sirenmedicalt" ;
                    _duration = 6.5;
                };
                case( _side == east && !_alt && !_ctrlKey && !_shift ): {
                    _message = "Hupe";
                    _sirenSound = "thwhorn";
                    _duration = 3;
                };
                case( _side == east && _alt && !_ctrlKey && !_shift ): {
                    _message = "Sirene";
                    _sirenSound = "thwsiren";
                    _duration = 3.45;
                };
                case( _side == east && !_alt && _ctrlKey && _shift ): {
                    _message = "Sonder-Sirene";
                    _sirenSound = "thwspecial";
                    _duration = 42;
                };
            };

            if( _sirenSound == "" ) exitWith {};

            _state = _vehicle getVariable[ _sirenSound, false];
            _vehicle setVariable[ _sirenSound, !_state, true ];

            if( _state ) then {
                titleText [ _message + " AUS", "PLAIN"];
            } else {
                titleText [ _message + " AN", "PLAIN"];
                [_vehicle, _sirenSound, _duration] remoteExec ["XY_fnc_siren", -2 ];
            };
        };
    };

    //U Key
    case 22: {
        if( !_alt && !_ctrlKey && time - XY_cooldown > 1 ) then {
            XY_cooldown = time;
            _handled = true;

            if( _vehicle isEqualTo player ) then {
                _vehicle = _cursorObject;
            };

            if(_vehicle isKindOf "House_F" && playerSide == civilian) then {
                if(_vehicle in XY_vehicles && player distance2D _vehicle < 15) then {
                    _door = [_vehicle] call XY_fnc_nearestDoor;
                    if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
                    _locked = _vehicle getVariable [format["bis_disabled_Door_%1",_door],0];
                    if(_locked == 0) then {
                        _vehicle setVariable[format["bis_disabled_Door_%1",_door],1,true];
                        _vehicle animate [format["door_%1_rot",_door],0];
                        systemChat localize "STR_House_Door_Lock";
                    } else {
                        _vehicle setVariable[format["bis_disabled_Door_%1",_door],0,true];
                        _vehicle animate [format["door_%1_rot",_door],1];
                        systemChat localize "STR_House_Door_Unlock";
                    };
                };
            } else {
                _locked = locked _vehicle;
                if(_vehicle in XY_vehicles && player distance _vehicle < 8) then {
                    _targetState = [0, 2] select (locked _vehicle != 2);
                    [ _vehicle, _targetState ] remoteExec ["XY_fnc_lockVehicle", _vehicle];
                    hint composeText [ image ("icons\" + (["unlock", "lock"] select (_targetState == 2)) + ".paa"), " " + (["Aufgeschlossen", "Abgeschlossen"] select (_targetState == 2 )) ];
                    [_vehicle, "locksound"] remoteExec ["say3D", -2];
                };
            };
        };
    };

    //Q Key
    case 16: {
        if( playerSide == west && { _vehicle != player } && { driver _vehicle == player } && { _vehicle isKindOf "Car" } && { time - XY_cooldown > 3 } ) then {
            _handled = true;
            XY_cooldown = time;
            [_vehicle, "policehonk"] remoteExec ["say3D", -2];
        };
    };

    //Surrender key Shift + B
    case 48: {

        if (_shift) then {
            _handled = true;
            if( _vehicle isEqualTo player && (animationState player) != "incapacitated" && !XY_isTazed ) then {
                if (player getVariable ["surrender", false]) then {
                    player setVariable ["surrender", false, true];
                } else {
                    [] spawn XY_fnc_surrender;
                };
            };
        };

        if( _alt ) then {
            _handled = true;
            if( playerSide == west && { time - XY_cooldown > 1 } ) then {
                XY_cooldown = time;
                call XY_fnc_seizeObjects;
            };
        };
    };

    //EMP Konsole - K
    case 37: {
        if( !_shift && !_alt && !_ctrlKey && (playerSide == west) && _vehicle != player && (typeOf _vehicle) in ["B_Heli_Transport_01_F", "I_Heli_light_03_unarmed_F"]) then {
            [] call XY_fnc_openEmpMenu;
        };
    };

    //Shift+P = Faded Sound
    case 25: {
        if( _shift ) then {
            [] call XY_fnc_fadeSound;
            _handled = true;
        };
    };

    default {

        if( _code in (actionKeys "ShowMap") && !visibleMap ) then {
            [] spawn XY_fnc_mapMarkers;
        };

        if( _code >= 2 && _code < (2 + (count XY_funAnimations)) ) then {
            if( _shift && _vehicle isEqualTo player && time - XY_cooldown > 6 ) then {
                XY_cooldown = time;
                _handled = true;
                player playMove (XY_funAnimations select (_code - 2) );
            };
        };
    };
};

_handled;