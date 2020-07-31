/*
	File: fn_pulloutAction.sqf
	
	
	Description:
	Pulls civilians out of a car if it's stopped.
*/
private["_crew"];
_crew = crew cursorTarget;
_veh = cursortarget;

if(side player == civilian && !(_veh in life_vehicles)) exitwith {};

{
	_x setVariable ["transporting", nil, true]; 
	_x setVariable ["Escorting", nil, true];
	[_x] remoteExecCall ["life_fnc_pulloutVeh",_x];
} foreach _crew;