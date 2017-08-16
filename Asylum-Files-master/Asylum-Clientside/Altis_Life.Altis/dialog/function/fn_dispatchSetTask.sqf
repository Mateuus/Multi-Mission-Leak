/*
	File: fn_dispatchSetTask.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Assign or clear a task for the selected cop.
	Please ask for permission to use this and stop stealing my stuff.
*/

disableSerialization;

private ["_task","_taskList"];

if (isNull (findDisplay 39500)) exitWith {};
if (playerSide != west) exitWith {};
if ((lbCurSel 39510) < 0) exitWith {};
if ((lbCurSel 39514) < 0) exitWith {};

_copList = (findDisplay 39500) displayCtrl 39510;
_cop = call compile (_copList lbData (lbCurSel 39510));

if (ctrlText 39512 == "Unassign") exitWith
{
	if (!isNil "life_dispatchTasks") then
	{
		_i = -1;
		_newCops = [];
		{
			if (_cop in (_x select 4)) then
			{
				_i = _forEachIndex;
				_row = _x;
				_newCops = _x select 4;
				_newCops = _newCops - [_cop];
				_row set[4, _newCops];
			};
		} forEach life_dispatchTasks;
		if (_i > -1) then
		{
			life_dispatchTasks set [_i, _row];
			ctrlSetText [39512, "Assign Task"];
			[[[0,1,2],format["Dispatch has relieved you of %1.", _row select 1]],"life_fnc_broadcast",_cop,false] spawn life_fnc_MP;
		};
	};
};

_taskList = (findDisplay 39500) displayCtrl 39514;
_task = call compile (_taskList lbData (lbCurSel 39514));

if (count (_task select 4) >= (_task select 3)) exitWith { hint "This task already has its maximum number of assigned officers." };

_i = (lbCurSel 39514);
_copList = _task select 4;
if (!(_cop in _copList)) then { _copList pushBack _cop; _task set [4, _copList]; };
life_dispatchTasks set [_i, _task];
ctrlSetText [39512, "Unassign"];
publicVariableServer "life_dispatchTasks";

[[_task select 0,_task select 1,_task select 2], "life_fnc_newDispatch", _cop, false] spawn life_fnc_MP;