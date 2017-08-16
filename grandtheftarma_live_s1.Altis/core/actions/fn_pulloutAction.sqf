/*
	File: fn_pulloutAction.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew ([] call GTA_fnc_cursorTarget);

{
	_x setVariable ["transporting",false,true]; _x setVariable ["Escorting",false,true];
	[[_x],"life_fnc_pulloutVeh",_x,false] call GTA_fnc_remoteExec;
} foreach _crew;
