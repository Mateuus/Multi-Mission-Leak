/*
	File: fn_calTalents.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Calculates the maximum number of talents the player can have given their experience.
*/
private["_max","_req","_i","_maxTalents"];

_max = 0;
if (isNil "life_gangperk") then { life_gangperk = false };
_maxTalents = if (life_gangperk) then { life_maxGangTalents } else { life_maxTalents };

for [{_i=_maxTalents}, {_i>0}, {_i=_i-1}] do
{
	_req = [_i] call ASY_fnc_experienceReq;
	_exp = if (life_gangperk) then { life_gangexp } else { life_experience };
	if (_exp >= _req) exitWith { _max = _i; };
};

_max;