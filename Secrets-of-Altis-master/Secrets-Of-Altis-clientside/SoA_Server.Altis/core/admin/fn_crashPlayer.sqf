#include <macro.h>
/*
	File: fn_crashPlayer.sqf
	Author: G00golplexian
	
	Description:
	Crashes Hackers Arma -.-
*/
if(__GETC__(life_adminlevel) < 3) exitWith {
	closeDialog 0;
	[] call life_fnc_crashStart;
};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_target == player) exitWith {hint localize "STR_ANOTF_Error";};

remoteExec ["life_fnc_crashStart",_target];
hint "Client Crashed."