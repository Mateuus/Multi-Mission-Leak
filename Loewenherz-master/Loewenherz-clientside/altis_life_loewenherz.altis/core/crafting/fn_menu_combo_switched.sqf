/*
	File: fn_menu_fill.sqf
	Author: Barney

	Description:
	Updates Dialog for categories blah blah blah....


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

disableSerialization;
private ["_dialog","_craften_listbox","_benoetigt_listobx","_combo_kategorien","_craft_BTN","_combo_cur_sel","_kategorie_index","_what","_foreachindex"];
if(isnull(findDisplay 1584)) exitWith {hint "Fehler: Kein Dialog? Wasch da losch!"};

_dialog = findDisplay 1584;

_craften_listbox = _dialog displayCtrl 1500;
_benoetigt_listobx = _dialog displayCtrl 1501;
_combo_kategorien = _dialog displayCtrl 2100;
_craft_BTN = _dialog displayCtrl 2400;




_combo_cur_sel = lbCurSel _combo_kategorien;
if(_combo_cur_sel == -1) exitWith {};


_kategorie_index = _combo_kategorien lbValue _combo_cur_sel;
_what = [_kategorie_index] call lhm_fnc_crafting_config;

lbclear _benoetigt_listobx;
lbclear _craften_listbox;


{
	if(!(((_what select _foreachindex) select 0) iskindof "Car")) then {
		_craften_listbox lbadd format["%1",getText(configFile >> "CfgWeapons" >> ((_what select _foreachindex) select 0) >> "displayName")];
		_craften_listbox lbSetPicture[_foreachindex,getText(configFile >> "CfgWeapons" >> ((_what select _foreachindex) select 0) >> "picture")];
		_craften_listbox lbSetValue [_foreachindex,_foreachindex];
	} else {
		_craften_listbox lbadd format["%1",getText(configFile >> "CfgVehicles" >> ((_what select _foreachindex) select 0) >> "displayName")];
		_craften_listbox lbSetPicture[_foreachindex,getText(configFile >> "CfgVehicles" >> ((_what select _foreachindex) select 0) >> "picture")];
		_craften_listbox lbSetValue [_foreachindex,_foreachindex];
	};

} foreach _what;

_benoetigt_listobx lbadd "Nichts ausgewählt";




















