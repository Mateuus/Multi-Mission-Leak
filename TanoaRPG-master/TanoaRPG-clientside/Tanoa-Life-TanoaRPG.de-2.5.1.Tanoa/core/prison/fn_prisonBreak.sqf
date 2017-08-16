/*
	File: fn_PrisonBreak.sqf
	Author: CooliMC
	
	Description: Compiles the String back to a Player
*/
private["_unit"];

_unit = lbData[8101,lbCurSel (8101)];
_unit = call compile format["%1", _unit];

if(isNil "_unit") exitWith {_text ctrlSetText "Du hast niemanden ausgewaehlt.";};
if(isNull _unit) exitWith {_text ctrlSetText "Du hast niemanden ausgewaehlt.";};

[_unit] spawn tanoarpg_fnc_progressBarPrison;
