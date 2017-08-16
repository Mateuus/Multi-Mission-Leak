/*
	File: fn_disarmed.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Disarmed by a police officer.
*/

_cop = [_this,0,ObjNull,[Objnull]] call BIS_fnc_param;
if (isNull _cop) exitWith {};

player setVariable ["disarmed", true, true];

life_dead_gear set [0, ""];
life_dead_gear set [1, ""];
life_dead_gear set [2, ""];

[[0,1,2], format["Your weapons have been removed by officer %1.", name _cop]] call life_fnc_broadcast;