/*
	File: fn_playerCount.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_containers"];
_unit = _this select 0;

//Comment this code out if you want them to keep the weapon on the ground.
_containers = nearestObjects[getPosATL _unit,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
{deleteVehicle _x;} foreach _containers; //Delete the containers.