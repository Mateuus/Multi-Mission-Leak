/*
	File: fn_admin_wled_menu_open.sqf
	Author: Barney

	Written for Loewenherz Altis RPG. Usage of this script is restricted to permitted servers e.g. Loewenherz
	Ask us for permission to use this file www.lhzp.de
	You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.

	Description:
	Bibidi babidi boooooo

*/

if(call lhm_adminlevel < 4) exitWith {hint "Falsches Admin Level N00b!";};
disableSerialization;
private ["_display","_listbox","_combo","_foreachindex"];
closeDialog 0;

createDialog "Wled_menu";

waituntil {dialog};


_display = findDisplay 5888;
_listbox = _display displayCtrl 1500;
_combo = _display displayCtrl 2100;

{
	_listbox lbAdd name _x;
	_listbox lbSetData [_foreachindex,getPlayerUID _x];

} foreach playableUnits;


{
	_combo lbAdd _x;
	_combo lbSetData [_foreachindex,_x];

} foreach ["coplevel","mediclevel","seclevel"];

