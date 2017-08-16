/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_params", "_sid", "_valid" ];
_params = [ _this, 0, [], [[]] ] call GTA_fnc_param;
_sid = [ _params, 0, "", [""] ] call GTA_fnc_param;
_valid = false;

//--- Validate
_valid = _sid isEqualTo ( "GTA_session_id" call GTA_fnc_const );

//--- Remove SID from params
if ( _valid ) then {

	_params deleteAt 0;

};

_valid
