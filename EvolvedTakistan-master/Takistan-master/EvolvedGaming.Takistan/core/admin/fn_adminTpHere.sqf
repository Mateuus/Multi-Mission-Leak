#include <macro.h>
/*
	File: fn_adminTpHere.sqf
	Author: ColinM9991
	
	Description:
	Teleport selected player to you.
*/
if(FETCH_CONST(life_adminlevel) == 0) exitWith {closeDialog 0;};

private["_target"];
_target = lbData[2902,lbCurSel (2902)];
_target = call compile format["%1", _target];
if(isNil "_target") exitwith {};
if(isNull _target) exitWith {};
if(_unit == player) exitWith {hint localize "STR_ANOTF_Error";};

_target setPos (getPos player);
hint format["You have teleported %1 to your location",_target getVariable["realname",name _target]];
if(FETCH_CONST(life_adminlevel) < 5) then {[[0,format["%1 has teleported %2 to their location.",str profileName,_target getVariable["realname",name _target]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;};