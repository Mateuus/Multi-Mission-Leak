/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_resource", "_type", "_speed", "_showOnMap" ];
_resource = [ _this, 0, "", [""] ] call GTA_fnc_param;
_type = [ _this, 1, "PLAIN", [""] ] call GTA_fnc_param;
_speed = [ _this, 2, 0, [0] ] call GTA_fnc_param;
_showOnMap = [ _this, 3, false, [true] ] call GTA_fnc_param;

//--- Check for previous instance
if ( [ _resource ] call GTA_fnc_hasDisplay ) then {

	//--- Destroy previous layer
	[ _resource ] call GTA_fnc_destroyRscLayer;

};

//--- Create the layer
( _resource call BIS_fnc_rscLayer ) cutRsc [ _resource, _type, _speed, _showOnMap ];
