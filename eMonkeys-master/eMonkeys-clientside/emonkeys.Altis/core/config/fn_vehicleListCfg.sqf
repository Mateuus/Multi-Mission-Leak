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
			["C_Kart_01_Blu_F",150000],
			["C_Kart_01_Fuel_F",150000],
			["C_Kart_01_Red_F",150000],
			["C_Kart_01_Vrana_F",150000]
		];
	};
	
	case "med_shop":
	{
		if((call EMonkeys_medicLevel) >= 1) then
		{
			_return  pushBack ["C_Offroad_01_F",4000];
		};
		if((call EMonkeys_medicLevel) > 1) then
		{
			_return  pushBack ["C_Van_01_box_F",30000];
			_return  pushBack ["B_Truck_01_medical_F",80000];	
		};
		if((call EMonkeys_medicLevel) > 3) then
		{
			_return  pushBack ["C_Hatchback_01_sport_F",60000];
			_return  pushBack ["O_Truck_03_medical_F",70000];
		};
	};
	
	case "med_air_hs":
	{
		if((call EMonkeys_medicLevel) > 1) then
		{
			_return  pushBack ["B_Heli_Light_01_F",40000];
		};
		if((call EMonkeys_medicLevel) > 2) then
		{
			_return  pushBack ["B_Heli_Light_01_F",40000];
			_return  pushBack ["O_Heli_Light_02_unarmed_F",100000];
		};
		if((call EMonkeys_medicLevel) > 4) then
		{
			_return  pushBack ["O_Heli_Transport_04_medevac_F",200000];
		};
	};

	case "med_air_hq":
	{
		if((call EMonkeys_medicLevel) > 1) then
		{
			_return  pushBack ["B_Heli_Light_01_F",40000];
		};
		if((call EMonkeys_medicLevel) > 2) then
		{
			_return  pushBack ["B_Heli_Light_01_F",40000];
			_return  pushBack ["O_Heli_Light_02_unarmed_F",100000];
		};
		if((call EMonkeys_medicLevel) > 4) then
		{
			_return  pushBack ["O_Heli_Transport_04_medevac_F",200000];
		};
	};
	
	case "civ_car":
	{
		_return = 
		[
			["C_Hatchback_01_F",3000],
			["C_Offroad_01_F",9000],
			["C_SUV_01_F",16000],
			["B_Quadbike_01_F",18000],
			["C_Van_01_transport_F",40000],
			["C_Van_01_fuel_F",50000]
		];
	}; 
	case "civ_truck":
	{
		_return =
		[
			["C_Van_01_box_F",50000],
			["I_Truck_02_transport_F",90000],
			["I_Truck_02_covered_F",120000],
			["O_Truck_03_transport_F",260000],
			["O_Truck_03_covered_F",320000],
			["B_Truck_01_transport_F",500000],
			["B_Truck_01_covered_F",600000],
			["B_Truck_01_box_F",1700000],
			["O_Truck_03_ammo_F",3000000],
			["O_Truck_03_device_F",4000000],
			["O_Truck_02_fuel_F",150000],
			["O_Truck_03_fuel_F",340000],
			["B_Truck_01_fuel_F",1400000]
		];	
	};
		
	case "reb_car":
	{
		_return =
		[
			["B_Quadbike_01_F",18000],
			["B_G_Offroad_01_F",15000],
			["O_MRAP_02_F",600000],
			["B_Heli_Light_01_F",325000],
			["C_Hatchback_01_sport_F",200000],
			["B_MRAP_01_F",1200000]
		];
		
		if(license_civ_rebel) then
		{
			_return  pushBack ["B_G_Offroad_01_armed_F",750000];
		};
	};

	case "cop_car":
	{
		_return  pushBack ["B_Quadbike_01_F",1000];
		_return  pushBack ["C_Offroad_01_F",5000];
		_return  pushBack ["C_SUV_01_F",4000];
		_return  pushBack ["I_Truck_02_covered_F",50000];

		if((call EMonkeys_coplevel) > 2) then
		{
			_return  pushBack ["C_Hatchback_01_sport_F",50000];
		};
		if((call EMonkeys_coplevel) > 4) then
		{
            _return  pushBack["B_MRAP_01_F",200000];
            _return  pushBack["I_MRAP_03_F",200000];
			_return  pushBack["C_Van_01_box_F",20000];
			_return  pushBack["B_Truck_01_transport_F",60000];
		};
		
		if((call EMonkeys_coplevel) > 6) then
        {
            _return  pushBack["I_MRAP_03_hmg_F",750000];
        };
	};

	case "cop_air":
	{
		if((call EMonkeys_coplevel) >= 2) then
		{
			_return  pushBack["B_Heli_Light_01_F",40000];
            _return  pushBack["O_Heli_Light_02_unarmed_F",140000];
		};
		
		if((call EMonkeys_coplevel) > 3) then
		{
			_return  pushBack["I_Heli_Transport_02_F",70000];
            _return  pushBack["O_Heli_Transport_04_bench_F",140000];
            _return  pushBack["B_Heli_Transport_03_unarmed_F",140000];
		};
		
		if((call EMonkeys_coplevel) >= 5) then
		{
			_return  pushBack["O_Heli_Transport_04_F",140000];  	
		};
		
		if((call EMonkeys_coplevel) > 6) then
		{
			_return  pushBack["I_Heli_light_03_unarmed_F",200000];  	
		};
	};
		
	case "cop_ship":
	{
		_return =
		[
			["B_Boat_Transport_01_F",3000],
			["C_Boat_Civil_01_police_F",20000],
			["O_Boat_Armed_01_hmg_F",75000],
			["B_SDV_01_F",100000]
		];
	};

	case "civ_air":
	{
		_return =
		[
			["B_Heli_Light_01_F",253000],
			["O_Heli_Light_02_unarmed_F",750000],
			["C_Heli_light_01_blue_F",220000],
			["C_Heli_Light_01_civil_F",220000],
			["I_Heli_Transport_02_F",3333333],
			["B_Heli_Transport_03_unarmed_F",5000000],
			["O_Heli_Transport_04_bench_F",7500000],
			["O_Heli_Transport_04_fuel_F",8000000]
		];
	};
	
	case "civ_ship":
	{
		_return =
		[
			["C_Rubberboat",5000],
			["C_Boat_Civil_01_F",22000]
		];
	};
	
	case "VIP_car":
	{
		if(EMonkeys_VIP == 1) then
		{
			_return  pushBack ["B_Quadbike_01_F",18000];
			_return  pushBack ["C_Offroad_01_F",6750];
			_return  pushBack ["C_SUV_01_F",12000];
		};
		if(EMonkeys_VIP == 2) then
		{
			_return  pushBack ["B_Quadbike_01_F",9000];
			_return  pushBack ["C_Offroad_01_F",4750];
			_return  pushBack ["C_SUV_01_F",8000];
			_return  pushBack ["C_Hatchback_01_sport_F",80000];
			_return  pushBack ["B_MRAP_01_F",500000];
		};
	};
	
		case "VIP_lkw":
	{
		if(EMonkeys_VIP == 1) then
		{
			_return  pushBack ["C_Van_01_Fuel_F",37500];
			_return  pushBack ["B_Truck_01_box_F",1275000];
		};
		if(EMonkeys_VIP == 2) then
		{
			_return  pushBack ["C_Van_01_Fuel_F",30000];
			_return  pushBack ["B_Truck_01_box_F",850000];
			_return  pushBack ["O_Truck_03_ammo_F",2000000];
			_return  pushBack ["O_Truck_03_device_F",2500000];
			_return  pushBack ["B_Truck_01_fuel_F",1000000];
		};
	};
	
		case "VIP_heli":
	{
		if(EMonkeys_VIP == 1) then
		{
			_return  pushBack ["B_Heli_Light_01_F",187000];
			_return  pushBack ["O_Heli_Light_02_unarmed_F",562000];
			_return  pushBack ["I_Heli_Transport_02_F",2500000];
			_return  pushBack ["B_Heli_Transport_03_unarmed_F",4000000];
		};
		if(EMonkeys_VIP == 2) then
		{
			_return  pushBack ["B_Heli_Light_01_F",125000];
			_return  pushBack ["C_Heli_light_01_blue_F",100000];
			_return  pushBack ["C_Heli_Light_01_civil_F",100000];
			_return  pushBack ["O_Heli_Light_02_unarmed_F",375000];
			_return  pushBack ["I_Heli_Transport_02_F",1562500];
			_return  pushBack ["B_Heli_Transport_03_unarmed_F",2500000];
			_return  pushBack ["O_Heli_Transport_04_bench_F",6000000];
			_return  pushBack ["O_Heli_Transport_04_fuel_F",6400000];
		};
	};
	
	case "civ_log":
	{
		_return = 
		[
		["Box_IND_AmmoVeh_F",100000],
		["Land_Cargo20_blue_F",300000]
		];
	};
	
	case "jet":
	{
			_return =
		[
			["B_Plane_CAS_01_F",26600000]
		];
	};
	
	case "adac_car":
	{
		_return =
		[
			["C_Offroad_01_F",2000],
			["B_Truck_01_transport_F",10000],
			["C_Van_01_fuel_F",10000]
		];
	};

	case "ap_car":
	{
		_return =
		[
			["C_Offroad_01_F",2000]
		];
	};
	
	case "ap_air":
	{
			_return =
		[
			["B_Heli_Light_01_F",8000]
		];
	};
	
	case "ksk_car":
	{
		if((["KSK"] call EMonkeys_fnc_permLevel) > 1) then
		{
			_return  pushBack ["B_MRAP_01_F",500000];
		};
	};
	
	case "ps_car":
	{
		if((["PS"] call EMonkeys_fnc_permLevel) > 1) then
		{
			_return  pushBack ["B_MRAP_01_F",500000];
		};
	};
	
	case "soa_car":
	{
		if((["SOA"] call EMonkeys_fnc_permLevel) > 1) then
		{
			_return  pushBack ["B_Quadbike_01_F",18000];
		};
	};
};


_return;
