/*
	File: fn_addExperience.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Adds experience, of course.
	Please either get Asylum permission to use this or create this system yourself.
*/
private["_exp"];

_exp = [_this,0,0,[0]] call BIS_fnc_param;

life_experience = life_experience + floor(_exp);