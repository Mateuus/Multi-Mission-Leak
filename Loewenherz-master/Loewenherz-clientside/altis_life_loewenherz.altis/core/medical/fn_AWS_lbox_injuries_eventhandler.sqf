/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/





private ["_display","_lbox_verletzungen","_str_text_beschr_verletzungen","_sel","_index","_conf"];

disableSerialization;
_display = findDisplay 5284;
_lbox_verletzungen = _display displayCtrl 1500;
_str_text_beschr_verletzungen = _display displayCtrl 1101;

_sel = lbCurSel _lbox_verletzungen;
_index = _lbox_verletzungen lbvalue _sel;
if(_index == -1) exitWith {_str_text_beschr_verletzungen ctrlSetStructuredText parseText "Du bist vollkommen gesund!";};

_conf = [true,false,_index] call lhm_fnc_AWS_config;


_str_text_beschr_verletzungen ctrlSetStructuredText parseText (_conf select 2);




