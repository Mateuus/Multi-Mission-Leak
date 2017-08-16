#include <macro.h>
/*
	Author: ArmA.Network
	The usage of this file is restricted to ArmA.Network
	You're not allowed to modify this file!
	Licensed under the Arma EULA and Arma Tools EULA.
	For further questions contact the author!
*/
_vehicle = cursorTarget;
_list = ["Air","Ship","LandVehicle"];
if(isNull _vehicle OR {!(KINDOF_ARRAY(_vehicle,_list))}) exitWith {};

createDialog "vehiclecargo";

{
	lbAdd [1500, _x];
} forEach (getWeaponCargo _vehicle select 0);

{
	lbAdd [1500, _x];
} forEach (getMagazineCargo _vehicle select 0);

{
	lbAdd [1500, _x];
} forEach (getItemCargo _vehicle select 0);
{
	lbAdd [1500, _x];
} forEach (getBackPackCargo _vehicle select 0);
