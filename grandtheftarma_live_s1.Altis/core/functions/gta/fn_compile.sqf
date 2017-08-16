/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_name", "_script", "_header" ];
_name = [ _this, 0, "", [""] ] call GTA_fnc_param;
_script = [ _this, 1, "", ["",[]] ] call GTA_fnc_param;

if ( typeName _script == typeName [] ) then {

	_script = toString _script;

};

_header = format [ "
	_fnc_scriptNameParentTemp = if !(isnil '_fnc_scriptName') then {_fnc_scriptName} else {'%1'};
	private ['_fnc_scriptNameParent'];
	_fnc_scriptNameParent = _fnc_scriptNameParentTemp;
	_fnc_scriptNameParentTemp = nil;

	private ['_fnc_scriptName'];
	_fnc_scriptName = '%1';
	scriptname _fnc_scriptName;
", _name ];

_script = _header + _script;

missionNamespace setVariable [ _name, compileFinal _script ];
