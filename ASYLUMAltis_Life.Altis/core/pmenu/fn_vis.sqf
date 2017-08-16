/*
	File: fn_vis.sqf
	Author: Alan
	
	Description:
	To hide an admin

*/

_isVis = player getVariable["isInvisible",false];

if(!_isVis) then 
{
	[[player, true, life_adminlevel], "ASY_fnc_visible",false,false] call BIS_fnc_MP;
	player setVariable["isInvisible",true, true];
	hint "You are now invisible!";
} else 
{
	[[player, false, life_adminlevel], "ASY_fnc_visible", false, false] call BIS_fnc_MP;
	player setVariable["isInvisible", false, true];
	hint "You are now visible!";
};