/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Unloads a vehicle from the back of another (Un-towing Mechanic version)
*/
private["_vehicle","_attached"];

_vehicle = cursorTarget;
if(!(_vehicle in DS_keyRing))exitwith{hint "You must have the vehicles keys to do this"};
_attached = [];
{
	_attached pushBack _x;
}forEach attachedObjects _vehicle;
_attached = _attached select 0;
if(isNull _vehicle) exitWith {};

hint "Disconnecting Vehicle, please stand clear of the rear of this vehicle";
systemchat "Disconnecting Vehicle, please stand clear of the rear of this vehicle";

_attached attachTo[_vehicle,[0,-12.5,0]];
_attached allowDamage false;

{
	detach _x;	
}forEach attachedObjects _vehicle;
_attached setPosATL [getPosATL _attached select 0, (getPosATL _attached select 1), (getPosATL _attached select 2) +2];
hint "Vehicle Disconnected";
_vehicle setVariable ["gotLoad",false,true];
sleep 5;
_attached allowDamage true;



















