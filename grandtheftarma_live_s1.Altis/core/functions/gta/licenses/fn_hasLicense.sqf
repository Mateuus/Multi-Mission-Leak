/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_license" ];
_license = [ _this, 0, "", [""] ] call GTA_fnc_param;

//--- Error checks
if ( _license == "" ) exitWith {};

//--- Has license
missionNamespace getVariable [ ( [ _license, 0 ] call life_fnc_licenseType ) select 0, false ]
