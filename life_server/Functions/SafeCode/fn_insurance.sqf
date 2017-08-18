#include <macro.h>
/*
Filename: fn_insurance.sqf
Author: Kevin Webb
Description: Simple way of insuring the vehicle. Will be modified in the future.
*/
private["_nearVehicles","_vehicle","_price"];
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
else
{
	_nearVehicles = nearestObjects[getPos player,["Car","Air","Ship"],50];
if(count _nearVehicles > 0) then
{
	{
	if(!isNil "_vehicle") exitWith {}; //Kill the loop.
	_vehData = _x getVariable["vehicle_info_owners",[]];
if(count _vehData  > 0) then
{
_vehOwner = (_vehData select 0) select 0;
if((getPlayerUID player) == _vehOwner) exitWith
{
_vehicle = _x;
};
};
} foreach _nearVehicles;
};
};


if(isNil "_vehicle") exitWith {hint "Make sure your vehicle is closest to the NPC and try again";};
if(isNull _vehicle) exitWith {};
if(_vehicle getVariable["isInsured",false]) exitWith { hint "This vehicle already has insurance."; };
if(!(_vehicle in life_vehicles)) exitWith {hint "The target vehicle doesn't seem to be your own."; };
_price = switch(typeOf _vehicle) do
{

case "B_Quadbike_01_F": { 625 };
case "C_Hatchback_01_F": { 2875 };
case "C_Hatchback_01_sport_F": { 10875 };
case "C_Offroad_01_F": { 4375 };
case "C_SUV_01_F": { 8750 };
case "C_Van_01_transport_F": { 10000 };
case "C_Van_01_box_F": { 15000 };
case "B_MRAP_01_F": { 17500 };
case "I_Truck_02_transport_F": { 18750 };
case "I_Truck_02_covered_F": { 25000 };
case "B_Truck_01_transport_F": { 68750 };
case "O_Truck_03_transport_F": { 50000 };
case "O_Truck_03_covered_F": { 62500 };
case "B_Truck_01_box_F": { 87500 };
case "O_Truck_03_device_F": { 112500 };
case "B_Heli_Light_01_F": { 62500 };
case "O_Heli_Light_02_unarmed_F": { 187500 };
case "C_Heli_Light_01_civil_F": { 68750 };
case "O_Heli_Transport_04_F": { 350000 };
case "B_Heli_Transport_03_F": { 437500 };
case "B_Heli_Transport_01_F": { 50000 };
case "O_Heli_Transport_04_box_F": { 625000 };
case "I_Heli_Transport_02_F": { 200000 };

default { -1};
};
if(_price == -1) exitWith { hint "You can not insure this type of vehicle"; };
if(playerSide == independent) then { _price = _price / 4; };
if(life_bankmoney < _price) exitWith { hint format["You do not have enough money in your bank account to complete this transaction, it requires $%1",_price]; };
hint format["You have been charged $%1 to insure this vehicle. If it explodes, it will be placed back inside your garage.",_price];
closeDialog 0;
_vehicle setVariable["isInsured",true,true];
[_vehicle] spawn
{
_vehicle = _this select 0;
waitUntil {sleep 1; !alive _vehicle};
[[_vehicle],"TON_fnc_vehicleInsurance",false,false] spawn life_fnc_MP;
};