/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
params [
	["_unit",objNull,[objNull]]
];
if(isNull _unit) exitWith {};
[localize "STR_NOTF_Searching",5,"blue"] call RPG_Fnc_Msg;
[player,"Patdown"] spawn life_fnc_nearestSound;
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {[localize "STR_NOTF_CannotSearchPerson",5,"gray"] call RPG_Fnc_Msg;};
[player] remoteExec ["life_fnc_searchClient",_unit];
life_action_inUse = true;