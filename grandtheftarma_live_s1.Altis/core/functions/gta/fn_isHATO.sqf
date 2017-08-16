/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit" ];
_unit = [ _this, 0, player, [objNull] ] call GTA_fnc_param;

( vehicleVarName _unit select [ 0, 5 ] == "hato_" )
