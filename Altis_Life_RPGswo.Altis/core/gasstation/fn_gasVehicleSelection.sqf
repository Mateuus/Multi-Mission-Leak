/*
	File: fn_gasVehicleSelection.sqf
	Author: MarkusSR1984

	Description:
	Füllt das menü zur Auswahl des zu betankenden Fahreuges

*/
#include "..\..\macros.hpp"
disableSerialization;
private["_typegas","_display","_dist","_list"];
_typegas = param[0,["LandVehicle"],[[],""]];

if(vehicle player != player) exitWith { hint format ["Du musst zum betanken des Fahrzeuges aussteigen!"]; };
DWEV_gas_refuel = 0;
DWEV_gas_liter = 0;
DWEV_gas_vehicle = objNull;
DWEV_gas_vehicles = [];

createDialog "DWEV_gas_select";
waitUntil {!(isNull (findDisplay IDC_GASSTAION_VEHICLESELECTION_MAIN))};
_display = findDisplay IDC_GASSTAION_VEHICLESELECTION_MAIN;
_list = _display displayCtrl IDC_GASSTAION_VEHICLESELECTION_LIST;
_dist = (if ("Air" in _typegas) then {20} else {7});
_playerSide = switch (side player) do {case west:{'cop'}; case independent: {'med'}; case east: {'WSC'}; default {'civ'};};


{
	if ((_x getVariable ['side','civ']) == _playerSide) then // Nur noch Fahrzeuge der eigenen Fraktion betankbar
	{
		_list lbAdd format ["%1 - %2",(getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")), ((_x getVariable["vehicle_info_owners",[]]) select 0)select 1];
		DWEV_gas_vehicles pushback _x;
	};
	false;
} count nearestObjects [player, _typegas, _dist];