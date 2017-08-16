/*
	File: fn_addKillCiv.sqf
	Author: Larry
	Disclaimer: You are not allowed to use this.
*/
private["_amount","_type"];
_amount = [_this,0,0] call BIS_fnc_param;
_type = [_this,1,0] call BIS_fnc_param;

if(_type isEqualTo 0) then {
	life_EXPZombiekills = life_EXPZombiekills + 1;
	[_amount] call life_fnc_updateEXP;
} else {
	life_EXPKills = life_EXPKills + 1;
	[_amount] call life_fnc_updateEXP;
};