/*
	File: fn_medicEnroute.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Let's the victim know a medic is on their way
*/

_medic = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (isNull _medic) exitWith {};

life_medic_enroute = _medic;