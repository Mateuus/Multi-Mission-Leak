/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Fills the array and sets up variables for shop items
*/

private ["_shop","_returnList"];

_shop = _this select 0;

switch(_shop)do
	{
	case 666://Vehicle Garage sell
		{
		_returnList =
			[
				["B_Quadbike_01_F",1400],
				["C_Hatchback_01_F",2900],
				["C_Offroad_01_F",4900],
				["C_SUV_01_F",7400],
				["C_Van_01_transport_F",9900],
				["C_Hatchback_01_sport_F",14900],
				["C_Offroad_02_unarmed_F",19900],
				["C_Van_01_box_F",9900],
				["I_Truck_02_transport_F",13900],
				["I_Truck_02_covered_F",19999],
				["O_Truck_02_fuel_F",19900],
				["B_Truck_01_fuel_F",24900],
				["O_Truck_03_fuel_F",29900],
				["O_Truck_03_repair_F",19900],
				["O_Truck_03_medical_F",19900],
				["B_Truck_01_transport_F",39900],
				["B_Truck_01_covered_F",49900],
				["B_Truck_01_box_F",124900],
				["O_Truck_03_device_F",174900],
				["C_Heli_Light_01_civil_F",109900],
				["B_Heli_Light_01_F",174900],
				["O_Heli_Light_02_unarmed_F",249900],
				["I_Heli_Transport_02_F",800000],
				["I_Heli_light_03_unarmed_F",424900],
				["O_Heli_Transport_04_fuel_F",749000],
				["O_Heli_Transport_04_F",1090000],
				["B_Heli_Transport_03_unarmed_F",1090000],
				["C_Plane_Civil_01_F",1249000],
				["I_Plane_Fighter_03_AA_F",1900000],
				["B_Plane_CAS_01_F",2490000],
				["C_Rubberboat",249],
				["C_Boat_Civil_01_F",3600],
				["C_Scooter_Transport_01_F",4900],
				["O_SDV_01_F",29000],
				["C_Boat_Transport_02_F",60000],
				["I_C_Boat_Transport_02_F",49000],
				["O_Boat_Armed_01_hmg_F",1090000],
				["B_MRAP_01_F",300000],
				["O_T_LSV_02_unarmed_F",75000],
				["B_T_LSV_01_unarmed_F",85000],
				["B_MRAP_01_hmg_F",800000],
				["O_T_LSV_02_armed_F",300000],
				["I_APC_Wheeled_03_cannon_F",2000000],
				["I_MRAP_03_hmg_F",800000],
				["O_G_Offroad_01_armed_F",300000],
				["O_MRAP_02_F",280000],
				["I_MRAP_03_F",300000],
				["B_G_Offroad_01_F",4900],
				["O_Heli_Transport_04_ammo_F",490000],
				["B_Heli_Light_01_armed_F",1390000],
				["O_Heli_Light_02_F",1590000],
				["B_Heli_Transport_01_camo_F",2090000],
				["B_Heli_Transport_03_F",2090000],
				["B_G_Offroad_01_armed_F",174000],
				["B_T_LSV_01_armed_F",640000],
				["I_Heli_light_03_F",350000],
				["O_Heli_Transport_04_bench_F",320000],
				["B_Heli_Transport_03_black_F",450000],
				["B_Heli_Transport_01_F",780000],
				["O_Heli_Attack_02_black_F",1000000],
				["O_Plane_CAS_02_F",1100000],
				["C_Plane_Civil_01_F",1240000],
				["O_Truck_02_box_F",20000],
				["B_Truck_01_mover_F",25000],
				["B_Boat_Transport_01_F",500],
				["C_Boat_Civil_01_police_F",10000],
				["B_SDV_01_F",50000],
				["B_Boat_Armed_01_minigun_F",550000],
				["O_Boat_Armed_01_hmg_F",550000],
				["B_T_VTOL_01_infantry_F",3000000],
				["B_T_VTOL_01_vehicle_F",3000000],
				["O_T_VTOL_02_infantry_F",3000000],
				["O_T_VTOL_02_vehicle_F",3000000],
				["O_Truck_03_transport_F",200000],
				["O_MRAP_02_hmg_F",600000],
				["O_Truck_02_Ammo_F",500000],
				["O_Truck_03_ammo_F",800000],
				["B_Truck_01_ammo_F",700000],
				["C_Van_01_fuel_F",10000],
				["I_Plane_Fighter_04_F",3000000],
				["B_Plane_Fighter_01_F",2000000],
				["O_Plane_Fighter_02_F",1500000]
			];
		};
	case 0://Civ Cars
		{
		_returnList =
			[
				["B_Quadbike_01_F",3000],
				["C_Hatchback_01_F",6000],
				["C_Offroad_01_F",10000],
				["C_SUV_01_F",15000],
				["C_Van_01_transport_F",20000],
				["C_Hatchback_01_sport_F",30000],
				["C_Offroad_02_unarmed_F",40000]
			];
		};
	case 1://Civ Trucks
		{
		_returnList =
			[
				["C_Van_01_box_F",20000],
				["C_Van_01_fuel_F",20000],
				["I_Truck_02_transport_F",20000],
				["I_Truck_02_covered_F",28000],
				["O_Truck_02_fuel_F",40000],
				["B_Truck_01_fuel_F",50000],
				["O_Truck_03_fuel_F",60000],
				["O_Truck_03_repair_F",40000],
				["O_Truck_03_medical_F",40000],
				["B_Truck_01_transport_F",80000],
				["B_Truck_01_covered_F",100000],
				["B_Truck_01_box_F",250000],
				["O_Truck_03_device_F",350000]
			];
		};
	case 2://Civ Air
		{
		_returnList =
			[
				["C_Heli_Light_01_civil_F",220000],
				["B_Heli_Light_01_F",350000],
				["O_Heli_Light_02_unarmed_F",500000],
				["I_Heli_Transport_02_F",850000],
				["I_Heli_light_03_unarmed_F",850000],
				["O_Heli_Transport_04_fuel_F",1500000],
				["O_Heli_Transport_04_F",2200000],
				["B_Heli_Transport_03_unarmed_F",2200000],
				["C_Plane_Civil_01_F",2000000],
				["I_Plane_Fighter_03_AA_F",2500000],
				["B_Plane_CAS_01_F",3000000],
				["I_Plane_Fighter_04_F",3300000],
				["O_Plane_CAS_02_F",3600000]
			];

		if((DS_infoArray select 13) > 47)then
			{
			_returnList pushBack ["B_Plane_Fighter_01_F",3600000];
			};
		};
	case 3://Civ Boats
		{
		_returnList =
			[
				["C_Rubberboat",500],
				["C_Boat_Civil_01_F",7500],
				["C_Scooter_Transport_01_F",10000],
				["O_SDV_01_F",60000],
				["I_C_Boat_Transport_02_F",100000]
			];
		if(DSL_rebelVeh)then
			{
			_returnList pushBack ["O_Boat_Armed_01_hmg_F",2200000];
			};
		};
	case 148://WL-civ Boats
		{
		_returnList =
			[
				["C_Boat_Civil_01_F",3200],
				["C_Scooter_Transport_01_F",5000],
				["O_SDV_01_F",30000],
				["I_C_Boat_Transport_02_F",50000]
			];
		};
	case 30://Police Public
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000]
			];
		};
	case 31://Police C
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500]
			];
		};
	case 32://Police PO
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500],
				["C_Hatchback_01_sport_F",15000]
			];
		};
	case 33://Police S
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500],
				["C_Hatchback_01_sport_F",15000],
				["C_Offroad_02_unarmed_F",20000],
				["O_T_LSV_02_unarmed_F",110000],
				["B_MRAP_01_F",120000]
			];
		};
	case 34://Police SS
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500],
				["C_Hatchback_01_sport_F",15000],
				["C_Offroad_02_unarmed_F",20000],
				["O_T_LSV_02_unarmed_F",110000],
				["B_T_LSV_01_unarmed_F",120000],
				["B_MRAP_01_F",120000],
				["B_MRAP_01_hmg_F",350000],
				["O_T_LSV_02_armed_F",380000],
				["I_APC_Wheeled_03_cannon_F",750000]
			];
		if((DS_infoArray select 21) > 15)then
			{
			_returnList pushBack ["I_MRAP_03_hmg_F",400000];
			};
		};
	case 35://Police vehicles
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000]
			];
		if(DS_copLevel > 0)then
			{
			_returnList pushBack ["C_SUV_01_F",7500];
			};
		if(DS_copLevel > 1)then
			{
			_returnList pushBack ["C_Hatchback_01_sport_F",15000];
			};
		if(DS_copLevel > 2)then
			{
			_returnList pushBack ["C_Offroad_02_unarmed_F",20000];
			_returnList pushBack ["O_MRAP_02_F",200000];
			};
		if(DS_copLevel > 3)then
			{
			_returnList pushBack ["B_MRAP_01_F",275000];
			_returnList pushBack ["O_T_LSV_02_unarmed_F",140000];
			_returnList pushBack ["O_G_Offroad_01_armed_F",400000];
			_returnList pushBack ["O_MRAP_02_hmg_F",800000];
			if((DS_infoArray select 21) > 15)then
				{
				_returnList pushBack ["I_MRAP_03_hmg_F",1000000];
				};
			};
		if(DS_copLevel > 4)then
			{
			_returnList pushBack ["B_T_LSV_01_unarmed_F",140000];
			_returnList pushBack ["B_MRAP_01_hmg_F",900000];
			_returnList pushBack ["O_T_LSV_02_armed_F",600000];
			_returnList pushBack ["I_APC_Wheeled_03_cannon_F",1500000];
			_returnList pushBack ["I_MRAP_03_F",300000];
			};
		if(DS_copLevel > 5)then
			{
			_returnList pushBack ["B_T_LSV_01_armed_F",600000];
			};
		if(DS_copLevel > 6)then
			{
			_returnList pushBack ["O_Truck_03_ammo_F",60000];
			_returnList pushBack ["O_Truck_03_repair_F",60000];
			_returnList pushBack ["O_Truck_03_medical_F",60000];
			_returnList pushBack ["O_Truck_03_fuel_F",60000];
			};
		};
	case 61://Rebel Veh
		{
		_returnList =
			[
				["B_Quadbike_01_F",3000],
				["B_G_Offroad_01_F",10000],
				["C_SUV_01_F",15000],
				["C_Offroad_02_unarmed_F",40000],
				["B_Heli_Light_01_F",380000],
				["O_MRAP_02_F",600000],
				["I_MRAP_03_F",600000],
				["O_Heli_Light_02_unarmed_F",500000],
				["I_Heli_light_03_unarmed_F",850000],
				["O_Heli_Transport_04_ammo_F",1000000]
			];
		if((DS_infoArray select 15) > 10)then
			{
			_returnList pushBack ["O_T_LSV_02_unarmed_F",120000];
			};
		if((DS_infoArray select 15) > 18)then
			{
			_returnList pushBack ["B_T_LSV_01_unarmed_F",140000];
			};
		};
	case 62://Rebel Armed Veh
		{
		_returnList =
			[
				["B_Heli_Light_01_armed_F",2800000],
				["O_Heli_Light_02_F",3200000],
				["B_Heli_Transport_01_camo_F",4200000],
				["B_Heli_Transport_03_F",4200000],
				["B_G_Offroad_01_armed_F",350000],
				["O_T_LSV_02_armed_F",500000],
				["I_MRAP_03_hmg_F",3750000],
				["O_MRAP_02_hmg_F",3650000],
				["B_T_LSV_01_armed_F",640000]
			];
		};
	case 65://Gang Vehicles
		{
		_returnList =
			[
				["B_Quadbike_01_F",3000],
				["C_Offroad_01_F",10000],
				["C_SUV_01_F",15000],
				["C_Offroad_02_unarmed_F",40000],
				["I_Truck_02_covered_F",30000],
				["B_Heli_Light_01_F",350000],
				["O_Heli_Light_02_unarmed_F",500000]
			];
		if((DS_infoArray select 15) > 10)then
			{
			_returnList pushBack ["O_T_LSV_02_unarmed_F",120000];
			};
		if((DS_infoArray select 15) > 18)then
			{
			["B_T_LSV_01_unarmed_F",140000];
			};
		};
	case 36://Air police
		{
		_returnList =
			[
				["C_Heli_Light_01_civil_F",160000]
			];
		if(DS_copLevel > 0)then
			{
			_returnList pushBack ["B_Heli_Light_01_F",225000];
			};
		if(DS_copLevel > 3)then
			{
			_returnList pushBack ["I_Heli_light_03_F",350000];
			_returnList pushBack ["B_Heli_Transport_01_F",780000];
			if((DS_infoArray select 21) > 15)then
				{
				_returnList pushBack ["B_Heli_Light_01_armed_F",1600000];
				};
			if((DS_infoArray select 21) > 25)then
				{
				_returnList pushBack ["O_Heli_Light_02_F",1800000];
				};
			if((DS_infoArray select 21) > 18)then
				{
				_returnList pushBack ["O_Plane_CAS_02_F",1500000];
				_returnList pushBack ["B_T_VTOL_01_infantry_F",3000000];
				_returnList pushBack ["B_T_VTOL_01_vehicle_F",3000000];
				};
			if((DS_infoArray select 21) > 25)then
				{
				_returnList pushBack ["O_Plane_Fighter_02_F",1500000];
				};
			};
		if(DS_copLevel > 4)then
			{
			_returnList pushBack ["O_Heli_Transport_04_bench_F",320000];
			_returnList pushBack ["C_Plane_Civil_01_F",1250000];
			_returnList pushBack ["O_Heli_Attack_02_black_F",1500000];
			};
		if(DS_copLevel > 5)then
			{
			_returnList pushBack ["B_Heli_Transport_03_black_F",450000];
			_returnList pushBack ["Land_Pod_Heli_Transport_04_covered_F",10000];
			};
		};
	case 83://No longer used
		{
		_returnList = [];
		};
	case 95://Medic
		{
		_returnList =
			[
				["C_SUV_01_F",7500],
				["C_Van_01_box_F",10000],
				["C_Heli_Light_01_civil_F",60000]
				/*
				["O_MRAP_02_F",600000]
				*/
			];
		if((DS_infoArray select 10) > 26)then
			{
			_returnList pushBack ["O_Heli_Light_02_unarmed_F",250000];
			};
		};
	case 96://Mechanic
		{
		_returnList =
			[
				["C_Offroad_01_F",5000],
				["O_Truck_02_box_F",20000],
				["B_Truck_01_mover_F",25000]
			];
		if((DS_infoArray select 23) > 15)then
			{
			_returnList pushBack ["O_Heli_Transport_04_F",1100000];
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
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500],
				["C_Hatchback_01_sport_F",15000],
				["C_Heli_Light_01_civil_F",60000]
			];
		};
	case 123://Sec Veh lvl3
		{
		_returnList =
			[
				["B_Quadbike_01_F",1500],
				["C_Offroad_01_F",5000],
				["C_SUV_01_F",7500],
				["C_Hatchback_01_sport_F",15000],
				["B_MRAP_01_F",120000],
				["I_MRAP_03_F",600000],
				["C_Heli_Light_01_civil_F",60000],
				["B_Heli_Light_01_F",175000],
				["I_Heli_light_03_unarmed_F",850000]
			];
		};
	case 127://Cop Boats
		{
		_returnList =
			[
				["B_Boat_Transport_01_F",500],
				["C_Boat_Civil_01_police_F",10000]
			];
		if(DS_copLevel > 1)then
			{
			_returnList pushBack ["C_Scooter_Transport_01_F",5000];
			_returnList pushBack ["B_SDV_01_F",50000];
			};
		if(DS_copLevel > 2)then
			{
			_returnList pushBack ["I_C_Boat_Transport_02_F",30000];
			};
		if(DS_copLevel > 3)then
			{
			_returnList pushBack ["B_Boat_Armed_01_minigun_F",100000];
			};
		if(DS_copLevel > 4)then
			{
			if((DS_infoArray select 21) > 15)then
				{
				_returnList pushBack ["O_Boat_Armed_01_hmg_F",100000];
				};
			};
		};
	case 166://Special KOS vehicles
		{
		_returnList =
			[
				["B_G_Offroad_01_armed_F",250000],
				["O_T_LSV_02_armed_F",350000],
				["B_T_LSV_01_armed_F",450000],
				["O_MRAP_02_hmg_F",600000],
				["B_MRAP_01_hmg_F",700000],
				["I_MRAP_03_hmg_F",800000],
				["B_Heli_Light_01_armed_F",1500000],
				["O_Heli_Light_02_F",1500000],
				["I_Heli_light_03_F",3200000],
				["B_Heli_Transport_01_camo_F",2500000],
				["O_APC_Wheeled_02_rcws_F",7500000],
				["B_APC_Wheeled_01_cannon_F",10000000]
			];
		};
	};

_returnList;
