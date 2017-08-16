/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_name", "_value" ];
_name = [ _this, 0, "", [""] ] call GTA_fnc_param;
_value = [ _this, 1 ] call GTA_fnc_param;

//--- Set value
missionNamespace setVariable [ _name, compileFinal str _value ];
