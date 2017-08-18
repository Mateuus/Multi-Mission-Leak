waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*

File: fn_statusBar.sqf

Author: Some French Guy named Osef I presume, given the variable on the status bar

Edited by: [midgetgrimm]

Description: Puts a small bar in the bottom right of screen to display in-game information



*/

4 cutRsc ["osefStatusBar","PLAIN"]; 
//systemChat format["[GL v3.1.4] Loading game server info...", _rscLayer];

[] spawn {
	sleep 5;
	_counter = 180;
	_timeSinceLastUpdate = 0;
	while {true} do
	{
		sleep 1;
		_uptime = [time,"HH:MM:SS"] call BIS_fnc_secondsToString;
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBar")displayCtrl 1000)ctrlSetText
    format["FPS: %1 | COP: %2 | COP2: %3 | CIV: %4 | MED: %5 | CASH: %6 | BANK: %7 | GRID: %8 | UPTIME: %9 | %10", round diag_fps, 
    west countSide playableUnits, east countSide playableUnits, civilian countSide playableUnits,
    independent countSide playableUnits,[life_cash] call life_fnc_numberText,[life_atmcash] call   
    life_fnc_numberText,mapGridPosition player, _uptime, player getVariable ["realname",name player], _counter];
	}; 
};