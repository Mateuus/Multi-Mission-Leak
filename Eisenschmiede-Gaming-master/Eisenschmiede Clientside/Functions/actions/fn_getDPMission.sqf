#include "..\script_macros.hpp"
/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = param [0,ObjNull,[ObjNull]];
if(str(_target) in ES_SETTINGS(getArray,"delivery_points")) then {
	private "_point";
	_point = ES_SETTINGS(getArray,"delivery_points");
	_point deleteAt (_point find (str(_target)));
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = ES_SETTINGS(getArray,"delivery_points") call BIS_fnc_selectRandom;
};

ES_dp_start = _target;

ES_delivery_in_progress = true;
ES_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
ES_cur_task = player createSimpleTask [format["Delivery_%1",ES_dp_point]];
ES_cur_task setSimpleTaskDescription [format[localize "STR_NOTF_DPStart",toUpper _dp],"Delivery Job",""];
ES_cur_task setTaskState "Assigned";
player setCurrentTask ES_cur_task;

["DeliveryAssigned",[format[localize "STR_NOTF_DPTask",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn {
	waitUntil {!ES_delivery_in_progress OR !alive player};
	if(!alive player) then {
		ES_cur_task setTaskState "Failed";
		player removeSimpleTask ES_cur_task;
		["DeliveryFailed",[localize "STR_NOTF_DPFailed"]] call BIS_fnc_showNotification;
		ES_delivery_in_progress = false;
		ES_dp_point = nil;
	};
};