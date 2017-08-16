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
player say3D "Patdown";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint localize "STR_NOTF_CannotSearchPerson"};
[[player],"ES_fnc_searchClient",_unit,false] call ES_fnc_MP;
ES_action_inUse = true;