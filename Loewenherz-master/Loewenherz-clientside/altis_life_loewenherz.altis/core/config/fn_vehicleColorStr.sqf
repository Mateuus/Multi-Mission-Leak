/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = param [0,"",[""]];
_index = param [1,-1,[0]];
_color = "";

switch (_vehicle) do
{

	case "B_Quadbike_01_F": // Quadbike
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Blue"};
			case 2: {_color = "Red"};
			case 3: {_color = "White"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Hunter Camo"};
			case 6: {_color = "Laser"};
			case 7: {_color = "Lady"};
			case 8: {_color = "Cop"};
			case 9: {_color = "Medic"};
		};
	};

	case "C_Offroad_01_F": // Offroad
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Cyan"};
			case 7: {_color = "Manga"};
			case 8: {_color = "Sponsored"};
			case 9: {_color = "Mechanical"};
			case 10: {_color = "Cop"};
			case 11: {_color = "Platzhalter Cop"};
			case 12: {_color = "Medic"};
			case 13: {_color = "Sec"};
		};
	};

	case "I_G_Offroad_01_F": // Offroad ADAC
	{
		switch (_index) do
		{
			case 0: {_color = "ADAC";};
		};
	};

	case "B_G_Offroad_01_F": // Offroad Rebel
	{
		switch (_index) do
		{
			case 0: {_color = "Lion";};
			case 1: {_color = "Lion Tarnung";};
		};
	};

	case "B_G_Offroad_01_armed_F": // Offroad HMG
	{
		switch (_index) do
		{
			case 0: {_color = "Lion"};
			case 1: {_color = "Lion Tarnung"};
		};
	};

	case "C_Hatchback_01_F": // Hatckback
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
			case 8: {_color = "Barbie"};
			case 9: {_color = "Weed"};
			case 10: {_color = "Fire"};
			case 11: {_color = "Matrix"};
			case 12: {_color = "Erotik"};
		};
	};

	case "C_Hatchback_01_sport_F": // Hatckback Sport
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Ferrari"};
			case 7: {_color = "Porsche"};
			case 8: {_color = "Batman"};
			case 9: {_color = "Matrix"};
			case 10: {_color = "Fire"};
			case 11: {_color = "Erotik"};
			case 12: {_color = "Cop"};
			case 13: {_color = "Medic"};
			case 14: {_color = "Security"};
		};
	};

	case "C_SUV_01_F": // SUV
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Black";};
			case 2: {_color = "Silver";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Ghostrider";};
			case 5: {_color = "Cartoon";};
			case 6: {_color = "Fire";};
			case 7: {_color = "Urban Camo";};
			case 8: {_color = "ADAC";};
			case 9: {_color = "Makaveli";};
			case 10: {_color = "Cop Civil";};
			case 11: {_color = "Cop";};
			case 12: {_color = "Cop A.T.U.";};
			case 13: {_color = "Medic";};
			case 14: {_color = "Bounty Hunter";};
			case 15: {_color = "SEC";};
			case 16: {_color = "BMW";};
			case 17: {_color = "Taxi";};
			case 18: {_color = "Black SEC";};
		};
	};

	case "B_MRAP_01_F": // Hunter
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
			case 1: {_color = "Medic"};
		};
	};

	case "B_MRAP_01_hmg_F": // Hunter HMG
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
		};
	};

	case "C_Van_01_transport_F": // Truck
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};

	case "C_Van_01_box_F": // Truck Boxer
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "Medic"};
		};
	};

	case "B_Truck_01_mover_F":  // Hemtt Mover
	{
		switch (_index) do
		{
			case 0: {_color = "Medic"};
		};
	};

	case "O_Truck_02_Ammo_F": // Zamak COP/SEC
	{
		switch (_index) do
		{
			case 0: {_color = "COP"};
			case 1: {_color = "SEC"};
		};
	};

	case "I_Truck_02_box_F":  // Zamak Medic
	{
		switch (_index) do
		{
			case 0: {_color = "Medic"};
		};
	};

	case "I_Truck_02_medical_F":  // Zamak Sanitätsfahrzeug
	{
		switch (_index) do
		{
			case 0: {_color = "Medic"};
		};
	};

	case "I_Truck_02_covered_F": // Zamak covered
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Weed"};
			case 2: {_color = "TREiBER"};
			case 3: {_color = "Lion Cola"};
			case 4: {_color = "Graffiti"};
		};
	};

	case "I_Truck_02_transport_F": // Zamak closed
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Weed"};
			case 2: {_color = "TREiBER"};
			case 3: {_color = "Lion Cola"};
		};
	};

	case "O_MRAP_02_F": // Ifrit
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel"};
			case 1: {_color = "Stormtroop"};
			case 2: {_color = "bloody"};
			case 3: {_color = "KillerZ"};
			case 4: {_color = "Viper"};
		};
	};

	case "I_MRAP_03_F": // Security  Strider
	{
		switch (_index) do
		{
			case 0: {_color = "Sec"};
		};
	};
    
	case "B_APC_Wheeled_01_cannon_F": // Marshall APC
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
		};
	};

	case "C_Heli_Light_01_civil_F": // M-900
	{
		switch (_index) do
		{
			case 0: {_color = "ADAC";};
			case 1: {_color = "Monster";};
			case 2: {_color = "White";};
			case 3: {_color = "COP";};
			case 4: {_color = "Medic";};
			case 5: {_color = "Security";};
		};
	};

	case "B_Heli_Light_01_F": // Hummingbird
	{
		switch (_index) do
		{
			case 0: {_color = "Civ Blue"};
			case 1: {_color = "Civ Red"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Blueline"};
			case 4: {_color = "Elliptical"};
			case 5: {_color = "Furious"};
			case 6: {_color = "Jeans Blue"};
			case 7: {_color = "Speedy Redline"};
			case 8: {_color = "Sunset"};
			case 9: {_color = "Vrana"};
			case 10: {_color = "Waves Blue"};
			case 11: {_color = "Monster"};
			case 12: {_color = "White"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "Cop"};
			case 15: {_color = "Medic"};
			case 16: {_color = "Sec"};
		};
	};

	case "O_Heli_Light_02_unarmed_F": // Orca
	{
		switch (_index) do
		{
			case 0: {_color = "Blue/White"};
			case 1: {_color = "Green"};
			case 2: {_color = "Black/White"};
			case 3: {_color = "ADAC"};
			case 4: {_color = "Desert Digi"};
			case 5: {_color = "Digi Green"};
			case 6: {_color = "Medic"};
		};
	};

	case "I_Heli_Transport_02_F": // Mohawk
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "Medic"};
			case 3: {_color = "Sec"};
		};
	};

	case "B_Heli_Transport_03_unarmed_F": // Huron Donator
	{
		switch (_index) do
		{
			case 0: {_color = "Dark"};
			case 1: {_color = "Dragon"};
			case 2: {_color = "Stormtrooper"};
		};
	};

	case "O_Heli_Transport_04_F": // Taru Cops
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
		};
	};

	case "O_Heli_Transport_04_bench_F": // Taru Donator
	{
		switch (_index) do
		{
			case 0: {_color = "Shitty"};
			case 1: {_color = "Cop"};
		};
	};

	case "I_Heli_light_03_unarmed_F": // Hellcat
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
			case 1: {_color = "Green"};
		};
	};

	case "B_Heli_Transport_01_F": // Ghosthawk
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
			case 1: {_color = "Coast Guard"};
		};
	};

	case "B_Heli_Transport_01_camo_F": // Ghosthawk Rebellen
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel crappy"};
			case 1: {_color = "Rebel style"};
		};
	};
    
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
		};
	};

// Container

	case "Land_Pod_Heli_Transport_04_bench_F": // Taru pod bench
	{
		switch (_index) do
		{
			case 0: {_color = "normal"};
			case 1: {_color = "cop"};
		};
	};

	case "Land_Pod_Heli_Transport_04_covered_F": // Taru pod bench covered
	{
		switch (_index) do
		{
			case 0: {_color = "grey"};
			case 1: {_color = "grey"};
		};
	};

	case "Land_Pod_Heli_Transport_04_box_F": // Taru transport Box
	{
		switch (_index) do
		{
			case 0: {_color = "grey"};
		};
	};

	case "Land_Pod_Heli_Transport_04_medevac_F": // Medic Container
	{
		switch (_index) do
		{
			case 0: {_color = "Medic"};
		};
	};

};
_color;