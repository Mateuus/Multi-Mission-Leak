#include "..\..\macros.hpp"
/*
	File: fn_opencraftMenu.sqf
	Author: www.division-wolf.de
	
	Description:
	Öffnet Waffenmenü
*/
if ((side player) == west) exitWith {hint "Nicht für die Polizei";};
createDialog "DWEV_craft";
disableSerialization;

