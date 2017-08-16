/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_pair";
_pair = [ _this, 0, [], [[]] ] call GTA_fnc_param;

//--- Check typeName of pair array
if ( typeName _pair != typeName [] ) exitWith {

	[ "Nested element is not an array" ] call BIS_fnc_error;
	false

};

//--- Count pair arry
if ( count _pair  != 2 ) exitWith {

	[ "Pair array must contain exactly 2 items, key and value." ] call BIS_fnc_error;
	false

};

//--- Check if key name is nil
if ( isNil { _pair select 0 } ) exitWith {

	[ "Array contains a nil key name" ] call BIS_fnc_error;
	false

};

//--- Check typeName of key name
if ( typeName ( _pair select 0 ) != typeName "" ) exitWith {

	[ "Array contains an incorrect key name type" ] call BIS_fnc_error;
	false

};

//--- Check key value is nil
if ( isNil { _pair select 1 } ) exitWith {

	[ "Array contains a nil key value" ] call BIS_fnc_error;
	false

};

true
