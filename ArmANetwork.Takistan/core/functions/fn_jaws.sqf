/*
	File: fn_emspulloutAction.sqf

	Pulls all players from a vehicle
*/
private["_crew"];
_myposy = getPos player;

_crew = crew cursorTarget;

{
	if(side _x == independent || side _x == west || side _x == civilian) then
	{
			_x setVariable ["transporting", nil, true]; 
			_x setVariable ["Escorting", nil, true];
			[[_x],"life_fnc_pulloutVeh",_x,false] call life_fnc_MP;
	};
} foreach _crew;


