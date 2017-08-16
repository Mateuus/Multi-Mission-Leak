/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

/*

	0: Client
	1: Server
	2: All clients + server

*/

private [ "_object", "_name", "_value", "_mode", "_global" ];
_object = [ _this, 0, objNull, [objNull,grpNull] ] call GTA_fnc_param;
_name = [ _this, 1, "", [""] ] call GTA_fnc_param;
_value = _this select 2;
_mode = [ _this, 3, 2, [0] ] call GTA_fnc_param;
_global = if ( _mode == 2 ) then { true } else { false };

//--- Unsupported mode
if ( _mode > 2 ) exitWith { [ "Mode %1 is not supported.", _mode ] call BIS_fnc_error; };

if ( _mode > 0 && { !isServer } ) exitWith {

	//--- Broadcast variable from server only
	[ _this, _fnc_scriptname, false ] call GTA_fnc_remoteExec;
	nil

};

if ( isNil "_value" ) then {

	_object setVariable [ _name, nil, _global ];

} else {

	_object setVariable [ _name, _value, _global ];

};
