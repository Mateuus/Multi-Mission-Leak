#include "..\..\script_macros.hpp"
/*
	File: fn_adminDeleteVehicle.sqf
	Author: [midgetgrimm]
	
	Description:
	deletevehicle
*/
if(FETCH_CONST(life_adminlevel) < 5) exitWith {closeDialog 0; [localize "STR_ANOTF_ErrorLevel",5,"gray"] call RPG_Fnc_Msg;};

private["_target"];
_target = cursorTarget;
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {["You cannot delete people",5,"gray"] call RPG_Fnc_Msg;};
deleteVehicle _target;
closeDialog 0; 
["Object Deleted",5,"blue"] call RPG_Fnc_Msg;