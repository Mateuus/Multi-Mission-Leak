/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
eM_delivery_in_progress = false;
EMonkeys_dp_point = nil;
_dis = round((getPos EMonkeys_dp_start) distance (getPos _dp));
_price = round(1.9 * _dis);

[] call EMonkeys_fnc_craftitems;

["DeliverySucceeded",[format["Du hast %1€ verdient.",[_price] call EMonkeys_fnc_numberText]]] call bis_fnc_showNotification;
EMonkeys_cur_task setTaskState "Succeeded";
player removeSimpleTask EMonkeys_cur_task;
EMonkeys_c164 = EMonkeys_c164 + _price;