/*
	File: fn_vehicleColorStr.sqf
	

	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = param [0,"",[""]];
_index = param [1,-1,[0]];
_color = "";

switch (_vehicle) do
{
	case "ivory_supra_tuned" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Alpine Silver";};
			case 1:  {_color = "Anthracite";};
			case 2:  {_color = "Baltic Blue";};
			case 3:  {_color = "Black";};
			case 4:  {_color = "Deep Jewel Green Pearl";};
			case 5:  {_color = "Renaissance Red";};
			case 6:  {_color = "Royal Sapphire Pearl";};
			case 7:  {_color = "Super White";};
			case 8:  {_color = "Blacked Out";};
			case 9:  {_color = "Walker";};
		};
	};
	case "ivory_supra" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Alpine Silver";};
			case 1:  {_color = "Anthracite";};
			case 2:  {_color = "Baltic Blue";};
			case 3:  {_color = "Black";};
			case 4:  {_color = "Deep Jewel Green Pearl";};
			case 5:  {_color = "Renaissance Red";};
			case 6:  {_color = "Royal Sapphire Pearl";};
			case 7:  {_color = "Super White";};
		};
	};
	case "ivory_m3_gts" :
	{
		switch (_index) do
		{
			case 0: {_color = "Classic";};
			case 1: {_color = "Kit Black";};
			case 2: {_color = "Forest Green";};
			case 3: {_color = "Candy Red";};
			case 4: {_color = "Crispy Blue";};
			case 5: {_color = "Deluxe Blue";};
			case 6: {_color = "Icy White";};
			case 7: {_color = "Special";};
			case 8: {_color = "C9";};
			case 9: {_color = "Nandoz";};
		};
	};
	case "ivory_m3" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Alpine White";};
			case 1:  {_color = "Austin Yellow";};
			case 2:  {_color = "Azurite Black";};
			case 3:  {_color = "Black Sapphire";};
			case 4:  {_color = "Mineral Gray";};
			case 5:  {_color = "Mineral White";};
			case 6:  {_color = "Moonstone";};
			case 7:  {_color = "Pyrite Brown";};
			case 8:  {_color = "Sakhir Orange";};
			case 9:  {_color = "Silverstone";};
			case 10: {_color = "Tanzanite Blue";};
			case 11: {_color = "Yas Marina Blue";};
		};
	};
	case "ivory_isf" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Liqud Platinum";};
			case 1:  {_color = "Matador Red Mica";};
			case 2:  {_color = "Nebula Gray Pearl";};
			case 3:  {_color = "Obsidian";};
			case 4:  {_color = "Ultra White";};
			case 5:  {_color = "Ultrasonic Blue Mica";};
		};
	};
	case "ivory_lp560" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Orange";};
			case 11: {_color = "Fidanza";};
			case 12: {_color = "Koni";};
			case 13: {_color = "KW";};
			case 14: {_color = "Recaro";};
			case 15: {_color = "Blue Ruthless";};
			case 16: {_color = "Red Savage";};
			case 17: {_color = "Galaxy";};
			case 18: {_color = "Dark Knight";};
			case 19: {_color = "Purrardo";};
			case 20: {_color = "25th";};
		};
	};
	case "ivory_wrx_marked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};

	case "ivory_wrx_slicktop" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};


	case "ivory_m3_marked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};
	
	case "ivory_m3_slicktop" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};

	case "ivory_isf_marked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};
	
	case "ivory_isf_slicktop" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Sheriff Patrol";};
			case 1:  {_color = "Sheriff Supervisor";};
			case 2:  {_color = "StateTrooper Patrol";};
			case 3:  {_color = "StateTrooper Supervisor";};
		};
	};

	case "ivory_m3_unmarked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Gray";};
			case 2:  {_color = "White";};
		};
	};


	case "ivory_isf_unmarked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Gray";};
			case 2:  {_color = "White";};
		};
	};

	case "ivory_wrx_unmarked" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Gray";};
			case 2:  {_color = "White";};
		};
	};

	case "ivory_wrx_med_ems" :
	{
		switch (_index) do
		{
			case 0:  {_color = "EMS";};
		};
	};
	case "ivory_wrx" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Red & Black";};
			case 11: {_color = "Camo";};
			case 12: {_color = "Nyan";};
			case 13: {_color = "Black & Gray";};
			case 14: {_color = "RPD";};
			case 15: {_color = "Monster";};
			case 16: {_color = "Gray Stripe";};
			case 17: {_color = "Candy";};
			case 18: {_color = "Sport Orange";};
			case 19: {_color = "Doritos";};
			case 20: {_color = "Classic";};
			case 21: {_color = "Candy";};
			case 22: {_color = "Orange";};
			case 23: {_color = "Russell";};
		};
	};
	case "ivory_gt500" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Gray on Black";};
			case 11: {_color = "Black on Gray";};
			case 12: {_color = "White on Red";};
			case 13: {_color = "Blue on White";};
			case 14: {_color = "Orange";};
		};
	};
	case "ivory_c" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black";};
			case 1: {_color = "Gold";};
			case 2: {_color = "Gray";};
			case 3: {_color = "Green";};
			case 4: {_color = "Pink";};
			case 5: {_color = "Purple";};
			case 6: {_color = "Red";};
			case 7: {_color = "White";};
			case 8: {_color = "Carillo";};
			case 9: {_color = "8";};
			case 10: {_color = "Revo";};
			case 11: {_color = "Ksport";};
			case 12: {_color = "Gee";};
			case 13: {_color = "Race";};
			case 14: {_color = "Goldee";};
			case 15: {_color = "Camo";};
			case 16: {_color = "Velvet";};
			case 17: {_color = "Blue";};
			case 18: {_color = "Teal";};
			case 19: {_color = "Wedding";};
			case 20: {_color = "Orange";};
		};
	};
	case "ivory_lfa" :
	{
		switch (_index) do
		{
			case 0: {_color = "Black";};
			case 1: {_color = "Gold";};
			case 2: {_color = "Gray";};
			case 3: {_color = "Green";};
			case 4: {_color = "Pink";};
			case 5: {_color = "Purple";};
			case 6: {_color = "Red";};
			case 7: {_color = "White";};
			case 8: {_color = "Speed Hunter 1";};
			case 9: {_color = "Speed Hunter 2";};
			case 10: {_color = "G Reddy";};
			case 11: {_color = "Hotchkis";};
			case 12: {_color = "Falken";};
			case 13: {_color = "WTF";};
			case 14: {_color = "Monty";};
			case 15: {_color = "Nyan";};
			case 16: {_color = "Deuce";};
			case 17: {_color = "Woodland";};
			case 18: {_color = "Neon";};
			case 19: {_color = "Tokyo";};
			case 20: {_color = "Supreme";};
			case 21: {_color = "Blue";};
			case 22: {_color = "Teal";};
			case 23: {_color = "Orange";};
		};
	};
	case "IVORY_PRIUS" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Sports 1";};
			case 11: {_color = "Sports 2";};
			case 12: {_color = "Sports 3";};
			case 13: {_color = "Sports 4";};
			case 14: {_color = "Taxi";};
		};
	};
	case "IVORY_R8SPYDER" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Sports 1";};
			case 11: {_color = "Sports 2";};
			case 12: {_color = "Sports 3";};
			case 13: {_color = "Sports 4";};
		};
	};
	case "IVORY_R8" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Sports 1";};
			case 11: {_color = "Sports 2";};
			case 12: {_color = "Sports 3";};
			case 13: {_color = "Sports 4";};
		};
	};
	case "IVORY_REV" :
	{
		switch (_index) do
		{
			case 0:  {_color = "Black";};
			case 1:  {_color = "Blue";};
			case 2:  {_color = "Gold";};
			case 3:  {_color = "Gray";};
			case 4:  {_color = "Green";};
			case 5:  {_color = "Pink";};
			case 6:  {_color = "Purple";};
			case 7:  {_color = "Red";};
			case 8:  {_color = "Teal";};
			case 9:  {_color = "White";};
			case 10: {_color = "Sports 1";};
			case 11: {_color = "Sports 2";};
			case 12: {_color = "Sports 3";};
			case 13: {_color = "Sports 4";};
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
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Ion"};
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
		};
	};
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Sheriff"};
			case 1: {_color = "Ion"};
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
			case 14: {_color = "EMS"};
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
			case 4: {_color = "EMS"};
		};
	};
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
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
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
		};
	};
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "VIP"};
			case 1: {_color = "Police"};
		};
	};
	case "O_Heli_Transport_04_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	case "O_Heli_Transport_04_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	case "O_Heli_Transport_04_medevac_F":
	{
		switch (_index) do
		{
			case 0: {_color = "EMS"};
		};
	};
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
};

_color;
