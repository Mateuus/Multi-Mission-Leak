#include "..\..\macros.hpp"
/*
	File: fn_unimpound.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Yeah... Gets the vehicle from the garage.

	Modyfied by: MarkusSR1984

	Description:
	Umbau für das Verwahrstellensystem

*/
private["_vehicle","_vid","_pid","_unit","_price","_storageFee1","_storageFee2","_storageFee3","_vehicleLife","_purchasePrice","_VerwahrFee"];
disableSerialization;
if(lbCurSel 2802 == -1) exitWith {hint "Du hast nichts ausgewählt."};
_vehicle_arr = call compile format["%1",(lbData[2802,(lbCurSel 2802)])];
_vehicle = (_vehicle_arr select 0);
_vehicleLife = _vehicle;
_arrested_tmp = (_vehicle_arr select 2);
_arrested = if (_arrested_tmp == 1) then {true} else {false};
_verkauft_tmp = (_vehicle_arr select 3);
_verkauft = if (_verkauft_tmp == 1) then {true} else {false};
_vid = lbValue[2802,(lbCurSel 2802)];
_pid = getPlayerUID player;
_unit = player;

if(isNil "_vehicle") exitWith {hint "Die Auswahl hat einen Fehler..."};

if (_arrested) then // Verwahrstelle
{
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
	_VerwahrFee = DWEV_SETTINGS(getNumber,"vehicle_verwahrstelle_multiplier");
	
	switch (playerSide) do
	{
		case civilian: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");};
		case west: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");};
		case independent: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");};
		case east: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");};
	};
	
	_price = round (_purchasePrice * _VerwahrFee);

	switch (__GETC__(DWEV_donator)) do
	{
		case 1: {_price = (_price*0.9);};// Premium 10% rabatt
		case 2: {_price = (_price*0.8);};// Premium 20% rabatt
		case 3: {_price = (_price*0.7);};// Premium 30% rabatt
		case 4: {_price = (_price*0.5);};// Premium 50% rabatt
	};

	if (actionSpendenziel2 && ((__GETC__(DWEV_donator)) == 0)) then	{_price = (_price*0.9);}; // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	
	if (!(_price isEqualType 0) || _price < 1) then {_price = 11111111;};
};

if (_verkauft) then // Schrottplatz
{
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"price");
	_schrottFee = DWEV_SETTINGS(getNumber,"vehicle_schrottplatz_multiplier");
	
	switch (playerSide) do
	{
		case civilian: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");};
		case west: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");};
		case independent: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");};
		case east: {_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");};
	};
	
	_price = round (_purchasePrice * _schrottFee);
	
	if (actionSpendenziel2) then {_price = (_price*0.9);}; // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	
	if (!(_price isEqualType 0) || _price < 1) then {_price = 11111111;};
};

if (!_arrested && !_verkauft) then // Garage
{
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_vehicleLife,"fee");
		
	switch (__GETC__(DWEV_donator)) do
	{
		case 1: {_price = (_price*0.9);};// Premium 10% rabatt
		case 2: {_price = (_price*0.8);};// Premium 20% rabatt
		case 3: {_price = (_price*0.7);};// Premium 30% rabatt
		case 4: {_price = (_price*0.5);};// Premium 50% rabatt
	};
	if (actionSpendenziel1 && ((__GETC__(DWEV_donator)) == 0) && (side player) == civilian) then
	{
		_price = (_price*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	};
	
	if ((side player) in [west,independent,east]) then {_price = (_price/2);};
	
	if (!(_price isEqualType 0) || _price < 1) then {_price = 1111;};
};

if(dwf_atmcash < _price) exitWith {hint format["Du hast keine %1€ auf dem Bankkonto.",[_price] call DWEV_fnc_numberText];};

if(typeName DWEV_garage_sp == "ARRAY") then
{
	[_vid,_pid,DWEV_garage_sp select 0,_unit,_price,DWEV_garage_sp select 1] remoteExec ["DWF_fnc_spawnVehicIe",2];  // Später mal (if (DWEV_HC_isActive && DWEV_HC_VALID) then {hc_1} else {2}) // anstelle von 2
}
else
{
	if(DWEV_garage_sp in ["medic_spawn_1","medic_spawn_2","medic_spawn_3"]) then
	{
		[_vid,_pid,DWEV_garage_sp,_unit,_price] remoteExec ["DWF_fnc_spawnVehicIe",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];
	}
	else
	{
		[_vid,_pid,(getMarkerPos DWEV_garage_sp),_unit,_price,markerDir DWEV_garage_sp] remoteExec ["DWF_fnc_spawnVehicIe",(if (/*DWEV_HC_isActive && !(isNil "hc_1") && !(isNull hc_1)*/ false) then {hc_1} else {2})];
	};
};

hint "Wird ausgeparkt, bitte warten...";

dwf_atmcash = dwf_atmcash - _price;
[1] call SOCK_fnc_updatePartial;
