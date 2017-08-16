/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_name", "_default" ];
_name = [ _this, 0, "", [""] ] call GTA_fnc_param;
_default = [ _this, 1 ] call GTA_fnc_param;

//--- Get value
if ( isNil "_default" ) then {

	call ( missionNamespace getVariable _name )

} else {

	call ( missionNamespace getVariable [ _name, { _default } ] )

};
