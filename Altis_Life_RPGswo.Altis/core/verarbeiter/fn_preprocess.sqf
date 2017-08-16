/*
	File: fn_preprocess.sqf
	Author: Firly <Division Wolf e.V.>

	Description:
	PreHandler für Verarbeitung
*/

#include "..\..\macros.hpp"
disableSerialization;
private["_typegas","_display","_dist","_list","_vendor", "_type", "_unit"];

DWEV_process_vendor = param [0,ObjNull,[ObjNull]];
DWEV_process_type = param [3,"",[""]]; 
DWEV_process_unit = player;
DWEV_process_vehicle = objNull;
DWEV_process_vehicles = [];

if(vehicle player != player) exitWith { hint format ["Du musst zum betanken des Fahrzeuges aussteigen!"]; };

createDialog "DWEV_process_select";
waitUntil {!(isNull (findDisplay IDC_PROCESS_VEHICLESELECTION_MAIN))};
_display = findDisplay IDC_PROCESS_VEHICLESELECTION_MAIN;
_list = _display displayCtrl IDC_PROCESS_VEHICLESELECTION_LIST;
_dist = 10;
_playerSide = switch (side player) do {case west:{'cop'}; case independent: {'med'}; case east: {'WSC'}; default {'civ'};};

{
	if ((_x getVariable ['side','civ']) == _playerSide) then // Nur noch Fahrzeuge der eigenen Fraktion betankbar
	{
		_list lbAdd format ["%1 - %2",(getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName")), ((_x getVariable["vehicle_info_owners",[]]) select 0)select 1];
		DWEV_process_vehicles pushback _x;
	};
	false;
} count nearestObjects [player, ["LandVehicle"], _dist];
 

//[_vendor, _type, _unit] call DWEV_fnc_processAction; 