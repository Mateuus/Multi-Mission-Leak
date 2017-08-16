/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	N/A
*/
((findDisplay 7300) displayCtrl 7303) ctrlEnable false;

[XY_corpse, profileName] remoteExec ["XY_fnc_medicRequest", independent];

XY_corpse setVariable["medicRequested", true, true];

XY_requestTimer = true;

// prevent spamming
[] spawn {
	sleep (5 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};