private["_crew"];
_crew = crew cursorTarget;
{
	if((_x getVariable ["restrained",false]) || (playerSide != independent && side _x != west) || (playerSide == independent && !alive _x)) then
	{
		_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
		[[_x],"life_fnc_pulloutVeh",_x,false] spawn life_fnc_MP;
	};
} foreach _crew;