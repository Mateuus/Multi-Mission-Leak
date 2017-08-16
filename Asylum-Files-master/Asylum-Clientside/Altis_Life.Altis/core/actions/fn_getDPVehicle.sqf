/*
	File: fn_getDPVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Selects a random DP point for a vehicle delivery mission.
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_vehType = [_this,1,1,[1]] call BIS_fnc_param;

if (!(34 in life_talents)) exitWith { hint "You do not have the delivery man talent!"; };

if(str(_target) in life_dp_points) then
{
	private["_point"];
	_point = life_dp_points - [(str(_target))];
	_dp = _point call BIS_fnc_selectRandom;
}
else
{
	_dp = life_dp_points call BIS_fnc_selectRandom;
};

life_dp_start = _target;

life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];
life_delivery_type = 1;

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_cur_task setSimpleTaskDescription [format["You have 10 minutes to delivery the vehicle contents to %1",toUpper _dp],"Delivery Job",""];
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format["Deliver the vehicle contents to %1",toUpper _dp]]] call BIS_fnc_showNotification;
//[[17, player, format["Started delivery mission to %1", _dp]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

time spawn
{
	_time = _this;
	waitUntil {!life_delivery_in_progress OR !alive player OR (time - _time > 600)};
	if(!alive player) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		["DeliveryFailed",["You failed to deliver the package because you died."]] call BIS_fnc_showNotification;
		//[[18, player, format["Failed delivery mission due to death"]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		life_delivery_in_progress = false;
		life_dp_point = nil;
	}
	else if (time - _time > 600) then
	{
	
	};
};