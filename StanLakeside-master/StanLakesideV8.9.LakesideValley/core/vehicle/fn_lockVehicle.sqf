/*
	File: fn_lockVehicle.sqf
	
	
	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/

params [["_vehicle", ObjNull, [ObjNull]], ["_state", 2, [0, false]]];

if(isNull _vehicle) exitWith {};

_vehicle lock _state;