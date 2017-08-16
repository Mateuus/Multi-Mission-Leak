/*
	File: fn_dpFinish.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Finishes the DP Mission and calculates the money earned based
	on distance between A->B
*/
private["_dp","_dis","_price","_success"];
_dp = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (!life_delivery_in_progress) exitWith { hint "You're not currently on a delivery mission!" };

_dis = round((getPos life_dp_start) distance (getPos _dp));
_price = round(0.3 * _dis);

_success = false;
if (life_delivery_type > 0) then
{
	_price = _price * 1.1;
	if (35 in life_talents && life_delivery_type == 1) then { _price = _price * 1.2; };
	if (36 in life_talents && life_delivery_type == 2) then { _price = _price * 1.25; };
	if (isNull life_delivery_object) exitWith {systemChat "Your package could not be located!"};
	if ((life_delivery_object distance _dp) < 30 && (getPos life_delivery_object) select 2 < 0.1 && isNull (ropeAttachedTo life_delivery_object)) then
	{
		_success = true;
		deleteVehicle life_delivery_object;
	};
}
else { _success = true; };

if (_success) then
{
	life_delivery_in_progress = false;
	life_dp_point = nil;
	["DeliverySucceeded",[format["You have earned $%1",[_price] call life_fnc_numberText]]] call bis_fnc_showNotification;
	life_cur_task setTaskState "Succeeded";
	player removeSimpleTask life_cur_task;
	["cash","add",_price] call life_fnc_uC;
	life_experience = life_experience + 40;
	if (isNull life_dp_vehicle) then {life_dp_vehicle = player};
	if ((_dis/floor(time - life_dp_time)) > 60) then {[[922,player,format["Delivered package from %1 to %2 (%7m) in %3 seconds (~%6m/s). Using %4 and gaining $%5",life_dp_start,_dp,round((time - life_dp_time)),typeOf (life_dp_vehicle),[_price] call life_fnc_numberText,round(_dis/floor(time - life_dp_time)),_dis]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;};
}
else
{
	hint "Delivery mission is not yet successful. Is your package nearby and detached on the ground?";
};
life_dp_vehicle = objNull;
life_dp_time = 0;