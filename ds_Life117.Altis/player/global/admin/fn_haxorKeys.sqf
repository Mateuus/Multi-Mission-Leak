/*
	File: fn_haxorKeys.sqf
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Simply turns on or off a publicVariable
*/
private ["_action"];
_action = true;

if(DS_haxKeys)then
	{
	DS_haxKeys = false;
	hint "Haxor Keys Off";
	}
	else
	{
	_action = [
		"Haxor Keys can cause very bad server lag, only use this when really needed?",
		"Lag Warning",
		"What Ever",
		"Yeah Nah"
	] call BIS_fnc_guiMessage;

	if(!_action)exitwith{};
	DS_haxKeys = true;
	hint "Haxor Keys On";
	};
publicVariable "DS_haxKeys";