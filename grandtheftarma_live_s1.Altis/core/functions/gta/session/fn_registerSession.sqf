/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_sid" ];
_sid = [ _this, 0, "", [""] ] call GTA_fnc_param;

//--- Assign session ID
missionNamespace setVariable [ "GTA_session_id", compileFinal str _sid ];

true
