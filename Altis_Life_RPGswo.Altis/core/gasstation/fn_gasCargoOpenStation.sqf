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

DWEV_gas_price = 20;

_index = ["oilp",sell_array] call DWF_fnc_index;
if(_index != -1) then 
{
	DWEV_gas_price = (((sell_array) select _index) select 1);
	if(DWEV_gas_vehicle isKindOf "Air") then // Kerosin
	{
		DWEV_gas_price = round(DWEV_gas_price / 250);
	} 
	else // Benzin / Diesel
	{
		DWEV_gas_price = round(DWEV_gas_price / 200);
	};
};

createDialog "DWEV_gasCargo_refuel";
[] call DWEV_fnc_gasCargoUpdate;