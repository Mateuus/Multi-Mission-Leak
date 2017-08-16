/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

/*
	0 = Info
	1 = Warning
	2 = Error
*/

private ["_log", "_type"];
_log = [_this, 0, "", ["",[]]] call GTA_fnc_param;
_type = [_this, 1, 0, [0]] call GTA_fnc_param;

//--- Format log
if (typeName _log == typeName []) then {
	if (isLocalized (_log select 0)) then {
		_log set [0, localize (_log select 0)];
	};

	_log = format _log;
} else {
	if (isLocalized _log) then {
		_log = localize _log;
	};
};

//--- Log type
_type = switch _type do {
	case 1: {"Warning"};
	case 2: {"Error"};
	default {"Info"};
};

diag_log text format ["[GTA][%1][%2][%3]: %4", toUpper _type, _fnc_scriptNameParent, diag_frameno, _log];
