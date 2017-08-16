/*
	File: fn_showTreasure.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays a treasure map on screen.
*/

private ["_display","_image","_map"];

_map = [_this,0,"",[""]] call BIS_fnc_param;
if (_map == "") exitWith {};

createDialog "treasureMap";
disableSerialization;

_display = findDisplay 12000;
_image = _display displayCtrl 12005;
_image ctrlSetText format["images\%1.jpg", _map];