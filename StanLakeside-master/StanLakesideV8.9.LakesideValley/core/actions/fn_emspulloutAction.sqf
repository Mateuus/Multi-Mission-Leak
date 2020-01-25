/*
	File: fn_emspulloutAction.sqf

	Pulls all players from a vehicle
*/
private["_crew"];
_myposy = getPos player;

_crew = crew cursorTarget;

{
	_x setVariable ["transporting", nil, true]; 
	_x setVariable ["Escorting", nil, true];
	[_x] remoteExecCall ["life_fnc_pulloutVeh",_x];
} foreach _crew;


