/*
	File: fn_calTalents.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Calculates the maximum number of talents the player can have given their experience.
*/
private["_max","_req","_i"];

_max = 0;

for [{_i=life_maxTalents}, {_i>0}, {_i=_i-1}] do
{
	_req = [_i] call ASY_fnc_experienceReq;
	if (life_experience >= _req) exitWith { _max = _i; };
};

_max;