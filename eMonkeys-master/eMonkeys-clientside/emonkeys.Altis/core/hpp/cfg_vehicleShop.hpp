/*
    Author: Niklas "Rappelkiste" Quenter
	File: cfg_vehicleShop.sqf
	Server: e-Monkeys.com
    
    Description: Configuration list for Vehicle Shop
	Variable format: [Classname,rent price,buy price,license]
*/

class CfgVehicleShopPosition
{
	vehicleShopDir[] = {218.960};										//Dir der Fahrzeuge im Shop
	vehicleShopSpawn[] = {26571.143,24075.23,0};						//Spawnpunkt der Fahrzeuge im Shop
};

class CfgVehicleShop
{
	class civ_car
	{
		//Zivilisten Auto Händler
		license = "license_civ_driver";
		color = "civ";
		name = "Stan`s PKW Händler";
		vehicles[] =
		{
			{"C_Hatchback_01_F",3000,9000,""},
			{"C_Offroad_01_F",9000,27000,""},
			{"C_SUV_01_F",16000,48000,""},
			{"B_Quadbike_01_F",18000,54000,""},
			{"C_Van_01_transport_F",40000,120000,""},
			{"C_Van_01_fuel_F",50000,150000,""}
		};
	};
	class civ_lkw
	{
		//Zivilisten LKW Händler
		license = "license_civ_truck";
		color = "civ";
		name = "Stan`s LKW Händler";
		vehicles[] =
		{
			{"C_Van_01_box_F",50000,150000,""},
			{"I_Truck_02_transport_F",90000,270000,""},
			{"I_Truck_02_covered_F",1200000,3600000,""},
			{"O_Truck_02_fuel_F",150000,450000,""},
			{"O_Truck_03_transport_F",260000,780000,""},
			{"O_Truck_03_covered_F",320000,960000,""},
			{"O_Truck_03_fuel_F",340000,1020000,""},
			{"B_Truck_01_transport_F",500000,1500000,""},
			{"B_Truck_01_covered_F",600000,1800000,""},
			{"B_Truck_01_fuel_F",1400000,4200000,""},
			{"B_Truck_01_box_F",1700000,5100000,""},
			{"O_Truck_03_ammo_F",3000000,9000000,""},
			{"O_Truck_03_device_F",4000000,12000000,""}
		};
	};
	class civ_air
	{
		//Zivilisten Helikopter Händler
		license = "license_civ_air";
		color = "civ";
		name = "Stan`s Helikopter Händler";
		vehicles[] =
		{
			{"C_Heli_light_01_blue_F",220000,660000,""},
			{"C_Heli_Light_01_civil_F",220000,660000,""},
			{"B_Heli_Light_01_F",253000,759000,""},
			{"O_Heli_Light_02_unarmed_F",750000,2250000,""},
			{"I_Heli_Transport_02_F",3333333,9999999,""},
			{"B_Heli_Transport_03_unarmed_F",5000000,15000000,""},
			{"O_Heli_Transport_04_bench_F",7500000,22500000,""},
			{"O_Heli_Transport_04_fuel_F",8000000,24000000,""}
		};
	};
	class civ_ship
	{
		//Zivilisten Boot Händler
		license = "license_civ_boat";
		color = "civ";
		name = "Stan`s Schiffs Händler";
		vehicles[] =
		{
			{"C_Rubberboat",5000,15000,""},
			{"C_Boat_Civil_01_F",22000,66000,""}
		};
	};
	class civ_log
	{
		//Zivilisten Logistik Händler
		license = "license_civ_log";
		color = "civ";
		name = "Stan`s Logistik Händler";
		vehicles[] =
		{
			{"Box_IND_AmmoVeh_F",100000,600000,""},
			{"Land_Cargo20_blue_F",300000,-1,""}
		};
	};
	class civ_kart
	{
		//Zivilisten Kart Händler
		license = "license_civ_driver";
		color = "civ";
		name = "Stan`s Rennwagen Verlei";
		vehicles[] =
		{
			{"C_Kart_01_Blu_F",150000,-1,""},
			{"C_Kart_01_Fuel_F",150000,-1,""},
			{"C_Kart_01_Red_F",150000,-1,""},
			{"C_Kart_01_Vrana_F",150000,-1,""}
		};
	};
	class civ_jet
	{
		//Zivilisten Jet Händler
		license = "license_civ_jet";
		color = "civ";
		name = "Stan`s Flugzeug Händler";
		vehicles[] =
		{
			{"B_Plane_CAS_01_F",26600000,79800000,""}
		};
	};
	class reb_car
	{
		//Waffenschieber Händler
		license = "license_civ_rebel";
		color = "reb";
		name = "Stan`s Fahrzeug Schmuggler";
		vehicles[] =
		{
			{"B_G_Offroad_01_F",15000,45000,""},
			{"B_Quadbike_01_F",18000,54000,""},
			{"C_Hatchback_01_sport_F",200000,600000,""},
			{"B_Heli_Light_01_F",325000,975000,""},
			{"O_MRAP_02_F",600000,1800000,""},
			{"B_MRAP_01_F",1200000,3600000,""},
			{"B_G_Offroad_01_armed_F",750000,-1,""}
		};
	};
	class vip_car
	{
		//VIP Auto Händler
		license = "license_civ_driver";
		condition = "EMonkeys_VIP >= 1";
		color = "vip";
		name = "PKW Händler VIP";
		vehicles[] =
		{
			//VIP Level 1
			{"C_Offroad_01_F",6750,20250,"EMonkeys_VIP == 1"},
			{"C_SUV_01_F",12000,36000,"EMonkeys_VIP == 1"},
			{"B_Quadbike_01_F",18000,54000,"EMonkeys_VIP == 1"},
			//VIP Level 2
			{"B_Quadbike_01_F",9000,27000,"EMonkeys_VIP == 2"},
			{"C_Offroad_01_F",4750,14250,"EMonkeys_VIP == 2"},
			{"C_SUV_01_F",8000,24000,"EMonkeys_VIP == 2"},
			{"C_Hatchback_01_sport_F",80000,240000,"EMonkeys_VIP == 2"},
			{"B_MRAP_01_F",500000,1500000,"EMonkeys_VIP == 2"}
		};
	};
	class vip_lkw
	{
		//VIP LKW Händler
		license = "license_civ_truck";
		condition = "EMonkeys_VIP >= 1";
		color = "vip";
		name = "LKW Händler VIP";
		vehicles[] =
		{
			//VIP Level 1
			{"C_Van_01_Fuel_F",37500,112500,"EMonkeys_VIP == 1"},
			{"B_Truck_01_box_F",1275000,3825000,"EMonkeys_VIP == 1"},
			//VIP Level 2
			{"C_Van_01_Fuel_F",30000,90000,"EMonkeys_VIP == 2"},
			{"B_Truck_01_box_F",850000,2550000,"EMonkeys_VIP == 2"},
			{"B_Truck_01_fuel_F",1000000,3000000,"EMonkeys_VIP == 2"},
			{"O_Truck_03_ammo_F",2000000,6000000,"EMonkeys_VIP == 2"},
			{"O_Truck_03_device_F",2500000,7500000,"EMonkeys_VIP == 2"}
		};
	};
	class vip_air
	{
		//VIP Helikopter Händler
		license = "license_civ_air";
		condition = "EMonkeys_VIP >= 1";
		color = "vip";
		name = "Helikopter Händler VIP";
		vehicles[] =
		{
			//VIP Level 1
			{"B_Heli_Light_01_F",187000,561000,"EMonkeys_VIP == 1"},
			{"O_Heli_Light_02_unarmed_F",562000,1686000,"EMonkeys_VIP == 1"},
			{"I_Heli_Transport_02_F",2500000,7500000,"EMonkeys_VIP == 1"},
			{"B_Heli_Transport_03_unarmed_F",4000000,12000000,"EMonkeys_VIP == 1"},
			//VIP Level 2
			{"C_Heli_light_01_blue_F",100000,300000,"EMonkeys_VIP == 2"},
			{"C_Heli_Light_01_civil_F",100000,300000,"EMonkeys_VIP == 2"},
			{"B_Heli_Light_01_F",125000,375000,"EMonkeys_VIP == 2"},
			{"O_Heli_Light_02_unarmed_F",375000,1125000,"EMonkeys_VIP == 2"},
			{"I_Heli_Transport_02_F",1562500,4687500,"EMonkeys_VIP == 2"},
			{"B_Heli_Transport_03_unarmed_F",2500000,7500000,"EMonkeys_VIP == 2"},
			{"O_Heli_Transport_04_bench_F",6000000,18000000,"EMonkeys_VIP == 2"},
			{"O_Heli_Transport_04_fuel_F",6400000,19200000,"EMonkeys_VIP == 2"}
		};
	};
	class cop_car
	{
		//Polizei Auto Händler
		license = "";
		color = "cop";
		name = "PKW Händler Bundespolizei";
		vehicles[] =
		{
			{"B_Quadbike_01_F",1000,3000,"(call EMonkeys_coplevel) > 0"},
			{"C_SUV_01_F",4000,12000,"(call EMonkeys_coplevel) > 0"},
			{"C_Offroad_01_F",5000,15000,"(call EMonkeys_coplevel) > 0"},
			{"I_Truck_02_covered_F",50000,150000,"(call EMonkeys_coplevel) > 0"},	
			//ab Polizei Level 3 
			{"C_Hatchback_01_sport_F",50000,150000,"(call EMonkeys_coplevel) > 2"},
			//ab Polizei Level 5
			{"C_Van_01_box_F",20000,60000,"(call EMonkeys_coplevel) > 4"},
			{"B_Truck_01_transport_F",60000,180000,"(call EMonkeys_coplevel) > 4"},
			{"B_MRAP_01_F",200000,600000,"(call EMonkeys_coplevel) > 4"},
			{"I_MRAP_03_F",200000,600000,"(call EMonkeys_coplevel) > 4"},
			//ab Polizei Level 7
			{"I_MRAP_03_hmg_F",750000,-1,"(call EMonkeys_coplevel) > 6"}
		};
	};
	class cop_air
	{
		//Polizei Helikopter Händler
		license = "";
		color = "cop";
		name = "Helikopter Händler Bundespolizei";
		vehicles[] =
		{
			//ab Polizei Level 2
			{"B_Heli_Light_01_F",40000,120000,"(call EMonkeys_coplevel) >= 2"},
			{"O_Heli_Light_02_unarmed_F",140000,420000,"(call EMonkeys_coplevel) >= 2"},
			//ab Polizei Level 4
			{"I_Heli_Transport_02_F",70000,210000,"(call EMonkeys_coplevel) > 3"},
			{"O_Heli_Transport_04_bench_F",140000,420000,"(call EMonkeys_coplevel) > 3"},
			{"B_Heli_Transport_03_unarmed_F",140000,420000,"(call EMonkeys_coplevel) > 3"},
			//ab Polizei Level 5
			{"O_Heli_Transport_04_F",140000,420000,"(call EMonkeys_coplevel) >= 5"},
			//ab Polizei Level 7
			{"I_Heli_light_03_unarmed_F",200000,600000,"(call EMonkeys_coplevel) > 6"}
		};
	};
	class cop_ship
	{
		//Polizei Boots Händler
		license = "";
		color = "cop";
		name = "Schiffs Händler Bundespolizei";
		vehicles[] =
		{
			{"B_Boat_Transport_01_F",3000,9000,"(call EMonkeys_coplevel) > 0"},
			{"C_Boat_Civil_01_police_F",20000,60000,"(call EMonkeys_coplevel) > 0"},
			{"O_Boat_Armed_01_hmg_F",75000,225000,"(call EMonkeys_coplevel) > 0"},
			{"B_SDV_01_F",100000,300000,"(call EMonkeys_coplevel) > 0"}
		};
	};
	class med_car
	{
		//Feuerwehr Auto Händler
		license = "";
		color = "med";
		name = "Bodenfahrzeuge der Feuerwehr";
		vehicles[] =
		{
			{"C_Offroad_01_F",4000,12000,"(call EMonkeys_medicLevel) > 0"},
			//ab Feuerwehr Level 2
			{"C_Van_01_box_F",30000,90000,"(call EMonkeys_medicLevel) > 1"},
			{"B_Truck_01_medical_F",80000,240000,"(call EMonkeys_medicLevel) > 1"},
			{"C_SUV_01_F",6000,16000,"(call EMonkeys_medicLevel) > 1"},
			//ab Feuerwehr Level 3
			{"O_Truck_03_medical_F",70000,210000,"(call EMonkeys_medicLevel) > 2"},
			//ab Feuerwehr Level 4
			{"C_Hatchback_01_sport_F",60000,180000,"(call EMonkeys_medicLevel) > 3"}
		};
	};
	class med_air
	{
		//Feuerwehr Helikopter Händler
		license = "";
		color = "med";
		name = "Luftfahrzeuge der Feuerwehr";
		vehicles[] =
		{
			//ab Feuerwehr Level 2
			{"B_Heli_Light_01_F",40000,120000,"(call EMonkeys_medicLevel) > 1"},
			//ab Feuerwehr Level 3
			{"O_Heli_Light_02_unarmed_F",100000,300000,"(call EMonkeys_medicLevel) > 2"},
			//ab Feuerwehr Level 5
			{"O_Heli_Transport_04_medevac_F",200000,600000,"(call EMonkeys_medicLevel) > 4"}
		};
	};
	class ap_car
	{
		//Fahrzeug Händler Gruppe: AP
		license = "license_civ_driver";
		color = "ap";
		name = "PKW Vertrieb der AP";
		vehicles[] =
		{
			{"C_Offroad_01_F",2000,6000,""};
			{"B_Heli_Light_01_F",8000,24000,""};
		};
	};
	class ps_car
	{
		//Fahrzeug Händler Gruppe: PS
		license = "license_civ_driver";
		color = "ps";
		name = "PKW Vertrieb der PS";
		vehicles[] =
		{
			{"B_MRAP_01_F",500000,1500000,""};
		};
	};
	class sog_car
	{
		//Fahrzeug Händler Gruppe: SOG
		license = "license_civ_driver";
		color = "ksk";
		name = "PKW Vertrieb der SOG";
		vehicles[] =
		{
			{"B_MRAP_01_F",500000,1500000,""};
		};
	};
	class soa_car
	{
		//Fahrzeug Händler Gruppe: SOA
		license = "license_civ_driver";
		color = "soa";
		name = "PKW Schmuggler der SOA";
		vehicles[] =
		{
			{"B_Quadbike_01_F",9000,27000,""};
		};
	};
	class dm_car
	{
		//Fahrzeug Händler Gruppe: SOA
		license = "license_civ_driver";
		color = "dm";
		name = "PKW Schmuggler der DM";
		vehicles[] =
		{
			{"C_Offroad_01_F",9000,27000,""};
		};
	};
};

class CfgVehicleGarage
{
	class vehicleTypes
	{
		class car
		{
			variable = "EMonkeys_VehicleTypeList_car";
			name = "Personenkraftwagen";
			impoundmoney = 1500;
		};
		class air
		{
			variable = "EMonkeys_VehicleTypeList_air";
			name = "Helikopter";
			impoundmoney = 2500;
		};
		class truck
		{
			variable = "EMonkeys_VehicleTypeList_truck";
			name = "Lastkraftwagen";
			impoundmoney = 1500;
		};
		class atv
		{
			variable = "EMonkeys_VehicleTypeList_atv";
			name = "Quad";
			impoundmoney = 1500;
		};
		class armored
		{
			variable = "EMonkeys_VehicleTypeList_armored";
			name = "Gepanzertes Fahrzeug";
			impoundmoney = 3500;
		};
		class plane
		{
			variable = "EMonkeys_VehicleTypeList_plane";
			name = "Flugzeuge";
			impoundmoney = 2500;
		};
		class boat
		{
			variable = "EMonkeys_VehicleTypeList_boat";
			name = "Schiffe";
			impoundmoney = 1500;
		};
		class log
		{
			variable = "EMonkeys_VehicleTypeList_log";
			name = "Container";
			impoundmoney = 1500;
		};
	};
};