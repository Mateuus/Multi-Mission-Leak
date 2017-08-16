/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Server handler
if ( !isServer ) exitWith {

	[ _this + [ player, getPlayerUID player, profileName ], "GTA_fnc_handleMessage", false ] call GTA_fnc_remoteExec;

};
