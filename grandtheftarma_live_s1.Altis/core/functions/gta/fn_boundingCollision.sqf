/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_object1", "_object2", "_extend", "_position", "_boundingBox", "_pX", "_pY", "_pZ", "_min", "_max" ];
_object1 = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_object2 = [ _this, 1, objNull, [objNull] ] call GTA_fnc_param;
_extend = [ _this, 2, 0, [0] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _object1 ) exitWith {};
if ( isNull _object2 ) exitWith {};

//--- Position and bounding box
_position = _object2 worldToModel ( _object1 call GTA_fnc_getPos3D );
_boundingBox = boundingBoxReal _object2;

//--- Extend axis 1
{

	( _boundingBox select 0 ) set [ _forEachIndex, _x - _extend ];

} forEach ( _boundingBox select 0 );

//--- Extend axis 2
{

	( _boundingBox select 1 ) set [ _forEachIndex, _x + _extend ];

} forEach ( _boundingBox select 1 );

//--- Position axis
_pX = _position select 0;
_pY = _position select 1;
_pZ = _position select 2;

//--- Bounding box axis
_min = _boundingBox select 0;
_max = _boundingBox select 1;

//--- Check collision
(
	( _pX > ( _min select 0 ) ) && ( _pX < ( _max select 0 ) ) &&
	( _pY > ( _min select 1 ) ) && ( _pY < ( _max select 1 ) ) &&
	( _pZ > ( _min select 2 ) ) && ( _pZ < ( _max select 2 ) )
)
