/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp", "_target","_point"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(str(_target) in XY_DPlist) then {
	_point = XY_DPlist - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = XY_DPlist call BIS_fnc_selectRandom;
};

XY_dpStart = _target;

XY_deliveryInProgress = true;
XY_dpPoint = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
XY_currentTask = player createSimpleTask [format["Delivery_%1",XY_dpPoint]];
XY_currentTask setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
XY_currentTask setTaskState "Assigned";
player setCurrentTask XY_currentTask;

hint format[localize "STR_NOTF_DPTask", toUpper _dp];

[] spawn {
    scriptName "DPMissionTracker";
	waitUntil { !XY_deliveryInProgress || !(alive player) };
	if( !(alive player) ) then {
		XY_currentTask setTaskState "Failed";
		player removeSimpleTask XY_currentTask;
		hint localize "STR_NOTF_DPFailed";
		XY_deliveryInProgress = false;
		XY_dpPoint = nil;
	};
};