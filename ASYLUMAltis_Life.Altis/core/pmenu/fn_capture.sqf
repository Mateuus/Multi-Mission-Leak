/*
	File: fn_capture.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays capturable points
*/
private["_display","_list","_str","_qty","_price","_shrt"];

disableSerialization;
waitUntil {!isNull findDisplay 2300};

[] call life_fnc_p_updateMenu;

_display = findDisplay 2300;
_list = _display displayCtrl 2305;
_details = _display displayCtrl 2310;

lbClear _list;
{
	_list lbAdd (_x select 0);
	_list lbSetdata [(lbSize _list)-1,str _forEachIndex];
} foreach life_capture_list;