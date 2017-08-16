/*
	File: fn_getDPMission.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Selects a random DP point for a delivery mission.
	Needs to be revised.
*/
private["_dp","_target"];
_target = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_type = [_this,3,0,[0]] call BIS_fnc_param;

if (playerSide != civilian) exitWith { hint "Only civilians can accept delivery missions!" };

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

if (!isNull life_delivery_object) then { deleteVehicle life_delivery_object };

life_dp_start = _target;
life_delivery_in_progress = true;
life_dp_point = call compile format["%1",_dp];
life_delivery_type = _type;
life_dp_time = time;
life_dp_vehicle = objNull;

_dp = [_dp,"_"," "] call KRON_Replace;
life_cur_task = player createSimpleTask [format["Delivery_%1",life_dp_point]];
life_delivery_expire = time + (floor ((((getPos life_dp_start) distance (getPos life_dp_point)) * (2.2 / 1000)) * 60)); // 2.2 mins per metre	
switch (_type) do
{
	case 1:
	{
		life_delivery_expire = time + (floor ((((getPos life_dp_start) distance (getPos life_dp_point)) * (2.2 / 1000)) * 60)); // 2.2 mins per metre
		if (life_delivery_expire < (time + 300)) then { life_delivery_expire = time + 300; };
		life_delivery_object = "Land_CargoBox_V1_F" createVehicle (getMarkerPos format["%1_spawn",_target]);
		life_delivery_object enableRopeAttach true;
		life_delivery_object setVariable ["idleTime", time, true];
		life_cur_task setSimpleTaskDescription [format["You are to delivery this PARCEL, using a vehicle which can tow, to %1 within %2 minutes. Untow the parcel at the destination when you arrive.",toUpper _dp, floor ((life_delivery_expire - time) / 60)],"Delivery Job","Delivery Job"];
	};
	case 2:
	{
		life_delivery_expire = time + (floor ((((getPos life_dp_start) distance (getPos life_dp_point)) * (1.2 / 1000)) * 60)); // 1.2 mins per metre
		if (life_delivery_expire < (time + 180)) then { life_delivery_expire = time + 180; };
		life_delivery_object = "Land_Cargo20_red_F" createVehicle (getMarkerPos format["%1_spawn",_target]);
		life_delivery_object setMass 2600;
		life_delivery_object enableRopeAttach true;
		life_delivery_object setVariable ["idleTime", time, true];
		life_cur_task setSimpleTaskDescription [format["You are to delivery this SHIPMENT, using a powerful AIR vehicle, to %1 within %2 minutes. Untow the shipment at the destination when you arrive.",toUpper _dp, floor ((life_delivery_expire - time) / 60)],"Delivery Job","Delivery Job"];
	};
	default
	{
		life_delivery_expire = time + (floor ((((getPos life_dp_start) distance (getPos life_dp_point)) * (3 / 1000)) * 60)); // 3 mins per metre
		life_delivery_object = objNull;
		life_cur_task setSimpleTaskDescription [format["Deliver this package to %1 within %2 minutes.",toUpper _dp,floor ((life_delivery_expire - time) / 60)],"Delivery Job","Delivery Job"];
	};
};

life_cur_task setSimpleTaskDestination (getPos life_dp_point);
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

["DeliveryAssigned",[format["Deliver this package to %1",toUpper _dp]]] call BIS_fnc_showNotification;
//[[17, player, format["Started delivery mission to %1", _dp]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;

[] spawn
{
	_upp = "Time to deliver";
	//Setup our progress bar.
	disableSerialization;
	5 cutRsc ["life_progress","PLAIN"];
	_ui = uiNameSpace getVariable "life_progress";
	_progress = _ui displayCtrl 38201;
	_pgText = _ui displayCtrl 38202;
	_pgText ctrlSetText format["%1...",_upp];
	_progress progressSetPosition 1;
	_cP = 1;
	_success=false;
	_started = time;
	
	_heliActions = [];
	if (life_delivery_type> 0) then
	{
		_heliActions = [
			player addAction ["Attach sling to cargo", {_r = ropeCreate [vehicle player, "slingload0", life_delivery_object, [0,0,0], 7];}, "", 2, true, true, "", ' vehicle player != player && driver (vehicle player) == player && (vehicle player) isKindOf "AIR" && !(life_delivery_object in (ropeAttachedObjects (vehicle player))) && ((getPos (vehicle player)) distance (getPos life_delivery_object)) < 14 && (getPos (vehicle player)) select 2 < 12 '],
			player addAction ["Detach all cargo", {{ropeDestroy _x} forEach (ropes (vehicle player));}, "", 2, true, true, "", ' vehicle player != player && (vehicle player) isKindOf "AIR" && life_delivery_object in (ropeAttachedObjects (vehicle player)) ']
		];
	};
	
	(findDisplay 12 displayCtrl 51) ctrlAddEventHandler ["Draw","
		(_this select 0) drawLine [
			getPos player,
			getPos life_dp_point,
			[0,0,1,1]
		];
	"];
	
	
	while {life_delivery_in_progress && alive player && time <= life_delivery_expire && (life_delivery_type == 0 || !isNull life_delivery_object)} do
	{
		_cP = 1 - ((time - _started) / (life_delivery_expire - _started));
		_progress progressSetPosition _cP;
		_pgText ctrlSetText format["%2 (%1 min(s))...",floor((life_delivery_expire - time) / 60),_upp];
		if (vehicle player != player) then {life_dp_vehicle = vehicle player};
	};
	5 cutText ["","PLAIN"];
	(findDisplay 12 displayCtrl 51) ctrlRemoveAllEventHandlers "Draw";
	
	if (life_delivery_in_progress) then
	{
		life_cur_task setTaskState "Failed";
		player removeSimpleTask life_cur_task;
		life_delivery_in_progress = false;
		life_dp_point = nil;
		
		switch (true) do
		{
			case (!alive player):
			{
				["DeliveryFailed",["You failed to deliver the package because you died."]] call BIS_fnc_showNotification;
			};
			case (time > life_delivery_expire):
			{
				["DeliveryFailed",["Your package is late. You've failed!"]] call BIS_fnc_showNotification;
			};
			case (isNull life_delivery_object):
			{
				["DeliveryFailed",["Your parcel has been lost. You've failed!"]] call BIS_fnc_showNotification;
			};
			default
			{
				["DeliveryFailed",["You've failed to deliver the package!"]] call BIS_fnc_showNotification;
			};
		};
		if (!isNull life_delivery_object) then { deleteVehicle life_delivery_object; life_delivery_object = objNull; };
		if (count _heliActions > 0) then { { player removeAction _x } forEach _heliActions; };
	};
	
	
};