class CfgVehicles
{
	//Autos
	class B_Quadbike_01_F
	{
		type = "atv";
		sort = 0;
		trunkWeight = 30;
		fuelCapicity = 20;
		fuel = "super";
		garageFee[] = {600,600,600}; /* Civ|Cop|Med */
		sellprice[] = {500,500,500}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Hatchback_01_F
	{
		type = "car";
		sort = 0;
		trunkWeight = 50;
		fuelCapicity = 65;
		fuel = "super";
		garageFee[] = {1800,1800,1800}; /* Civ|Cop|Med */
		sellprice[] = {1500,1500,1500}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Hatchback_01_sport_F
	{
		type = "car";
		sort = 1;
		trunkWeight = 30;
		fuelCapicity = 65;
		fuel = "superplus";
		garageFee[] = {50000,10000,15000}; /* Civ|Cop|Med */
		sellprice[] = {45000,25000,25000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Offroad_01_F
	{
		type = "car";
		sort = 2;
		trunkWeight = 85;
		fuelCapicity = 70;
		fuel = "biodiesel";
		garageFee[] = {2700,2700,2700}; /* Civ|Cop|Med */
		sellprice[] = {3000,3000,3000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_G_Offroad_01_F
	{
		type = "car";
		sort = 3;
		trunkWeight = 85;
		fuelCapicity = 70;
		fuel = "biodiesel";
		garageFee[] = {3700,3700,3700}; /* Civ|Cop|Med */
		sellprice[] = {6000,6000,6000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_G_Offroad_01_armed_F
	{
		type = "car";
		sort = 4;
		trunkWeight = 85;
		fuelCapicity = 70;
		fuel = "biodiesel";
		garageFee[] = {60000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {50000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_SUV_01_F
	{
		type = "car";
		sort = 5;
		trunkWeight = 65;
		fuelCapicity = 65;
		fuel = "superplus";
		garageFee[] = {4800,4800,4800}; /* Civ|Cop|Med */
		sellprice[] = {6000,6000,6000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Van_01_transport_F
	{
		type = "car";
		sort = 6;
		trunkWeight = 120;
		fuelCapicity = 120;
		fuel = "biodiesel";
		garageFee[] = {6000,3000,3000}; /* Civ|Cop|Med */
		sellprice[] = {25000,12500,12500}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//LKWs
	class C_Van_01_fuel_F
	{
		type = "truck";
		sort = 0;
		trunkWeight = 400;
		fuelCapicity = 120;
		fuel = "biodiesel";
		garageFee[] = {6000,3000,3000}; /* Civ|Cop|Med */
		sellprice[] = {20000,10000,10000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Van_01_box_F
	{
		type = "truck";
		sort = 1;
		trunkWeight = 200;
		fuelCapicity = 120;
		fuel = "biodiesel";
		garageFee[] = {7500,2500,2000}; /* Civ|Cop|Med */
		sellprice[] = {25000,18000,15000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_Truck_02_transport_F
	{
		type = "truck";
		sort = 2;
		trunkWeight = 300;
		fuelCapicity = 160;
		fuel = "biodiesel";
		garageFee[] = {12000,6000,6000}; /* Civ|Cop|Med */
		sellprice[] = {60000,30000,30000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_02_fuel_F
	{
		type = "truck";
		sort = 3;
		trunkWeight = 650;
		fuelCapicity = 160;
		fuel = "biodiesel";
		garageFee[] = {20000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {200000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_Truck_02_covered_F
	{
		type = "truck";
		sort = 4;
		trunkWeight = 375;
		fuelCapicity = 160;
		fuel = "biodiesel";
		garageFee[] = {15000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {70000,35000,35000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_02_box_F
	{
		type = "truck";
		sort = 5;
		trunkWeight = 400;
		fuelCapicity = 200;
		fuel = "biodiesel";
		garageFee[] = {20000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {100000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_transport_F
	{
		type = "truck";
		sort = 6;
		trunkWeight = 400;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {35000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {100000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_fuel_F
	{
		type = "truck";
		sort = 7;
		trunkWeight = 1000;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {30000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {300000,150000,150000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_covered_F
	{
		type = "truck";
		sort = 8;
		trunkWeight = 500;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {45000,25000,25000}; /* Civ|Cop|Med */
		sellprice[] = {100000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_ammo_F
	{
		type = "truck";
		sort = 9;
		trunkWeight = 1000;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {60000,25000,25000}; /* Civ|Cop|Med */
		sellprice[] = {70000,35000,35000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_device_F
	{
		type = "truck";
		sort = 10;
		trunkWeight = 350;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {65000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {200000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Truck_03_medical_F
	{
		type = "truck";
		sort = 11;
		trunkWeight = 200;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {45000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {100000,35000,35000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_transport_F
	{
		type = "truck";
		sort = 12;
		trunkWeight = 550;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {40000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {150000,75000,75000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_fuel_F
	{
		type = "truck";
		sort = 13;
		trunkWeight = 1500;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {50000,20000,20000}; /* Civ|Cop|Med */
		sellprice[] = {400000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_covered_F
	{
		type = "truck";
		sort = 14;
		trunkWeight = 650;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {45000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {100000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_ammo_F
	{
		type = "truck";
		sort = 15;
		trunkWeight = -1;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {80000,20000,20000}; /* Civ|Cop|Med */
		sellprice[] = {0,0,0}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_box_F
	{
		type = "truck";
		sort = 16;
		trunkWeight = 1000;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {70000,20000,20000}; /* Civ|Cop|Med */
		sellprice[] = {500000,200000,200000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Truck_01_medical_F
	{
		type = "truck";
		sort = 17;
		trunkWeight = 200;
		fuelCapicity = 200;
		fuel = "diesel";
		garageFee[] = {45000,15000,15000}; /* Civ|Cop|Med */
		sellprice[] = {100000,35000,35000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//Gepanzerte
	class O_MRAP_02_F
	{
		type = "armored";
		sort = 0;
		trunkWeight = 65;
		fuelCapicity = 250;
		fuel = "diesel";
		garageFee[] = {200000,50000,50000}; /* Civ|Cop|Med */
		sellprice[] = {200000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_MRAP_01_F
	{
		type = "armored";
		sort = 1;
		trunkWeight = 65;
		fuelCapicity = 250;
		fuel = "diesel";
		garageFee[] = {200000,50000,50000}; /* Civ|Cop|Med */
		sellprice[] = {250000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_MRAP_01_hmg_F
	{
		type = "armored";
		sort = 2;
		trunkWeight = 65;
		fuelCapicity = 250;
		fuel = "diesel";
		garageFee[] = {500000,150000,150000}; /* Civ|Cop|Med */
		sellprice[] = {750000,250000,250000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_MRAP_03_F
	{
		type = "armored";
		sort = 3;
		trunkWeight = 65;
		fuelCapicity = 250;
		fuel = "diesel";
		garageFee[] = {250000,80000,80000}; /* Civ|Cop|Med */
		sellprice[] = {200000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_MRAP_03_hmg_F
	{
		type = "armored";
		sort = 4;
		trunkWeight = 65;
		fuelCapicity = 250;
		fuel = "diesel";
		garageFee[] = {250000,180000,180000}; /* Civ|Cop|Med */
		sellprice[] = {200000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//Karts
	class C_Kart_01_fuel_F
	{
		type = "atv";
		sort = 1;
		trunkWeight = 15;
		fuelCapicity = 10;
		fuel = "super";
		garageFee[] = {8000,8000,8000}; /* Civ|Cop|Med */
		sellprice[] = {45000,45000,45000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Kart_01_Red_F
	{
		type = "atv";
		sort = 2;
		trunkWeight = 15;
		fuelCapicity = 10;
		fuel = "super";
		garageFee[] = {8000,8000,8000}; /* Civ|Cop|Med */
		sellprice[] = {45000,45000,45000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Kart_01_Vrana_F
	{
		type = "atv";
		sort = 3;
		trunkWeight = 15;
		fuelCapicity = 10;
		fuel = "super";
		garageFee[] = {8000,8000,8000}; /* Civ|Cop|Med */
		sellprice[] = {45000,45000,45000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Kart_01_Blu_F
	{
		type = "atv";
		sort = 4;
		trunkWeight = 15;
		fuelCapicity = 10;
		fuel = "super";
		garageFee[] = {8000,8000,8000}; /* Civ|Cop|Med */
		sellprice[] = {45000,45000,45000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//Helis
	class B_Heli_Light_01_F
	{
		type = "air";
		sort = 0;
		trunkWeight = 25;
		fuelCapicity = 80;
		fuel = "kerosin";
		garageFee[] = {20000,12000,12000}; /* Civ|Cop|Med */
		sellprice[] = {50000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Heli_Light_01_civil_F
	{
		type = "air";
		sort = 1;
		trunkWeight = 40;
		fuelCapicity = 80;
		fuel = "kerosin";
		garageFee[] = {20000,12000,12000}; /* Civ|Cop|Med */
		sellprice[] = {50000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Heli_light_01_blue_F
	{
		type = "air";
		sort = 2;
		trunkWeight = 40;
		fuelCapicity = 80;
		fuel = "kerosin";
		garageFee[] = {20000,12000,12000}; /* Civ|Cop|Med */
		sellprice[] = {50000,50000,50000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Light_02_unarmed_F
	{
		type = "air";
		sort = 3;
		trunkWeight = 90;
		fuelCapicity = 250;
		fuel = "kerosin";
		garageFee[] = {30000,20000,15000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_Heli_Transport_02_F
	{
		type = "air";
		sort = 4;
		trunkWeight = 200;
		fuelCapicity = 350;
		fuel = "kerosin";
		garageFee[] = {60000,25000,20000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Heli_Transport_01_F
	{
		type = "air";
		sort = 5;
		trunkWeight = 200;
		fuelCapicity = 340;
		fuel = "kerosin";
		garageFee[] = {100000,30000,30000}; /* Civ|Cop|Med */
		sellprice[] = {500000,500000,500000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Heli_Transport_01_camo_F
	{
		type = "air";
		sort = 6;
		trunkWeight = 200;
		fuelCapicity = 340;
		fuel = "kerosin";
		garageFee[] = {100000,30000,30000}; /* Civ|Cop|Med */
		sellprice[] = {500000,500000,500000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class I_Heli_light_03_unarmed_F
	{
		type = "air";
		sort = 7;
		trunkWeight = 200;
		fuelCapicity = 340;
		fuel = "kerosin";
		garageFee[] = {150000,50000,50000}; /* Civ|Cop|Med */
		sellprice[] = {250000,250000,250000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Transport_04_F
	{
		type = "air";
		sort = 8;
		trunkWeight = 300;
		fuelCapicity = 300;
		fuel = "kerosin";
		garageFee[] = {75000,40000,50000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Transport_04_covered_F
	{
		type = "air";
		sort = 9;
		trunkWeight = 200;
		fuelCapicity = 300;
		fuel = "kerosin";
		garageFee[] = {75000,40000,50000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Transport_04_bench_F
	{
		type = "air";
		sort = 10;
		trunkWeight = 200;
		fuelCapicity = 300;
		fuel = "kerosin";
		garageFee[] = {75000,40000,50000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Transport_04_medevac_F
	{
		type = "air";
		sort = 11;
		trunkWeight = 200;
		fuelCapicity = 300;
		fuel = "kerosin";
		garageFee[] = {75000,40000,50000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Heli_Transport_04_fuel_F
	{
		type = "air";
		sort = 12;
		trunkWeight = 1000;
		fuelCapicity = 450;
		fuel = "kerosin";
		garageFee[] = {75000,40000,50000}; /* Civ|Cop|Med */
		sellprice[] = {440000,440000,440000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Heli_Transport_03_unarmed_F
	{
		type = "air";
		sort = 13;
		trunkWeight = 450;
		fuelCapicity = 450;
		fuel = "kerosin";
		garageFee[] = {65000,25000,25000}; /* Civ|Cop|Med */
		sellprice[] = {1600000,1600000,1600000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Plane_CAS_01_F
	{
		type = "plane";
		sort = 0;
		trunkWeight = 1200;
		fuelCapicity = 700;
		fuel = "kerosin";
		garageFee[] = {200000,100000,100000}; /* Civ|Cop|Med */
		sellprice[] = {2000000,2000000,2000000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//Boote
	class C_Rubberboat
	{
		type = "boat";
		sort = 0;
		trunkWeight = 60;
		fuelCapicity = 5;
		fuel = "super";
		garageFee[] = {1000,1000,1000}; /* Civ|Cop|Med */
		sellprice[] = {1500,1500,1500}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_SDV_01_F
	{
		type = "boat";
		sort = 1;
		trunkWeight = -1;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {1000,1000,1000}; /* Civ|Cop|Med */
		sellprice[] = {1000,1000,1000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Boat_Civil_01_F
	{
		type = "boat";
		sort = 2;
		trunkWeight = 250;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {5500,5500,5500}; /* Civ|Cop|Med */
		sellprice[] = {1500,1500,1500}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class C_Boat_Civil_01_police_F
	{
		type = "boat";
		sort = 3;
		trunkWeight = 300;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {1000,1000,1000}; /* Civ|Cop|Med */
		sellprice[] = {4095,4095,4095}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Boat_Transport_01_F
	{
		type = "boat";
		sort = 4;
		trunkWeight = 100;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {1000,1000,1000}; /* Civ|Cop|Med */
		sellprice[] = {2700,2700,2700}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class O_Boat_Armed_01_hmg_F
	{
		type = "boat";
		sort = 5;
		trunkWeight = 200;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {90000,30000,30000}; /* Civ|Cop|Med */
		sellprice[] = {7140,75000,75000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class B_Boat_Armed_01_minigun_F
	{
		type = "boat";
		sort = 5;
		trunkWeight = 200;
		fuelCapicity = 30;
		fuel = "super";
		garageFee[] = {90000,30000,30000}; /* Civ|Cop|Med */
		sellprice[] = {7140,75000,75000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	//Logistik
	class Box_IND_AmmoVeh_F
	{
		type = "log";
		sort = 0;
		trunkWeight = 150;
		garageFee[] = {10000,10000,10000}; /* Civ|Cop|Med */
		sellprice[] = {100000,100000,100000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
	class Land_Cargo20_blue_F
	{
		type = "log";
		sort = 1;
		trunkWeight = 400;
		garageFee[] = {25000,25000,25000}; /* Civ|Cop|Med */
		sellprice[] = {500000,500000,500000}; /* Civ|Cop|Med */
		impoundprice = 0;
	};
};