/*
	File: fn_setUnconscious.sqf
	Author: speed

	Description:
	Toggle unconsciousness
*/

private["_unconscious"];
_unconscious = [_this,0,false,[false]] call BIS_fnc_param;

player setUnconscious _unconscious;
