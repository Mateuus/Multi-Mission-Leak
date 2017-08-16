/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

if (cameraView == "External" && {cameraOn == vehicle player} && {vehicle player == player || {!local vehicle player}}) then {
	if !(missionNamespace getVariable ["GTA_enableExternalCamera", false]) then {
		//--- Switch to 1st person
		player switchCamera "Internal";

		//--- Hint
		[1, "STR_GTA_ACTIONS_CAMERAVIEW", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
	};
};
