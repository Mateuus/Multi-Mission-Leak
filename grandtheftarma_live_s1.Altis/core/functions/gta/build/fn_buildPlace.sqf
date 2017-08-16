/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object", "_pos" ];
_object = [ _this, 3, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _object ) exitWith {};

//--- Remove place action
player removeAction GTA_build_placeAction;

//--- Get position of attached object
_pos = _object modelToWorldVisual [ 0, 0, 0 ];

//--- Detach the object and it's position
detach _object;

//--- Set the objects position
if ( surfaceIsWater _pos ) then {

	_pos set [ 2, ( getPosASLVisual	player ) select 2 ];
	_object setPosASL _pos;

} else {

	_pos set [ 2, ( getPosATLVisual	player ) select 2 ];
	_object setPosATL _pos;

};

GTA_build_busy = false;
