/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target","_dpSpots"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_dpSpots = getArray(missionConfigFile >> "Cfgmaster" >> "dpSpots");

if(str(_target) in _dpSpots) then
{
	private["_point"];
	_point = _dpSpots - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
	else
{
	_dp = _dpSpots call BIS_fnc_selectRandom;
};

EMonkeys_dp_start = _target;

eM_delivery_in_progress = true;
EMonkeys_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
EMonkeys_cur_task = player createSimpleTask [format["Delivery_%1",EMonkeys_dp_point]];
EMonkeys_cur_task setSimpleTaskDescription [format["Du musst dieses Paket nach %1 bringen.",toUpper _dp],"Delivery Job",""];
EMonkeys_cur_task setTaskState "Assigned";
player setCurrentTask EMonkeys_cur_task;

["DeliveryAssigned",[format["Bringe dieses Paket zu %1",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn
{
	waitUntil {!eM_delivery_in_progress OR ((!alive player) || (player getVariable["onkill",FALSE]))};
	if(((!alive player) || (player getVariable["onkill",FALSE]))) then
	{
		EMonkeys_cur_task setTaskState "Failed";
		player removeSimpleTask EMonkeys_cur_task;
		["DeliveryFailed",["Kurierauftrag fehlgeschlagen."]] call BIS_fnc_showNotification;
		eM_delivery_in_progress = false;
		EMonkeys_dp_point = nil;
	};
};