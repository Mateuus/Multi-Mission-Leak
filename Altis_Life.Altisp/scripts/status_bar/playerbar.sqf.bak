#include "script_macros.hpp"
waitUntil {!(isNull (findDisplay 46))};
disableSerialization;
/*
	File: fn_statusBar.sqf
	Author: Some French Guy named Osef I presume, given the variable on the status bar
	Edited by: [midgetgrimm]
	Description: Puts a small bar in the bottom right of screen to display in-game information
*/
4 cutRsc ["osefStatusBarAdmin","PLAIN"];

[] spawn {
	sleep 5;
	_counter = 240;
	_timeSinceLastUpdate = 0;
	Server_Session = 21600;
	_statusText = "stabilne.it";
	_gangName = "";
	while {true} do
	{
		TimeTillRestart = Server_Session - ServerTime;
		sleep 1;
		if(isNull ((uiNamespace getVariable "osefStatusBarAdmin")displayCtrl 55554)) then
		{
			diag_log "Ladowanie ...";
			disableSerialization;
			_rscLayer = "osefStatusBarAdmin" call BIS_fnc_rscLayer;
			_rscLayer cutRsc["osefStatusBarAdmin","PLAIN"];
		};
		if(!isNil {group player getVariable "gang_name"}) then 
		{ 
			_gangName = format["%1",group player getVariable "gang_name"]; 
		}
		else
		{
			_gangName = "";
		};
		_counter = _counter - 1;
		((uiNamespace getVariable "osefStatusBarAdmin")displayCtrl 55554)ctrlSetStructuredText parseText format["<img size='1.0' image='icons\hud\cop.paa'/><t color='#FFFFFF'>Policja %1</t> | <img size='1.0' image='icons\hud\civ.paa'/><t color='#FFFFFF'>Cywil %2</t> | <img size='1.0' image='icons\hud\med.paa'/><t color='#FFFFFF'>Medyk %3</t> | <img size='1.0' image='icons\hud\bank.paa'/><t color='#FFFFFF'> %4</t> | <t color='#FFFFFF' size='1' font='PuristaSemibold'>Restart mozliwy za: %5</t> | <img size='1.0' image='icons\hud\ts.paa'/><t color='#FFFFFF'> %6</t> | <img size='1.0' image='icons\hud\gang.paa'/><t color='#FFFFFF'> %7</t>", west countSide playableUnits, civilian countSide playableUnits, independent countSide playableUnits,[life_atmbank] call life_fnc_numberText, [TimeTillRestart, "HH:MM:SS"] call BIS_fnc_secondsToString, _statusText,_gangname, _counter];
	}; 
};
