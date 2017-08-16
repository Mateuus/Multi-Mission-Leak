// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// mildly "inspired" by the original from Tonic

private _time = param[0, -1, [0]];

if( _time < 1 || _time > 60 ) then {
    format [ "<CERROR> %1 (%2) called jailMe incorrectly: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
    _time = 15;
};

XY_canPayBail = false;
XY_bailAmount = ( (1 max round( _time / 15)) * 100000 );

private _bailTime = _time / 2 * 60;
private _timeOut = time + _time * 60;
private _escaped = false;
private _nextSave = time + 120;

// make sure the jailed person can buy some food
if( XY_CC < 500 ) then {
    XY_CC = 500;
};

while { true } do {
    private _countdown = floor( _timeOut - time );

    if( !XY_canPayBail && _countdown < _bailTime ) then {
        XY_canPayBail = true;
    };
    private _message = [ _countdown, "MM:SS" ] call BIS_fnc_secondsToString;
    if( XY_canPayBail ) then {
        _message = _message + format[ "\n\nKaution kann gezahlt werden!\nPreis: %1€", [XY_bailAmount] call XY_fnc_numberText ];
    } else {
        _message = _message + format[ "\n\nKautionszahlung nach halber Haftzeit möglich\nPreis: %1€", [XY_bailAmount] call XY_fnc_numberText ];
    };
    hintSilent _message;

    if( !(alive player) || XY_bailPaid ) exitWith {};
    if( player distance (getMarkerPos "jail_marker") > 60 ) exitWith {
        _escaped = true;
    };
    if( _countdown < 1 ) exitWith {
        hintSilent "";
    };
    if( _nextSave <= time ) then {
        _nextSave = time + 120;
        [ player, ceil(_countdown / 60) ] remoteExec ["XYDB_fnc_updateJailTime", XYDB];
    };
    sleep 1;
};

switch (true) do {
    case ( XY_bailPaid ): {
        hint "Du hast die Kaution gezahlt und bist nun frei";
        [getPlayerUID player] remoteExec ["XY_fnc_wantedRemove", 2];
    };
    case ( _escaped ): {
        hint "Du bist aus dem Knast entkommen: Du behälst deine Straftaten und dein Ausbruch wurde hinzugefügt";
        [0, format["%1 ist aus dem Knast ausgebrochen!", profileName]] remoteExec ["XY_fnc_broadcast"];
        [getPlayerUID player, "147"] remoteExec ["XY_fnc_wantedAdd", 2];
    };
    case ( alive player && !_escaped && !XY_bailPaid ): {
        hint "Du hast deine Strafe abgesessen und bist nun frei";
        [getPlayerUID player] remoteExec ["XY_fnc_wantedRemove", 2];
    };
};

XY_canPayBail = false;
XY_bailAmount = 0;
XY_bailPaid = false;

if( !_escaped ) then {
    player setPos (getMarkerPos "jail_release");
};

if( !(alive player) ) exitWith {};

XY_isArrested = false;
[2] call XY_fnc_updatePartial;