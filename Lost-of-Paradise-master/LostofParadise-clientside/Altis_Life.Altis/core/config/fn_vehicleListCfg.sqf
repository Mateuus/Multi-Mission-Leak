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
        if(license_civ_driver) then
        {
            _return set[count _return,
            ["C_Kart_01_Blu_F",250000]];
            _return set[count _return,
            ["C_Kart_01_Fuel_F",250000]];
            _return set[count _return,
            ["C_Kart_01_Red_F",250000]];
            _return set[count _return,
            ["C_Kart_01_Vrana_F",250000]];
            _return set[count _return,
            ["C_Kart_01_F",250000]];
        };
    };
   
    case "med_shop":
    {
        _return = [
            ["C_Offroad_01_F",10000],
            ["C_Offroad_01_repair_F",10000],
            ["C_Van_01_box_F",25000],
            ["C_SUV_01_F",35000],
            ["B_MRAP_01_F",50000],
            ["I_MRAP_03_F",75000]
        //  ["B_Truck_01_mover_F",50000]
        ];
    };
   
    case "med_air_hs": {
        _return = [
            ["B_Heli_Light_01_F",75000],
            ["O_Heli_Light_02_unarmed_F",100000],
            ["I_Heli_Transport_02_F",125000]
        ];
    };
   
    case "civ_car":
    {
        if(license_civ_driver) then
        {
            _return set[count _return,
            ["B_Quadbike_01_F",13000]];
            _return set[count _return,
            ["C_Hatchback_01_F",16000]];
            _return set[count _return,
            ["C_Offroad_01_F",20000]];
            _return set[count _return,
            ["C_Offroad_02_unarmed_F",30000]];
            _return set[count _return,
            ["B_T_LSV_01_unarmed_F",100000]];
            _return set[count _return,
            ["O_T_LSV_02_unarmed_F",110000]];
            _return set[count _return,
            ["C_SUV_01_F",35000]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",400000]];
            _return set[count _return,
            ["C_Van_01_transport_F",40000]];
            _return set[count _return,
            ["C_Van_01_box_F",60000]];
        }
        else
        {
            hint "Du hast keinen Führerschein!";
        };
    };
   
    case "civ_truck":
    {
        if(license_civ_truck) then
        {
            _return set[count _return,
            ["I_Truck_02_transport_F",175000]];
            _return set[count _return,
            ["I_Truck_02_fuel_F",190000]];
            _return set[count _return,
            ["I_Truck_02_covered_F",200000]];
            _return set[count _return,
            ["B_Truck_01_transport_F",350000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",500000]];
            _return set[count _return,
            ["O_Truck_03_transport_F",700000]];
            _return set[count _return,
            ["B_Truck_01_box_F",1400000]];
            _return set[count _return,
            ["B_Truck_01_ammo_F",1500000]];
            _return set[count _return,
            ["O_Truck_03_fuel_F",2000000]];
            _return set[count _return,
            ["O_Truck_03_covered_F",3500000]];
            _return set[count _return,
            ["O_Truck_03_repair_F",3600000]];
            _return set[count _return,
            ["B_Truck_01_fuel_F",3700000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["O_Truck_03_device_F",40000000]];
        }
        else
        {
            hint "Du hast keinen Führerschein!";
        };
    };
   
    case "reb_car":
    {
        if(license_civ_rebel) then
        {
            _return set[count _return,
            ["B_Quadbike_01_F",2500]];
            _return set[count _return,
            ["B_G_Offroad_01_F",13000]];
            _return set[count _return,
            ["B_T_LSV_01_unarmed_F",100000]];
            _return set[count _return,
            ["O_T_LSV_02_unarmed_F",110000]];
            _return set[count _return,
            ["O_MRAP_02_F",4200000]];
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
            _return set[count _return,
            ["B_Heli_Light_01_F",750000]];
            _return set[count _return,
            ["O_Heli_Transport_04_bench_F",4000000]];
        //  _return set[count _return,
        //  ["B_G_Offroad_01_armed_F",850000]];
        };
    };
   
    case "bhc_car":
    {
        if(license_civ_bhc) then
        {
            _return set[count _return,
            ["O_MRAP_02_F",1000000]];
            _return set[count _return,
            ["I_MRAP_03_F",1000000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",1000000]];
            _return set[count _return,
            ["B_Heli_Transport_03_unarmed_F",1000000]];
            _return set[count _return,
            ["O_Heli_Transport_04_F",1000000]];
        };
    };
   
    case "presse_car_shop":
    {
        if(license_civ_presse) then
        {
            _return set[count _return,
            ["C_SUV_01_F",35000]];
        };
    };
   
    case "donator1_car":
    {
        if(license_civ_donator1) then
        {
            _return set[count _return,
            ["C_SUV_01_F",17500]];
            _return set[count _return,
            ["I_Truck_02_transport_F",87500]];
            _return set[count _return,
            ["I_Truck_02_fuel_F",95000]];
            _return set[count _return,
            ["I_Truck_02_covered_F",100000]];
            _return set[count _return,
            ["B_Truck_01_transport_F",175000]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",200000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",250000]];
            _return set[count _return,
            ["O_Truck_03_transport_F",350000]];
            _return set[count _return,
            ["B_Truck_01_box_F",700000]];
            _return set[count _return,
            ["B_Truck_01_ammo_F",750000]];
            _return set[count _return,
            ["O_Truck_03_fuel_F",1000000]];
            _return set[count _return,
            ["O_Truck_03_covered_F",1750000]];
            _return set[count _return,
            ["O_Truck_03_repair_F",1800000]];
            _return set[count _return,
            ["B_Truck_01_fuel_F",1850000]];
            _return set[count _return,
            ["I_MRAP_03_F",3200000]];
            _return set[count _return,
            ["O_Truck_03_device_F",27000000]];
            _return set[count _return,
            ["B_Heli_Light_01_F",300000]];
            _return set[count _return,
            ["C_Heli_Light_01_civil_F",300000]];
            _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",750000]];
            _return set[count _return,
            ["I_Heli_Transport_02_F",1350000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",1750000]];
            _return set[count _return,
            ["B_Heli_Transport_03_unarmed_F",1675000]];
            _return set[count _return,
            ["O_Heli_Transport_04_fuel_F",1900000]];
            _return set[count _return,
            ["O_Heli_Transport_04_box_F",1800000]];
            _return set[count _return,
            ["C_Plane_Civil_01_F",1000000]];
			_return set[count _return,
            ["C_Plane_civil_01_racing_F",1000000]];
            _return set[count _return,
            ["B_T_VTOL_01_infantry_F",2500000]];
			_return set[count _return,
			["B_T_VTOL_01_vehicle_F",5000000]];
            _return set[count _return,
            ["B_MRAP_01_F",5000000]];
        }
        else
        {
            hint "Du bist kein Donator!";
        };
    };
   
    case "admin1_car":
    {
        if(license_civ_admin1) then
        {
                        _return set[count _return,
            ["I_MRAP_03_F",100]];
                        _return set[count _return,
            ["B_Heli_Light_01_F",100]];
                        _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",100]];
                        _return set[count _return,
            ["I_Heli_light_03_unarmed_F",100]];
                        _return set[count _return,
            ["I_Heli_Transport_02_F",100]];
                        _return set[count _return,
            ["B_Truck_01_ammo_F",100]];
                        _return set[count _return,
            ["B_Truck_01_fuel_F",100]];
                        _return set[count _return,
            ["B_Truck_01_box_F",100]];
                        _return set[count _return,
            ["O_Truck_03_covered_F",100]];
                        _return set[count _return,
            ["O_Truck_03_repair_F",100]];
                        _return set[count _return,
            ["O_Truck_03_device_F",100]];
                        _return set[count _return,
            ["B_APC_Tracked_01_CRV_F",100]];
                        _return set[count _return,
            ["O_APC_Tracked_02_cannon_F",100]];
                        _return set[count _return,
            ["B_MBT_01_cannon_F",100]];
                        _return set[count _return,
            ["B_APC_Wheeled_01_cannon_F",100]];
                        _return set[count _return,
            ["B_MBT_01_TUSK_F",100]];
                        _return set[count _return,
            ["I_APC_Wheeled_03_cannon_F",100]];
                        _return set[count _return,
            ["B_MRAP_01_hmg_F",100]];
                        _return set[count _return,
            ["O_MRAP_02_hmg_F",100]];
                        _return set[count _return,
            ["I_MRAP_03_hmg_F",100]];
                        _return set[count _return,
            ["I_MBT_03_cannon_F",100]];
                        _return set[count _return,
            ["B_MBT_01_arty_F",100]];
                        _return set[count _return,
            ["O_MBT_02_arty_F",100]];
                        _return set[count _return,
            ["O_MBT_02_cannon_F",100]];
                        _return set[count _return,
            ["B_MBT_01_mlrs_F",100]];
                        _return set[count _return,
            ["O_Truck_03_ammo_F",100]];
                        _return set[count _return,
            ["C_Hatchback_01_sport_F",100]];
                        _return set[count _return,
            ["C_SUV_01_F",100]];
        };
    };
 
    case "dm_car":
    {
        if(license_civ_dm) then
        {
            _return set[count _return,
            ["O_Heli_Transport_04_bench_F",4000000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
        };
    };
   
        case "ar_car":
    {
        if(license_civ_leer) then
        {
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
        };
    }; 
   
    case "ssg_car":
    {
        if(license_civ_ssg) then
        {
   //         _return set[count _return,
    //        ["B_Heli_Light_01_F",600000]];
     //       _return set[count _return,
     //       ["B_MRAP_01_F",7000000]];
        };
    };
   
        case "x_car":
    {
        if(license_civ_x) then
        {
            _return set[count _return,
            ["I_MRAP_03_F",6400000]];
            _return set[count _return,
            ["B_MRAP_01_F",7000000]];
        };
    };
   
        case "o_car":
    {
        if(license_civ_kartell) then
        {
        //  _return set[count _return,
        //  ["I_Heli_light_03_unarmed_F",3500000]];
        //  _return set[count _return,
        //  ["B_MRAP_01_F",7000000]];
        };
    }; 
   
    case "cop_car":
    {
        _return set[count _return,
        ["C_Offroad_01_F",7500]];
        _return set[count _return,
        ["C_SUV_01_F",15000]];
        if(__GETC__(life_coplevel) > 1) then
        {
            _return set[count _return,
            ["C_Kart_01_Blu_F",25000]];
            _return set[count _return,
            ["C_Hatchback_01_sport_F",25000]];
            _return set[count _return,
            ["B_Truck_01_covered_F",140000]];
			_return set[count _return,
			["B_Truck_01_box_F",140000]];
            _return set[count _return,
            ["B_T_LSV_01_unarmed_F",100000]];
            _return set[count _return,
            ["O_T_LSV_02_unarmed_F",100000]];
        };
       
        if(__GETC__(life_coplevel) > 3) then
        {
            _return set[count _return,
            ["B_MRAP_01_F",140000]];
            _return set[count _return,
            ["I_MRAP_03_F",200000]];
        };
       
        if(__GETC__(life_coplevel) > 6) then
        {
        //  _return set[count _return,
        //  ["I_MRAP_03_hmg_F",275000]];
            _return set[count _return,
            ["O_MRAP_02_F",200000]];
        };
		
		if(license_cop_zoll) then
		{
			_return set[count _return,
			["I_Truck_02_covered_F",100000]];
		};

    };
   
    case "civ_air":
    {
        if(license_civ_air) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",600000]];
            _return set[count _return,
            ["C_Heli_Light_01_civil_F",600000]];
            _return set[count _return,
            ["O_Heli_Light_02_unarmed_F",1500000]];
            _return set[count _return,
            ["I_Heli_Transport_02_F",2700000]];
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",3500000]];
            _return set[count _return,
            ["B_Heli_Transport_03_unarmed_F",3350000]];
            _return set[count _return,
            ["O_Heli_Transport_04_fuel_F",3800000]];
            _return set[count _return,
            ["O_Heli_Transport_04_box_F",3600000]];
            _return set[count _return,
            ["C_Plane_Civil_01_F",2000000]];
			_return set[count _return,
            ["C_Plane_civil_01_racing_F",2000000]];
            _return set[count _return,
            ["B_T_VTOL_01_infantry_F",5000000]];
			_return set[count _return,
			["B_T_VTOL_01_vehicle_F",6666666]];
            _return set[count _return,
            ["O_Plane_CAS_02_F",66666666]];
        };
    };
   
    case "cop_air":
    {
        if(__GETC__(life_coplevel) > 2) then
        {
            _return set[count _return,
            ["B_Heli_Light_01_F",100000]];
        };
        if(__GETC__(life_coplevel) > 3) then
        {
            _return set[count _return,
            ["I_Heli_light_03_unarmed_F",160000]];
            _return set[count _return,
            ["B_Heli_Transport_03_unarmed_F",300000]];
        };
        if(__GETC__(life_coplevel) > 6) then
        {
        //  _return set[count _return,
        //  ["B_Heli_Transport_01_camo_F",340000]];
        //  _return set[count _return,
        //  ["B_Heli_Transport_03_F",300000]];
        _return set[count _return,
        ["O_Heli_Transport_04_bench_F",200000]];
       
        };
    };
   
    case "civ_ship":
    {
        if(license_civ_boat) then
        {
            _return set[count _return,
            ["C_Rubberboat",4500]];
            _return set[count _return,
            ["C_Boat_Civil_01_F",150000]];
            _return set[count _return,
            ["B_SDV_01_F",70000]];
            _return set[count _return,
            ["I_C_Boat_Transport_02_F",150000]];
            _return set[count _return,
            ["C_Scooter_Transport_01_F",50000]];
        };
    };
 
    case "cop_ship":
    {
        _return set[count _return,
        ["B_Boat_Transport_01_F",300]];
        _return set[count _return,
        ["C_Boat_Civil_01_police_F",20000]];
        _return set[count _return,
        ["I_C_Boat_Transport_02_F",20000]];
        _return set[count _return,
        ["C_Scooter_Transport_01_F",5000]];
       
        if(__GETC__(life_coplevel) > 3) then
        {
            _return set[count _return,
            ["O_Boat_Armed_01_hmg_F",75000]];
            _return set[count _return,
            ["B_SDV_01_F",30000]];
        };
    };
   
    case "ars_ship":
    {
        _return =
        [
            ["B_Boat_Transport_01_F",3000],
            ["C_Boat_Civil_01_F",3000],
            ["B_SDV_01_F",3000],
            ["C_Scooter_Transport_01_F",50000]
        ];
    };
};
 
_return;