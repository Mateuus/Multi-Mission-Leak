/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns the impound price of a vehicle
*/

private ["_price","_smallLand","_smallSea","_smallAir","_medLand","_medAir","_largeLand","_largeSea","_largeAir","_armed1","_armed2","_armed3"];

params [
	["_vehicle",objNull,[objNull]],
	["_special",false,[false]]
];

if(isNull _vehicle)exitWith{};

_price = 1000;

_smallLand = ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Van_01_transport_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F"];
_smallSea = ["C_Rubberboat","C_Boat_Civil_01_F","C_Scooter_Transport_01_F"];
_smallAir = ["C_Heli_Light_01_civil_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F"];

_medLand = ["C_Van_01_box_F","C_Van_01_fuel_F","I_Truck_02_transport_F","I_Truck_02_covered_F","O_T_LSV_02_unarmed_F","B_MRAP_01_F","B_T_LSV_01_unarmed_F","O_MRAP_02_F"];
_medAir = ["I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_bench_F","B_Heli_Transport_03_black_F"];

_largeLand = ["O_Truck_02_fuel_F","B_Truck_01_fuel_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_medical_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","O_Truck_03_device_F","O_Truck_03_ammo_F","O_Truck_03_repair_F","O_Truck_03_medical_F","O_Truck_03_fuel_F"];
_largeSea = ["O_SDV_01_F","I_C_Boat_Transport_02_F"];
_largeAir = ["C_Plane_Civil_01_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F"];

_armed1 = ["B_G_Offroad_01_armed_F","O_T_LSV_02_armed_F","B_T_LSV_01_armed_F"];
_armed2 = ["B_Heli_Light_01_armed_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","B_MRAP_01_hmg_F"];
_armed3 = ["O_Heli_Light_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_03_F","B_Heli_Attack_01_F","O_Heli_Attack_02_black_F","I_APC_Wheeled_03_cannon_F"];

_special = ["B_T_VTOL_01_infantry_F","B_T_VTOL_01_vehicle_F","O_T_VTOL_02_infantry_F","O_T_VTOL_02_vehicle_F"];

switch(true)do {
	case ((typeOf _vehicle) in _smallLand): {_price = 5000};
	case ((typeOf _vehicle) in _smallSea): {_price = 7000};
	case ((typeOf _vehicle) in _smallAir): {_price = 10000};
	case ((typeOf _vehicle) in _medLand): {_price = 15000};
	case ((typeOf _vehicle) in _medAir): {_price = 20000};
	case ((typeOf _vehicle) in _largeLand): {_price = 20000};
	case ((typeOf _vehicle) in _largeSea): {_price = 25000};
	case ((typeOf _vehicle) in _largeAir): {_price = 30000};
	case ((typeOf _vehicle) in _armed1): {_price = 30000};
	case ((typeOf _vehicle) in _armed2): {_price = 45000};
	case ((typeOf _vehicle) in _armed3): {_price = 60000};
	case ((typeOf _vehicle) in _special): {_price = 75000};
};

if(_vehicle getVariable ["convoy_truck",false])then{_price = _price*3};

_price;