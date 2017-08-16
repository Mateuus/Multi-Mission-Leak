#include <macro.h>
/*
	File: fn_adminKick.sqf
	Author: CooliMC "Marc"
	
	Description:
	Kick a player
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[player, _unit] remoteExec ["TEX_fnc_adminKick", 2, false];