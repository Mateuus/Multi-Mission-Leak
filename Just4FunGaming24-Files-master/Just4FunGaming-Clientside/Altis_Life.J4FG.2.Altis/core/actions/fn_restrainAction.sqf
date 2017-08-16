// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
private _unit = cursorTarget;

if( isNull _unit || { player == _unit } || { !(isPlayer _unit) } || { _unit getVariable ["restrained", false] } ) exitWith {};

[player, "cuff"] remoteExec ["say3D", -2];

[player] remoteExec ["XY_fnc_restrain", _unit];

[getPlayerUID player, 6, format ["Fesselt %1 (%2) @ %3", name _unit, getPlayerUID _unit, mapGridPosition player ]] remoteExec ["XYDB_fnc_log", XYDB];

if( playerSide == west ) then {
    [0, format[localize "STR_NOTF_Restrained", _unit getVariable["realName", name _unit], profileName]] remoteExec ["XY_fnc_broadcast"];
};
