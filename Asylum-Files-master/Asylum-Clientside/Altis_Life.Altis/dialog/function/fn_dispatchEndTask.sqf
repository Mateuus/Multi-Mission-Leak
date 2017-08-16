/*
	File: fn_dispatchEndTask.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	End the task and inform all cops assigned to it.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

private ["_task","_taskList","_success"];

if (isNull (findDisplay 39500)) exitWith {};
if (playerSide != west) exitWith {};
if ((lbCurSel 39514) < 0) exitWith {};

_taskList = (findDisplay 39500) displayCtrl 39514;
_task = call compile (_taskList lbData (lbCurSel 39514));
_i = (lbCurSel 39514);

_success = false;
if (_task select 6 != "") then
{
	_unit = objNull;
	{ if (getPlayerUID _x == (_task select 6)) then { _unit = _x } } forEach allPlayers;
	if (!isNull _unit) then { [[_unit, -1, true], "ASY_fnc_manageRadio", false, false] spawn life_fnc_MP; };
};

[[_task select 0, _success],"life_fnc_finishDispatch",west,false] spawn life_fnc_MP;
life_dispatchTasks set [_i, "GOODBYE"];
life_dispatchTasks = life_dispatchTasks - ["GOODBYE"];
publicVariableServer "life_dispatchTasks";

disableSerialization;
_taskList = (findDisplay 39500) displayCtrl 39514;
lbClear _taskList;
{
	_taskList lbAdd (_x select 1);
	_taskList lbSetData [(lbSize _taskList)-1, str _x];
} forEach life_dispatchTasks;
_taskList lbSetCurSel -1;