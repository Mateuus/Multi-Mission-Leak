/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_params", "_fnc", "_uid", "_sid" ];
_params = [ _this, 0, [] ] call GTA_fnc_param;
_fnc = [ _this, 1, "", [""] ] call GTA_fnc_param;

//--- Retrive UID and SID
_uid = getPlayerUID player;
_sid = "GTA_session_id" call GTA_fnc_const;

//--- Push session ID header to front
_params = [ _uid, _sid ] + _params;

//--- Server execution
[ _params, _fnc, false ] call GTA_fnc_remoteExec;
