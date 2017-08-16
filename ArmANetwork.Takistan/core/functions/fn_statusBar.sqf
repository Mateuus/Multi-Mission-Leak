waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
4 cutRsc ["osefStatusBar","PLAIN"];
//systemChat format["[DToX Statusbar] Loading server information...", _rscLayer];

[] spawn {
	sleep 3;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 2;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText format["FPS: %1 | TSF/NATO: %2 | Civs: %3 | Medic: %4 | CASH: %5 | Restart: %6 Minutes", round diag_fps, west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_cash] call life_fnc_numberText,(359-(round(serverTime / 60)))];
	}; 
};