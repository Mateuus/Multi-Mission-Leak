/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;

{
	if((playerSide != independent && (_x getVariable ["restrained",false])) || (playerSide != independent) || (playerSide == independent && !alive _x)) then
	{
		_x setVariable ["transporting",nil,true]; _x setVariable ["Escorting",nil,true];
		[[player],"life_fnc_pulloutVeh",_x,false] spawn BIS_fnc_MP;
		//[[37, player, format["Pulled %1 out of vehicle", name _x]],"ASY_fnc_logIt",false,false] spawn BIS_fnc_MP;
	};
} foreach _crew;