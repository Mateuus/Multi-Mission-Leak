/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle", "_handle" ];
_vehicle = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error check
if ( isNull _vehicle ) exitWith { -1 };

//--- Apply handle damage event handler
_handle = _vehicle addEventHandler [ "HandleDamage", {

	private [ "_unit", "_damage", "_source", "_projectile" ];
	_unit = _this select 0;
	_part = _this select 1;
	_damage = _this select 2;
	_source = _this select 3;
	_projectile = _this select 4;

	if( _source != _unit ) then {

		if ( _projectile == "" && { !( [ "wheel", _part ] call GTA_fnc_inString ) } ) then {

			_damage = _unit getHit _part;

		};

	};

	_damage

} ];

_handle
