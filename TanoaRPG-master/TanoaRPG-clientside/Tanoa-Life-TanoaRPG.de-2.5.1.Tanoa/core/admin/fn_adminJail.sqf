#include <macro.h>
/*
	File: fn_adminJail.sqf
	Author: CooliMC "Marc"
	
	Description:
	Send a player to Jail
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

[_unit,false,15] remoteExec ["tanoarpg_fnc_jail", _unit, false];
[player, _unit, 3, "[ADMIN-Menu]", "Hat für 15 Minuten inhaftiert"] remoteExec ["TEX_FNC_LOGIT", 2];
hint format["Du hast %1 für 15 Minuten inhaftiert",_unit getVariable["realname",name _unit]];	