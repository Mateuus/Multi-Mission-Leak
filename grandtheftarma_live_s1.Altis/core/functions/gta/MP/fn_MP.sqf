/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

with missionNamespace do {

	private [ "_params", "_functionName", "_target", "_isPersistent", "_isCall", "_ownerID" ];

	_params = [ _this, 0, [] ] call GTA_fnc_param;
	_functionName =	[ _this, 1, "", [""] ] call GTA_fnc_param;
	_target = [ _this, 2, true, [objnull,true,0,[],sideUnknown,grpnull,""] ] call GTA_fnc_param;
	_isPersistent =	false/*[ _this, 3, false, [false] ] call GTA_fnc_param*/;
	_isCall = [ _this, 4, false, [false] ] call GTA_fnc_param;

	if ( typeName _target == typeName objNull && { local _target } ) then {

		//--- Local execution
		GTA_fnc_MP_packet = [ 1, _params, _functionName, _target, _isPersistent, _isCall ];
		[ "GTA_fnc_MP_packet", GTA_fnc_MP_packet ] call GTA_fnc_MPexec;

	} else {

		//--- Send to server
		GTA_fnc_MP_packet = [ 0, _params, _functionName, _target, _isPersistent, _isCall ];
		publicVariableServer "GTA_fnc_MP_packet";

	};

	//--- Singleplayer execution
	if !( isMultiplayer ) then {

		[ "GTA_fnc_MP_packet", GTA_fnc_MP_packet ] call GTA_fnc_MPexec;

	};

	GTA_fnc_MP_packet

};
