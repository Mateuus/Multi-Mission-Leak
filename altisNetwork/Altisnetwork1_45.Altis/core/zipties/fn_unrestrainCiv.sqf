#include "..\..\script_macros.hpp"
/*
	File: fn_unrestrain.sqf
	Author: 
	
	Description:
	
*/
private["_unit"];
_unit = param [0,ObjNull,[ObjNull]];
if(isNull _unit OR !(_unit getVariable ["restrainedCiv",FALSE])) exitWith {}; //Error check?

_unit setVariable ["restrainedCiv",FALSE,TRUE];
_unit setVariable ["Escorting",FALSE,TRUE];
_unit setVariable ["transporting",FALSE,TRUE];
detach _unit;

[0,"STR_NOTF_unzipteed",true,[_unit getVariable ["realname",name _unit], profileName]] remoteExecCall ["life_fnc_broadcast",RCLIENT];