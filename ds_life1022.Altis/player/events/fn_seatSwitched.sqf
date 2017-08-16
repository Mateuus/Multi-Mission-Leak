/*
    Darkside Life

	Author: ShadowRanger (Luke)

	Description:
	Runs when a player switches seats in a vehicle
*/

params ["_unit1","_unit2","_vehicle"];

_newRole = assignedVehicleRole _unit1;

if(_newRole isEqualTo ["driver"])then {
    if((playerSide isEqualTo civilian)&&{!(_vehicle in DS_keyRing)}&&{!((typeOf _vehicle) isEqualTo "Steerable_Parachute_F")}&&{(player inArea "safezone")||(player inArea "safezone_1")})then {
    	player action ["GetOut",_vehicle];
    	hint "You've been ejected from this vehicle because you don't have it's keys and you're in a safezone";
    };
};