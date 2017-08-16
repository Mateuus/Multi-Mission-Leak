#include "..\..\script_macros.hpp"
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
closeDialog 0;
if(FETCH_CONST(life_adminlevel) < 4) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
_toSpawn = "O_G_Quadbike_01_F" createVehicle position player;	