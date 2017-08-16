/*
	File: fn_lockVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Locks the vehicle (used through the network when the person calling it isn't local).
*/
private["_vehicle","_state"];
_vehicle = param [0,Objnull,[Objnull]];
_state = param [1,2,[0,false]];
if(isNull _vehicle) exitWith {};

_vehicle lock _state;
