/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_wait" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_wait = [ _this, 1, 0, [0] ] call GTA_fnc_param;

//--- Wait timer
sleep _wait;

//--- Hide body
if ( _unit isKindOf "Man" && { vehicle _unit == _unit } ) then {

	[ _unit, "hideBody" ] call GTA_fnc_remoteExec;
	sleep 7;

};

//--- Delete
deleteVehicle _unit;
