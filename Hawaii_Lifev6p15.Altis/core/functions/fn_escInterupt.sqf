#include "..\..\script_macros.hpp"
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls","_ESCTOP","_ESCBOT"];
disableSerialization;

waitUntil{!isNull (findDisplay 38500)}; //Wait for the spawn selection to be open.
waitUntil{isNull (findDisplay 38500)}; //Wait for the spawn selection to be done.
/*
_escSync = {
	private["_abortButton","_thread","_syncManager"];
	disableSerialization;

	_syncManager = {
		disableSerialization;
		private["_abortButton","_timeStamp"];
		_abortButton = CONTROL(49,104);
		_timeStamp = time + 10;

		waitUntil {
			_abortButton ctrlSetText format[localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
			_abortButton ctrlCommit 0;
			round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
		};

		_abortButton ctrlSetText localize "STR_DISP_INT_ABORT";
		_abortButton ctrlCommit 0;
	};

	_abortButton = CONTROL(49,104);
	[] call SOCK_fnc_updateRequest; //call our silent sync.

	if(_this) then {
		_thread = [] spawn _syncManager;
		waitUntil{scriptDone _thread OR isNull (findDisplay 49)};
		_abortButton ctrlEnable true;
	};
};

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player GVAR ["restrained",FALSE]) OR (player GVAR ["Escorting",FALSE]) OR (player GVAR ["transporting",FALSE]) OR (life_is_arrested) OR (life_istazed) OR (life_isknocked)) then {false} else {true};
};*/

while {true} do
{
	waitUntil{!isNull (findDisplay 49)};
	_abortButton = CONTROL(49,104);
	_respawnButton = CONTROL(49,1010);
	_fieldManual = CONTROL(49,122);
	_ESCTOP = CONTROL(49,2);
	_ESCBOT = CONTROL(49,103);
	
	_ESCTOP ctrlSetText "Hompage: www.hawaii-life.net";
	_ESCTOP ctrlEnable false;
	
	_ESCBOT ctrlSetText "Server: s.hawaii-life.net";
	_ESCBOT ctrlEnable false;

	_respawnButton ctrlSetText "Ts3: ts.hawaii-life.net";
	_respawnButton ctrlEnable false;
	_abortButton ctrlSetEventHandler [
		"ButtonClick",
		"civ_position = getPos player;[9] call SOCK_fnc_updatePartial;[] spawn life_fnc_goodbye; (findDisplay 49) closeDisplay 2; true"
	];
	_fieldManual ctrlSetText localize "STR_chvd_title2";
	_fieldManual ctrlSetEventHandler [
        "ButtonClick",
        "[] spawn CHVD_fnc_openDialog; (findDisplay 49) closeDisplay 2; true"
    ];
	if (life_loggingOUT) then {
		_abortButton ctrlEnable false;
		_fieldManual ctrlEnable false;
	};

	//_usebleCtrl = call _canUseControls;
	//_usebleCtrl spawn _escSync;
	waitUntil{isNull (findDisplay 49)};
};
