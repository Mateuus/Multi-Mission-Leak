#include "\life_server\script_macros.hpp"
/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	When a client disconnects this will remove their corpse and
	clean up their storage boxes in their house.
*/
private["_unit","_id","_uid","_name"];
_unit = SEL(_this,0);
if(isNull _unit) exitWith {};
_id = SEL(_this,1);
_uid = SEL(_this,2);
_name = SEL(_this,3);

_containers = nearestObjects[_unit,["WeaponHolderSimulated"],5];
{deleteVehicle _x;} foreach _containers;
deleteVehicle _unit;

{
	_pid = _x getVariable["steam64ID",""];
	
	if(_uid == _pid OR _pid == "" OR owner _x < 3) then {
		_containers = nearestObjects[_x,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
		{deleteVehicle _x;} foreach _containers; //Delete the containers.
		deleteVehicle _x; //Get rid of the corpse.
	}
} foreach playableUnits;

_uid spawn TON_fnc_houseCleanup;