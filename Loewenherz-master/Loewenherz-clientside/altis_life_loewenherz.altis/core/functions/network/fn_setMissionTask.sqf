
/*
	Author: Blackd0g

	Description:
	set missiontask state.... blah
*/
private ["_task","_taskState","_notification","_descriptionShort"];
_task = param [0,"",[""]]; // can be any name
_taskState = param [1,"",[""]];  // Statements below
_notification = param [2,"",[""]]; // note
_descriptionShort = param [3,"",[""]]; // description short
_template = param [4,"",[""]]; // description short

if(!isnil "lhm_cur_task") then {
	lhm_cur_task setTaskState _taskState;
} else {
	_task setTaskState _taskState;
};

[_template,[_descriptionShort]] call BIS_fnc_showNotification;