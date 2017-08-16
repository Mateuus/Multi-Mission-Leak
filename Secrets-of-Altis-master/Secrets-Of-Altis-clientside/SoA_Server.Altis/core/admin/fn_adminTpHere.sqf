#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(__GETC__(life_adminlevel) < 2) exitWith {
	closeDialog 0; 
	[] call life_fnc_crashStart;
	_message = format["%1 verwendet unbefugt den Admin-Teleport (herporten)!", name player];
	[["",_message,player,8],"SOA_fnc_handleMessages",false,false] spawn life_fnc_MP;
};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint localize "STR_ANOTF_Error";};

[player] remoteExecCall ["life_fnc_teleportPlayer",_target];
[name player, format["hat %1 zu sich teleportiert!",name _target],call life_adminlevel,7] remoteExecCall ["life_fnc_logdat",2];