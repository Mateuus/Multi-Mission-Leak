
/*
	File: fn_getMissionTask.sqf
	Author: Blackd0g

	Description:
	creates a mission task

	Example:
	["task1",position player,"Assigned","Description","DescriptionShort","DescriptionHUD","DeliveryAssigned"] call lhm_fnc_getMissionTask;
*/
private ["_task","_taskPos","_taskState","_description","_descriptionShort","_descriptionHUD","_notification","_translateItems"];

_task = param [0,"",[""]]; // can be any name
_taskPos = param [1,[],[[]]]; // target positon marker
_taskState = param [2,"",[""]];  // Statements below
_description = param [3,"",[""]]; // Map Task long text
_descriptionShort = param [4,"",[""]]; // Map Task
_descriptionHUD = param [5,"",[""]]; // Target marker Name
_notification = param [6,"",[""]]; // cfgNotification Name
_translateItems = param [7,[],[[]]]; // translate a item array

if(count _translateItems > 0) then {

	{
		_item = [(_x select 0),0] call lhm_fnc_varHandle;
		_itemName = [_item] call lhm_fnc_varToStr;
		_description = _description + format["  %1  %2x   ",_itemName,(_x select 1)];
	} forEach _translateItems;
};
playsound "takeQuest";
lhm_cur_task = player createSimpleTask [_task];
if(count _taskPos > 0) then {
	lhm_cur_task setSimpleTaskDestination _taskPos;
};
lhm_cur_task setSimpleTaskDescription [
   _description,
   _descriptionShort,
   _descriptionHUD
];

/*
Set the state of a given task. State value may be one of:
"Succeeded"
"Failed"
"Canceled"
"Created"
"Assigned"
*/
lhm_cur_task setTaskState _taskState;

player setCurrentTask lhm_cur_task;

// decription max 63 characters
[_notification,[_descriptionShort]] call BIS_fnc_showNotification;