#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = param [0,"",[""]];
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "med_container":
	{
		if(__GETC__(lhm_medicLevel) > 2)then{
			_return pushBack ["Land_Pod_Heli_Transport_04_medevac_F",5000];
		};
	};
	case "civ_container":
	{
		_return = [
			["Land_Pod_Heli_Transport_04_bench_F",5000],
			["Land_Pod_Heli_Transport_04_covered_F",5000],
			["O_supplyCrate_F",7000],
			["Land_Pod_Heli_Transport_04_box_F",20000],
			["Box_IND_AmmoVeh_F",30000],
			["B_Slingload_01_Cargo_F",50000]
		];
	};
	case "cop_container":
	{
		if(__GETC__(lhm_copLevel) > 3)then{
			_return pushBack ["Land_Pod_Heli_Transport_04_covered_F",5000];
		};
		if(__GETC__(lhm_copLevel) > 3)then{
			_return pushBack ["Land_Pod_Heli_Transport_04_bench_F",5000];
		};
	};

// Security Shops
	case "sec_shop":
	{
		_rank = __GETC__(lhm_seclevel);//Testzwecke
		_return = [];
		if(_rank > 0) then {
			_return pushback["C_SUV_01_F",30000];
			_return pushback["C_Offroad_01_F",10000];
			_return pushback["B_Heli_Light_01_F",95000];
			_return pushback["C_Heli_Light_01_civil_F",95000];
		};
		if(_rank > 1) then {
			_return pushback["I_MRAP_03_F",90000];
			_return pushback["I_Heli_Transport_02_F",400000];
			_return pushback["C_Hatchback_01_sport_F",30000];

		};
		if(_rank > 2) then {
			_return pushback["O_Truck_02_Ammo_F",5000000];
		//	_return pushback["I_Heli_light_03_unarmed_F",800000];
		};
	};

	case "sec_heli_shop":
	{
		_rank = __GETC__(lhm_seclevel);//Testzwecke
		_return = [];
		if(_rank > 0) then {
			_return pushback["B_Heli_Light_01_F",95000];
			_return pushback["C_Heli_Light_01_civil_F",95000];
		};
		if(_rank > 1) then {
			_return pushback["I_Heli_Transport_02_F",400000];
		};
		if(_rank > 2) then {
//			_return pushback["I_Heli_light_03_unarmed_F",800000];
		};

	};

	case "sec_car_shop":
	{
		_rank = __GETC__(lhm_seclevel);//Testzwecke
		_return = [];
		if(_rank > 0) then {
			_return pushback["C_SUV_01_F",30000];
			_return pushback["C_Offroad_01_F",10000];
		};
		if(_rank > 1) then {
			_return pushback["I_MRAP_03_F",90000];
			_return pushback["C_Hatchback_01_sport_F",30000];
		};
		if(_rank > 2) then {
			_return pushback["O_Truck_02_Ammo_F",5000000];
		};
	};

	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",20000],
			["C_Kart_01_Fuel_F",20000],
			["C_Kart_01_Red_F",20000],
			["C_Kart_01_Vrana_F",20000]
		];
	};

		case "don-store":
	{
		_return = [
			["O_Heli_Light_02_unarmed_F",750000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["I_Heli_Transport_02_F",2000000],
			["C_Hatchback_01_sport_F",25000],
			["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000],
			["O_Heli_Transport_04_bench_F",1200000],
			["B_Heli_Transport_03_unarmed_F",2000000],
			["O_MRAP_02_F",400000]
		];
	};

	case "med_shop":
	{
		// Medic Level 1
		_return pushBack
			["B_Quadbike_01_F",2000];
		_return pushBack
			["C_Offroad_01_F",10000];

		// Medic Level 2
		if(__GETC__(lhm_medicLevel) > 1) then
		{
			_return pushBack
			["C_SUV_01_F",25000];
			_return pushBack
			["C_Van_01_box_F",35000];
			_return pushBack
			["B_Truck_01_mover_F",100000];
			_return pushBack
			["I_Truck_02_medical_F",25000];
			_return pushBack
			["O_Truck_03_medical_F",45000];
			_return pushBack
			["B_Truck_01_medical_F",60000];
		};

		// Medic Level 3
		if(__GETC__(lhm_medicLevel) > 2) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",50000];
			_return pushBack
            ["Land_Pod_Heli_Transport_04_medevac_F",5000];
		};

		// Medic Level 4
		if(__GETC__(lhm_medicLevel) > 3) then
		{
			_return pushBack
			["B_MRAP_01_F",60000];
			_return pushBack
			["I_Truck_02_box_F",90000];
		};
		// Medic Level 5
		if(__GETC__(lhm_medicLevel) > 4) then
		{

		};
	};

	case "med_air_hs":
	{
			// Medic Level 1
		if(__GETC__(lhm_medicLevel) > 0) then
		{
			_return pushBack
			["C_Heli_Light_01_civil_F",50000];
		};
		if(__GETC__(lhm_medicLevel) > 1) then
		{
			_return pushBack
			["B_Heli_Light_01_F",50000];
			_return pushBack
			["O_Heli_Light_02_unarmed_F",200000];

		};
		// Medic Level 3
		if(__GETC__(lhm_medicLevel) > 2) then
		{
			_return pushBack
			["I_Heli_Transport_02_F",400000];

		};
		//Medic LVL 4
		/*if(__GETC__(lhm_medicLevel) > 3) then
		{

		};*/
	};

	case "civ_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",9500],
			["C_Offroad_01_F",12500],
			["C_SUV_01_F",35000],
			["C_Van_01_transport_F",40000]
		];
	};

	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",60000],
			["I_Truck_02_transport_F",75000],
			["I_Truck_02_covered_F",100000],
			["B_Truck_01_transport_F",275000],
			["O_Truck_03_transport_F",200000],
			["O_Truck_03_covered_F",250000],
			//["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000]
		];
	};

	case "civ_serv_truck": // ADAC SHOP
	{
		_return =
		[
			["I_G_Offroad_01_F",15000], //ADAC Vehicle
			["C_Heli_Light_01_civil_F",300000], // ADAC Hummingbird
			["C_SUV_01_F",20000],  //ADAC SUV
			["O_Heli_Light_02_unarmed_F",750000] //ADAC ORCA
		];
	};

	case "civ_hunter_car": // Bounty Hunter Shop
	{
		_return =
		[
			["C_SUV_01_F",50000]
		];
	};

	case "gang_area_car": // Gang Area Shop
	{
		_return =
		[
			//["B_Quadbike_01_F",1750],
			["B_G_Offroad_01_F",10500],
			["O_MRAP_02_F",250000],
			["O_MRAP_02_hmg_F",1700000],
			["I_Truck_02_ammo_F",300000],
			["B_G_Offroad_01_armed_F",600000]
		];
	};

	case "gang_area_air": // Gang Area Shop
	{
		_return =
		[
			["B_Heli_Transport_01_camo_F",800000],
			["B_Heli_Light_01_F",267500]
		];
	};

	case "reb_car":
	{
		_return =
		[
			//["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",400000],
			["O_MRAP_02_hmg_F",2000000],
			["B_Heli_Transport_01_camo_F",1000000],
			["B_Heli_Light_01_F",325000]
		];

		if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
		};
	};

	case "cop_car":
	{
		_return pushBack
		["B_Quadbike_01_F",2000];
		_return pushBack
		["C_Offroad_01_F",7500];

		if(__GETC__(lhm_coplevel) > 1) then
		{
			_return pushBack
			["C_SUV_01_F",30000];
		};
		if(__GETC__(lhm_coplevel) > 2) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",50000];
			_return pushBack
			["O_Truck_02_Ammo_F",6666700];
		};
		if(__GETC__(lhm_coplevel) > 3) then
		{
			_return pushBack
			["B_MRAP_01_F",80000];
		};
		if (__GETC__(lhm_coplevel) > 5) then
		{
			_return pushBack
			["B_MRAP_01_hmg_F",750000];
		};
		if(__GETC__(lhm_coplevel) > 8) then
		{
			_return pushBack
			["B_APC_Wheeled_01_cannon_F",1000000];
		};
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["C_Heli_Light_01_civil_F",253000],
			["O_Heli_Light_02_unarmed_F",750000]
		];
	};

	case "cop_air":
	{

		_return pushBack
		["C_Heli_Light_01_civil_F",75000];

		if(__GETC__(lhm_coplevel) > 2) then
		{
			_return pushBack
			["B_Heli_Light_01_F",75000];
		};
		if(__GETC__(lhm_coplevel) > 3) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
		};
		if(__GETC__(lhm_coplevel) > 4) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",450000];
		};
		if(__GETC__(lhm_coplevel) > 5) then
		{
		_return pushBack
		["O_Heli_Transport_04_F",270000]; // Taru DLC
		};
		if(__GETC__(lhm_coplevel) > 6) then
		{
		_return pushBack
		["O_Heli_Transport_04_bench_F",500000]; // Taru Bench Bloodwyn evtl. zu stark
		};
	};

	case "cop_airhq":
	{
		_return pushBack
		["C_Heli_Light_01_civil_F",75000];

		if(__GETC__(lhm_coplevel) > 2) then
		{
			_return pushBack
			["B_Heli_Light_01_F",75000];
		};
		if(__GETC__(lhm_coplevel) > 3) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
		};
		if(__GETC__(lhm_coplevel) > 4) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",450000];
		};
		if(__GETC__(lhm_coplevel) > 5) then
		{
		_return pushBack
			["O_Heli_Transport_04_F",270000]; // Taru DLC
		};

		if (__GETC__(lhm_coplevel) > 6) then
		{
			_return pushBack
			["O_Heli_Transport_04_bench_F",500000]; // Taru Bench Bloodwyn evtl. zu stark

		};

	};

	case "cop_ship":
	{
		_return pushBack
			["B_Boat_Transport_01_F",3000];
		_return pushBack
			["C_Boat_Civil_01_police_F",20000];

		if(__GETC__(lhm_coplevel) > 3) then
		{
		_return pushBack
			["B_Boat_Armed_01_minigun_F",75000];
		};
		if(__GETC__(lhm_coplevel) > 3) then
		{
		_return pushBack
			["B_SDV_01_F",100000];
		};
	};

	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",300000]
		];
	};
};
_return;