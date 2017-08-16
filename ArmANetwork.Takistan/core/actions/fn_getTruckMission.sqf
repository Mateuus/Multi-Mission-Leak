#include <macro.h>
/*
	File: fn_getTruckMission.sqf
	Author: [GSN] Paronity

	Description:
	Selects a random freight yard legal/illegal delivery mission.
*/
private["_yard","_target","_type","_spawn","_sp","_newTruck","_civCar","_points","_giveGarage"];
_target = param [0,ObjNull];
_type =  _this select 3 select 0;
_spawn = _this select 3 select 1;
_sp = getMarkerPos _spawn;
_nearTrucks = nearestObjects [_sp, ["Car","Air"], 30];
if(count _nearTrucks > 0) exitWith {hint "There is a delivery truck already on the spawn point";};

if(str(_target) in LIFE_SETTINGS(getArray,"truck_missions")) then {
	private "_point";
	_points = LIFE_SETTINGS(getArray,"truck_missions");
	_points deleteAt (_points find (str(_target)));
	_yard = _points call BIS_fnc_selectRandom;
} else {
	_yard = LIFE_SETTINGS(getArray,"truck_missions") call BIS_fnc_selectRandom;
};

life_truck_in_progress = true;
life_truck_point = call compile format["%1",_yard];

if(vehicle player != player) then
{
	_civCar = vehicle player;
} else {
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air"],30]; //Fetch vehicles within 30m.
	if(count _nearVehicles > 0) then
	{
		{
			private["_vehData","_vehOwner"];
			if(!isNil "_civCar") exitWith {}; //Kill the loop.
			_vehData = _x getVariable["vehicle_info_owners",[]];
			if(count _vehData  > 0) then
			{
				_vehOwner = (_vehData select 0) select 0;
				if((getPlayerUID player) == _vehOwner) exitWith
				{
					_civCar = _x;
				};
			};
		} foreach _nearVehicles;
	};
};

if(!isNil "_civCar") then
{
	[_civCar,false,(_this select 1)] remoteExecCall ["TON_fnc_vehicleStore",2];
    _giveGarage = "1";
} else {
    _giveGarage = "0";
};

sleep 3;

_newTruck = "I_Truck_02_covered_F" createVehicle _sp;
_newTruck setVectorUp (surfaceNormal (getMarkerPos _spawn));
_newTruck setPos (getMarkerPos _spawn);
_newTruck setDir (markerDir _spawn);
[_newTruck] call life_fnc_clearVehicleAmmo;

_newTruck setVariable["purpose","truck_mission",true];
_newTruck setVariable["driver",name player,true];
_newTruck setVariable["startYard",_target,true];
_newTruck setVariable["goodsRemoved","0",true];
_newTruck setVariable["giveGarage",_giveGarage,true];
_newTruck setVariable["vehicle_info_owners","truck_mission",true];

if(_type == "legal") then
{
	_newTruck setVariable["type","legal",true];
} else {
	_newTruck setVariable["type","illegal",true];
	hint "You have chosen an illegal mission. This means the cops have been alerted to your activites. Completing the mission will immediately clear it from your record. RUN!!";
	[format["Somebody has accepted an illegal truck mission. They are leaving from the freight yard now. Catch them!"],"Anonymous Tipper",1] remoteExecCall ["TON_fnc_clientMessage",-2];
};

life_cur_task = player createSimpleTask [format["Truck_%1",life_truck_point]];
life_cur_task setSimpleTaskDescription [format["You are to deliver this truck to the %1 freight yard.",toUpper _yard],"Truck Job",""];
["DeliveryAssigned",[format["Deliver this truck to the %1 freight yard.",toUpper _yard]]] call bis_fnc_showNotification;
life_cur_task setTaskState "Assigned";
player setCurrentTask life_cur_task;

[_newTruck] spawn
{
	_truckToWatch = _this select 0;
	waitUntil {!life_truck_in_progress OR !alive player OR !alive _truckToWatch};
	if(life_truck_in_progress) then
	{
		if(!alive player) then
		{
			life_cur_task setTaskState "Failed";
			player removeSimpleTask life_cur_task;
			["DeliveryFailed",["You failed to deliver the truck because you died."]] call BIS_fnc_showNotification;
			life_truck_in_progress = false;
			life_truck_point = nil;
		};
		if(!alive _truckToWatch) then
		{
			life_cur_task setTaskState "Failed";
			player removeSimpleTask life_cur_task;
			["DeliveryFailed",["Truck exploded or was impounded. Mission failed."]] call BIS_fnc_showNotification;
			life_truck_in_progress = false;
			life_truck_point = nil;
		};
	};
};
