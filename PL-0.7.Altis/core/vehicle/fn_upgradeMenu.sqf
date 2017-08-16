#include "..\..\script_macros.hpp"
/*---------------------------------------------------------------------------
	File: fn_upgradeMenu.sqf
	Author: Skrow & Skyfezzer
	Date: 06/03/2017
	Description:
		*************************
---------------------------------------------------------------------------*/

if(life_action_inUse) exitWith {hint localize "STR_NOTF_ActionInProc"};
disableSerialization;
private["_nearVehicles","_control","_vehicle","_vehData","_vehOwner","_trunkslider","_trunklevel","_insslider","_inslevel","_securecheck","_hookcheck","_gpscheck"];


if(vehicle player != player) then
{
	_vehicle = vehicle player;
} else {
	_nearVehicles = nearestObjects [(getPosWorld player),["Car","Truck","Air","Ship"],15];

	//Error check
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
					upgradeVehicle = _vehicle;
				};
			};
		} foreach _nearVehicles;
	};
};

if(EQUAL(count _nearVehicles,0)) exitWith {titleText["Aucun véhicule proche de la zone de mise à niveau","PLAIN"];};


if(isNil "_vehicle") exitWith {hint "Vous n'êtes pas le propriétaire du véhicule" };
if(isNull _vehicle) exitWith {};

//upgradeVehicle = _vehicle;

if(!(createDialog "Life_upgrade_car")) exitWith {hint "Mise à niveau échoué"};



_display = findDisplay 5500;
_trunkslider = 5501;
_trunklevel = 5511;
_insslider = 5502;
_inslevel = 5512;
_securecheck = _display displayCtrl 5503;
_hookcheck = _display displayCtrl 5504;
_gpscheck = _display displayCtrl 5505;
_hooklabel = _display displayCtrl 1010;

sliderSetRange [_trunkslider, 0, 4];
sliderSetRange [_insslider, 0, 3];

sliderSetSpeed [_trunkslider, 1, 1];
sliderSetSpeed [_insslider, 1, 1];

sliderSetPosition[_trunkslider, (_vehicle getVariable["trunklevel", 0])];
sliderSetPosition[_insslider, (_vehicle getVariable["insurance", 0])];

ctrlSetText[5512,format["%1",(_vehicle getVariable["insurance", 0])]];
ctrlSetText[5511,format["%1",(_vehicle getVariable["trunklevel", 0])]];



_securecheck cbSetChecked (_vehicle getVariable["security",false]);
_hookcheck cbSetChecked (_vehicle getVariable["hooks",false]);
_gpscheck cbSetChecked (_vehicle getVariable["gps",false]);

if (_vehicle isKindOf "Air") then {
	_hooklabel ctrlShow false;
	_hookcheck ctrlShow false;
};
if ((typeOf _vehicle) in ["B_Truck_01_transport_F","B_Truck_01_box_F","O_Truck_03_device_F","O_Truck_03_covered_F","O_Truck_03_transport_F"]) then {
	_hooklabel ctrlShow false;
	_hookcheck ctrlShow false;
};