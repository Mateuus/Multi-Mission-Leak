#include <macro.h>
/*
	File: fn_dpFinish.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price","_multi"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
life_delivery_in_progress = false;
life_dp_point = nil;
_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(6.6 * _dis);
if ((!isNull PG_dpTruck) && {PG_dpTruck distance player < 200}) then {
	_multi = switch (typeOf PG_dpTruck) do {
		case "I_Truck_02_transport_F": {1.3;};
		case "I_Truck_02_covered_F": {1.4;};
		case "O_Truck_03_transport_F": {1.6;};
		case "O_Truck_03_covered_F": {1.7;};
		case "B_Truck_01_transport_F": {2;};
		case "B_Truck_01_covered_F": {2;};
		default {1;};
	};
	_price = _price * _multi;
};

["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Succeeded";
player removeSimpleTask life_cur_task;
ADD(CASH,_price);
[] call life_fnc_hudUpdate;