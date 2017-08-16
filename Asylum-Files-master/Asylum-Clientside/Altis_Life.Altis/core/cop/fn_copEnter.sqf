/*
	File: fn_copEnter.sqf
	Author: Skalicon
	
	Description:
	Allows Cops to enter locked Vehicles
*/
if(playerSide != west) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

//player connectTerminalToUAV objNull;// If this is intentional, it shouldn't be in this file
switch (_position) do
{
	case "driver":
	{
		cursorTarget lock false;
		player action ["getInDriver", cursorTarget];
		cursorTarget lock true;
	};
	case "passenger":
	{
		cursorTarget lock false;
		player action ["getInCargo", cursorTarget];
		cursorTarget lock true;
	};
	case "commander":
	{
		cursorTarget lock false;
		player action ["getInCommander", cursorTarget];
		cursorTarget lock true;
	};
	case "exit":
	{
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};