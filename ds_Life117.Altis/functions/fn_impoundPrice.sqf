/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Returns the impound price
*/
private ["_special","_type","_config","_gun","_price","_complete"];
_class = _this select 0;
_special = [_this,1,false,[false]] call BIS_fnc_param;
_price = 5000;

switch(true)do
	{
	case (_class in ["B_Quadbike_01_F","C_Hatchback_01_F","C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F"]) : {_price = 10000};
	case (_class in ["C_Van_01_transport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","O_Truck_02_fuel_F","B_Truck_01_fuel_F","O_Truck_03_fuel_F","O_Truck_03_repair_F","O_Truck_03_medical_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","O_Truck_03_device_F"]) : {_price = 20000};
	case (_class in ["B_Heli_Light_01_F","C_Heli_Light_01_civil_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_F","B_Heli_Transport_03_unarmed_F","I_Plane_Fighter_03_AA_F","B_Plane_CAS_01_F"]) : {_price = 30000};
	case (_class in ["C_Rubberboat","C_Boat_Civil_01_F","O_SDV_01_F","O_Boat_Armed_01_hmg_F"]) : {_price = 7000};
	case (_class in ["B_MRAP_01_F","B_MRAP_01_hmg_F","I_APC_Wheeled_03_cannon_F","I_MRAP_03_hmg_F","O_G_Offroad_01_armed_F","O_MRAP_02_F","I_MRAP_03_F"]) : {_price = 35000};
	};

_price;






