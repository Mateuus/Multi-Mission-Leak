#include "..\..\script_macros.hpp"
/*
	File: fn_lmenu.sqf
	Author: RPGforYOU
*/
private ["_list"];
//Checks
if(!license_civ_rebel) exitWith {hint"You need a rebel license to access customloadouts, purchase one in rebelcamp.";closeDialog 0;};
if(playerSide != civilian) exitWith {hint"Custom loadouts are only available for civilian rebels!(For now atleast)";closeDialog 0;};

//initialize dialog
createDialog "life_lcustom";

//Dialog controls
disableSerialization;
waitUntil {!isNull (findDisplay 3000)};
_list = CONTROL(3000,3001);
lbClear _list;

//listbox fill
OVcustoml = profileNamespace getVariable['OVcustoml',[]];
if!(OVcustoml isEqualTo []) then {
	{_list lbAdd _x;} forEach OVcustoml;
};