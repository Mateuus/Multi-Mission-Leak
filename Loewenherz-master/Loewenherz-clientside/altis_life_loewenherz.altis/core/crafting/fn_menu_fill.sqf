/*
	File: fn_menu_fill.sqf
	Author: Barney

	Description:
	Fills the Crafting Menu Dialog ALPHA VERSION!


	You're not allowed to modify this file!
    	Licensed under the Arma EULA and Arma Tools EULA.
	Usage of this file is restricted to permitted servers e.g. Loewenherz.
	Ask us for permission to use this file: www.lhzp.de
*/

disableSerialization;
private ["_dialog","_craften_listbox","_benoetigt_listobx","_combo_kategorien","_craft_BTN","_what","_foreachindex"];
closeDialog 0;
createDialog "crafting";
waitUntil {!isnull(findDisplay 1584)};

_dialog = findDisplay 1584;

_craften_listbox = _dialog displayCtrl 1500;
_benoetigt_listobx = _dialog displayCtrl 1501;
_combo_kategorien = _dialog displayCtrl 2100;
_craft_BTN = _dialog displayCtrl 2400;


_what = [0] call lhm_fnc_crafting_config;  // CONfig NEEDED!


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


{
	_combo_kategorien lbadd _x;
	_combo_kategorien lbsetValue [_foreachindex , _foreachindex];

} foreach ["Primärwaffe", "Sekundärwaffe","Kleidung","Fahrzeuge"];


_craft_BTN buttonSetAction "[] spawn lhm_fnc_craft;";



















