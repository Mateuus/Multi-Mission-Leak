// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _vehicle = cursorTarget;

if( isNull _vehicle ) exitWith {};
if( !(_vehicle isKindOf "Car" || _vehicle isKindOf "Ship" || _vehicle isKindOf "Air") ) exitWith {};
if( !("ToolKit" in items player) ) exitWith {};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;
XY_interrupted = false;

if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 1;
};

disableSerialization;

private _duration = 25;

private _cp = 0;
private _startTime = time;
private _timeOut = _startTime + _duration;
private _animTarget = time;
private _interrupted = true;

5 cutRsc ["XY_progressBar", "PLAIN"];
private _ui = uiNameSpace getVariable "XY_progressBar";
private _progress = _ui displayCtrl 38201;
private _progressText = _ui displayCtrl 38202;

while { alive player && player == vehicle player && !XY_isTazed && !XY_interrupted && !(player getVariable["restrained", false]) && player distance _vehicle <= 10 } do {
    if( _animTarget <= time ) then {
        _animTarget = time + 5.5;
        player playAction "medicStartUp";
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progress progressSetPosition _cp;
    _progressText ctrlSetText format["%1 (%2%3)", format[ localize "STR_NOTF_Repairing", getText(configFile >> "CfgVehicles" >> (typeOf _vehicle) >> "displayName") ], round (_cp * 100), "%"];

    if(_cp >= 1) exitWith {
        _interrupted = false;
    };
    sleep 0.25;
};

5 cutText ["", "PLAIN"];
player playActionNow "stop";
XY_actionInUse = false;

if( !("ToolKit" in items player) || _interrupted ) exitWith {
    XY_interrupted = false;
    hint "Abgebrochen";
};
if( playerSide isEqualTo civilian ) then {
    player removeItem "ToolKit";
};

_vehicle setDamage 0;

hint "Fahrzeug repariert";