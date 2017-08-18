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
	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red"};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Dodge RAM"};
			case 7: {_color = "Rebel Camo"};
			case 8: {_color = "Police"};
			case 9: {_color = "Highway"};
			case 10: {_color = "EMS"};
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
			case 8: {_color = "Channel 7"};
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
			case 6: {_color = "Highway"};
			case 7: {_color = "EMS"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Camo";};
		};
	};
	
	case "O_MRAP_02_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Camo";};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Silver";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Taxi";};
			case 4: {_color = "Police";};
			case 5: {_color = "Undercover";};
			case 6: {_color = "Patrol";};
			case 7: {_color = "Highway";};
			case 8: {_color = "Interceptor";};
			case 9: {_color = "Highway Interceptor";};
			case 10: {_color = "EMS";};
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
			case 9: {_color = "Police"};
		};
	};

	case "B_Heli_Transport_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police 1"};
			case 1: {_color = "Police 2"};
			case 2: {_color = "Highway"};
			case 3: {_color = "Black"};
			case 4: {_color = "Civ Blue"};
			case 5: {_color = "Civ Red"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Blueline"};
			case 8: {_color = "Elliptical"};
			case 9: {_color = "Furious"};
			case 10: {_color = "Jeans Blue"};
			case 11: {_color = "Speedy Redline"};
			case 12: {_color = "Sunset"};
			case 13: {_color = "Vrana"};
			case 14: {_color = "Waves Blue"};
			case 15: {_color = "Rebel Wasp"};
			case 16: {_color = "Rebel Camo"};
			case 17: {_color = "Medic"};
		};
	};
	
	case "C_Heli_Light_01_civil_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police 1"};
			case 1: {_color = "Police 2"};
			case 2: {_color = "Highway"};
			case 3: {_color = "Black"};
			case 4: {_color = "Civ Blue"};
			case 5: {_color = "Civ Red"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Blueline"};
			case 8: {_color = "Elliptical"};
			case 9: {_color = "Furious"};
			case 10: {_color = "Jeans Blue"};
			case 11: {_color = "Speedy Redline"};
			case 12: {_color = "Sunset"};
			case 13: {_color = "Vrana"};
			case 14: {_color = "Waves Blue"};
			case 15: {_color = "Channel 7"};
		};
	};
	
	case "B_Heli_Light_01_armed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Rebel Wasp"};
			case 1: {_color = "Rebel Camo"};
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
			case 4: {_color = "Medic"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Bounty Hunter"};
			case 1: {_color = "Police"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
		};
	};
	
	case "I_MRAP_03_hmg_F":
	{
		switch (_index) do
		{
			case 0: {_color = "SWAT"};
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
			case 0: {_color = "Black"};
		};
	};
	
	case "B_APC_Tracked_01_CRV_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
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
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "Rebel Camo"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Light_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police"};
		};
	};
};

_color;