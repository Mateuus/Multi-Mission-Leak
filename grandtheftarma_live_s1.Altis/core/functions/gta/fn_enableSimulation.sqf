/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_enable" ];
_object = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_enable = [ _this, 1, true, [true] ] call GTA_fnc_param;

//--- Error checking
if ( isNull _object ) exitWith { [ "'%1' is null", _object ] call BIS_fnc_error; false };
if ( isPlayer _object ) exitWith { [ "'%1' cannot be executed on '%2' because object is a player", _functionName, _object ] call BIS_fnc_error; false };

//--- Execute only on server
if ( !isServer ) exitWith {

	[ _this, _fnc_scriptname, false ] call GTA_fnc_remoteExec;
	true

};

//--- Set the objects simulation
_object enableSimulationGlobal _enable;

true
