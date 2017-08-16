/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Fulls the array and sets up variables for shop items
*/

private ["_shop","_returnList"];

_shop = _this select 0;

switch(_shop)do
	{
	case 666://Vehicle Garage sell
		{
		_returnList =
			[
				["B_Quadbike_01_F",700],
				["C_Hatchback_01_F",2500],
				["C_Offroad_01_F",5100],
				["C_SUV_01_F",7500],
				["C_Van_01_transport_F",11000],
				["C_Hatchback_01_sport_F",15000],
				["C_Van_01_box_F",11000],
				["I_Truck_02_transport_F",15000],
				["I_Truck_02_covered_F",15000],
				["O_Truck_02_fuel_F",35000],
				["B_Truck_01_fuel_F",35000],
				["O_Truck_03_fuel_F",35000],
				["O_Truck_03_repair_F",40000],
				["O_Truck_03_medical_F",45000],
				["B_Truck_01_transport_F",50000],
				["B_Truck_01_covered_F",55000],
				["B_Truck_01_box_F",250000],
				["O_Truck_03_device_F",140000],
				["C_Heli_Light_01_civil_F",50000],
				["O_Heli_Light_02_unarmed_F",110000],
				["I_Heli_Transport_02_F",600000],
				["I_Heli_light_03_unarmed_F",800000],
				["O_Heli_Transport_04_fuel_F",650000],
				["O_Heli_Transport_04_F",1100000],
				["B_Heli_Transport_03_unarmed_F",650000],
				["I_Plane_Fighter_03_AA_F",420000],
				["B_Plane_CAS_01_F",720000],
				["C_Rubberboat",500],
				["C_Boat_Civil_01_F",7500],
				["O_SDV_01_F",21000],
				["O_Boat_Armed_01_hmg_F",1200000],
				["B_MRAP_01_F",90000],
				["B_MRAP_01_hmg_F",2500000],
				["I_APC_Wheeled_03_cannon_F",500000],
				["O_G_Offroad_01_armed_F",100000],
				["O_MRAP_02_F",100000],
				["B_Heli_Light_01_F",133500],
				["O_MRAP_02_F",275000],
				["I_MRAP_03_F",285000],
				["O_Heli_Transport_04_ammo_F",800000],
				["B_Heli_Light_01_armed_F",1900000],
				["O_Heli_Light_02_F",2900000],
				["B_Heli_Transport_01_camo_F",3225000],
				["B_Heli_Transport_03_F",3250000],
				["B_G_Offroad_01_armed_F",100000],
				["I_MRAP_03_hmg_F",3250000],
				["O_MRAP_02_hmg_F",3250000],
				["B_Heli_Light_01_F",40000],
				["I_Heli_light_03_F",120000],
				["O_Heli_Transport_04_bench_F",150000],
				["B_Heli_Transport_03_black_F",250000],
				["B_Heli_Transport_01_F",780000],
				["O_Heli_Attack_02_black_F",3220000],
				["O_Plane_CAS_02_F",400000],
				["B_Boat_Armed_01_minigun_F",400000],
				["O_Truck_02_Ammo_F",600000],
				["O_Truck_03_ammo_F",900000],
				["B_Heli_Attack_01_F",25000000]
			];
		};
	case 0://Civ Cars
		{
		_returnList =
			[
				["B_Quadbike_01_F",1200],
				["C_Hatchback_01_F",3500],
				["C_Offroad_01_F",7100],
				["C_SUV_01_F",12500],
				["C_Van_01_transport_F",16000],
				["C_Hatchback_01_sport_F",22000]
			];
		};
	case 1://Civ Trucks
		{
		_returnList =
			[
				["C_Van_01_box_F",16000],
				["I_Truck_02_transport_F",20000],
				["I_Truck_02_covered_F",22000],
				["O_Truck_02_fuel_F",40000],
				["B_Truck_01_fuel_F",40000],
				["O_Truck_03_fuel_F",40000],
				["O_Truck_03_repair_F",45000],
				["O_Truck_03_medical_F",45000],
				["B_Truck_01_transport_F",60000],
				["B_Truck_01_covered_F",65000],
				["B_Truck_01_box_F",250000],
				["O_Truck_03_device_F",350000]
			];
		};
	case 2://Civ Air
		{
		_returnList =
			[
				["C_Heli_Light_01_civil_F",60000],
				["O_Heli_Light_02_unarmed_F",120000],
				["I_Heli_Transport_02_F",650000],
				["I_Heli_light_03_unarmed_F",850000],
				["O_Heli_Transport_04_fuel_F",1100000],
				["O_Heli_Transport_04_F",1200000],
				["B_Heli_Transport_03_unarmed_F",1300000],
				["I_Plane_Fighter_03_AA_F",1600000],
				["B_Plane_CAS_01_F",1900000]
			];
		};
	case 3://Civ Boats
		{
		_returnList =
			[
				["C_Rubberboat",500],
				["C_Boat_Civil_01_F",7500],
				["O_SDV_01_F",21000]
			];
		if(DSL_rebelVeh)then
			{
			_returnList pushBack ["O_Boat_Armed_01_hmg_F",2200000];
			};
		};
	case 30://Police Public
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200]
			];
		};
	case 31://Police C
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800]
			];
		};
	case 32://Police PO
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600]
			];
		};
	case 33://Police S
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600],
				["B_MRAP_01_F",90000]
			];
		};
	case 34://Police SS
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600],
				["B_MRAP_01_F",80000],
				["B_MRAP_01_hmg_F",250000],
				["I_APC_Wheeled_03_cannon_F",500000]
			];
		if((DS_infoArray select 21) > 15)then
			{
			_returnList pushBack ["I_MRAP_03_hmg_F",400000];
			};
		};
	case 35://Police L
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600],
				["B_MRAP_01_F",70000],
				["B_MRAP_01_hmg_F",200000],
				["I_APC_Wheeled_03_cannon_F",450000],
				["O_G_Offroad_01_armed_F",100000],
				["O_MRAP_02_F",100000],
				["I_MRAP_03_F",100000]
			];
		if((DS_infoArray select 21) > 15)then
			{
			_returnList pushBack ["I_MRAP_03_hmg_F",400000];
			};
		};
	case 61://Rebel Veh
		{
		_returnList =
			[
				["B_Quadbike_01_F",750],
				["B_G_Offroad_01_F",5500],
				["C_SUV_01_F",8500],
				["B_Heli_Light_01_F",133500],
				["O_MRAP_02_F",375000],
				["I_MRAP_03_F",375000],
				["O_Heli_Light_02_unarmed_F",475000],
				["I_Heli_light_03_unarmed_F",600000],
				["O_Heli_Transport_04_ammo_F",900000]
			];
		};
	case 62://Rebel Armed Veh
		{
		_returnList =
			[
				["B_Heli_Light_01_armed_F",2800000],
				["O_Heli_Light_02_F",2900000],
				["B_Heli_Transport_01_camo_F",3125000],
				["B_Heli_Transport_03_F",3150000],
				["B_G_Offroad_01_armed_F",350000],
				["I_MRAP_03_hmg_F",3750000],
				["O_MRAP_02_hmg_F",3650000]
			];
		};
	case 65://Gang Vehicles
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",8000],
				["I_Truck_02_covered_F",18000],
				["B_Heli_Light_01_F",92000],
				["O_Heli_Light_02_unarmed_F",182000]
			];
		};
	case 36://Air low police
		{
		_returnList =
			[
				["C_Heli_Light_01_civil_F",32500],
				["B_Heli_Light_01_F",40000],
				["I_Heli_light_03_F",120000],
				["O_Heli_Transport_04_bench_F",150000],
				["Land_Pod_Heli_Transport_04_covered_F",10000]
			];
		};
	case 83://Air high police
		{
		_returnList =
			[
				["B_Heli_Transport_03_black_F",250000],
				["B_Heli_Transport_01_F",780000],
				["O_Heli_Attack_02_black_F",1220000],
				["I_Plane_Fighter_03_AA_F",300000],
				["O_Plane_CAS_02_F",400000]
			];
		if((DS_infoArray select 21) > 15)then
			{
			_returnList pushBack ["B_Heli_Light_01_armed_F",400000];
			};
		if((DS_infoArray select 21) > 25)then
			{
			_returnList pushBack ["O_Heli_Light_02_F",600000];
			};
		};
	case 95://Medic
		{
		_returnList =
			[
				["C_SUV_01_F",2500],
				["C_Van_01_box_F",2800],
				["C_Heli_Light_01_civil_F",16200]
			];
		if((DS_infoArray select 10) > 26)then
			{
			_returnList pushBack ["O_Heli_Light_02_unarmed_F",100000];
			};
		};
	case 96://Mechanic
		{
		_returnList =
			[
				["C_Offroad_01_F",2500],
				["O_Truck_02_box_F",3500],
				["B_Truck_01_mover_F",5500]
			];
		if((DS_infoArray select 23) > 15)then
			{
			_returnList pushBack ["O_Heli_Transport_04_F",400000];
			};
		};
	case 103://pods
		{
		_returnList =
			[
				["Land_Pod_Heli_Transport_04_fuel_F",20000],
				["Land_Pod_Heli_Transport_04_box_F",9500],
				["Land_Pod_Heli_Transport_04_covered_F",10000],
				["Land_Pod_Heli_Transport_04_medevac_F",16000],
				["Land_Pod_Heli_Transport_04_repair_F",16000],
				["B_Slingload_01_Cargo_F",9500],
				["B_Slingload_01_Medevac_F",16000],
				["B_Slingload_01_Repair_F",16000],
				["B_Slingload_01_Fuel_F",20000]
			];
		};
	case 120://Sec Veh
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600],
				["C_Heli_Light_01_civil_F",50000]
			];
		};
	case 123://Sec Veh lvl3
		{
		_returnList =
			[
				["B_Quadbike_01_F",500],
				["C_Offroad_01_F",2200],
				["C_SUV_01_F",2800],
				["C_Hatchback_01_sport_F",3600],
				["B_MRAP_01_F",40000],
				["I_MRAP_03_F",60000],
				["C_Heli_Light_01_civil_F",50000],
				["B_Heli_Light_01_F",60000],
				["I_Heli_light_03_unarmed_F",120000]
			];
		};
	case 127://Cop Boats
		{
		_returnList =
			[
				["B_Boat_Transport_01_F",500],
				["C_Boat_Civil_01_police_F",7500]
			];
		if(DS_copLevel > 2)then
			{
			_returnList pushBack ["B_SDV_01_F",10000];
			};
		if(DS_copLevel > 3)then
			{
			_returnList pushBack ["B_Boat_Armed_01_minigun_F",40000];
			};
		if(((DS_infoArray select 21) > 15)&&(DS_copLevel > 3))then
			{
			_returnList pushBack ["O_Boat_Armed_01_hmg_F",100000];
			};
		};
	};
	
_returnList;
