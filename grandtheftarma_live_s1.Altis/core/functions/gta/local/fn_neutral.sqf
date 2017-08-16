/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_neutral" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_neutral = [ _this, 1, true, [true] ] call GTA_fnc_param;

//--- Set unit's neutral status
[ _unit, "neutral", _neutral, 2 ] call GTA_fnc_setVariable;

//--- Set the unit as captive or not
[ [ _unit, _neutral ], "setCaptive", _unit ] call GTA_fnc_remoteExec;

true
