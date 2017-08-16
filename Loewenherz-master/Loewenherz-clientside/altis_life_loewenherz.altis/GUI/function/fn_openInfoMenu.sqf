/*
	File: fn_infoLBchanged.sqf
	Author: Barney

	Description:
	BLAH
*/


private ["_display","_listbox","_text","_foreachindex"];
disableSerialization;
closeDialog 0;

createDialog "InfoMenu";
waituntil {!isnull (findDisplay 2001);};

_display = findDisplay 2001;
_listbox = _display displayCtrl 1500;
_text = _display displayCtrl 1100;
{
	_listbox lbadd _x;
	_listbox lbsetvalue [_foreachindex,_foreachindex];

} foreach LHM_info_menu;

_text ctrlSetStructuredText parsetext "Loewenherz Hilfe Menü!";

