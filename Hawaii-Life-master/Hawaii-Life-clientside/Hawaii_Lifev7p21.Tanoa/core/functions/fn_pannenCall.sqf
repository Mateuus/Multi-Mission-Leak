#include "..\..\script_macros.hpp"
/*
	Author: Larry
	
	License: You are not allowed to use this File
	Description: Calls the THW
*/
private["_veh","_THWonline"];
_veh = cursorTarget;
_THWonline = independent countSide playableUnits;
if(isNull _veh) exitWith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if(_THWonline > 0) then {
		_veh SVAR["calledTHW",true,true];
		_veh SVAR["vehicleown",profileName,TRUE];
		[player,profileName] remoteExecCall ["life_fnc_medicRequest",independent];
		hint format["Wir haben ihren Notruf erhalten. Bitte bleiben sie ruhig, wir sind in wenigen Minuten da."];
	};
};