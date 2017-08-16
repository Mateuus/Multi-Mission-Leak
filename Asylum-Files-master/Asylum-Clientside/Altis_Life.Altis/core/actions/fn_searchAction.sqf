/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {};
hint "Searching...";
sleep 2;
if(player distance _unit > 5 || !alive player || !alive _unit) exitWith {hint "Cannot search that person."};

//[[43, player, format["Searched %1", name _unit]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

[[player],"life_fnc_searchClient",_unit,false] spawn life_fnc_MP;
