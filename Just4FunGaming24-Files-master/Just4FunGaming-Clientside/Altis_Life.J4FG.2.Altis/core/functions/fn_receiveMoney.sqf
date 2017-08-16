// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_target", "_value", "_source", "_isTicket"];

if( !params [
    [ "_target",   objNull, [objNull] ],
    [ "_value",    -1,      [0]       ],
    [ "_source",   objNull, [objNull] ],
    [ "_isTicket", false,   [false]   ]
]) exitWith {};

if( !(player isEqualTo _target) || { _target isEqualTo _source } ) exitWith {};

if( _isTicket ) then {
    hint format [ "%1 hat %2€ gezahlt", _source getVariable["realName", name _source], [_value] call XY_fnc_numberText ];
    XY_CA = XY_CA + _value;
} else {
    hint format [ "%1 hat dir %2€ gegeben", _source getVariable["realName", name _source], [_value] call XY_fnc_numberText ];
    XY_CC = XY_CC + _value;
};
[0] call XY_fnc_updatePartial;
[getPlayerUID player, 2, format ["Hat von %1 (%2) %3€ erhalten (TICKET/SPENDE/RECHNUNG: %4)", name _source, getPlayerUID _source, [_value] call XY_fnc_numberText, ["NEIN", "JA"] select _isTicket ]] remoteExec ["XYDB_fnc_log", XYDB];