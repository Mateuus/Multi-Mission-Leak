/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Cleans up dead bodies locally
*/

{
	if(!(_x getVariable ["revive",false]))then {
		deleteVehicle _x;
	};
} forEach allDeadMen;