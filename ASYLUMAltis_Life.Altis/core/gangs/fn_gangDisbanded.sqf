/*
	File: fn_gangDisbanded.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Removes player from the gang if they belong to it
*/

_gang = [_this,0,"",[""]] call BIS_fnc_param;

if (_gang == life_gang) then
{
	life_gang = "0";
};