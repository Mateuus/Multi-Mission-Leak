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
			["C_Kart_01_Blu_F",3000],
			["C_Kart_01_Fuel_F",3000],
			["C_Kart_01_Red_F",3000],
			["C_Kart_01_Vrana_F",3000]
		];
	};
	case "med_shop":
	{
		_return = [
			["C_Offroad_01_F",10000],
			["C_Hatchback_01_sport_F",9500],
			["C_SUV_01_F",35000],
			["I_Truck_02_medical_F",25000],
			["O_Truck_03_medical_F",45000],
			["B_Truck_01_medical_F",60000]
		];
	};
	
	case "med_air_hs": {
		_return = [
			["B_Heli_Light_01_F",50000],
			["O_Heli_Light_02_unarmed_F",75000]
		];
	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",2500],
			["C_Hatchback_01_F",11500],
			["C_Hatchback_01_sport_F",43500],
			["C_Offroad_01_F",17500],
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
			["B_Truck_01_box_F",350000],
			["O_Truck_03_device_F",450000]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",2500],
			["B_G_Offroad_01_F",10000]
		];
		
		if(license_civ_rebel) then
		{
			_return pushBack
			["O_MRAP_02_F",150000];
			_return pushBack
			["O_MRAP_02_hmg_F",450000];
			_return pushBack
			["B_Heli_Light_01_F",250000];
			_return pushBack
			["B_Heli_Light_01_armed_F",420000];
			_return pushBack
			["I_Heli_light_03_F",550000];
			_return pushBack
			["I_Heli_Transport_02_F",800000];
		};
	};
	
	case "donator_car":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
			
			case (__GETC__(life_donator) == 1):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",50000];
				_return pushBack
				["C_Offroad_01_F",13000];
				_return pushBack
				["C_Hatchback_01_sport_F",43500];
				_return pushBack
				["C_Kart_01_Blu_F",3000];
				_return pushBack
				["C_Kart_01_Fuel_F",3000];
				_return pushBack
				["C_Kart_01_Red_F",3000];
				_return pushBack
				["C_Kart_01_Vrana_F",3000];
				_return pushBack
				["C_Van_01_box_F",60000];
				_return pushBack
				["I_Truck_02_transport_F",75000];
				_return pushBack
				["I_Truck_02_covered_F",100000];
				_return pushBack
				["B_Truck_01_transport_F",275000];
				_return pushBack
				["O_Truck_03_transport_F",200000];
				_return pushBack
				["O_Truck_03_covered_F",250000];
				_return pushBack
				["B_Truck_01_box_F",350000];
				_return pushBack
				["O_Truck_03_device_F",450000];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				_return pushBack
				["B_Quadbike_01_F",1875];
				_return pushBack
				["C_SUV_01_F",37500];
				_return pushBack
				["C_Offroad_01_F",9750];
				_return pushBack
				["C_Hatchback_01_sport_F",32625];
				_return pushBack
				["C_Kart_01_Blu_F",2250];
				_return pushBack
				["C_Kart_01_Fuel_F",2250];
				_return pushBack
				["C_Kart_01_Red_F",2250];
				_return pushBack
				["C_Kart_01_Vrana_F",2250];
				_return pushBack
				["C_Van_01_box_F",45000];
				_return pushBack
				["I_Truck_02_transport_F",56250];
				_return pushBack
				["I_Truck_02_covered_F",56250];
				_return pushBack
				["B_Truck_01_transport_F",206250];
				_return pushBack
				["O_Truck_03_transport_F",150000];
				_return pushBack
				["O_Truck_03_covered_F",206250];
				_return pushBack
				["B_Truck_01_box_F",262500];
				_return pushBack
				["O_Truck_03_device_F",337500];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				_return pushBack
				["B_Quadbike_01_F",1250];
				_return pushBack
				["C_SUV_01_F",25000];
				_return pushBack
				["C_Offroad_01_F",6500];
				_return pushBack
				["C_Hatchback_01_sport_F",21750];
				_return pushBack
				["C_Kart_01_Blu_F",1500];
				_return pushBack
				["C_Kart_01_Fuel_F",1500];
				_return pushBack
				["C_Kart_01_Red_F",1500];
				_return pushBack
				["C_Kart_01_Vrana_F",1500];
				_return pushBack
				["C_Van_01_box_F",30000];
				_return pushBack
				["I_Truck_02_transport_F",37500];
				_return pushBack
				["I_Truck_02_covered_F",50000];
				_return pushBack
				["B_Truck_01_transport_F",137500];
				_return pushBack
				["O_Truck_03_transport_F",100000];
				_return pushBack
				["O_Truck_03_covered_F",125000];
				_return pushBack
				["B_Truck_01_box_F",175000];
				_return pushBack
				["O_Truck_03_device_F",225000];
			};
		};
	};
	
	case "cop_car":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			
			// Cadet Vehicles
			case (__GETC__(life_coplevel) == 0):
			{
				_return pushBack
				["B_Quadbike_01_F",5000];
			};

			// Constable Vehicles
			case (__GETC__(life_coplevel) == 1):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Offroad_01_F",13000];
			};

			// Sergeant Vehicles
			case (__GETC__(life_coplevel) == 2):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Offroad_01_F",13000];
			};
			
			// Lieutenant Vehicles
			case (__GETC__(life_coplevel) == 3):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Hatchback_01_sport_F",25000];
				_return pushBack
				["C_Offroad_01_F",13000];
			};
			
			// Detective Vehicles
			case (__GETC__(life_coplevel) == 4):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Hatchback_01_sport_F",25000];
				_return pushBack
				["C_Offroad_01_F",13000];
				_return pushBack
				["B_MRAP_01_F",70000];
			};
			
			// SWAT Vehicles Only At SWAT HQ
			case (__GETC__(life_coplevel) == 5):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Hatchback_01_sport_F",25000];
				_return pushBack
				["C_Offroad_01_F",13000];
				_return pushBack
				["B_MRAP_01_F",70000];
			};
			
			// Captain Vehicles
			case (__GETC__(life_coplevel) == 6):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Hatchback_01_sport_F",25000];
				_return pushBack
				["C_Offroad_01_F",13000];
				_return pushBack
				["B_MRAP_01_F",70000];
			};
			
			
			// Chief Vehicles
			case (__GETC__(life_coplevel) == 7):
			{
				_return pushBack
				["B_Quadbike_01_F",2500];
				_return pushBack
				["C_SUV_01_F",10000];
				_return pushBack
				["C_Hatchback_01_sport_F",25000];
				_return pushBack
				["C_Offroad_01_F",13000];
				_return pushBack
				["B_MRAP_01_F",70000];
			};
		};
	};
	
	case "swat_car":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not a SWAT officer!"};
			
			if(__GETC__(life_coplevel) >= 5) then
			{
				_return pushBack
				["I_MRAP_03_hmg_F",200000];
				_return pushBack
				["B_MRAP_01_hmg_F",160000];
				_return pushBack
				["B_APC_Wheeled_01_cannon_F",300000];
				_return pushBack
				["B_APC_Tracked_01_CRV_F",750000];
			};
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",250000],
			["O_Heli_Light_02_unarmed_F",750000],
			["C_Heli_Light_01_civil_F",275000],
			["I_Heli_Transport_02_F",800000],
			["O_Heli_Transport_04_F",1400000],
			["O_Heli_Transport_04_box_F",2500000],
			["B_Heli_Transport_03_unarmed_F",2000000]
		];
	};
	
	case "cop_air":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			// Cadets Do Not Get Helicopters
			case (__GETC__(life_coplevel) == 0): {"You are not a whitelisted officer of the law!"};

			// Constable Helicopters
			case (__GETC__(life_coplevel) == 1):
			{
			};
			
			// Sergeant Helicopters
			case (__GETC__(life_coplevel) == 2):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
			};
			
			// Lieutenant Helicopters
			case (__GETC__(life_coplevel) == 3):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",450000];
			};
			
			// Detective Helicopters
			case (__GETC__(life_coplevel) == 4):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",450000];
			};
			
			// SWAT Helicopters
			case (__GETC__(life_coplevel) == 5):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",450000];
			};
			
			// Captain Helicopters
			case (__GETC__(life_coplevel) == 6):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",450000];
			};
			
			// Chief Helicopters
			case (__GETC__(life_coplevel) == 7):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["I_Heli_light_03_unarmed_F",450000];
			};
		};
	};
	
	case "swat_air":
	{
		case (playerSide != west): {"You are not a cop!"};
		case (__GETC__(life_coplevel) == 0): {"You are not a whitelisted officer of the law!"};
		
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",300000];
			_return pushBack
			["O_Heli_Light_02_F",420000];
			_return pushBack
			["B_Heli_Attack_01_F",500000];
			_return pushBack
			["B_Heli_Transport_03_F",1500000];
		};
	};
	
	case "donator_air":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
			
			case (__GETC__(life_donator) == 1):
			{
				_return pushBack
				["B_Heli_Light_01_F",250000];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",750000];
				_return pushBack
				["C_Heli_Light_01_civil_F",275000];
				_return pushBack
				["I_Heli_Transport_02_F",500000];
				_return pushBack
				["O_Heli_Transport_04_F",1400000];
				_return pushBack
				["O_Heli_Transport_04_box_F",2500000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",2000000];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				_return pushBack
				["B_Heli_Light_01_F",187500];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",562500];
				_return pushBack
				["C_Heli_Light_01_civil_F",206250];
				_return pushBack
				["I_Heli_Transport_02_F",375000];
				_return pushBack
				["O_Heli_Transport_04_F",1050000];
				_return pushBack
				["O_Heli_Transport_04_box_F",1875000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",1500000];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				_return pushBack
				["B_Heli_Light_01_F",125000];
				_return pushBack
				["O_Heli_Light_02_unarmed_F",375000];
				_return pushBack
				["C_Heli_Light_01_civil_F",137500];
				_return pushBack
				["I_Heli_Transport_02_F",250000];
				_return pushBack
				["O_Heli_Transport_04_F",700000];
				_return pushBack
				["O_Heli_Transport_04_box_F",1250000];
				_return pushBack
				["B_Heli_Transport_03_unarmed_F",1000000];
			};
		};
	};
	
	case "donator_plane":
	{
		case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
		case (__GETC__(life_donator) < 3): {"You must be a Level 3 Donator!"};
		
		if(__GETC__(life_donator) == 3 ) then
		{
			_return pushBack
			["B_Plane_CAS_01_F",5000000];
		};
	};
	
	case "cop_airhq":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack
			["B_Heli_Light_01_F",75000];
		};
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["B_Heli_Transport_01_F",200000];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000],
			["B_SDV_01_F",500000]
		];
	};
	
	case "donator_ship":
	{
		_return pushBack
		["B_Boat_Transport_01_F",3000];
		_return pushBack
		["B_SDV_01_F",200000];
		_return pushBack
		["B_Boat_Armed_01_minigun_F",175000];
	};

	case "cop_ship":
	{
		_return pushBack
		["B_Boat_Transport_01_F",3000];
		_return pushBack
		["C_Boat_Civil_01_police_F",20000];
		if(__GETC__(life_coplevel) >= 5) then
		{
			_return pushBack
			["B_SDV_01_F",200000];
			_return pushBack
			["B_Boat_Armed_01_minigun_F",175000];
		};
	};
	
	case "bh_car":
	{
		_return =
		[
			["B_MRAP_01_F",70000]
		];
	};
};

_return;
