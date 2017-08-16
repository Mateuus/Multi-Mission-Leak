#include "..\..\script_macros.hpp"
/*
	File: fn_getDPMission.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = param [0,ObjNull,[ObjNull]];
if(str(_target) in LIFE_SETTINGS(getArray,"delivery_points")) then {
	private "_point";
	_point = LIFE_SETTINGS(getArray,"delivery_points");
	_point deleteAt (_point find (str(_target)));
	_dp = _point call BIS_fnc_selectRandom;
} else {
	_dp = LIFE_SETTINGS(getArray,"delivery_points") call BIS_fnc_selectRandom;
};

life_dp_start = _target;

life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format[ "Du musst dieses Paket bei %1 abliefern",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format[ "Liefere dieses Paket bei %1 ab",toUpper _dp]]] call bis_fnc_showNotification;

[] spawn {
	waitUntil {!life_delivery_in_progress OR !alive player};
	if(!alive player) then {
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",[ "Du hast es nicht geschafft, das Paket abzuliefern, da du gestorben bist."]] call BIS_fnc_showNotification;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	};
};