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
		if(life_level >= 2) then
		{
			_return = ["C_Kart_01_Blu_F","C_Kart_01_Fuel_F","C_Kart_01_Red_F","C_Kart_01_Vrana_F"];
		};
	};

	case "civ_car":
	{			
		if(life_level >= 1) then
		{
			_return pushBack "C_Quadbike_01_black_F";
			_return pushBack "C_Quadbike_01_F";
			_return pushBack "C_Offroad_01_F";
			_return pushBack "C_Van_01_transport_F";
			_return pushBack "C_Offroad_02_unarmed_F";
		};

		if(life_level >= 2) then
		{
			_return pushBack "C_Hatchback_01_F";
		};

		if(life_level >= 3) then
		{
			_return pushBack "C_SUV_01_F";
		};

		if(life_level >= 4) then
		{
			_return pushBack "C_Hatchback_01_sport_F";
		};
	};
	
	case "civ_truck":
	{
		if(life_level >= 4) then
		{
			_return pushBack "C_Van_01_box_F";
			_return pushBack "C_Van_01_fuel_F";
		};

		if(life_level >= 5) then 
		{
			_return pushBack "I_Truck_02_transport_F";
			_return pushBack "I_Truck_02_covered_F";
			_return pushBack "O_Truck_02_fuel_F";
		};

		if(life_level >= 6) then 
		{
			_return pushBack "B_Truck_01_transport_F";
			_return pushBack "B_Truck_01_fuel_F";
			_return pushBack "B_Truck_01_covered_F";
		};

		if(life_level >= 7) then 
		{
			_return pushBack "O_Truck_03_fuel_F";
			_return pushBack "O_Truck_03_transport_F";
		};

		if(life_level >= 8) then
		{
			_return pushBack "O_Truck_03_covered_F";
			_return pushBack "B_Truck_01_ammo_F";
			_return pushBack "O_Truck_03_ammo_F";
		};

		if(life_level >= 9) then 
		{
			_return pushBack "B_Truck_01_box_F";
		};

		if(life_level >= 10) then
		{
			_return pushBack "O_Truck_03_device_F";
		};
	};
	
	case "civ_air":
	{
		if(life_level >= 3) then 
		{
			_return pushBack "C_Heli_Light_01_civil_F",;
		};

		if(life_level >= 5) then 
		{
			_return pushBack "O_Heli_Light_02_unarmed_F";
		};

		if(life_level >= 7) then 
		{
			_return pushBack "I_Heli_Transport_02_F";
		};
	};
			
	case "civ_dlc":
	{
		if(life_level >= 8) then 
		{
			_return pushBack "O_Heli_Transport_04_covered_F";
			_return pushBack "O_Heli_Transport_04_bench_F";
		};

		if(life_level >= 9) then 
		{
			_return pushBack "B_Heli_Transport_03_unarmed_F";
		};

		if(life_level >= 10) then 
		{
			_return pushBack "O_Heli_Transport_04_box_F";
		};

		if(life_level >= 12) then 
		{
			_return pushBack "B_T_VTOL_01_infantry_F";
		};
	};

	case "civ_fly":
	{
		if(life_level >= 5) then 
		{
			_return pushBack "C_Plane_Civil_01_F";
			_return pushBack "C_Plane_Civil_01_racing_F";
		};

		if(life_level >= 11) then 
		{
			_return pushBack "B_Plane_CAS_01_F";
		};
	};
	
	case "civ_ship":
	{
		if(life_level >= 2) then 
		{
			_return pushBack "C_Boat_Civil_01_F";
		};

		if(life_level >= 3) then 
		{
			_return pushBack "I_C_Boat_Transport_02_F";
		};

		if(life_level >= 4) then 
		{		
			_return pushBack "B_SDV_01_F";
		};

		if(life_level >= 10) then 
		{
			_return pushBack "C_Scooter_Transport_01_F";
		};
	};
		
	case "civ_shipluxus":
	{
		if(life_level >= 2) then 
		{
			_return pushBack "C_Boat_Civil_01_rescue_F";
		};
	};

	case "reb_car":
	{
		if(license_civ_rebel && life_level >= 5) then 
		{
			_return pushBack "O_T_LSV_02_unarmed_F";
			_return pushBack "B_T_LSV_01_unarmed_F";
			_return pushBack "C_Quadbike_01_F";
			_return pushBack "B_G_Offroad_01_F";
		};

		if(license_civ_rebel && life_level >= 6) then 
		{
			_return pushBack "B_Heli_Light_01_F";
			_return pushBack "O_Heli_Light_02_unarmed_F";
		};
		if(license_civ_rebel && life_level >= 7) then 
		{
			_return pushBack "O_MRAP_02_F";
		};
	};

	case "gruppe_car":
	{
		if(life_level >= 1) then
		{
			_return pushBack "C_Quadbike_01_F";
		};

		if(life_level >= 2) then
		{
			_return pushBack "C_Hatchback_01_F";
		};

		if(life_level >= 3) then
		{
			_return pushBack "C_SUV_01_F";
			_return pushBack "C_Van_01_transport_F";
		};

		if(life_level >= 4) then {
			_return pushBack "C_Hatchback_01_sport_F";
		};

		if(life_level >= 5) then {
			_return pushBack "B_G_Offroad_01_F";
		};

		if(life_level >= 7) then
		{
			_return pushBack "O_Truck_03_fuel_F";
			_return pushBack "O_Truck_03_transport_F";
			_return pushBack "O_MRAP_02_F";
		};

		if(life_level >= 8) then
		{
			_return pushBack "O_Truck_03_covered_F";
		};

		if(life_level >= 10) then
		{
			_return pushBack "O_Truck_03_device_F";
		};
	};
		
	case "gruppe_heli":
	{
		if(life_level >= 6) then {
			_return pushBack "B_Heli_Light_01_F";
			_return pushBack "O_Heli_Light_02_unarmed_F";
		};
	};
	
		case "presse_car":
	{
		_return pushBack "C_Hatchback_01_sport_F";
	};
	
		case "presse_air":
	{
		_return pushBack "C_Heli_Light_01_civil_F";
	};

	case "president_car":
	{
		_return pushBack "C_SUV_01_F";
	};
	
	case "president_heli":
	{
		_return pushBack "I_Heli_Transport_02_F";
	};
	
	case "civ_carwinter":
	{
		hint "Dein Fahrzeug wird nach Kauf vor dem Festgelände bereitstehen!";
	
		_return pushBack "C_Van_01_box_F";
	};

	case "donator":
	{
		if(life_level >= 3) then
		{
			_return pushBack "C_Offroad_01_F";
			_return pushBack "C_SUV_01_F";
			_return pushBack "C_Van_01_box_F";
			_return pushBack "C_Heli_Light_01_civil_F";
		};

		if(life_level >= 4) then
		{
			_return pushBack "C_Hatchback_01_sport_F";
		};

		if(life_level >= 7) then {
			_return pushBack "O_MRAP_02_F";
		};
	};

	case "donator_gang":
	{
		if(life_level >= 8) then
		{
			_return pushBack "B_Truck_01_ammo_F";
		};
	};


// -------------------------------------------------- POLIZEI
	
	case "cop_car":
	{
		_return pushback "C_Quadbike_01_F";
		_return pushBack "C_Offroad_01_F";

		if(call life_coplevel > 1) then 
		{
			_return pushBack "C_Offroad_02_unarmed_F";
		};	

		if(call life_coplevel > 2) then
		{
			_return pushBack "C_Hatchback_01_F";
		};

		if(call life_coplevel > 3) then
		{
			_return pushBack "C_SUV_01_F";
		};

		if(call life_coplevel > 5) then
		{
			_return pushBack "I_Truck_02_covered_F";		
			_return pushBack "B_MRAP_01_F";
			_return pushBack "C_Van_01_transport_F";
			_return pushBack "B_G_Offroad_01_F";
		};

		if(call life_coplevel > 6) then
		{
			_return pushBack "C_Hatchback_01_sport_F";
		};

		if(call life_coplevel > 7) then
		{
			_return pushBack "I_MRAP_03_F";
		};
	};

	case "cop_air":
	{
		if(call life_coplevel > 2) then
		{
			_return pushBack "B_Heli_Light_01_F";
		};

		if(call life_coplevel > 4) then
		{
			_return pushBack "C_Plane_Civil_01_F";
		};

		if(call life_coplevel > 5) then
		{
			_return pushBack "I_Heli_light_03_unarmed_F";
		};

		if(call life_coplevel > 6) then
		{
			_return pushBack "B_Heli_Transport_03_unarmed_F";
		};

		if(call life_coplevel > 8) then
		{
			_return pushBack "B_Heli_Transport_01_F";
		};	
	};

	case "cop_ship":
	{
		if(call life_coplevel > 1) then
		{
			_return pushback "B_Boat_Transport_01_F";
		};

		if(call life_coplevel > 2) then
		{
			_return pushback "I_C_Boat_Transport_02_F";
		};

		if(call life_coplevel > 3) then
		{
			_return pushback "C_Boat_Civil_01_police_F";
		};

		if(call life_coplevel > 5) then
		{
			_return pushback "B_SDV_01_F";
		};

		if(call life_coplevel > 6) then {
			_return pushback  "B_Boat_Armed_01_minigun_F";
		};
	};


// -------------------------------------------------- AHW

	case "med_shop":
	{
		if(call life_ahwLevel > 0) then
		{
			_return pushBack "C_Offroad_01_F";
			_return pushBack "I_G_Offroad_01_F";
		};

		if(call life_ahwLevel > 1) then
		{
			_return pushBack "B_Truck_01_mover_F";
		};

		if(call life_ahwLevel > 2) then
		{	
			_return pushBack "C_Van_01_box_F";
			_return pushBack "I_Truck_02_covered_F";	
		};
		if(call life_ahwLevel > 3) then 
		{
			_return pushBack "C_Offroad_02_unarmed_F";
		};
		if(call life_ahwLevel > 4) then 
		{
			_return pushBack "I_Truck_02_box_F";
		};
		if(call life_ahwLevel > 6) then 
		{
			_return pushBack "C_SUV_01_F";
		};
	};

	case "med_air": 
	{
		if(call life_ahwLevel > 1) then
		{
			_return pushBack "B_Heli_Light_01_F";
			_return pushBack "C_Heli_Light_01_civil_F";
		};

		if(call life_ahwLevel > 3) then
		{
			_return pushBack "O_Heli_Light_02_unarmed_F";
		};
		if(call life_ahwLevel > 4) then
		{
			_return pushBack "I_Heli_Transport_02_F";
		};
		if(call life_ahwLevel > 5) then
		{
			_return pushBack "B_T_VTOL_01_vehicle_F";
		};
	};

	case "med_ship":
	{
		if(call life_ahwLevel > 2) then {
			_return = ["C_Rubberboat","C_Boat_Civil_01_rescue_F"];
		};
	};
};

_return;
