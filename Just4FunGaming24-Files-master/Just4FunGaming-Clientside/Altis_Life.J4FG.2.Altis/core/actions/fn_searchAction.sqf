// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_unit"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _unit) exitWith {};

if( XY_actionInUse ) exitWith {};
XY_actionInUse = true;

hint localize "STR_NOTF_Searching";

sleep 2;
if( player distance _unit > 5 || !alive player || !alive _unit ) exitWith {
    hint localize "STR_NOTF_CannotSearchPerson"
};
[player] remoteExec ["XY_fnc_searchClient", _unit];