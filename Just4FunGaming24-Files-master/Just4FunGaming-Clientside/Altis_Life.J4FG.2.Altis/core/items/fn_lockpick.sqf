// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _curTarget = cursorObject;

if( XY_actionInUse ) exitWith {};
if( isNull _curTarget ) exitWith {};

private _distance = ((boundingBox _curTarget select 1) select 0) + 3;
if( player distance _curTarget > _distance ) exitWith {};

private _isVehicle = _curTarget isKindOf "LandVehicle" || _curTarget isKindOf "Ship" || _curTarget isKindOf "Air";
if( _isVehicle && _curTarget in XY_vehicles ) exitWith { hint "Du hast diesen Fahrzeugschlüssen bereits in deinem Schlüsselbund" };

//More error checks
if( !_isVehicle && !isPlayer _curTarget ) exitWith {};
if( !_isVehicle && !(_curTarget getVariable["restrained",false]) ) exitWith {};

private _title = format[ "Breche %1 auf...", if( !_isVehicle ) then { "Handschellen" } else { getText(configFile >> "CfgVehicles" >> (typeOf _curTarget) >> "displayName") } ];

closeDialog 0;

XY_actionInUse = true;
XY_interrupted = false;

// KK: Holster weapon:
if( currentWeapon player != "" ) then {
    XY_currentWeaponToRecall = currentWeapon player;
    player action ["SwitchWeapon", player, player, 100];
    player switchcamera cameraView; // << What is this needed for?
    sleep 3;
};

if( _isVehicle && !((_curTarget getVariable["ownerName", ""]) isEqualTo "") ) then {
    [getPlayerUID player, 21, format ["(Versucht) Auto von %1 (%2) aufzubrechen @ %3", _curTarget getVariable[ "ownerName", "ERROR" ], _curTarget getVariable[ "owner", "ERROR" ], mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
    [_curTarget getVariable[ "owner", "ERROR" ], 21, format ["Auto wurde von %1 (%2) (versucht) aufzubrechen @ %3", profileName, getPlayerUID player, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];
};

disableSerialization;

// Etwas witziger gestalten: Versuche dauern zwischen 5 und 15 Sekunden
private _duration = 5 + round(random 10);

private _cp = 0;
private _startTime = time;
private _timeOut = _startTime + _duration;
private _animTarget = time;
private _interrupted = true;

private _alarmed = false;

5 cutRsc ["XY_progressBar","PLAIN"];
private _ui = uiNamespace getVariable "XY_progressBar";
private _progressBar = _ui displayCtrl 38201;
private _progressText = _ui displayCtrl 38202;

private _animCounter = 0;
while { alive player && !XY_isTazed && !XY_interrupted && !(player getVariable["restrained", false]) && player distance _curTarget <= _distance } do {

    if( _animTarget <= time ) then {
        _animTarget = time + 2;
        [player, "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon"] remoteExec ["XY_fnc_animSync", -2];
    };

    _cp = (time - _startTime) / (_timeOut - _startTime);
    _progressBar progressSetPosition _cP;
    _progressText ctrlSetText format[ "%1 (%2%3)", _title, round(_cP * 100), "%" ];

    if( _cp >= 1 ) exitWith {
        _interrupted = false;
    };

    if( playerSide isEqualTo civilian && { _isVehicle } && { !_alarmed } && { _cp > (0.3 + (random 0.5)) } ) then {
        _alarmed = true;
        [_curTarget, "caralarm"] remoteExec ["say3D", -2];
    };

    uisleep 0.333;
};

XY_actionInUse = false;

5 cutText ["","PLAIN"];
player playActionNow "stop";

if( _interrupted ) exitWith {
    hint localize "STR_NOTF_ActionCancel";
};

if( playerSide == civilian && { !([false, "lockpick", 1] call XY_fnc_handleInv) } ) exitWith {};

if( !_isVehicle ) then {
    _curTarget setVariable["restrained", false, true];
    _curTarget setVariable["escorting", false, true];
    _curTarget setVariable["transporting", false, true];
} else {
    private _dice = random(100);
    private _max = 30;

    if( _curTarget getVariable["lockpick.hardened", false] ) then {
        _max = 8;
    };

    if( !(playerSide isEqualTo civilian) || _dice <= _max) then {
        hint "Du hast nun einen Schlüssel zu diesem Fahrzeug";
        if( playerSide isEqualTo civilian ) then {
            [ getPlayerUID player, "124" ] remoteExec ["XY_fnc_wantedAdd", 2];
        };
        XY_vehicles pushBack _curTarget;

    } else {
        hint "Der Dietrich ist abgebrochen";
    };

    if(side player == civilian) then {
        // Bei der Polizei verpetzen:
        if( _dice > 20 && _dice < 45 ) then {
            [ [0, 1], format["%1 wurde beim Aufbrechen eines Autos gesehen: Koordinaten %2", profileName, mapGridPosition player]] remoteExec ["XY_fnc_broadcast", [west, 2]];
        };
    };
};