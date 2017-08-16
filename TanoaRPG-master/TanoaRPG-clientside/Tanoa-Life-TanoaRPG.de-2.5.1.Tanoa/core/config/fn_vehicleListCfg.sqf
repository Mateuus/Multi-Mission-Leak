#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return","_rabatt"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];

switch (_shop) do
{	
	//ZIVI SHOPS
	//Zivi Fahrzeugshop
	case "civ_car_1":
	{
		_return = 
		[
			["B_Quadbike_01_F",3000],//Quadbike
			["C_Van_01_fuel_F",40000],//Fueltruck
			["C_Hatchback_01_F",15000],//Limousine
			["C_Hatchback_01_sport_F",80000],//Limousine Sport
			["C_Offroad_01_F",30000],//Offroader
			["C_Offroad_02_unarmed_F",30000],//4WD Apex-Offroader
			["I_C_Offroad_02_unarmed_F",35000], //4WD ohne Überrollkäfig
			["C_SUV_01_F",37500],//SUV
			["C_Van_01_transport_F",40000],//Pizzataxi
			["C_Van_01_box_F",50000],//Pizzataxi mit Box
			["Box_East_AmmoVeh_F",80000]// Die Vehicle Ammo Box
		];
	}; 
	
	//Zivi LKW Shop
	case "civ_truck_1":
	{
		_return =
		[
			["I_Truck_02_transport_F",100000],//Zamak unabgedeckt
			["O_Truck_02_covered_F",200000],//Zamak abgedeckt
			["O_Truck_03_transport_F",666666],//Tempest unabgedeckt
			["O_Truck_03_covered_F",1500000],//Tempest abgedeckt
			
			["B_Truck_01_transport_F",5500000],//Hemtt unabgedeckt
			["B_Truck_01_covered_F",8000000],//Hemtt abgedeckt
			["O_Truck_03_ammo_F",11500000],//Tempest Ammo
			["B_Truck_01_ammo_F",15000000],//Hemtt Ammo
			["B_Truck_01_box_F",20000000],//Hemtt Box
			//["B_Truck_01_fuel_F",6666666],//Hemtt Treibstoff
			//["O_Truck_03_fuel_F",3666666],//Tempest Treibstoff
			/*
			["C_supplyCrate_F",150000],//Kleine Transportbox
			["Box_IND_AmmoVeh_F",300000],//Große Transportbox
            ["B_Slingload_01_Cargo_F",350000],//Huron Container normal
			["B_Slingload_01_Fuel_F",450000]//Huron Container Treibstoff*/
			["O_Truck_03_device_F",20000000]//Tempest Gerät
		];	
	};
	
	//Zivi Luft
	case "civ_air_1":
	{
		_return =
		[
			["C_Plane_Civil_01_racing_F",50000],//Cessna Racing
			["C_Plane_Civil_01_F",1400000],//Cessna
			["B_Heli_Light_01_F",1200000],//Hummingbird
			["O_Heli_Light_02_unarmed_F",2666666],//Orca
			["I_Heli_Transport_02_F",10000000],//Mohawk
			["O_Heli_Transport_04_black_F",13333333],//Civ Taru
			//["O_Heli_Transport_04_fuel_F",12000000],//Civ Taru Treibsoff
			["B_Heli_Transport_03_unarmed_F",22000000],//Huron
			["O_T_VTOL_02_vehicle_F",19000000],//Y32
			["B_T_VTOL_01_vehicle_F",28000000]//YTOL
			//["I_Plane_Fighter_03_CAS_F",35000000]//Buzzard
			//["O_Plane_CAS_02_F",40000000]//Neophron
			//["B_Plane_CAS_01_F",50000000]//Wipeout
			
		];
	};
	
	//Zivi Boote
	case "civ_ship_1":
	{
		_return =
		[
			["C_Scooter_Transport_01_F",25000],
			["C_Rubberboat",25000],  					//Schlauchboot CIV
			["B_Lifeboat",100000],					//Rettungsboot WEST
			["O_Lifeboat",200000],					//Rettungsboot EAST
			["C_Boat_Civil_01_F",400000],			//Motorbboot CIV
			["C_Boat_Civil_01_rescue_F",500000],		//Motor-Rettungsboot CIV
			["B_Boat_Transport_01_F",1000000],		//Assault Boat WEST
			["O_Boat_Transport_01_F",1500000],		//Assault Boat EAST
			["I_Boat_Transport_01_F",2000000],		//Assault Boat GUER
			["I_G_Boat_Transport_01_F",4000000],		//Assault Boat Tanoa GUER
			["C_Boat_Transport_02_F",8000000],		//RHIB CIV
			["I_C_Boat_Transport_02_F",8000000],		//RHIB GUER
			["B_Boat_Armed_01_minigun_F",8000000],	//Speedboat Minigun WEST
			["O_Boat_Armed_01_hmg_F",17000000],		//Speedboat HMG EAST
			["I_Boat_Armed_01_minigun_F",25000000],	//Speedboat Minigun GUER
			["O_SDV_01_F",1500000]						//U-Boot
			//ToDo: Trawler
			//["C_Boat_Civil_04_F",3000000] //Trawler
		];
	};
	
	//Kart Shop
	case "kart_shop":
	{
		_return = 
		[
			["C_Kart_01_Blu_F",15000],//Kart Blau
			["C_Kart_01_Fuel_F",15000],//Kart Fuel
			["C_Kart_01_Red_F",15000],//Kart Rot
			["C_Kart_01_Vrana_F",15000]//Kart Vrana
		];
	};
	
	//Rebellenshop
	case "reb_v_1":
	{
		_return =
		[
			["B_Quadbike_01_F",3000],//Rebellenquad
			["B_G_Offroad_01_F",45500],//Rebellenoffrad
			["C_Offroad_02_unarmed_F",30000],
			["I_C_Offroad_02_unarmed_F",35000],
			["B_Heli_Light_01_F",1000000]//Rebellenhummingbird
		];
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["B_CTRG_LSV_01_light_F",300000]];//Quilin
			_return set[count _return,
			["O_LSV_02_unarmed_F",1000000]];//Huron
			_return set[count _return,
			["B_G_Offroad_01_armed_F",2000000]];//Bewaffneter Offroad	
			_return set[count _return,
			["I_Heli_Transport_02_F",10000000]];//Mohawk
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",2666666]];//Orca
			_return set[count _return,
			["O_Heli_Transport_04_black_F",13333333]];//Civ Taru
			//_return set[count _return,
			//["O_Heli_Transport_04_fuel_F",12000000]];//Civ Taru Treibstoff
			_return set[count _return,
			["O_MRAP_02_F",5333333]]; //Ifrit
			_return set[count _return,
			["B_MRAP_01_F",6666666]]; //Hunter
			_return set[count _return,
			["I_MRAP_03_F",8000000]]; //Strider
		};
	};
	
	//MEDIC SHOPS
	//Medic Fahrzeuge
	case "med_shop":
	{
		_return = 
		[
			["C_Offroad_01_F",6500],//Medic Offroad
			["C_Offroad_02_unarmed_F",6500],//Medic 4WD Apex-Offroad
			["I_C_Offroad_02_unarmed_F",35000],
			["C_Offroad_01_repair_F",6500],//Offroad Repair
			["C_SUV_01_F",15000],//Medic SUV
			["C_Van_01_box_F",10000],//Medic Truck box
			//["B_MRAP_01_F",20000],//Medic Hunter
			["B_Truck_01_transport_F",135000],//Medic Hemtt
			["C_Hatchback_01_sport_F",6000]//Medic Sportlimousine
		];
	};
	
	//Medic Luft
	case "med_air_1":
	{
		_return = 
		[
			["B_Heli_Light_01_F",57000],//Medic Hummingbird
			["O_Heli_Light_02_unarmed_F",72500],//Medic Orca
			["I_Heli_light_03_unarmed_F",15000],//Medic Hellcat
			["O_Heli_Transport_04_F",200000],//Medic Taru normal
			["O_Heli_Transport_04_medevac_F",200000],//Medic Taru Medizin
            ["I_Heli_Transport_02_F",100000]//Medic Mohawk
			//["O_T_VTOL_02_vehicle_F",2000000]//Y32
        ];
	};
	
	//COP SHOPS
	//Cop Fahrzeuge
	case "cop_car_1":
	{
		
		if(__GETC__(life_coplevel) > 0) then
		{
			_return set[count _return,["B_Quadbike_01_F",5000]];//Cop Quad
			_return set[count _return,["C_Offroad_01_F",10000]];//Cop Offroad
			_return set[count _return,["C_Offroad_02_unarmed_F",10000]];//Cop 4WD Offroad
			_return set[count _return,["I_C_Offroad_02_unarmed_F",35000]];
		};
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["C_SUV_01_F",15000]];//Cop SUV
			_return set[count _return,["C_Hatchback_01_F",15000]];//Cop Limousine
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["B_MRAP_01_F",40000]];//Cop Hunter	
			_return set[count _return,["B_T_LSV_01_unarmed_F",40000]];//NATO Apex-Teil da	
			_return set[count _return,["C_Hatchback_01_sport_F",50000]];//Cop Sportlimousine
			_return set[count _return,["B_Truck_01_mover_F",250000]];//Cop Hemtt (Mobile Strassensperre)
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["I_MRAP_03_F",100000]];//Cop Strider
		};
	};
	
	//Cop Luft
	case "cop_air_1":
	{
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",100000]];//Cop Hummingbird
			_return set[count _return,["C_Plane_Civil_01_F",100000]];//Cop Ceasar
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["I_Heli_Transport_02_F",2333333]];//Cop Mohawk
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["I_Heli_light_03_F",500000]];//Cop Hellcat
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",900000]];//Cop Orca
			_return set[count _return,["O_T_VTOL_02_vehicle_F",2000000]];//Y32
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",300000]];//Cop Huron
			_return set[count _return,["B_T_VTOL_01_vehicle_F",850000]];//YTOL Blackfish
		};
		if(__GETC__(life_coplevel) > 5) then
		{
			_return set[count _return,["B_Heli_Transport_01_F",3000000]];//Cop Ghosthawk
		};
		if(__GETC__(life_coplevel) > 6) then
		{
			
		};
	};
	
	//Cop Boote
	case "cop_ship_1":
	{
		_return =
		[
			["C_Scooter_Transport_01_F",25000],
			["B_Boat_Transport_01_F",3000],//Cop Speedboot
			["C_Boat_Civil_01_police_F",20000],//Cop Polizeiboot
			["C_Boat_Transport_02_F",40000], //COP RHIB
			["B_SDV_01_F",100000]//Cop U-Boot
			//["C_Boat_Civil_04_F",1000000] //Trawler
		];
	};
	
	//IMPERIUM SHOPS
	//Imperium Fahrzeuge
	case "adac_car":
    {
        _return =
        [
            ["O_MRAP_02_F",1100000],//Imperium Ifrit
            ["C_Offroad_01_F",30000],//Imperium Offroad
            ["O_G_Offroad_01_armed_F",1500000],//Imperium Bewaffneter Offroad
			["C_Offroad_02_unarmed_F",30000],
			["I_C_Offroad_02_unarmed_F",35000],
			["B_CTRG_LSV_01_light_F",40000],//NATO Apex-Teil da	
            ["O_Quadbike_01_F",1500],//Imperium Quad
			["O_Truck_03_transport_F",700000],//Imperium Tempest unabgedeckt
            ["O_Truck_02_covered_F",300000],//Imperium Zamak abgedeckt
            ["O_Truck_03_covered_F",800000],//Imperium Tempest abgedeckt
            ["B_MRAP_01_F",1200000],//Imperium Hunter
			["I_MRAP_03_F",1300000],//Imperium Strider
			
			["C_Scooter_Transport_01_F",1000],
			["O_Lifeboat",5000],					//Rettungsboot EAST
			["C_Boat_Civil_01_rescue_F",5000],	//Motor-Rettungsboot CIV
			["O_Boat_Transport_01_F",5000],		//Assault Boat EAST
			["I_C_Boat_Transport_02_F",5000],	//RHIB GUER
			["O_Boat_Armed_01_hmg_F",5000],		//Speedboat HMG EAST
			["O_SDV_01_F",150000]					//U-Boot
        ];
    };
    
    //Imperium Luft
	case "adac_air":
    {
        _return =
        [
			["B_Heli_Light_01_F",1000000],//Imperium Hummingbird
			["O_Heli_Light_02_unarmed_F",2500000],//Imperium Orca
			["I_Heli_Transport_02_F",8000000],//Imperium Mohawk
			["I_Heli_light_03_unarmed_F",5000000], //Hellcat
			["O_Heli_Transport_04_black_F",6666666],//Imperium Taru
			["O_Heli_Transport_04_fuel_F",13000000],//Imperium Taru Treibstoff
			["B_Heli_Transport_03_unarmed_F",26000000],//Imperium Huron
			["O_T_VTOL_02_vehicle_F",10000000],//Y32
			["B_T_VTOL_01_vehicle_F",16666666],//YTOL
			["C_Plane_Civil_01_racing_F",50000],//Cessna
			["I_Plane_Fighter_03_CAS_F",35000000],//Imperium Buzzard
			["O_Plane_CAS_02_F",40000000]//Imperium Neophron
        ];
    };
	
	
	case "ateam":
	{
		_return = 
		[
			["C_Hatchback_01_sport_F",70000],	//Limousine Sport
			["C_Offroad_01_F",20000]	//Offroader		
		];
		
		if(license_civ_air) then
		{
			_return set[count _return,
			["B_Heli_Light_01_F",800000]];	//Humming
			_return set[count _return,
			["O_Heli_Light_02_unarmed_F",2000000]];	//Orca
		};
		
		if(license_civ_rebel) then
		{
			_return set[count _return,
			["O_MRAP_02_F",3333333]]; //Ifrit
			_return set[count _return,
			["B_MRAP_01_F",4666666]]; //Hunter
			_return set[count _return,
			["I_MRAP_03_F",6000000]]; //Strider
		};
	}; 

	case "civ_servt_1":
	{
		_return =
		[
			["C_Offroad_01_F",15000] //Service Truck
		];
	};
};
_return;