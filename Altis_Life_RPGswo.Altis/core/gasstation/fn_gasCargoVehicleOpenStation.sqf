/*
	File: fn_gasVehicle.sqf
	Author: MarkusSR1984


	Description:
	Berechnet den aktuellen Spritpreis und öffnet den Tanken dialog

*/
#include "..\..\macros.hpp";
private["_index"];

if ((lbCurSel IDC_GASSTAION_VEHICLESELECTION_LIST) < 0) exitWith {hint "Du musst ein Fahrzeug auswaehlen um es zu betanken";};

DWEV_gas_vehicle = (DWEV_gas_vehicles select (lbCurSel IDC_GASSTAION_VEHICLESELECTION_LIST));
closeDialog 0; 
if(isNull DWEV_gas_vehicle OR !alive DWEV_gas_vehicle OR isNil "DWEV_gas_vehicle") exitWith { hint format "Fahrzeug nicht gefunden!"; closeDialog 0;};

createDialog "DWEV_gasCargoVehicle_refuel";
[] call DWEV_fnc_gasCargoVehicleUpdate;