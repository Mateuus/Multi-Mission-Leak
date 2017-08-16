/*
	File: fn_initDialog.sqf
	Author: Mario2002

	Description:
	init the builder menu
*/



private ["_display","_confirmBTN","_listbox","_count"];

disableSerialization;


_display = finddisplay 8900;
_confirmBTN = _display displayCtrl 5002;
_listbox = _display displayCtrl 8910;
_count = 0;
waitUntil {!isnull(findDisplay 8900)};
{

	if(!isNil {(group _x) getVariable "gang_name"}) then {
    		_listbox lbadd format["%1 - Gang:%2",(name _x),(group _x) getVariable "gang_name"];
    		_listbox lbsetdata[_count,(name _x)];
		_count = _count + 1;
	};



} foreach playableUnits;

_confirmBTN buttonSetAction " [] spawn build_fnc_buttonAction;";
