#include <macro.h>
/*
	File: fn_adminGetID.sqf
	Author: CooliMC "Marc"
	
	Description:
	Get the PID
*/
private["_unit"];
_unit = lbData[2902,lbCurSel (2902)];
_unit = call compile format["%1", _unit];
if(isNil "_unit") exitwith {};
if(isNull _unit) exitWith {};

if(__GETC__(life_adminlevel) == 0) exitWith {closeDialog 0;};

((findDisplay 2900) displayCtrl 2903) ctrlSetStructuredText parseText format["PID: %1",getPlayerUID _unit];
[player, _unit, 3, "[ADMIN-Menu]", "Hat PlayerId abgefragt"] remoteExec ["TEX_FNC_LOGIT", 2];