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
	case "C_Offroad_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "ADAC"};
			case 7: {_color = "Gay"};
			case 8: {_color = "Holz"};
			case 9: {_color = "Cop"};
			case 10: {_color = "PRS"};
			case 11: {_color = "Monster"};
			case 12: {_color = "Dodge"};
			case 13: {_color = "Zoll"};
			case 14: {_color = "Event"};
		};
	};
	
	case "C_Offroad_02_unarmed_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Blau";};
			case 2: {_color = "Grün";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Rot";};
			case 5: {_color = "Weiß"};
			case 6: {_color = "Braun"};
			case 7: {_color = "Olive"};
		};
	};
	
	case "B_T_LSV_01_unarmed_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Olive";};
			case 2: {_color = "Sand";};
			case 3: {_color = "Tarn";};
			case 4: {_color = "Cop";};
		};
	};
	
	case "O_T_LSV_02_unarmed_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Karg";};
			case 2: {_color = "Grün";};
			case 3: {_color = "Cop";};
		};
	};
	
	case "I_C_Boat_Transport_02_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz";};
			case 1: {_color = "Türkis";};
		};
	};
	
	case "C_Offroad_01_repair_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Adac";};
			case 1: {_color = "PRS";};
		};
	};
	
	case "I_MRAP_03_hmg_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Cop";};
		};
	};
	
		case "O_Plane_CAS_02_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Grau Privat Jet";};
			case 1: {_color = "Rot/Weiß Privat Jet";};
		};
	};
	
	case "I_Truck_02_fuel_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Standard";};
		};
	};
	
	case "C_Hatchback_01_F":
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
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "Cop"};
			case 7: {_color = "Hello Kitty"};
			case 8: {_color = "Monster"};
			case 9: {_color = "Metallica"};
			case 10: {_color = "Impreza"};
			case 11: {_color = "Assimo"};
			case 13: {_color = "LoP Edition"};
			case 14: {_color = "Hello Kitty"};
			case 15: {_color = "Monster"};
			case 16: {_color = "Metallica"};
			case 17: {_color = "Impreza"};
			case 18: {_color = "Assimo"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Black";};
			case 2: {_color = "Silver";};
			case 3: {_color = "Orange";};
			case 4: {_color = "Cop Schwarz";};
			case 5: {_color = "Carbon";};
			case 6: {_color = "Cop2";};
			case 7: {_color = "Zoll";};
			case 8: {_color = "Monster";};
			case 9: {_color = "Priester";};
			case 10: {_color = "PRS";};
			case 11: {_color = "City";};
			case 12: {_color = "SWAT";};
			case 13: {_color = "empty";};
			case 14: {_color = "Weihnachten";};
			case 15: {_color = "Event Skin";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
			case 2: {_color = "PRS"};
			case 3: {_color = "Black"};
		};
	};
	
	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Polizei"};
			case 2: {_color = "Standard"};
		};
	};	
	
	case "B_Truck_01_mover_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Adac"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
			case 9: {_color = "Event"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Zivil"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "EMS White"};
			case 15: {_color = "Cop"};
			case 16: {_color = "ADAC"};
			case 17: {_color = "Monster"};
			case 18: {_color = "Blueline"};
			case 19: {_color = "Elliptical"};
			case 20: {_color = "Furious"};
			case 21: {_color = "Jeans Blue"};
			case 22: {_color = "Speedy Redline"};
			case 23: {_color = "Sunset"};
			case 24: {_color = "Vrana"};
			case 25: {_color = "Waves Blue"};
			case 26: {_color = "Schwarz"};
			case 27: {_color = "Schwarz"};
			case 28: {_color = "PRS"};
			case 29: {_color = "leer"};
			case 30: {_color = "empty"};
			case 31: {_color = "SWAT"};
			case 32: {_color = "leer"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Desert Digi"};
			case 4: {_color = "PRS"};
			case 5: {_color = "White / Blue"};
			case 6: {_color = "Schwarz"};
			case 7: {_color = "Schwarz"};
			case 8: {_color = "BioSpecs"};
			case 9: {_color = "PRS"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Blueline"};
			case 1: {_color = "Digital"};
			case 2: {_color = "elliptical"};
			case 3: {_color = "furious"};
			case 4: {_color = "graywatcher"};
			case 5: {_color = "jeans"};
			case 6: {_color = "light"};
			case 7: {_color = "schadow"};
			case 8: {_color = "sheriff"};
			case 9: {_color = "speedy"};
			case 10: {_color = "sunset"};
			case 11: {_color = "vrana"};
			case 12: {_color = "wasp"};
			case 13: {_color = "wave"};
			case 14: {_color = "Blueline"};
			case 15: {_color = "Digital"};
			case 16: {_color = "elliptical"};
			case 17: {_color = "furious"};
			case 18: {_color = "graywatcher"};
			case 19: {_color = "jeans"};
			case 20: {_color = "light"};
			case 21: {_color = "schadow"};
			case 22: {_color = "sheriff"};
			case 23: {_color = "speedy"};
			case 24: {_color = "sunset"};
			case 25: {_color = "vrana"};
			case 26: {_color = "wasp"};
			case 27: {_color = "wave"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Grün"};
			case 1: {_color = "BHC"};
			case 2: {_color = "Cop"};
			case 3: {_color = "BHC Skin"};
			case 4: {_color = "SWAT"};
			case 5: {_color = "DM Skin"};
		//	case 6: {_color = "RH Skin"};
		};
	};
	
	case "O_Heli_Transport_04_bench_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Standard"};
			case 1: {_color = "Standard"};
		};
	};
	
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Cop"};
			case 1: {_color = "PRS"};
			case 2: {_color = "Weiß Grau Tarn"};
			case 3: {_color = "SWAT"};
			case 4: {_color = "Standard"};
			case 5: {_color = "DM Skin"};
			case 6: {_color = "X Skin"};
			case 7: {_color = "empty Skin"};
			case 8: {_color = "leer"};
		//	case 9: {_color = "RH Skin"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Regular"};
			case 1: {_color = "BHC"};
			case 2: {_color = "Grau"};
			case 3: {_color = "Gelb"};
			case 4: {_color = "Rot"};
		//	case 5: {_color = "RH"};
			case 6: {_color = "BHC"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Zivilist"};
			case 1: {_color = "BHC"};
			case 2: {_color = "Cop"};
			case 3: {_color = "TF"};
			case 4: {_color = "BHC Skin"};
			case 5: {_color = "X Skin"};
			case 6: {_color = "Zivilist"};
			case 7: {_color = "Blau Digital"};
			case 8: {_color = "Safari"};
			case 9: {_color = "offen"};
			case 10: {_color = "PRS"};
			case 11: {_color = "Beim Admin Melden"};
			case 12: {_color = "SWAT"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Berliner Kindl"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Berliner Kindl"};
			case 4: {_color = "Orange"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "WTA"};
			case 3: {_color = "Ion"};
			case 4: {_color = "Dahoman"};
			case 5: {_color = "PRS"};
		};
	};
};

_color;