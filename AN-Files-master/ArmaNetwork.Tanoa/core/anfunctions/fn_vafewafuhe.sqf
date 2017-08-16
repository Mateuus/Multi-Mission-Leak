#include <macro.h>
/*
	File: fn_vafewafuhe.sqf
	Author: [GSN] Paronity

	Description:
	Finishes the legal/illegal truck Mission and calculates the money earned based on flat rate of risk of job.
*/
private["_yard","_price","_type","_deliveryTruck","_startYard","_dis","_legLength","_vid"];
_yard = param [0,ObjNull,[ObjNull]];

if(vehicle player != player) then
{
	_deliveryTruck = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			private["_tempType"];
			_tempType = _x getVariable["purpose",[]];
			if(_tempType == "truck_mission") then
			{
				if(alive _x) then
				{
					_deliveryTruck = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(!isNil "_deliveryTruck") then
{
	_type = _deliveryTruck getVariable["type","legal"];
	_startYard = _deliveryTruck getVariable["startYard","dp_calc"];
	life_truck_in_progress = false;

	if(!isNil "_startYard") then
	{
		_legLength = round((getPos _startYard) distance (getPos dp_calc));
		_dis = _legLength + round((getPos dp_calc) distance (getPos _yard));
	} else {
		_dis = round((getPos dp_calc) distance (getPos _yard)) * 2;
	};

	if(_type == "illegal") then
	{
		if(_deliveryTruck getVariable["goodsRemoved","1"] == "1") then
		{
			_price = 30;
			hint "The police have taken the goods from this truck. It's worthless... Here is 30 for nothing.....";
		} else {
			[true,150] call life_fnc_thagayazapu;
			_price = round(3 * _dis);
		};
		[format["The truck driven by %1 has been delivered. You guys are too slow.",name player], "Anonymous Tipper",1] remoteExecCall ["life_fnc_nuphecast",west];
	} else {
		[true,60] call life_fnc_thagayazapu;
		_price = round(1 * _dis);
	};
	_vid = _deliveryTruck getVariable["giveGarage","0"];
	deleteVehicle _deliveryTruck;
	["DeliverySucceeded",[format[(localize "STR_NOTF_Earned_1"),[_price] call life_fnc_rupadudejat]]] call bis_fnc_showNotification;
	life_cur_task setTaskState "Succeeded";
	player removeSimpleTask life_cur_task;
	[_price,0,0] call life_fnc_sewawruk;
	if(_vid == "1") then {life_delivery_garage = true;} else {life_delivery_garage = false;};
	life_truck_point = nil;
} else {
	hint "Unable to find delivery truck. Is it close enough to the freight yard?";
};
