/*
	File: fn_unlockVeh.sqf

	Author: Blackd0g modified by Teebaron
	
	Description:
	Allows to enter locked Vehicles
*/
private ["_position","_veh","_vehicle"];
_vehicle = cursorTarget;
_position = param [3,"",[""]];
if(_position == "exit") then {
		_vehicle = vehicle player;
	};
if(playerSide == civilian || isNull _vehicle) exitWith {};

switch (_position) do
{
	case "driver":
	{
		_vehicle lock false;
		player action ["getInDriver", _vehicle];
		_vehicle lock true;
	};

	case "passenger":
	{
		_vehicle lock false;
		player action ["getInCargo", _vehicle];
		_vehicle lock true;
	};

	case "co-pilot":
	{
		_vehicle lock false;
		//Steige als Co-Pilot ein 
		player moveInTurret [vehicle _vehicle, [0]]; 
		_vehicle lock true;
	};

	case "gunner":
	{
		_vehicle lock false;
		if(_vehicle isKindOf "car") then{//Nur bei HMG ist Pos = 0. Bei Luft ist es Co-Pilot
			player moveInTurret [vehicle _vehicle, [0]];
		}else {
			player moveInTurret [vehicle _vehicle, [9]];	
			player moveInTurret [vehicle _vehicle, [8]];	
			player moveInTurret [vehicle _vehicle, [7]];	
			player moveInTurret [vehicle _vehicle, [6]];	
			player moveInTurret [vehicle _vehicle, [5]];	
			player moveInTurret [vehicle _vehicle, [4]];	
			player moveInTurret [vehicle _vehicle, [2]];
			player moveInTurret [vehicle _vehicle, [3]];
			player moveInTurret [vehicle _vehicle, [1]];
		};
		_vehicle lock true;
	};

	case "exit":
	{
		_vehicle = vehicle player;
		_vehicle lock false;
		player action ["getOut", _vehicle];
		_vehicle lock true;
	};
};



