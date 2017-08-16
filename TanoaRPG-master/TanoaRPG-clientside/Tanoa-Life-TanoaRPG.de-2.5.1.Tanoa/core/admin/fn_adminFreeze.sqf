#include <macro.h>
/*
	File: fn_adminFreeze.sqf
	Author: CooliMC "Marc"
	
	Description:
	Freeze a player
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[player, _unit] remoteExec ["TEX_fnc_adminFreeze", 2, false];
if((vehicle _unit) != _unit) then
{
	if(simulationEnabled _unit) then
	{
		hint format["Du hast %1's Fahrzeug eingefroren",_unit getVariable["realname",name _unit]];	
	} else {
		hint format["Du hast %1's Fahrzeug aufgetaut",_unit getVariable["realname",name _unit]];
	};
} else {
	if(simulationEnabled _unit) then
	{
		hint format["Du hast %1 eingefroren",_unit getVariable["realname",name _unit]];	
	} else {
		hint format["Du hast %1 aufgetaut",_unit getVariable["realname",name _unit]];
	};
};