// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_vehicle","_duration", "_ui", "_progress", "_progressText", "_cp", "_startTime", "_timeOut", "_interrupted", "_animTarget"];

_vehicle = cursorTarget;

if( vehicle player != player ) exitWith {
    hint localize "STR_ISTR_RefuelInVehicle"
};
if( isNull _vehicle ) exitWith {
    hint localize "STR_ISTR_Jerry_NotLooking"
};

if( !(_vehicle isKindOF "LandVehicle") && !(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Ship") ) exitWith {};
if( player distance _vehicle > 7.5 ) exitWith {
    hint localize "STR_ISTR_Jerry_NotNear"
};

closeDialog 0;

XY_interrupted = false;
XY_actionInUse = true;

if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 1;
};

disableSerialization;

_duration = 20;

_cp = 0;
_startTime = time;
_timeOut = _startTime + _duration;
_animTarget = time;
_interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
_ui = uiNameSpace getVariable "XY_progressBar";
_progress = _ui displayCtrl 38201;
_progressText = _ui displayCtrl 38202;

while { alive player && player == vehicle player && !XY_isTazed && !XY_interrupted && !(player getVariable["restrained", false]) && (player distance _vehicle) < 10 } do {
    if( _animTarget <= time ) then {
        _animTarget = time + 5.5;
        player playAction "medicStartUp";
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progress progressSetPosition _cp;
    _progressText ctrlSetText format["Befülle %1 (%2%3)", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName"), round (_cp * 100), "%"];

    if(_cp >= 1) exitWith {
        _interrupted = false;
    };
    sleep 0.25;
};

5 cutText ["", "PLAIN"];
player playActionNow "stop";
XY_actionInUse = false;

if( !([false, "fuelF", 1] call XY_fnc_handleInv) ) then {
    _interrupted = true;
};

if( _interrupted ) exitWith {
    XY_interrupted = false;
    hint localize "STR_NOTF_ActionCancel";
};

_amount = switch (true) do {
    case (_vehicle isKindOf "Air"): { 0.1 };
    case (_vehicle isKindOf "Ship"): { 0.2 };
    default { 0.25 };
};
[ _vehicle, 1 min ((fuel _vehicle) + _amount) ] remoteExec ["setFuel", _vehicle];

hint "Fahrzeug betankt!";

[true, "fuelE", 1] call XY_fnc_handleInv;