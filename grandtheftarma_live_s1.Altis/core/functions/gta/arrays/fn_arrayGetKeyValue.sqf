/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_key", "_default", "_value" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_key = [ _this, 1, "", [""] ] call GTA_fnc_param;
_default = [ _this, 2 ] call GTA_fnc_param;

_value = {

	//--- Validate exisiting key
	if !( [ _x ] call GTA_fnc_arrayValidKey ) exitWith {};

	//--- Check if key name matches
	if ( _key == _x select 0 ) exitWith { ( _array select _forEachIndex ) select 1 };

} forEach _array;

//--- Return value
if ( isNil "_value" ) then {

	_default

} else {

	_value

};
