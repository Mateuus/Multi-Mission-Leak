/*
	File: fn_confirmMenu.sqf
	Author: John "Paratus" VanderZwet & Alan
	
	Description:
	Call to confirm an action.
	
	Parameter(s):
	0 - STRING or STRUCTURED TEXT
	
	_handle = [format["%1 ", _var]] spawn life_fnc_confirmMenu;
	waitUntil {scriptDone _handle};
	if(!life_confirm_response) exitWith {};
*/
private["_msg"];
disableSerialization;
life_confirm_response = false;
createDialog "life_confirm_menu";

_msg = parseText (_this select 0);

waitUntil {!isNull (findDisplay 4700)};
_display = findDisplay 4700;
_label = _display displayCtrl 4710;

_label ctrlSetStructuredText _msg;

waitUntil {isNull (findDisplay 4700)};