/*
	File: fn_adminRestart.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Testing restart carry weight increase
*/

private ["_action"];

_action = [
	"Are you sure you want to increase every bodies carry weight, only do this right before a restart so people can process etc faster?",
	"Increase Carry Weight",
	"Yes",
	"No"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};

[[],"DS_fnc_increaseWeight"] spawn BIS_fnc_MP;

hint "All players weights have been increased";