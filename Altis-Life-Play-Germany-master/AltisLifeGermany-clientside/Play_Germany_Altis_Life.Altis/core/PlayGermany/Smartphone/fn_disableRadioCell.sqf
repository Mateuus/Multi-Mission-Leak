#include <macro.h>
/*
File: fn_disableRadioCell.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.
 
Description:
Action for enabling / disabling a hacked radio cell.
*/
private["_cellName","_cellsIdx","_cellObj","_cellOwner","_radioCellStatus","_provider_costs"];

_cellName = [_this,3,"",[""]] call BIS_fnc_param;

//diag_log format["DEBUG: _radioCell: %1", _cellName];

_cellsIdx = [_cellName, PGSERV_mobile_radiocells] call TON_fnc_index;

if (_cellsIdx == -1) exitWith {
    //diag_log format["DEBUG fn_disableRadioCell: unknown cell %1", _cellName];
};

_cellObj = SEL(SEL(PGSERV_mobile_radiocells, _cellsIdx), 1);

_cellOwner = _cellObj GVAR["gangOwner", grpNull];

if (_cellOwner != grpPlayer) exitWith {
    //diag_log "DEBUG: owner of cell is not the group of the player";
};

_radioCellStatus = _cellObj GVAR["disabled", false];

if (_radioCellStatus) then {
    _cellObj SVAR["disabled", false, true];
    hint "Funkzelle aktiviert!";
}
else
{
    _cellObj SVAR["disabled", true, true];
    hint "Funkzelle deaktiviert";
};