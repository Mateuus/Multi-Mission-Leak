#include "..\..\macros.hpp"
/*
	File: fn_garageLBChange.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Can't be bothered to answer it.. Already deleted it by accident..
*/
disableSerialization;
private["_control","_index","_className","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice","_classNameLife","_VerwahrFee","_storageFee1","_storageFee2","_storageFee3","_price","_purchasePrice","_sellMultiplier","_schrottFee","_schrottPrice"];
_control = _this select 0;
_index = _this select 1;

//Fetch some information.
_dataArr = _control lbData _index; 
_dataArr = call compile format["%1",_dataArr];
_className = (_dataArr select 0);
_classNameLife = _className;

_vehicleColor = ((M_CONFIG(getArray,"LifeCfgVehicles",_classNameLife,"textures") select (_dataArr select 1)) select 0);
if (isNil "_vehicleColor") then {_vehicleColor = "Default";};

_vehicleInfo = [_className] call DWEV_fnc_fetchVehInfo;
_trunkSpace = [_className] call DWEV_fnc_vehicleWeightCfg;

_arrested_tmp = parseNumber str(_dataArr select 2);
_arrested = if (_arrested_tmp == 1) then {true} else {false};

_verkauft_tmp = parseNumber str(_dataArr select 3);
_verkauft = if (_verkauft_tmp == 1) then {true} else {false};


if (_arrested) then // Verwahrstelle auslösen
{	
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
	_VerwahrFee = DWEV_SETTINGS(getNumber,"vehicle_verwahrstelle_multiplier");

	switch (playerSide) do
	{
		case civilian:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
		};
		case west:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
		};
		case independent:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
		};
		case east:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
		};
	};
	_retrievePrice = _purchasePrice * _VerwahrFee;
	_sellPrice = _purchasePrice * _sellMultiplier;
	
	switch (__GETC__(DWEV_donator)) do
	{
		case 1: {_retrievePrice = (_retrievePrice*0.9);};// Premium 10% rabatt
		case 2: {_retrievePrice = (_retrievePrice*0.8);};// Premium 20% rabatt
		case 3: {_retrievePrice = (_retrievePrice*0.7);};// Premium 30% rabatt
		case 4: {_retrievePrice = (_retrievePrice*0.5);};// Premium 50% rabatt
	};
	
	if (actionSpendenziel2 && ((__GETC__(DWEV_donator)) == 0)) then
	{
		_retrievePrice = (_retrievePrice*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	};
	
	if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 555;};
	if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 11111111;};
	
	(getControl(2800,2803)) ctrlSetStructuredText parseText format["
		Auslösegebühr: <t color='#8cff9b'>%1€</t><br/>
		Verkaufspreis: <t color='#8cff9b'>%2€</t><br/>
		Farbe: %8<br/>
		Max. Geschwindigkeit: %3 km/h<br/>
		PS: %4<br/>
		Beifahrersitzte: %5<br/>
		Lagerplatz: %6<br/>
		Tank: %7
		",
	[round _retrievePrice] call DWEV_fnc_numberText,
	[round _sellPrice] call DWEV_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
	_vehicleInfo select 12,
	_vehicleColor
	];
};

if (_verkauft) then // Schrottplatz zurückkaufen
{
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
	_schrottFee = DWEV_SETTINGS(getNumber,"vehicle_schrottplatz_multiplier");

	switch (playerSide) do
	{
		case civilian:{_schrottPrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");};
		case west: {_schrottPrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");};
		case independent: {_schrottPrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");};
		case east: {_schrottPrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");};
	};
	_retrievePrice = _schrottPrice * _schrottFee;
	
	if (actionSpendenziel2) then
	{
		_retrievePrice = (_retrievePrice*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	};

	_NoSellBTN = (getControl(2800,507008));
	_NoSellBTN ctrlEnable false;
	_NoSellBTN ctrlSetTooltip "Verkaufte oder zerstörte Fahrzeuge können nicht verkauft werden!";
	
	if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 11111111;};
	
	(getControl(2800,2803)) ctrlSetStructuredText parseText format["
		Rückkaufspreis: <t color='#8cff9b'>%1€</t><br/>
		Farbe: %8<br/>
		Max. Geschwindigkeit: %3 km/h<br/>
		PS: %4<br/>
		Beifahrersitzte: %5<br/>
		Lagerplatz: %6<br/>
		Tank: %7
		",
	[round _retrievePrice] call DWEV_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
	_vehicleInfo select 12,
	_vehicleColor
	];
};

if (!_arrested && !_verkauft) then // Garage ausparken
{	
	_price = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"price");
	_retrievePrice = M_CONFIG(getNumber,"LifeCfgVehicles",_classNameLife,"fee");

	switch (playerSide) do
	{
		case civilian:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_CIVILIAN");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_CIVILIAN");
		};
		case west:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_COP");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_COP");
		};
		case independent:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_MEDIC");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_MEDIC");
		};
		case east:
		{
			_purchasePrice = _price * DWEV_SETTINGS(getNumber,"vehicle_purchase_multiplier_OPFOR");
			_sellMultiplier = DWEV_SETTINGS(getNumber,"vehicle_sell_multiplier_OPFOR");
		};
	};

	_sellPrice = _purchasePrice * _sellMultiplier;
	
	switch (__GETC__(DWEV_donator)) do
	{
		case 1: {_retrievePrice = (_retrievePrice*0.9);};// Premium 10% rabatt
		case 2: {_retrievePrice = (_retrievePrice*0.8);};// Premium 20% rabatt
		case 3: {_retrievePrice = (_retrievePrice*0.7);};// Premium 30% rabatt
		case 4: {_retrievePrice = (_retrievePrice*0.5);};// Premium 50% rabatt
	};
	if (actionSpendenziel1 && ((__GETC__(DWEV_donator)) == 0) && (side player) == civilian) then
	{
		_retrievePrice = (_retrievePrice*0.9); // 10% rabatt wenn Spendenziel erreicht. Alt Donator bekommen kein extra rabatt.
	};
	
	if ((side player) in [west,independent,east]) then {_retrievePrice = (_retrievePrice/2);};

	if (!(_sellPrice isEqualType 0) || _sellPrice < 1) then {_sellPrice = 555;};
	if (!(_retrievePrice isEqualType 0) || _retrievePrice < 1) then {_retrievePrice = 1111;};
	
	(getControl(2800,2803)) ctrlSetStructuredText parseText format["
		Ausparkgebühr: <t color='#8cff9b'>%1€</t><br/>
		Verkaufspreis: <t color='#8cff9b'>%2€</t><br/>
		Farbe: %8<br/>
		Max. Geschwindigkeit: %3 km/h<br/>
		PS: %4<br/>
		Beifahrersitzte: %5<br/>
		Lagerplatz: %6<br/>
		Tank: %7
		",
	[round _retrievePrice] call DWEV_fnc_numberText,
	[round _sellPrice] call DWEV_fnc_numberText,
	_vehicleInfo select 8,
	_vehicleInfo select 11,
	_vehicleInfo select 10,
	if(_trunkSpace == -1) then {"None"} else {_trunkSpace},
	_vehicleInfo select 12,
	_vehicleColor
	];
};

ctrlShow [2803,true];
ctrlShow [2830,true];