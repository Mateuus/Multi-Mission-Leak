/*
File: fn_initRadioCellsClientside.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Clientside initialization of the radio cells.
*/
private["_cellName","_cellObj","_cellTable"];

waitUntil {!isNil "PGSERV_mobile_radiocells"};

{
    _cellName = _x select 0;
    _cellTable = _x select 2;

    // hack
    _cellTable addAction["Funkzelle hacken",PG_fnc_hackCell,_cellName,0,false,false,"",
    	'_cell = (nearestObjects[getPosATL _this,["Land_Communication_F"],25]) select 0; playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && {(_cell getVariable ["gangOwner",grpNull]) != (group player)} && !life_action_inUse'];

    _cellTable addAction["Funkzelle ein/ausschalten",PG_fnc_disableRadioCell,_cellName,0,false,false,"",
    	'_cell = (nearestObjects[getPosATL _this,["Land_Communication_F"],25]) select 0; playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && {(_cell getVariable ["gangOwner",grpNull]) == (group player)}'];
/*
    _cellTable addAction["Anonyme Nachricht an verbundene Clients",PG_fnc_sendHackedMessage,_cellName,0,false,false,"",
    	'_cell = (nearestObjects[getPosATL _this,["Land_Communication_F"],25]) select 0; playerSide == civilian && !isNil {(group player) getVariable "gang_owner"} && {(_cell getVariable ["gangOwner",grpNull]) == (group player)}'];
*/
    // repair
    _cellTable addAction["Funkzelle reparieren",PG_fnc_repairHackedCell,_cellName,0,false,false,"",
    	'_cell = (nearestObjects[getPosATL _this,["Land_Communication_F"],25]) select 0; playerSide == independent && !isNull (_cell getVariable ["gangOwner",grpNull]) && !life_action_inUse'];


    //diag_log format["%1: %2",_cellName,_cellTable];
} forEach PGSERV_mobile_radiocells;