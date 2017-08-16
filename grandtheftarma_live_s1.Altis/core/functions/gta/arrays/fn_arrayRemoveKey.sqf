/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_key", "_result" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_key = [ _this, 1, "", [""] ] call GTA_fnc_param;

_result = {

	//--- Validate exisiting key
	if !( [ _x ] call GTA_fnc_arrayValidKey ) exitWith { false };

	//--- Check if key name matches
	if ( _key == _x select 0 ) exitWith {

		//--- Remove key pair
		_array deleteAt _forEachIndex;
		true

	};

	false

} forEach _array;

//--- Return result
_result
