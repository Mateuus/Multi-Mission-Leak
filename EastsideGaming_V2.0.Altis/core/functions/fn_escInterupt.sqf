#include "..\..\script_macros.hpp"
/*
    File: fn_escInterupt.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Monitors when the ESC menu is pulled up and blocks off
    certain controls when conditions meet.
*/
private ["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls"];
disableSerialization;

_escSync = {
    private ["_abortButton","_thread","_syncManager"];
    disableSerialization;

    _syncManager = {
        disableSerialization;
        private ["_abortButton","_timeStamp","_abortTime"];
        _abortButton = CONTROL(49,104);
        _abortTime = 20;
        _timeStamp = time + _abortTime;

        waitUntil {
            _abortButton ctrlSetText format [localize "STR_NOTF_AbortESC",[(_timeStamp - time),"SS.MS"] call BIS_fnc_secondsToString];
            _abortButton ctrlCommit 0;
            round(_timeStamp - time) <= 0 || isNull (findDisplay 49)
        };

        _abortButton ctrlSetText "Server Verlassen";
        _abortButton ctrlCommit 0;
    };

    _abortButton = CONTROL(49,104);

    if (_this) then {
        _thread = [] spawn _syncManager;
        waitUntil {scriptDone _thread || isNull (findDisplay 49)};
        _abortButton ctrlEnable true;
    };
};

_canUseControls = {
    //if (playerSide isEqualTo west) exitWith {true};
    if ((player getVariable ["esg_bewusstlos",false]) ||(player getVariable ["restrained",false]) || (player getVariable ["Escorting",false]) || (player getVariable ["transporting",false]) || (life_is_arrested) || (player getVariable ["istazed",false]) || (life_isknocked)) then {false} else {true};
};

for "_i" from 0 to 1 step 0 do {
    waitUntil {!isNull (findDisplay 49)};
	"dynamicBlur" ppEffectEnable true;
	"dynamicBlur" ppEffectAdjust [6];
	"dynamicBlur" ppEffectCommit 1;
	_logo = findDisplay 49 ctrlCreate ["RscPicture", 8888];
	_logo ctrlSetPosition [(0.427812 * safezoneW + safezoneX),(0.368 * safezoneH + safezoneY),(0.128906 * safezoneW),(0.231 * safezoneH)];
	_logo ctrlSetText "texture\misc\esg_logo.paa";
	_logo ctrlCommit 0;
    _abortButton = CONTROL(49,104);
    _abortButton buttonSetAction "[] call SOCK_fnc_updateRequest; [player] remoteExec [""TON_fnc_cleanupRequest"",2];";
    _respawnButton = CONTROL(49,1010);
    _fieldManual = CONTROL(49,122);
    private _saveButton = CONTROL(49,103);
    _saveButton ctrlSetText "";

    private _topButton = CONTROL(49,2);
    _topButton ctrlEnable false;
    _topButton ctrlSetText format ["%1","Eastside-Gaming.de"];
    _saveButton ctrlEnable false;
    _saveButton ctrlSetText format ["%1","server.eastside-gaming.de"];

    //Block off our buttons first.
    _abortButton ctrlEnable false;
    _respawnButton ctrlEnable false;
    _fieldManual ctrlEnable false; //Never re-enable, blocks an old script executor.
    _fieldManual ctrlShow false;

    _usebleCtrl = call _canUseControls;
    _usebleCtrl spawn _escSync;
    if (_usebleCtrl) then {
        _respawnButton ctrlEnable false; //Enable the button.
    };
    waitUntil {isNull (findDisplay 49)};
	"dynamicBlur" ppEffectEnable false;
	if(player getVariable ["esg_bewusstlos",false]) then {
		"ColorCorrections" ppEffectEnable true;
		"ColorCorrections" ppEffectAdjust [1,0.4,0,[0,0,0,0],[1,1,1,0],[1,1,1,1]];
		"ColorCorrections" ppEffectCommit 2;
		"dynamicBlur" ppEffectEnable true;
		"dynamicBlur" ppEffectAdjust [10];
		"dynamicBlur" ppEffectCommit 2;
	};
};
