/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Displays markers for police convoys
*/

private ["_position"];

_position = _this select 0;

if(_this select 2)exitWith {
	player removeSimpleTask DS_convoyTask;
};

if(_this select 1)exitWith {
	player removeSimpleTask DS_convoyTask;
	DS_convoyTask = player createSimpleTask ["convoyTask"];
	DS_convoyTask setSimpleTaskDescription ["Escort the police convoy to the marked location to complete the convoy","Convoy End-Point",""];
	DS_convoyTask setSimpleTaskDestination _position;
	DS_convoyTask setTaskState "Assigned";
	player setCurrentTask DS_convoyTask;
};

player removeSimpleTask DS_convoyTask;
DS_convoyTask = player createSimpleTask ["convoyTask"];
DS_convoyTask setSimpleTaskDescription ["Escort the police convoy to the marked location","Convoy Way-Point",""];
DS_convoyTask setSimpleTaskDestination _position;
DS_convoyTask setTaskState "Assigned";
player setCurrentTask DS_convoyTask;