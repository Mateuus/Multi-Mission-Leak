/*
	File: fn_putInCar.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finds the nearest vehicle and loads the target into the vehicle.
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit OR !isPlayer _unit) exitWith {};
if((side _uni == west)) exitWith {};

_nearestVehicle = nearestObjects[getPosATL player,["Car","Ship","Submarine","Air"],10] select 0;
if(isNil "_nearestVehicle") exitWith {hint "Es ist kein Fahrzeug in der Nähe .."};

detach _unit;
[[_nearestVehicle],"EMonkeys_fnc_moveIn",_unit,false] call EMonkeys_fnc_MP;
_unit setVariable["Escortingciv",FALSE,TRUE];
_unit setVariable["transportingciv",TRUE,TRUE];