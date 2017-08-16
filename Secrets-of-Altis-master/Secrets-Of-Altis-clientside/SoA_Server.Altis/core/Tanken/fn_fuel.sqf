/*
	File: fuel.sqf
	Author: Paradox
	Setze den Verbrauch
*/
private ["_vehicle", "_rate", "_oldFuel", "_newFuel", "_difFuel"];

_vehicle = _this select 0;
_state = _this select 1;
_oldFuel = fuel _vehicle;
_rate = 0;

if(!_state) exitWith {};
if(!local _vehicle || !local player) exitWith {};
	
_rate = switch(typeOf _vehicle)do
{
	//Zivile Autos	Tankverbrauch
	case "B_Quadbike_01_F": {0.00015};
	case "C_Quadbike_01_F": {0.00015};
	case "C_Offroad_01_F": {0.00035};
	case "I_G_Offroad_01_F": {0.00035};
	case "B_G_Offroad_01_armed_F": {0.00055};
	case "C_SUV_01_F": {0.00035};
	case "C_Hatchback_01_F": {0.00025};
	case "C_Hatchback_01_sport_F": {0.00035};	
	case "C_Offroad_02_unarmed_F": {0.00035};
	case "O_T_LSV_02_unarmed_F": {0.00040};
	case "B_T_LSV_01_unarmed_F": {0.00040};

	//Kleine LKW Tankverbrauch
	case "C_Van_01_transport_F": {0.00025};
	case "C_Van_01_box_F": {0.00025};
	case "C_Van_01_fuel_F": {0.00025};

	// Zamak Tankverbrauch
	case "I_Truck_02_transport_F": {0.00035};
	case "I_Truck_02_covered_F": {0.00035};	
	case "I_Truck_02_fuel_F": {0.00035};
	case "I_Truck_02_box_F": {0.00035};
	case "O_Truck_02_fuel_F": {0.00035};
	
	// Hemtt Tankverbrauch
	case "B_Truck_01_transport_F": {0.00045};
	case "B_Truck_01_covered_F": {0.00045};
	case "B_Truck_01_mover_F": {0.00045};
	case "B_Truck_01_box_F": {0.00045};
	case "B_Truck_01_repair_F": {0.00045};
	case "B_Truck_01_ammo_F": {0.00045};
	case "B_Truck_01_fuel_F": {0.00045};
	case "B_Truck_01_medical_F": {0.00045};

	// Tempest Tankverbrauch
	case "O_Truck_03_transport_F": {0.00055};		
	case "O_Truck_03_covered_F": {0.00055};
	case "O_Truck_03_fuel_F": {0.00055};
	case "O_Truck_03_repair_F": {0.00055};
	case "O_Truck_03_device_F": {0.00060};
	case "O_Truck_03_ammo_F": {0.00070};

	//Cop Bewaffnete
	case "B_MRAP_01_F": {0.00020}; 
	case "B_MRAP_02_hmg_F": {0.00020};
	case "O_MRAP_02_F": {0.00030};
	case "O_MRAP_02_hmg_F": {0.00030};
	case "I_MRAP_03_F": {0.00020};
	case "B_G_Offroad_01_F": {0.00015};

	default {-1};
};

if(_vehicle isKindOf "Air") then {_rate = 0.00025};
if(_vehicle isKindOf "Ship") then {_rate = 0.00020};

if(_rate == -1) exitWith {hint format["Fehlerhaftes Fahrzeug: %1. Berichte dies einem Admin!",typeof _vehicle]};

while{isengineOn _vehicle} do {
	_fuel = fuel _vehicle;
	_difFuel = _oldFuel - _fuel;
	if(!local _vehicle || !local player) exitWith {};
	if!(isengineOn _vehicle) exitWith {};		
	if(isNull ObjectParent player) exitWith {};
	if((driver _vehicle) != player) exitWith {};
	if!(alive _vehicle) exitWith {};
	if(_fuel < 0) exitWith {};
	_rate = _rate / 1;
	
	if (_difFuel > 0) then {
		_newFuel = _fuel - (_difFuel + _rate);
		_vehicle setFuel _newFuel;
	};
	_oldFuel = fuel _vehicle;
	uisleep 1;
};