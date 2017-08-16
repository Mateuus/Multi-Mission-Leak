#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
switch (_shop) do
{
	case "kart_shop":
	{
		_return = [
			["C_Kart_01_Blu_F",15000],
			["C_Kart_01_Fuel_F",15000],
			["C_Kart_01_Red_F",15000],
			["C_Kart_01_Vrana_F",15000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_SUV_01_F",200],
			["C_Offroad_01_F",500],
			["O_Truck_02_medical_F",500],
			["O_Truck_02_box_F",500],
			["B_Truck_01_medical_F",500]

			
		];
	};
	
	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",5000],
			["O_Heli_Transport_04_medevac_F",5000],
			["O_Heli_Transport_04_F",5000]


		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",3333],
			["C_Hatchback_01_F",6667],
			["C_Offroad_02_unarmed_F",25000],
			["C_Offroad_01_F",33333],
			["C_SUV_01_F",50000],
			["C_Van_01_transport_F",66667],
			["C_Van_01_fuel_F",100000],
			["C_Hatchback_01_sport_F",233333]
		];
	};
	case "opsec":
	{
		_return = 
		[

			["C_Offroad_01_F",15000]

		];
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",100000],
			["I_Truck_02_transport_F",200000],
			["I_Truck_02_covered_F",266667],
			["B_Truck_01_transport_F",1000000],
			["B_Truck_01_covered_F",1666667],
			["B_Truck_01_ammo_F",2266667],
			["B_Truck_01_box_F",3000000],
			["B_Truck_01_fuel_F",1333333],
			["O_Truck_03_device_F",4000000],
			["O_Truck_03_transport_F",1200000],
			["O_Truck_03_covered_F",1933333],
			["O_Truck_03_fuel_F",1666667],
			["O_Truck_03_ammo_F",3333333]
		];	
	};
	
	case "whinc":
	{
		_return =
		[
			["O_Truck_02_covered_F",2000000],
			["C_SUV_01_F",50000]

		];	
	};
	case "cc":
	{
		_return =
		[
			["C_SUV_01_F",50000]

		];	
	};
	case "tuning":
	{
		_return =
		[
			["C_Offroad_01_F",83333],
			["C_SUV_01_F",166667]

		];	
	};
	case "mrsf":
	{
		_return =
		[
			["C_Offroad_01_F",33333],
			["C_SUV_01_F",50000]


		];	
	};
	
	case "reb_car":
	{
		_return =
		[
			["O_G_Offroad_01_F",40000],
			["C_Heli_light_01_digital_F",300000],
			["B_Heli_Light_01_F",400000],
			["O_MRAP_02_F",3000000],
			["O_G_Offroad_01_armed_F",3000000],
			["I_Heli_light_03_unarmed_F",3000000],
			["B_Heli_Transport_01_F",3000000],
			["B_Heli_Transport_03_unarmed_F",5000000]
		];
		
		/*if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
		};*/
	};
	
	case "bm_car":
	{
		_return =
		[
			["B_Quadbike_01_F",40000],
			["O_MRAP_02_F",4000000],
			["B_G_Offroad_01_F",15000],
			["C_SUV_01_F",60000],
			["O_G_Offroad_01_armed_F",1500000],
			["B_Heli_Light_01_F",400000],
			["C_Hatchback_01_F",6000]
		];
		
		/*if(license_civ_rebel) then
		{
			_return pushBack
			["B_G_Offroad_01_armed_F",750000];
		};*/
	};
	
	case "cop_car":
	{
		if(__GETC__(life_coplevel) >= 2) then
		{
			_return pushBack
		["C_Offroad_01_F",10000];
			
		};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["C_SUV_01_F",10000];
			
		};
		if(__GETC__(life_coplevel) >= 7) then
		{
			_return pushBack
			["C_Hatchback_01_sport_F",10000];

			
		};
		if(__GETC__(life_coplevel) >= 8) then
		{
			_return pushBack
			["B_MRAP_01_F",50000];
	
		};
		if(__GETC__(life_coplevel) >= 11) then
		{
			_return pushBack
			["I_MRAP_03_F",50000];
	
		};
	};

	case "civ_air":
	{
		_return =
		[
			["C_Heli_light_01_blue_F",500000],
			["C_Heli_light_01_elliptical_F",500000],
			["C_Heli_light_01_furious_F",500000],
			["C_Heli_light_01_jeans_F",500000],
			["C_Heli_light_01_speedy_F",500000],
			["C_Heli_light_01_vrana_F",500000],
			["C_Heli_light_01_wasp_F",500000],
			["C_Heli_light_01_wave_F",500000],
			["C_Heli_light_01_stripped_F",500000],
			["B_Heli_Light_01_F",600000],
			["C_Plane_Civil_01_F",666667],
			["O_Heli_Light_02_unarmed_F",1000000],
			["I_Heli_Transport_02_F",1200000]
			
		];
	};
	
	case "cop_air":
	{
		_return pushBack
		["B_Heli_Light_01_F",75000];
		_return pushBack
		["C_Heli_light_01_ion_F",60000];
		if(license_cop_air2) then
		{
			_return pushBack
			["I_Heli_light_03_unarmed_F",100000];
		};
		if(__GETC__(life_coplevel) >= 10) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",100000];
		};
	};
	
	case "cop_airhq":
	{
		_return pushBack
		["B_Heli_Light_01_F",75000];
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
			//_return pushBack
			//["B_MRAP_01_hmg_F",750000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Scooter_Transport_01_F",15000],
			["C_Rubberboat",16667],
			["C_Boat_Civil_01_F",33333],
			["C_Boat_Civil_01_rescue_F",33333],
			["I_C_Boat_Transport_02_F",50000],
			["B_SDV_01_F",333333]
		];
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["I_C_Boat_Transport_02_F",20000],
			["C_Scooter_Transport_01_F",20000],
			//["B_Boat_Armed_01_minigun_F",75000],
			["B_SDV_01_F",100000]
		];
	};
};

_return;
