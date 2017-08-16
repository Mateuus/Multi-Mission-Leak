/*
	File: fn_newWaypoint.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets or cancels current dispatch waypoint
*/
private["_pos","_remove"];
_pos = [_this,0,[0,0,0],[[]]] call BIS_fnc_param;
_remove = [_this,1,false,[false]] call BIS_fnc_param;

if (playerSide != west) exitWith {};

{
	if ((taskDescription _x) select 1 == "Dispatch Waypoint") then
	{
		player removeSimpleTask _x;
	};
} forEach (simpleTasks player);

if (_remove) exitWith { hint "Your current waypoint task from dispatch has been canceled." };

_task = player createSimpleTask ["DispatchWaypoint"];
_task setSimpleTaskDestination _pos;
_task setSimpleTaskDescription ["Dispatch has requested that you move to this location.", "Dispatch Waypoint", "Dispatch Waypoint"];
_task setTaskState "Assigned";

hint "You have been assigned a new waypoint task from dispatch. You will find this on your map in the Tasks tab.";