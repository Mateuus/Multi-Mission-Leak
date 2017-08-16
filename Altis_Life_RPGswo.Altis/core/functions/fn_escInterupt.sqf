#include "..\..\macros.hpp"
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_escSave","_escContinue","_fieldManual","_escSync","_canUseControls","_save","_logtodb"];
disableSerialization;
_escSync = {
	private["_abortButton","_thread","_syncManager","_save","_logtodb"];
	disableSerialization;
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp","_save","_logtodb","_abortTime"];
		_save = false;
		_logtodb = false;
		_abortButton = (findDisplay 49) displayCtrl 104;
		_respawnButton = (findDisplay 49) displayCtrl 1010;
		_abortTime = DWEV_SETTINGS(getNumber,"escapeMenu_timer");
        _timeStamp = time + _abortTime;
		if(__GETC__(DWEV_adminlevel) == 4) then {_timeStamp = time + 1;};

		waitUntil {
			_abortButton ctrlSetText format["Abbruch in %1 verfügbar",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			if (!isNull (findDisplay 3500) && !(_logtodb)) then
			 {
				[0,player,format ["ESC(3500) Spieler %1",getMyName]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
//				_logtodb = true;
				closedialog 0;
			 };
			if (!isNull (findDisplay 602) && !(_logtodb)) then
			 {
				[0,player,format ["ESC(602) Spieler %1",getMyName]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
//				_logtodb = true;
				closedialog 0;
			 };
			 if ((round(_timeStamp - time) == 25) && !(_save)) then // Speichert erst nach 10 Sekunden im ESC menü
			 {
				_save = true;
				[] call SOCK_fnc_updateRequest;
			 };
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_respawnButton = (findDisplay 49) displayCtrl 1010;

	if(_this) then
	{
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
		_respawnButton ctrlEnable true;
	};
};

_canUseControls = {
	if((side player) == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (DWEV_is_arrested) OR (DWEV_istazed) OR (DWEV_isdowned)) then {false} else {true};
};

while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "[player] remoteExec [""DWF_fnc_cleanupRequest"",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];"; // KEIN remoteExec !!!!
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	_escContinue = (findDisplay 49) displayCtrl 2;
	_escSave = (findDisplay 49) displayCtrl 103;

	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_fieldManual ctrlSetText "ts.division-wolf.de";
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	_fieldManual ctrlCommit 0;
//	_escContinue ctrlSetText "Division Wolf";
	_escContinue ctrlSetText format ["Spieler UID: %1",getPlayerUID player];
	_escContinue ctrlEnable false;
	_escContinue ctrlCommit 0;
	_escSave ctrlSetText "www.Division-Wolf.de";
	_escSave ctrlEnable false;
	_escSave ctrlCommit 0;

	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	waitUntil{isNull (findDisplay 49)};
};
