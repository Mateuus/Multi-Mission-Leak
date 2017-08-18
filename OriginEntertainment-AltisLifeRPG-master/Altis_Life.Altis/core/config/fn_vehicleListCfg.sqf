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
 			["C_SUV_01_F",40000 * life_donDis]
 		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",50000 * life_donDis];
		};
		
		if(__GETC__(life_medicLevel) > 1) then
		{
			_return pushBack ["C_Offroad_01_repair_F",50000 * life_donDis];
		};
		/*
		if(__GETC__(life_medicLevel) > 2) then
		{
			_return pushBack ["B_Truck_01_transport_F",200000 * life_donDis];
		};
		*/
		
 	};
	
 	case "med_air_hs": {
		_return = [];
		if(__GETC__(life_medicLevel) > 1) then
		{
			_return pushBack ["B_Heli_Light_01_F",700000 * life_donDis];
		};
		
		if(__GETC__(life_medicLevel) > 1) then
		{
			_return pushBack ["O_Heli_Light_02_unarmed_F",800000 * life_donDis];
		};
 	};
	
	case "civ_car":
	{
		_return = 
		[
			["B_Quadbike_01_F",1500 * life_donDis],
			["C_Hatchback_01_F",10000 * life_donDis],			
			["C_Offroad_01_F",30000 * life_donDis],
			["C_SUV_01_F",40000 * life_donDis]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",50000 * life_donDis];
		};
		
		if(__GETC__(life_donator) > 2) then
		{
			_return pushBack ["C_Kart_01_F",12500 * life_donDis];
			_return pushBack ["C_Kart_01_Vrana_F",12500 * life_donDis];
			_return pushBack ["C_Kart_01_Red_F",12500 * life_donDis];
			_return pushBack ["C_Kart_01_Fuel_F",12500 * life_donDis];
			_return pushBack ["C_Kart_01_Blu_F",12500 * life_donDis];
		};
	};
	
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_transport_F",60000 * life_donDis],
			["C_Van_01_fuel_F",75000 * life_donDis],
			["C_Van_01_box_F",80000 * life_donDis],
			["I_Truck_02_transport_F",200000 * life_donDis],
			["I_Truck_02_covered_F",250000 * life_donDis],
			["B_Truck_01_transport_F",300000 * life_donDis],
			["B_Truck_01_box_F",450000 * life_donDis],
			["O_Truck_03_device_F",750000 * life_donDis]
		];	
	};
	
	
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",1000 * life_donDis]
		];
		
		if(license_civ_rebel) then
		{
			_return pushBack ["B_G_Offroad_01_F",30000 * life_donDis];
			_return pushBack ["O_Truck_03_transport_F",300000 * life_donDis];
			_return pushBack ["O_Truck_03_covered_F",400000 * life_donDis];
			_return pushBack ["O_MRAP_02_F",960000 * life_donDis];
			_return pushBack ["B_G_Offroad_01_armed_F",1500000 * life_donDis];
			_return pushBack ["I_Heli_light_03_unarmed_F",700000 * life_donDis];
			_return pushBack ["O_Heli_Light_02_unarmed_F",700000 * life_donDis];
			_return pushBack ["B_Heli_Light_01_F",700000 * life_donDis];
		};
	};
	
	case "cop_car":
	{
		_return =
		[
			["C_Offroad_01_F",30000 * life_donDis]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",30000 * life_donDis];
		};
		
		if(__GETC__(life_coplevel) > 1) then
		{

			_return pushBack ["C_SUV_01_F",55000 * life_donDis];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return pushBack ["B_MRAP_01_F",800000 * life_donDis];
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return pushBack ["I_MRAP_03_F",900000 * life_donDis];
		};
	};
	
	case "cop2_car":
	{
		_return =
		[
			["C_Offroad_01_F",30000 * life_donDis]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return pushBack ["C_Hatchback_01_sport_F",30000 * life_donDis];
		};
		
		if(__GETC__(life_cop2level) > 1) then
		{

			_return pushBack ["C_SUV_01_F",55000 * life_donDis];
		};
		if(__GETC__(life_cop2level) > 4) then
		{
			_return pushBack ["B_MRAP_01_F",800000 * life_donDis];
		};
		if(__GETC__(life_cop2level) > 5) then
		{
			_return pushBack ["I_MRAP_03_F",900000 * life_donDis];
		};
	};
	
	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",300000 * life_donDis],
			["O_Heli_Light_02_unarmed_F",600000 * life_donDis]
		];
		
		if(__GETC__(life_donator) > 3) then
		{
			_return pushBack ["I_Heli_Transport_02_F",1470000  * life_donDis];
		};
	};
	
	case "cop_air":
	{
		if(__GETC__(life_coplevel) > 2) then
		{
			_return pushBack ["B_Heli_Light_01_F",300000 * life_donDis];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["B_Heli_Transport_01_F",800000 * life_donDis];
		};
	};
	
	case "cop2_air":
	{
		if(__GETC__(life_cop2level) > 2) then
		{
			_return pushBack ["B_Heli_Light_01_F",300000 * life_donDis];
		};
		if(__GETC__(life_cop2level) > 3) then
		{
			_return pushBack ["B_Heli_Transport_01_F",800000 * life_donDis];
		};
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000 * life_donDis],
			["C_Boat_Civil_01_F",20000 * life_donDis]
		];
		
		if(__GETC__(life_donator) > 1) then
		{
			_return pushBack ["B_Lifeboat",9000  * life_donDis];
			_return pushBack ["C_Boat_Civil_01_rescue_F",21000 * life_donDis];
		};
	};

	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",8000 * life_donDis]
		];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return pushBack ["C_Boat_Civil_01_police_F",20000 * life_donDis];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return pushBack ["B_SDV_01_F",1200000 * life_donDis];
		};
	}; 
	/*
	case "med_ship":
	{
		_return =
		[
			["O_Boat_Armed_01_hmg_F",3000]
		];
	};
	*/
};

_return;
