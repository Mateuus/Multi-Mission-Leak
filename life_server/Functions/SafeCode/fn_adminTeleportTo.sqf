#include <macro.h>
/*
	File: fn_adminTeleportTo.sqf
	Author: Kevin Webb
	
	Description:
	Teleports yourself to a selected player.
*/
if(__GETC__(life_adminlevel) < 3) exitWith {closeDialog 0; hint localize "STR_ANOTF_ErrorLevel";};
private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format ["%1", _target];
if(isNil "_target") exitWith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint "You cannot teleport to yourself!";};

player setPosATL (getPosATL _target);
[[0,format["%2 has teleported to %1",_target getVariable["realname",name _target],profileName]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP;