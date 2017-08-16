/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = param [0,ObjNull,[ObjNull]];
if(str(_target) in DWEV_dp_points) then
{
	private["_point"];
	_point = DWEV_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = DWEV_dp_points call BIS_fnc_selectRandom;
};

DWEV_dp_start = _target;

DWEV_delivery_in_progress = true;
DWEV_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
DWEV_cur_task = player createSimpleTask [format["Delivery_%1",DWEV_dp_point]];
DWEV_cur_task setSimpleTaskDescription [format["Bringe das Paket zu %1",toUpper _dp],"Delivery Job",""];
DWEV_cur_task setTaskState "Assigned";
player setCurrentTask DWEV_cur_task;

["DeliveryAssigned",[format["Bringe das Paket zu %1",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!DWEV_delivery_in_progress OR !alive player};
	if(!alive player) then
	{
		DWEV_cur_task setTaskState "Failed";
		player removeSimpleTask DWEV_cur_task;
		["DeliveryFailed",["Durch dein ableben, hast du das Paket nicht zustellen können."]] call BIS_fnc_showNotification;
		DWEV_delivery_in_progress = false;
		DWEV_dp_point = nil;
	};
};
