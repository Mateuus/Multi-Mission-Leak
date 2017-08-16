/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = param [0,ObjNull,[ObjNull]];
DWEV_delivery_in_progress = false;
DWEV_dp_point = nil;
_dis = round((getPos DWEV_dp_start) distance (getPos _dp));
_price = round(2.3 * _dis);

["DeliverySucceeded",[format["Du hast %1€ verdient",[_price] call DWEV_fnc_numberText]]] call bis_fnc_showNotification;
DWEV_cur_task setTaskState "Succeeded";
player removeSimpleTask DWEV_cur_task;
dwf_cash = dwf_cash + _price;
