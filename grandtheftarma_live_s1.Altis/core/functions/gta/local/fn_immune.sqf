/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_immune" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_immune = [ _this, 1, true, [true] ] call GTA_fnc_param;

//--- Set unit's immune status
[ _unit, "immune", _immune, 2 ] call GTA_fnc_setVariable;

//--- Set the immunity
[ [ _unit, !_immune ], "allowDamage", _unit ] call GTA_fnc_remoteExec;

true
