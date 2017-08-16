/*
    Author: Niklas "Rappelkiste" Quenter
	File: fn_switchVehicleGarage.sqf
	Server: e-Monkeys.com
    
    Description: New Vehicle Garage System
*/
private["_boxType","_display","_VehicleList","_VehicleInfo","_ParkoutCtrl","_ParkoutButton","_VehicleTypeList","_selectedVehType","_vehType","_vehTypeVariable","_selectedVeh","_vehClass","_vehIndex","_priceArray","_price","_position","_positionDir","_selectedVehInfo","_vehicleColor","_trunkSpace","_fuelSpace","_fuelType","_fuelTypeN","_fuelVolume"];
disableSerialization;
_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];

//Display Variables
_display = findDisplay 21000;
_VehicleList = _display displayCtrl 1000;
_VehicleInfo = _display displayCtrl 1005;
_ParkoutCtrl = _display displayCtrl 1010;
_ParkoutButton = _display displayCtrl 1201;
_VehicleTypeList = _display displayCtrl 1100;

//Select Vehicle Type
_selectedVehType = lbCurSel _VehicleTypeList;
_vehType = _VehicleTypeList lbData _selectedVehType;
_vehType = compile _vehType;
_vehTypeVariable = call _vehType;

//Select Vehicle
_selectedVeh = lbCurSel _VehicleList;
_vehClass = _VehicleList lbData _selectedVeh;
_vehIndex = _VehicleList lbValue _selectedVeh;

_priceArray = getArray (missionConfigFile >> "CfgVehicles" >> _vehClass >> "garageFee");
switch (playerSide) do
{
	case civilian: {_price = _priceArray select 0};
	case opfor: {_price = _priceArray select 0};
	case west: {_price = _priceArray select 1};
	case independent: {_price = _priceArray select 2};
};

if((EMonkeys_VehicleGarageSettings select 2) == "impound") then
{
	_price = ((_price / 100)* 25) + _price;
};

//Change Vehicle Informations
_selectedVehInfo = [_vehClass] call EMonkeys_fnc_fetchVehInfo;
_vehicleColor = getText (missionConfigFile >> "CfgVehicleColor" >> _vehClass >> format["%1",(((_vehTypeVariable select _vehIndex) select 1) select 4)] >> "name");
_trunkSpace = getNumber (missionConfigFile >> "CfgVehicles" >> _vehClass >> "trunkWeight");
_fuelSpace = getNumber (missionConfigFile >> "CfgVehicles" >> _vehClass >> "fuelCapicity");
_fuelType = getText (missionConfigFile >> "CfgVehicles" >> _vehClass >> "fuel");
_fuelTypeN = getText (missionConfigFile >> "cfgFuelstationSys" >> "fuelnames" >> _fuelType >> "name");
_fuelVolume = parseNumber (((_vehTypeVariable select _vehIndex) select 1) select 5);

if(!(_vehClass in _boxType)) then
{
	_VehicleInfo ctrlSetStructuredText parseText format[
	"<t size = '0.95'>Höchstgeschwindigkeit: %1 km/h<br/>Pferdestärken: %2<br/>Sitzplätze: %3<br/>Ladekapazität: %4<br/>Treibstoff: %5<br/>Tankinhalt: %6 / %7 L<br/>Panzerung: %8<br/>Lackierung: %9</t>",
	_selectedVehInfo select 8,
	_selectedVehInfo select 11,
	(_selectedVehInfo select 10) + 1,
	if(_trunkSpace == -1) then {"0"} else {_trunkSpace},
	_fuelTypeN,
	round (_fuelVolume * _fuelSpace),
	_fuelSpace,
	_selectedVehInfo select 9,
	_vehicleColor
	];
}else{
	_VehicleInfo ctrlSetStructuredText parseText format[
	"<t size = '0.95'>Ladekapazität: %1<br/>Panzerung: %2<br/>Lackierung: %3</t>",
	if(_trunkSpace == -1) then {"0"} else {_trunkSpace},
	_selectedVehInfo select 9,
	_vehicleColor
	];
};

//Change Parkout price
_ParkoutCtrl ctrlSetStructuredText parseText format["<t size = '0.95'>%1 Gebühr: <t color='#8cff9b'>%2€</t></t>",if((EMonkeys_VehicleGarageSettings select 2) == "impound") then {"Beschlagnahmungs"} else {"Auspark"},if(_price == 0) then {"Keine"} else {[_price]call EMonkeys_fnc_numberText}];

//Setup Parkout Button
_ParkoutButton ctrlSetTooltip format["%1 ausparken für %2€", (_selectedVehInfo select 3), [_price]call EMonkeys_fnc_numberText];
_ParkoutButton ctrlSetEventHandler ["ButtonClick", "[] spawn Emonkeys_fnc_VehicleGarageParkout"];
