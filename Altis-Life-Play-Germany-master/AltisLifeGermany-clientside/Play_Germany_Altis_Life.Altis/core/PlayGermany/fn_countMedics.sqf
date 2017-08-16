/*
	File: fn_countMedics.sqf
	Author: Rafi Quak for PlayGermany
	
	Description:
	Calculates the number of medics
*/
private["_medics"];
_medics = [];
_number = 0;

{
	if (side _x == independent) then {
		if ((_x getVariable ["hsd",""]) in ["med","thw"]) then { _medics pushBack _x };
	};
} foreach playableUnits;

_number = count _medics;

_number;