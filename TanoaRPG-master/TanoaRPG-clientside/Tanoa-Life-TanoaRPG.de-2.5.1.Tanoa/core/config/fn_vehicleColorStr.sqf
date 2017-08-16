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
	case "B_Truck_01_mover_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "O_Heli_Transport_04_F":
	{
		switch (_index) do
		{
			case 0: {_color = "ADAC"};
		};
	};

	case "O_Heli_Transport_04_medevac_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Medic"};
		};
	};

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
			case 6: {_color = "Black"};
			case 7: {_color = "Polizei"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "Monster"};
			case 10: {_color = "Imperium"};
			case 11: {_color = "A-Team"};
			case 12: {_color = "QT"};
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
			case 8: {_color = "Polizei"};
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
			case 6: {_color = "Polizei"};
			case 7: {_color = "Metallica"};
			case 8: {_color = "Medic"};
			case 9: {_color = "A-Team"};
			case 10: {_color = "QT"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei";};
			case 1: {_color = "Silver";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Medic";};
			case 4: {_color = "HyperBeast";};
			case 5: {_color = "Joker";};
			case 6: {_color = "QT";};
			case 7: {_color = "AAN World News";};
			case 8: {_color = "Schwarz";};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
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
			case 0: {_color = "Polizei"};
			case 1: {_color = "Brown"};
			case 2: {_color = "Digi Desert"};
			case 3: {_color = "Black"};
			case 4: {_color = "Blue"};
			case 5: {_color = "Red"};
			case 6: {_color = "White"};
			case 7: {_color = "Digi Green"};
			case 8: {_color = "Hunter Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "Polizei"};
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
			case 14: {_color = "Medic"};
			case 15: {_color = "Imperium"};
			case 16: {_color = "A-Team"};
			case 17: {_color = "QT"};
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
			case 4: {_color = "ADAC"};
			case 5: {_color = "Medic"};
			case 6: {_color = "Polizei"};
			case 7: {_color = "A-Team"};
			case 8: {_color = "QT"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Braun"};
			case 1: {_color = "Grau Tarnfleck"};
			case 2: {_color = "Medic"};
			case 3: {_color = "Polizei"};
			case 4: {_color = "Imperium"};
			case 5: {_color = "A-Team"};
		};
	};

	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebellen Tarnung"};
			case 1: {_color = "FleckTarn (Rot)"};
			case 2: {_color = "Totenkopf"};
			case 3: {_color = "Imperium"};
			case 4: {_color = "A-Team"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
			case 2: {_color = "QT"};
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
			case 2: {_color = "Medic"};
			case 3: {_color = "Polizei"};
		};
	};

	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Fehler"};
			case 0: {_color = "Polizei"};
			case 1: {_color = "ADAC"};
		};
	};
	
	
	/*
	case "I_Heli_light_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	*/
	
	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
	case "C_Offroad_01_repair_F":
	{
		switch (_index) do
		{
			case 0: {_color = "ADAC"};
		};
	};

	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digi Grün"};
			case 1: {_color = "Camo"};
			case 2: {_color = "Polizei"};
			case 3: {_color = "A-Team"};
		};
	};
	case "B_Truck_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digi Grün"};
			case 1: {_color = "Hello Kitty"};
			case 2: {_color = "QT"};
		};
	};	
	case "B_Truck_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digi Grün"};
			case 1: {_color = "Hello Kitty"};
			case 2: {_color = "ADAC"};
		};
	};
	case "B_Truck_01_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digi Grün"};
			case 1: {_color = "Hello Kitty"};
		};
	};
	case "B_Truck_01_ammo_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Digi Grün"};
			case 1: {_color = "Hello Kitty"};
		};
	};
	//Apex
	case "C_Offroad_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Schwarz"};
			case 1: {_color = "Blau"};
			case 2: {_color = "Grün"};
			case 3: {_color = "Orange"};
			case 4: {_color = "Rot"};
			case 5: {_color = "Weiß"};
			case 6: {_color = "Braun"};
			case 7: {_color = "Olive"};
			case 8: {_color = "Polizei"};
		};
	};
	
	case "C_Scooter_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "CO"};
			case 1: {_color = "Schwarz"};
			case 2: {_color = "Blau"};
			case 3: {_color = "Grau"};
			case 4: {_color = "Lime"};
			case 5: {_color = "Rot"};
			case 6: {_color = "Gelb"};
		};
	};
	
	case "C_Plane_Civil_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Racer"};
			case 1: {_color = "Racer"};
			case 2: {_color = "RedLine"};
			case 3: {_color = "RedLine"};
			case 4: {_color = "Wave"};
			case 5: {_color = "Wave"};
			case 6: {_color = "Tribal"};
			case 7: {_color = "Tribal"};
		};
	};
	
	case "B_T_LSV_01_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Polizei"};
		};
	};
	
};


_color;