/*
	Darkside Life
	
	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns price for destroying a vehicle
*/

private ["_className","_price","_return"];

_className = _this select 0;
_price = 0;
_return = 1000;

switch(true)do
	{
	case (_className in ["O_Boat_Armed_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","B_G_Offroad_01_armed_F","B_Heli_Transport_03_F","B_Heli_Transport_01_camo_F","O_Heli_Light_02_F","B_Heli_Light_01_armed_F","B_MRAP_01_hmg_F"]) : {_price = 40000};
	case (_className in ["I_MRAP_03_F","O_MRAP_02_F"]) : {_price = 30000};
	case (_className in ["O_Heli_Transport_04_ammo_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","B_Heli_Light_01_F","B_G_Offroad_01_F"]) : {_price = 20000};
	case (_className in ["B_Plane_CAS_01_F","I_Plane_Fighter_03_AA_F","B_Heli_Transport_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_fuel_F","I_Heli_light_03_unarmed_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F","C_Heli_Light_01_civil_F"]) : {_price = 15000};
	case (_className in ["C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_medical_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","O_Truck_03_device_F"]) : {_price = 10000};
	};

if(_price == 0)then{_price = 5000;};
_price;