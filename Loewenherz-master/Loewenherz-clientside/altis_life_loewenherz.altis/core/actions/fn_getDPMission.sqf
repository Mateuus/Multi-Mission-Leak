/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = param [0,ObjNull,[ObjNull]];
if(str(_target) in lhm_dp_points) then
{
	private["_point"];
	_point = lhm_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = lhm_dp_points call BIS_fnc_selectRandom;
};

lhm_dp_start = _target;

lhm_delivery_in_progress = true;
lhm_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
lhm_cur_task = player createSimpleTask [format["Delivery_%1",lhm_dp_point]];
lhm_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
lhm_cur_task setTaskState "Assigned";
player setCurrentTask lhm_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!lhm_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		lhm_cur_task setTaskState "Failed";
		player removeSimpleTask lhm_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		lhm_delivery_in_progress = false;
		lhm_dp_point = nil;
	};
};