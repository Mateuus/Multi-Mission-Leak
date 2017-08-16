/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_part" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_part = [ _this, 1, "", [""] ] call GTA_fnc_param;

//--- Return part damage
if ( _part == "" ) then {

	damage _unit;

} else {

	_unit getHit _part;

};
