/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = param [0,ObjNull,[ObjNull]];
lhm_delivery_in_progress = false;
lhm_dp_point = nil;
_dis = round((getPos lhm_dp_start) distance (getPos _dp));
_price = round(1.7 * _dis);

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call lhm_fnc_numberText]]] call bis_fnc_showNotification;
lhm_cur_task setTaskState "Succeeded";
player removeSimpleTask lhm_cur_task;
lhm_cash = lhm_cash + _price;