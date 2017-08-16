/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
hintSilent localize "STR_NOTF_Searching";
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hintSilent localize "STR_NOTF_CannotSearchPerson"};
hint format ["Searching %1", name _unit];
[player] remoteExecCall ["life_fnc_xaphetrapath",_unit];
life_action_inUse = true;
