/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_resource" ];
_resource = [ _this, 0, "", [""] ] call GTA_fnc_param;

//--- Call the onUnload event
[ "onUnload", [] ] call ( missionNamespace getVariable [ _resource + "_script", {} ] );

//--- Destroy the layer
( _resource call BIS_fnc_rscLayer ) cutText [ "", "PLAIN" ];
