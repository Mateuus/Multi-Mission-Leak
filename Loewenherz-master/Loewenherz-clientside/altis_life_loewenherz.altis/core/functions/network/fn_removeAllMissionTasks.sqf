/*
	File: fn_removeAllMissionTasks.sqf
	Author: Blackd0g

	Description:
	removes all mission tasks from player
*/
{
	if (tolower taskstate _x in ["created","assigned"]) then {_x settaskstate "Failed";};
	// [_x] call lhm_fnc_removeMissionTask;
	player removeSimpleTask _x;
} foreach simpletasks player;

//["TaskFailed",["Nicht erfolgreich","Mission fehlgeschlagen"]] call bis_fnc_showNotification;

lhm_delivery_in_progress = false;
lhm_dp_point = nil;

