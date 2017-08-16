/*
	File: fn_gasVehicleSelection.sqf
	Author: MarkusSR1984

	Description:
	Füllt das menü zur Auswahl des zu betankenden Fahreuges

*/
#include "..\..\macros.hpp"
disableSerialization;
private["_typegas","_display","_dist","_list"];
_typegas = param [0,["LandVehicle"],[[],""]];
_vehicle = param [1,objNull,[objNull]];

if(vehicle player != player) exitWith { hint format ["Du musst zum betanken des Fahrzeuges aussteigen!"]; };
DWEV_gas_refuel = 0;
DWEV_gas_liter = 0;
DWEV_gas_vehicle = objNull;
DWEV_gas_vehicles = [];

createDialog "DWEV_gasCargoVehicle_select";
waitUntil {!(isNull (findDisplay IDC_GASSTAION_VEHICLESELECTION_MAIN))};
_display = findDisplay IDC_GASSTAION_VEHICLESELECTION_MAIN;
_list = _display displayCtrl IDC_GASSTAION_VEHICLESELECTION_LIST;

{
	_list lbAdd format ["%1 - %2",(getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")), ((_x getVariable["vehicle_info_owners",[]]) select 0)select 1];
	DWEV_gas_vehicles pushback _x;
	false;
} count nearestObjects [_vehicle, _typegas, 30];