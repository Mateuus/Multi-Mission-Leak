/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit) exitWith {};
hint localize "STR_NOTF_Searching";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[[player],"lhm_fnc_searchClientCOP",_unit,false] call lhm_fnc_mp;
lhm_action_inUse = true;