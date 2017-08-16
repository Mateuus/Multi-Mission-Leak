// by ALIAS
// nul = [] execVM "ALartillery\alias_hunt.sqf";

if (!isServer) exitWith {};
if (!isNil "ALIAS_player_art") exitWith {}; 

ALIAS_player_art = true;

while {true} do {
	_allunits = [];
	{
		if (alive _x) then
		{
			_allunits pushBack _x;
		};
	}  foreach (if (isMultiplayer) then {playableUnits} else {switchableUnits});
	hunt_alias = _allunits call BIS_fnc_selectRandom;
	publicVariable "hunt_alias"; 
	sleep 60;
};