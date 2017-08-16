/*
	File: openEmpMenu.sqf
	Author: © 2014 nano2K - written for we-are-friendly.de
	
	Description:
	Opens the EMP operator menu
*/
if(!alive player || dialog) exitWith {};
createDialog "nanoEMPConsole";	
[player, objNull, 1, "[EMP]", "Hat die EMP Konsole geoeffnet"] remoteExec ["TEX_FNC_LOGIT", 2];
disableSerialization;
waitUntil {!isNull (findDisplay 3494)};
[] spawn tanoarpg_fnc_scanVehicles;