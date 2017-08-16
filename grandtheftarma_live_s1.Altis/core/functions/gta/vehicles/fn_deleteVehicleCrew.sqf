/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_vehicle", "_unit" ];
_vehicle = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_unit = [ _this, 1, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _vehicle ) exitWith {};
if ( isNull _unit ) exitWith {};
if ( _vehicle == _unit ) exitWith {};

//--- Delete the crew member (local)
if ( local _vehicle ) then {

	_vehicle deleteVehicleCrew _unit;

} else {

	[ [ _vehicle, _unit ], _fnc_scriptname, _vehicle ] call GTA_fnc_remoteExec;

};
