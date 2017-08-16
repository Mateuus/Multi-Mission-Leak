
/*
	File: fn_removeMissionTask.sqf
	Author: Blackd0g

	Description:
	removes/failed a mission task

	Example:
	["task1","test1","test1Short"] call lhm_fnc_removeMissionTask;
*/
private ["_task","_notification","_descriptionShort"];
_task = param [0,"",[""]]; // can be any name
_notification = param [1,"",[""]]; // can be any name
_descriptionShort = param [2,"",[""]]; // can be any name

lhm_cur_task = _task;
lhm_cur_task setTaskState "Failed";
player removeSimpleTask lhm_cur_task;
if(_notification != "" || _descriptionShort != "") then {
	[_notification,[_descriptionShort]] call BIS_fnc_showNotification;
};
lhm_delivery_in_progress = false;
lhm_dp_point = nil;