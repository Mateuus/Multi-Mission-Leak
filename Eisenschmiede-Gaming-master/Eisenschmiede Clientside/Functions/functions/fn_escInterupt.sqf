#include "..\script_macros.hpp"
/*
	File: fn_escInterupt.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Monitors when the ESC menu is pulled up and blocks off
	certain controls when conditions meet.
*/
private["_abortButton","_respawnButton","_fieldManual","_escSync","_canUseControls","_escContinue","_escSave","_escBut"];
disableSerialization;

_canUseControls = {
	if(playerSide == west) exitWith {true};
	if((player getVariable ["restrained",FALSE]) OR (player getVariable ["Escorting",FALSE]) OR (player getVariable ["transporting",FALSE]) OR (ES_is_arrested) OR (ES_istazed)) then {false} else {true};
};

while {true} do
{
	waitUntil{!isNull (findDisplay 49)};

	_escContinue = CONTROL(49,2);
	_escContinue ctrlSetStructuredText parseText format["EISENSCHMIEDE-GAMING"];
	_escContinue ctrlEnable false;
	_escContinue ctrlCommit 0;

	_escSave = CONTROL(49,103);
	_escSave ctrlSetStructuredText parseText format["TS.EISENSCHMIEDE-GAMING.de"];
	_escSave ctrlEnable false;
	_escSave ctrlCommit 0;

    _escBut = CONTROL(49,1005); 
    _escBut ctrlSetText format ["Stefan Liebt dich :)"];

    _escServer = CONTROL(49,120);
    _escServer ctrlSetText Servername;

    _abortButton = CONTROL(49,104);
    _abortButton ctrlSetStructuredText parseText format ["SERVER VERLASSEN"]; 
	_abortButton ctrlSetEventHandler [
		"ButtonClick",
		"[] spawn ES_fnc_abortAction; (findDisplay 49) closeDisplay 2;
		true" 
	];

	_fieldManual = CONTROL(49,122);
    _fieldManual ctrlSetStructuredText parseText format ["<a color='#FFB266' >ARMA-HILFE"]; 

	_respawnButton = CONTROL(49,1010);
	_respawnButton ctrlSetStructuredText parseText format["<a color='#FF0000' >NEUES LEBEN"]; 

	_abortButton ctrlEnable false;
	_respawnButton ctrlEnable false;
	
	_usebleCtrl = call _canUseControls;
	if(_usebleCtrl) then {
		_abortButton ctrlEnable true;
		_respawnButton ctrlEnable true;
	};

	if(ES_firstSpawn) then {
		_abortButton ctrlEnable false;
		_respawnButton ctrlEnable false;
	};

	[] spawn {sleep 0.01; if(BinImShop) then {closeDialog 0}; };
	waitUntil{isNull (findDisplay 49)};

	if(SmokePlayer)then{

		"dynamicBlur" ppEffectEnable true;
        "dynamicBlur" ppEffectAdjust [20];
        "dynamicBlur" ppEffectCommit 0;
        enableCamShake true;
        addCamShake [10, 45, 10];
        player setFatigue 1;
        5 fadeSound 0.1;
	};
};