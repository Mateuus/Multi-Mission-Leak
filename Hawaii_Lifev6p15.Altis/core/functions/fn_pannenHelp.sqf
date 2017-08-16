#include "..\..\script_macros.hpp"
/*
	Author: Larry
	
	License: You are not allowed to use this File
*/
private["_veh"];
_veh = cursorTarget;
if(isNull _veh) exitWith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	_veh SVAR["calledTHW",false,true];
	_veh SVAR["vehicleown",nil,TRUE];
	ADD(BANK,5000);
	hint "Sie haben den Auftrag erfolgreich abgeschlossen und erhalten 5.000$";
};