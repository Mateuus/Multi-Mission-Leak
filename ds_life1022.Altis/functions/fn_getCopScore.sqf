/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Return current cop score depending on online cops, their ranks and if public cops are unlocked
*/

private ["_copRanks"];

_copsRanks = 0;

{
	if((side _x) isEqualTo west)then {
		_copsRanks = _copsRanks + (_x getVariable ["rank",0]);
	};
} forEach allPlayers;

if(!(miscInfoArray select 7))then{_copsRanks = _copsRanks + 4;};

_copsRanks;