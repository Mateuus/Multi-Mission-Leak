#include "..\..\macros.hpp"
/*
	File: fn_storeVehicle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Stores the vehicle in the garage.
*/
private["_nearVehicles","_vehicle","_uid"];
_uid = getPlayerUID player;
if(vehicle player != player) then
{
	_vehicle = vehicle player;
}
	else
{
	_nearVehicles = nearestObjects[getPos (_this select 0),["Car","Air","Ship"],30]; //Fetch vehicles within 30m.
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
			false;
		} count _nearVehicles;
	};
};

if(isNil "_vehicle") exitWith {hint "Kein Fahrzeug in der Nähe der Garage."};
if(isNull _vehicle) exitWith {};
/*
if (_vehicle getVariable["DWEV_INVENTORY_OPEN",false] && (side player) != civilian) then 
{
	if (_uid != (_vehicle getVariable["DWEV_INVENTORY_OPENER","UIDFEHLER"])) then
	{
		[2,player,format ["Spieler %1 hat zusammen mit dem Spieler %2 den Inventory Garagen Bug genutzt",getMyName,_vehicle getVariable["DWEV_INVENTORY_OPENER","UIDFEHLER"]]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
};
*/
if (_vehicle getVariable["DWEV_TRUNK_OPEN",false]) then 
{
	if (_uid != (_vehicle getVariable["DWEV_TRUNK_OPENER","UIDFEHLER"])) then
	{
	[2,player,format ["Spieler %1 hat zusammen mit dem Spieler %2 den Trunk Garagen Bug genutzt",getMyName,_vehicle getVariable["DWEV_TRUNK_OPENER","UIDFEHLER"]]] remoteExec ["DB_fnc_logToDB",(if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2})];
	};
};

[_vehicle,false,(_this select 1)] remoteExec ["DWF_fnc_vehicleStore",2];
hint "Der Parkservice versucht dein Fahrzeug unterzubringen...";
DWEV_garage_store = true;