// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// based on work by Tonic

private _building = param[0, objNull, [objNull]];

if( isNull _building ) exitWith {};

if( !(_building isKindOf "House_F") ) exitWith {
    hint "Du schaust nicht auf eine Tür"
};

closeDialog 0;

private _doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

private _door = 0;
private _doorPosition = [];
for "_i" from 1 to _doors do {
    _doorPosition = _building modelToWorld (_building selectionPosition format["Door_%1_trigger", _i]);
    if( player distance _doorPosition < 5 ) exitWith {
        _door = _i;
    };
};
if( _door <= 0 ) exitWith {
    hint "Du bist nicht in der Nähe einer Tür";
};
if( (_building getVariable[format["bis_disabled_Door_%1", _door], 0]) == 0 ) exitWith {
    hint "Die Tür ist bereits offen";
};

private _isBank = XY_FED_DOME isEqualTo _building || XY_FED_RSB isEqualTo _building;
private _isJail = XY_JAIL isEqualTo _building;

if( _isJail ) then {
    [[0, 1], "ACHTUNG: Das Staatsgefängnis wird aufgebrochen!"] remoteExec ["XY_fnc_broadcast"];
};
if( _isBank ) then {
    [[0, 1], "ACHTUNG: Die Staatsbank wird aufgebrochen!"] remoteExec ["XY_fnc_broadcast"];
};

private _ownerID = "UNKNOWN";
private _ownerName = "ERROR";

if( !_isBank && !_isJail ) then {
    _owner = _building getVariable["house_owner", []];
    if ( !(_owner isEqualTo []) ) then {
        _ownerID = _owner select 0;
        _ownerName = _owner select 1;
    };
    [0, format["%1 bricht in das Haus von %2 ein", profileName, _ownerName ]] remoteExec ["XY_fnc_broadcast", [civilian, 2]];
    {
        if( getPlayerUID _x isEqualTo _ownerID ) exitWith {
            [ [0, 1], format["%1 bricht in dein Haus ein", profileName]] remoteExec ["XY_fnc_broadcast", _x];
        };
    } forEach allPlayers;
};

XY_interrupted = false;
XY_actionInUse = true;

if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 1;
};

disableSerialization;

private _duration = 120;

private _cp = 0;
private _startTime = time;
private _timeOut = _startTime + _duration;
private _animTarget = time;
private _interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
private _ui = uiNameSpace getVariable "XY_progressBar";
private _progress = _ui displayCtrl 38201;
private _progressText = _ui displayCtrl 38202;

while { alive player && player == vehicle player && !XY_isTazed && !XY_interrupted && !(player getVariable["restrained", false]) && player distance _doorPosition < 10 } do {
    if( _animTarget <= time ) then {
        _animTarget = time + 5.5;
        player playAction "medicStartUp";
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progress progressSetPosition _cp;
    _progressText ctrlSetText format["Breche Tür auf... (%1%2)", round (_cp * 100), "%"];

    if(_cp >= 1) exitWith {
        _interrupted = false;
    };
    sleep 0.25;
};

5 cutText ["", "PLAIN"];
player playActionNow "stop";
XY_actionInUse = false;

if( !([false, "boltcutter", 1] call XY_fnc_handleInv) ) then {
    _interrupted = true;
};

if( _interrupted ) exitWith {
    XY_interrupted = false;
    hint localize "STR_NOTF_ActionCancel";
};

[getPlayerUID player, if(_isBank || _isJail) then { "145" } else { "123" } ] remoteExec ["XY_fnc_wantedAdd", 2];

if( !(_isBank) ) then {
    [_ownerID, 12, format ["Hauseinbruch durch %1 (%2) @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
    [getPlayerUID player, 12, format ["Bricht in Haus von %1 (%2) ein @ %3", _ownerName, _ownerID, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
};

_building setVariable[format["bis_disabled_Door_%1", _door], 0, true]; //Unlock the door.
if( _isBank ) then {
    fed_bank setVariable[ format["door.open.%1", _door], true, true ];
};

if( (_building getVariable["locked", false]) ) then {
    _building setVariable["locked", false, true];
};