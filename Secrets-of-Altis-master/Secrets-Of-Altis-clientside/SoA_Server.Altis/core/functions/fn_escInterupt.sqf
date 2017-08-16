/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_abortButton ctrlSettext "Abreisen";
		_timeStamp = time + 10;
		
		waitUntil {
			sleep 0.1;
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSettext "Abreisen";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	if(alive player) then {[] call SOCK_fnc_updateRequest;}; //call our silent sync.
	
	if(_this && (call life_adminlevel) < 2) then {
		_thread = [] spawn _syncManager;
		waitUntil{sleep 0.1; scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	} else {_abortButton ctrlEnable true};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{sleep 0.1; !isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton ctrlSettext "Abreisen";
	_abortButton buttonSetAction "[player] remoteExec [""SOA_fnc_cleanupRequest"",2];";
	_abortButton ctrlSetEventHandler ["ButtonClick","[] spawn life_fnc_endCam; (findDisplay 49) closeDisplay 2; true"];
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	_speichernButton = (findDisplay 49) displayCtrl 103;
	
	_speichernButton ctrlSetText "Secrets of Altis";
	_speichernButton ctrlEnable false;
		
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_respawnButton ctrlSetText "";
	
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	_fieldManual ctrlSetText format["Version: %1",life_version];
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	waitUntil{uisleep 0.1; isNull (findDisplay 49)};
};
