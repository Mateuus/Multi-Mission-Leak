/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private [ "_unit", "_sound", "_distance", "_global" ];
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;
_sound = [ _this, 1, "", [""] ] call GTA_fnc_param;
_distance = [ _this, 2, 0, [0] ] call GTA_fnc_param;
_global = [ _this, 3, true, [true] ] call GTA_fnc_param;

//--- Error checks
if ( _sound == "" ) exitWith {};

//--- Broadcast
if ( _global ) exitWith {

	if ( _distance > 0 ) then {

		private "_targets";
		_targets = [ _unit, _distance, nil, true ] call GTA_fnc_nearbyUnits;

		//--- Check number of clients
		if ( count _targets == 0 ) exitWith {};

		//--- Nearby clients
		[ [ _unit, _sound, _distance, false ], "GTA_fnc_playSound", _targets ] call GTA_fnc_remoteExec;

	} else {

		//--- All clients
		[ [ _unit, _sound, _distance, false ], "GTA_fnc_playSound" ] call GTA_fnc_remoteExec;

	};

};

//--- Check play type
if ( isNull _unit ) then {

	playSound _sound;

} else {

	_unit say3D _sound;

};
