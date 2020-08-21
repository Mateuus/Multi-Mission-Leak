/*
	File: fn_copEnter.sqf
	Author: Skalicon
	
	Description:
	Allows Cops to enter locked Vehicles
*/
if(playerSide == civilian) exitWith {};
private ["_position","_veh"];
_position = _this select 3;

player connectTerminalToUAV objNull;
switch (_position) do
{
	case "driver":
	{
		cursorObject lock false;
		player action ["getInDriver", cursorObject];
		cursorObject lock true;
	};
	case "passenger":
	{
		cursorObject lock false;
		player action ["getInCargo", cursorObject];
		cursorObject lock true;
	};
	case "commander":
	{
		cursorObject lock false;
		player action ["getInTurret", cursorObject, [0]];
		cursorObject lock true;
	};
	case "exit":
	{
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};