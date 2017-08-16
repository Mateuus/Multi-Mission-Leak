waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information

*/
_rscLayer = "osefStatusBar" call BIS_fnc_rscLayer;
_rscLayer cutRsc["osefStatusBar","PLAIN"];

[] spawn {
	uisleep 10;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		uisleep 1;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | POLIZEI: %2 | FEUERWEHR: %4 | ZIVIS: %3 | GELD: %5 | BANK: %6 | SPIELER: %7", round diag_fps, west countSide playableUnits, (civilian countSide playableUnits) + (east countSide playableUnits), independent countSide playableUnits,[EMonkeys_c164] call EMonkeys_fnc_numberText,[EMonkeys_a164] call EMonkeys_fnc_numberText, count playableUnits,_counter];
	}; 
};
