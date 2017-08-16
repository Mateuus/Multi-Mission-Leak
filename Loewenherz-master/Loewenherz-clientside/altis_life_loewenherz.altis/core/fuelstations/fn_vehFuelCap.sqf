/*
	File: fn_vehFuelCap.sqf
	Author: MarioF
	
	Description:
	Holds the Fuel Capacity of all vehicle 
*/

private["_veh"];

_veh = param [0,""];

switch(_veh) do
{
	case "C_Offroad_01_F": 				{50};
	case "B_G_Offroad_01_F": 			{70};
	case "B_G_Offroad_01_armed_F": 		{70};
	case "B_Quadbike_01_F": 			{15};
	case "I_Truck_02_covered_F": 		{800};
	case "I_Truck_02_transport_F": 		{800};
	case "C_Hatchback_01_F": 			{45};
	case "C_Hatchback_01_sport_F": 		{80};
	case "C_SUV_01_F": 					{100};
	case "C_Van_01_transport_F": 		{80};
	case "I_G_Van_01_transport_F": 		{80};
	case "C_Van_01_box_F": 				{80};
	case "B_Truck_01_box_F": 			{1600};
	case "B_Truck_01_transport_F": 		{1400};
	case "I_Heli_light_03_unarmed_F":	{1600};
	case "B_Plane_CAS_01_F":			{5000};
	case "B_MRAP_01_F": 				{500};
	case "B_MRAP_01_hmg_F":				{500};
	case "O_MRAP_02_F": 				{600};
	case "B_Heli_Light_01_F": 			{1000};
	case "O_Heli_Light_02_unarmed_F": 	{1600};
	case "I_Heli_Transport_02_F": 		{3600};
	case "B_Heli_Transport_01_F":		{3500};
	case "C_Van_01_fuel_F":				{120};
	case "C_Van_01_fuel_F_TRAILER":		{6000};
	case "I_Truck_02_medical_F": 		{800};
	case "O_Truck_03_medical_F": 		{800};
	case "B_Truck_01_medical_F": 		{800};
	case "O_Truck_03_device_F": 		{800};
	case "O_Truck_03_covered_F": 		{800};
	case "O_Truck_03_transport_F": 		{800};
	case "C_Kart_01_Blu_F": 			{30};
	case "C_Kart_01_Fuel_F": 			{30};
	case "C_Kart_01_Red_F": 			{30};
	case "C_Kart_01_Vrana_F": 			{30};
	case "B_APC_Wheeled_01_cannon_F":	{1000};
	default {100};
};