/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Unloads a vehicle from the back of another
*/
private["_vehicle","_attached"];

_vehicle = nearestObjects[getPos (vehicle player), ["LandVehicle"],20];
_vehicle = _vehicle select 0;
if(!(_vehicle in DS_keyRing))exitwith{hint "You must have the vehicles keys to do this"};
_attached = [];
{
	_attached pushBack _x;
}forEach attachedObjects _vehicle;
_attached = _attached select 0;
if(isNull _vehicle) exitWith {};

hint "Unloading, please stand clear of the rear of this vehicle";
systemchat "Unloading, please stand clear of the rear of this vehicle";

sleep 5;

switch(typeOf _vehicle)do
	{
	case "I_Truck_02_transport_F":
		{
		_attached attachTo[_vehicle,[0,-8.5,-0.4]];
		};
	case "B_Truck_01_transport_F":
		{
		_attached attachTo[_vehicle,[0,-14.5,-0.2]];
		};
	};
_attached allowDamage false;
sleep 1;
{
	detach _x;	
}forEach attachedObjects _vehicle;
hint "Vehicle Unloaded";
_vehicle setVariable ["gotLoad",false,true];
sleep 1;
_attached allowDamage true;



















