/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_array", "_key", "_value", "_add", "_result", "_index", "_oldValue" ];
_array = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_key = [ _this, 1, "", [""] ] call GTA_fnc_param;
_value = [ _this, 2, 1 ] call GTA_fnc_param;
_add = [ _this, 3, false, [true] ] call GTA_fnc_param;
_result = false;

_index = {

	//--- Validate exisiting key
	if !( [ _x ] call GTA_fnc_arrayValidKey ) exitWith { -1 };

	//--- Check if key name matches
	if ( _key == _x select 0 ) exitWith { _forEachIndex };

	-1

} forEach _array;
if ( isNil "_index" ) then { _index = -1 };

//--- Can set
if ( _index >= 0 ) then {

	if ( _add ) then {

		//--- Add
		_oldValue = ( _array select _index ) select 1;

		switch ( typeName _value ) do {

			//--- Number
			case ( typeName 0 ): {

				_array set [ _index, _oldValue + _value ];

			};

			//--- Array
			case ( typeName [] ): {

				if ( typeName _value == typeName [] ) then {

					//--- Merge arrays
					_array set [ _index, _oldValue + _value ];

				} else {

					//--- Push value to array
					_oldValue pushBack _value;

				};

			};

			default {

				_array set [ _index, _value ];

			};

		};

	} else {

		//--- Set
		_array set [ _index, _value ];

	};

	//--- Set result
	_result = true;

};

//--- Return result
_result
