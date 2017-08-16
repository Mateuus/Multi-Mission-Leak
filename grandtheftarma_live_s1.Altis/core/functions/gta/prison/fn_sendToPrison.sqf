/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_unit";
_unit = [ _this, 0, objNull, [objNull] ] call GTA_fnc_param;

//--- Error checks
if ( isNull _unit ) exitWith {};

//--- Check if local
if ( local _unit ) then {

	//--- Imprison


} else {

	//--- Send to player
	[ _this, _fnc_scriptName, _unit ] call GTA_fnc_remoteExec;

};
