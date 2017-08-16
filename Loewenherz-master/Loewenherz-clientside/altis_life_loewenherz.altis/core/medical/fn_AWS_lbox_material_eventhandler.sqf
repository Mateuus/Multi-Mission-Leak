/*
    File: fn_packupContainer.sqf
    Author: Bryan "Tonic" Boardwine
    Edited by: demiced

    Description:
    Packs up a deployed container.
*/






private ["_display","_lbox_materialien","_str_text_beschr_material","_sel","_index","_conf"];
disableSerialization;
_display = findDisplay 5284;
_lbox_materialien = _display displayCtrl 1501;
_str_text_beschr_material = _display displayCtrl 1103;

_sel = lbCurSel _lbox_materialien;
_index = _lbox_materialien lbvalue _sel;
if(_index == -1) exitWith {_str_text_beschr_material ctrlSetStructuredText parseText "Du hast keine medizinischen Materialien bei dir!";};

_conf = [false,false,_index] call lhm_fnc_AWS_config;


_str_text_beschr_material ctrlSetStructuredText parseText (_conf select 2);



