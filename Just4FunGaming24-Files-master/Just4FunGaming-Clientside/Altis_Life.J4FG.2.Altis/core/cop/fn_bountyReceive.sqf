// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_value"];

if( !params[
        [ "_value", -1, [0] ]
    ]) exitWith {};

[0, format[ "%1 erhält für die Festnahme eines Kriminellen %2€ Kopfgeld", profileName, [_value] call XY_fnc_numberText]] remoteExec ["XY_fnc_broadcast"];

[getPlayerUID player, 2, format ["Hat %1€ Kopfgeld erhalten", [_value] call XY_fnc_numberText]] remoteExec ["XYDB_fnc_log", XYDB];

hint format[ "Für die Festnahme eines gesuchten Kriminellen erhälst du %1€", [_value] call XY_fnc_numberText ];
XY_CA = XY_CA + _value;
[0] call XY_fnc_updatePartial;