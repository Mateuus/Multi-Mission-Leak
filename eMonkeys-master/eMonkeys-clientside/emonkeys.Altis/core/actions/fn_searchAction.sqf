/*
	File: fn_searchAction.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the searching process.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {};
hint "Durchsuchen...";
player say3D "patdown"; 	// Durchsuchsound
uisleep 2;
if(player distance _unit > 5 || ((!alive player) || (player getVariable["onkill",FALSE])) || ((!alive _unit) || (_unit getVariable["onkill",FALSE]))) exitWith {hint "Du kannst die Person nicht durchsuchen"};
[[player],"EMonkeys_fnc_searchClient",_unit,false] call EMonkeys_fnc_mp;
eM_action_inUse = true;