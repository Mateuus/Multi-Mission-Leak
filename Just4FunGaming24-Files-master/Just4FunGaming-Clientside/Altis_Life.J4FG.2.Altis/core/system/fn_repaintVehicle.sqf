// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private["_nearVehicles", "_vehicle", "_color"];

_vehicle = XY_currentInteraction;
_color = lbValue[2302, lbCurSel 2302];

if( _color < 0 ) exitWith {
    hint "Keine Farbe ausgewählt";
};

closeDialog 0;

if( _vehicle getVariable["dbInfo", -1] < 0 ) exitWith {
    hint "Mietfahrzeuge können nicht umlackiert werden";
};
if( XY_actionInUse ) exitWith {
    hint "Du bist grad anderweitig beschäftigt";
};
XY_actionInUse = true;

// KK: Holster weapon:
if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 1;
};

disableSerialization;

_duration = 60;

_cp = 0;
_startTime = time;
_timeOut = _startTime + _duration;
_animTarget = time;
_interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
_ui = uiNameSpace getVariable "XY_progressBar";
_progress = _ui displayCtrl 38201;
_progressText = _ui displayCtrl 38202;

while { alive player && player == vehicle player && !XY_isTazed && !(player getVariable["restrained", false]) && player distance _vehicle <= 10 } do {
    if( _animTarget <= time ) then {
        _animTarget = time + 9;
        [player, "spraycan"] remoteExec ["say3D", -2];
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progress progressSetPosition _cp;
    _progressText ctrlSetText format["%1 (%2%3)", format[ "Lackiere %1", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName") ], round (_cp * 100), "%"];

    if(_cp >= 1) exitWith {
        _interrupted = false;
    };
    sleep 0.25;
};

5 cutText ["", "PLAIN"];
XY_actionInUse = false;

if( _interrupted ) exitWith {
    hint localize "STR_NOTF_ActionCancel";
};

[_vehicle, _color] remoteExec ["XYDB_fnc_vehicleRepaint", XYDB ];
[_vehicle, _color] call XY_fnc_vehicleColor;

hint "Fahrzeug wurde umlackiert";