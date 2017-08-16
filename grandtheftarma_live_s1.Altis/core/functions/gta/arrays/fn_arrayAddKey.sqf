/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_key", "_value", "_add", "_index", "_push" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_key = [ _this, 1, "", [""] ] call GTA_fnc_param;
_value = [ _this, 2, 1 ] call GTA_fnc_param;
_add = [ _this, 3, false, [true] ] call GTA_fnc_param;
_index = -1;

_push = {

	//--- Validate exisiting key
	if !( [ _x ] call GTA_fnc_arrayValidKey ) then { false };

	//--- Check if key name matches
	if ( _key == _x select 0 ) exitWith {

		//--- Set existing key value and exit
		[ _array, _key, _value, _add ] call GTA_fnc_arraySetKey;
		false

	};

	true

} forEach _array;
if ( isNil "_push" ) then { _push = true };

//--- Push
if ( _push ) then {

	_index = _array pushBack [ _key, _value ];

};

//--- Return
_index
