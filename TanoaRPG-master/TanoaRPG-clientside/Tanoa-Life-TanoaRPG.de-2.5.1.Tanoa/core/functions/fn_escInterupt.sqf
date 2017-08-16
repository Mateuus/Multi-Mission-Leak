/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_escSave","_escContinue","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;
	
	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = (findDisplay 49) displayCtrl 104;
		_respawnButton = (findDisplay 49) displayCtrl 1010; // LHM
		_timeStamp = time + 2;
		
		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};
		
		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};
	
	_abortButton = (findDisplay 49) displayCtrl 104;
	[] call XAS_fnc_updateRequest; //call our silent sync.
	
	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
		
		if (!isNil "XAS_fnc_updateRequest") then {
			[] call XAS_fnc_updateRequest; //call our silent sync.
		} else {
			[true] call tanoarpg_fnc_sessionUpdate; // Old System
		};
		
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable["restrained",FALSE]) OR (player getVariable["Escorting",FALSE]) OR (player getVariable["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed)) then {false} else {true};
};
	
while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = (findDisplay 49) displayCtrl 104;
	_abortButton buttonSetAction "
		[player] remoteExec [""TEX_fnc_cleanupRequest"", 2, false];
		[0, format[""%1 hat sich in die Lobby begeben"", (name player)], false] remoteExec [""tanoarpg_fnc_broadcast"", -2, false];
		
		
		[[(getPlayerUID player), (name player)], [-1, ""SERVER""], 4, ""[BACKTOLOBBY]"", format[""Pos:%1"", getPos player]] remoteExec [""TEX_fnc_logIt"", 2];
	";
	_respawnButton = (findDisplay 49) displayCtrl 1010;
	_fieldManual = (findDisplay 49) displayCtrl 122;
	_escSave = (findDisplay 49) displayCtrl 103;
	_escContinue = (findDisplay 49) displayCtrl 2;
	
	//Block off our buttons first.
	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	_respawnButton ctrlSetText "RESPAWN";
	_fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
	_fieldManual ctrlCommit 0;
	_fieldManual ctrlSetText "ts.tanoarpg.de";
	_escContinue ctrlSetText "TanoaRPG";
	_escContinue ctrlEnable false;
	_escContinue ctrlCommit 0;
	_escSave ctrlSetText "tanoarpg.de";
	_escSave ctrlEnable false;
	_escSave ctrlCommit 0;
	
	_usebleCtrl = call _canUseControls;
	_usebleCtrl spawn _escSync;
	if(_usebleCtrl) then {
		_respawnButton ctrlEnable true; //Enable the button.
	};
	waitUntil{isNull (findDisplay 49)};
};
