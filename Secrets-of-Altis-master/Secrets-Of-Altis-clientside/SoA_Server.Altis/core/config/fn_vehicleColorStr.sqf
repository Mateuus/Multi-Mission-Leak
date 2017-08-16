/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

switch (_vehicle) do
{

	case "C_Plane_Civil_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blaue Welle";};
			case 1: {_color = "Rote Linie";};
			case 2: {_color = "Blue Angel";};
			case 3: {_color = "Tribal";};
		};
	};

	case "C_Plane_Civil_01_racing_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blaue Welle";};
			case 1: {_color = "Rote Linie";};
			case 2: {_color = "Blue Angel";};
			case 3: {_color = "Tribal";};
		};
	};

	case "B_T_VTOL_01_infantry_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blau";};
			case 1: {_color = "Olivegrün";};
			case 2: {_color = "Polizei";};
		};
	};

	case "B_T_VTOL_01_vehicle_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blaue Welle";};
			case 1: {_color = "Rote Linie";};
			case 2: {_color = "Blue Angel";};
			case 3: {_color = "Großlasthelikopter";};
		};
	};

	case "B_Plane_CAS_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Business Class";};
			case 1: {_color = "Economy Class";};
		};
	};
	
	case "C_Quadbike_01_black_F": 
	{
		switch (_index) do
		{
			case 0: {_color = "E-Rollator";};
		};
	};

	case "O_T_LSV_02_unarmed_F": 
	{
		switch (_index) do
		{
			case 0: {_color = "Karg";};
			case 1: {_color = "Grüne Sechsecke";};
			case 2: {_color = "Schwarz";};
		};
	};

	case "B_T_LSV_01_unarmed_F": 
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Olivgrün";};
			case 2: {_color = "Sandfarben";};
			case 3: {_color = "Chaos";};
		};
	};
	
	case "C_Offroad_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Blau"};
			case 2: {_color = "Grün"};
			case 3: {_color = "Orange"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Braun"};
			case 7: {_color = "Olive"};
			case 8: {_color = "Rettungsjeep"};
			case 9: {_color = "Polizeijeep"};
		};
	};

	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Beige"};
			case 2: {_color = "Weiss"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Dunkelrot"};
			case 5: {_color = "Blauweiss"};
			case 6: {_color = "Schwarz"};
			case 7: {_color = "Gelb"};
			case 8: {_color = "Rettungsdienst"};
			case 9: {_color = "Polizei"};
			case 10: {_color = "Dimitri's Pizza"};
			case 11: {_color = "Black Magic"};
			case 12: {_color = "Gold (selten)"};
		};
	};
	
	case "I_G_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Unfallservice"};
		};
	};
	
	case "C_Boat_Civil_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Altis Travel"};
			case 1: {_color = "Luxusstil"};	
		};
	};
	
	case "C_Boat_Civil_01_rescue_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Luxusstil"};
			case 1: {_color = "Seenotrettung"};	
		};
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Grün";};
			case 2: {_color = "Blau";};
			case 3: {_color = "Dunkelblau";};
			case 4: {_color = "Gelb";};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Grau"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "Polizei"};
			case 9: {_color = "Broken Cat"};
			case 10: {_color = "Asiimov"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Rot"};
			case 1: {_color = "Dunkelblau"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Schwarz-Weiss"};
			case 4: {_color = "Rotbraun"};
			case 5: {_color = "Grün"};
			case 6: {_color = "Polizei"};
			//case 7: {_color = "SoA Support"};
			case 8: {_color = "Altis 95.8 Presse"};
			case 9: {_color = "Broken Cat"};
			case 10: {_color = "Eurocar"};
			case 11: {_color = "Asiimov"};
			case 12: {_color = "Gold (selten)"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dunkelrot";};
			case 1: {_color = "Polizei";};
			case 2: {_color = "Silber";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Bundespolizei"};
			case 5: {_color = "AHW-Firmenwagen"};
			case 6: {_color = "Abgespaced"};
			case 7: {_color = "Comic Graffiti"};
			case 8: {_color = "Hello Gitty"};
			case 9: {_color = "Graphit"};
			case 10: {_color = "Taxi"};
			case 12: {_color = "Pixelcar"};
			case 13: {_color = "GrayHawk"};
			case 14: {_color = "Gold (selten)"};
			case 15: {_color = "The Monster"};
			//case 16: {_color = "Salatmobil"};
			case 17: {_color = "Deutschlandfarben"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
			case 2: {_color = "Rettungsdienst"};
			case 3: {_color = "Eiswagen"};
			case 4: {_color = "Altis Pilsner"};
			case 7: {_color = "Altis Post"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Weiss"};
			case 1: {_color = "Rot"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Bundespolizei"};
		};
	};
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Titanschwarz"};
		};
	};
	
	case "C_Quadbike_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Braun"};
			case 1: {_color = "Digital Wüste"};
			case 2: {_color = "Schwarz"};
			case 3: {_color = "Blau"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiss"};
			case 6: {_color = "Digital Grün"};
			case 7: {_color = "Hunter Camouflage"};
			case 8: {_color = "Rebel Camouflage"};
			case 9: {_color = "GrayHawk"};
			case 10: {_color = "Polizei"};	
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Blau Zivil"};
			case 2: {_color = "Rot Zivil"};
			case 3: {_color = "Digital Grün"};
			case 4: {_color = "Blaulinie"};
			case 5: {_color = "Eliptisch"};
			case 6: {_color = "Furios"};
			case 7: {_color = "Jeans Blau"};
			case 8: {_color = "Rotlinie"};
			case 9: {_color = "Sonnenuntergang"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Wellenblau"};
			case 12: {_color = "Digital Rebell"};
			//case 13: {_color = "Luftrettung"};
			case 14: {_color = "Polizei"};
			case 15: {_color = "Altis 95.8 Presse"};
			case 16: {_color = "Luftrettung"};
			case 17: {_color = "Andreas Haltstopp"};
			case 18: {_color = "Andreas Wanted"};
			case 19: {_color = "Die Timpsons"};
			case 20: {_color = "Unicorn-Power"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Blau Zivil"};
			case 2: {_color = "Rot Zivil"};
			case 3: {_color = "Digital Grün"};
			case 4: {_color = "Blaulinie"};
			case 5: {_color = "Eliptisch"};
			case 6: {_color = "Furios"};
			case 7: {_color = "Jeans Blau"};
			case 8: {_color = "Rotline"};
			case 9: {_color = "Sonnenuntergang"};
			case 10: {_color = "Vrana"};
			case 11: {_color = "Wellenblau"};
			case 12: {_color = "Digital Rebell"};
			//case 13: {_color = "Luftrettung"};
			case 14: {_color = "Polizei"};
			case 15: {_color = "Altis 95.8 Presse"};
			case 16: {_color = "Luftrettung"};
			case 17: {_color = "Andreas Haltstopp"};
			case 18: {_color = "Andreas Wanted"};
			//case 19: {_color = "SoA Support"};
			case 20: {_color = "DDR-Look"};
			case 21: {_color = "Die Timpsons"};
			case 22: {_color = "Unicorn-Power"};		
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Weiss / Blau"};
			case 2: {_color = "Digital Grün"};
			case 3: {_color = "Digital Wüste"};
			case 4: {_color = "Luftrettung"};
		};
	};
	
	case "B_Truck_01_mover_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Abschleppfahrzeug"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geheimdienst"};
			case 1: {_color = "Polizei"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Bundespolizei"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Geheimdienst"};
			case 1: {_color = "Polizei"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Polizei"};
			case 3: {_color = "Rettungsdienst"};
			case 4: {_color = "Altis Kindl"};
			case 5: {_color = "Roco Möbelwagen"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Schwarz"};
		};
	};
	
	case "I_Truck_02_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "ABC-Fahrzeug"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
		};
	};
	
	case "O_Heli_Attack_02_Schwarz_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "BlackWhiteness©"};
			case 1: {_color = "Majestätisch"};
			case 2: {_color = "Luftrettung"};
			case 3: {_color = "AltisOne"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
		};
	};
	
	case "O_Heli_Transport_04_medevac_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Luftrettung"};
		};
	};
	
	case "O_Heli_Transport_04_covered_F":
	{
		switch(_index) do
		{
			case 0: {_color = "GrayHawk"};
		};
	};
	
	case "O_Heli_Transport_04_bench_F":
	{
		switch(_index) do
		{
			case 0: {_color = "GrayHawk"};
		};
	};
	
	case "O_Heli_Transport_04_box_F":
	{
		switch(_index) do
		{
			case 0: {_color = "GrayHawk"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Stahllegierung"};
			case 1: {_color = "Unicorn Power"};
			case 2: {_color = "Gold (episch)"};
		};
	};
	
	case "C_Rubberboat":
	{
		switch (_index) do
		{
			case 0: {_color = "Rettungsboot"};
		};
	};

	case "C_Scooter_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Grau"};
			case 1: {_color = "Blau"};
			case 2: {_color = "Weiss"};
			case 3: {_color = "Schwarz"};
			case 4: {_color = "Limettengrün"};
			case 5: {_color = "Rot"};
			case 6: {_color = "Gelb"};
		};
	};

	case "I_C_Boat_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
			case 1: {_color = "Blauweiss"};
		};
	};
	
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Silver and Gold"};
			case 3: {_color = "Fire and Ice"};
		};
	};
	
	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Silver and Gold"};
			case 3: {_color = "Fire and Ice"};
		};
	};

	case "B_Truck_01_ammo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Silver and Gold"};
			case 3: {_color = "Fire and Ice"};
			case 4: {_color = "Familie Ludolf"};
		};
	};
	
	case "B_Truck_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Silver and Gold"};
			case 3: {_color = "Fire and Ice"};
		};
	};
	
	case "B_Truck_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Silver and Gold"};
			case 3: {_color = "Fire and Ice"};
		};
	};
	
	case "O_Truck_02_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
		};
	};

	case "O_Truck_03_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Jungle Spray"};
			case 3: {_color = "Salty Style"};
		};
	};

	case "O_Truck_03_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Jungle Spray"};
			case 3: {_color = "Salty Style"};
		};
	};

	case "O_Truck_03_device_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Jungle Spray"};
			case 3: {_color = "Salty Style"};
		};
	};

	case "O_Truck_03_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Jungle Spray"};
			case 3: {_color = "Salty Style"};
		};
	};

	case "O_Truck_03_ammo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Original"};
			case 1: {_color = "GrayHawk"};
			case 2: {_color = "Jungle Spray"};
			case 3: {_color = "Salty Style"};
		};
	};
};

_color;