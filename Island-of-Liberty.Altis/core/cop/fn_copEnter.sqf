/*
	File: fn_copEnter.sqf
	Author: I dunno, I do not care!
	
	Description:
	Allows Cops to enter locked Vehicles
*/
private ["_position","_veh"];
_position = _this select 3;

switch (_position) do
{
	case "driver":
	{
		cursorTarget lock false;
		player moveInDriver cursorTarget;
		vehicle player lock true;
	};
	case "passenger":
	{
		cursorTarget lock false;
		if(isNil "driver cursorTarget") then {
			player moveInCargo cursorTarget;
		} else {
			player moveInAny cursorTarget;
		};
		vehicle player lock true;
	};
	case "exit":
	{
		_veh = vehicle player;
		_veh lock false;
		player action ["getOut", _veh];
		_veh lock true;
	};
};