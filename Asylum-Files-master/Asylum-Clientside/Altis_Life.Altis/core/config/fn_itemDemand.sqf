/*
	File: fn_itemDemand.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Returns demand for item (when it's at it's least value)
*/

switch (_this) do
{
	case "arifle_Katiba_C_F" : { 50 };
	case "arifle_Katiba_F" : { 50 };
	case "B_G_Offroad_01_armed_F" : { 10 };
	case "B_G_Offroad_01_F" : { 50 };
	case "B_Heli_Light_01_F" : { 30 };
	case "B_Truck_01_box_F" : { 40 };
	case "B_Truck_01_transport_F" : { 40 };
	case "C_Hatchback_01_F" : { 50 };
	case "C_Hatchback_01_sport_F" : { 40 };
	case "C_Heli_Light_01_civil_F" : { 30 };
	case "C_Offroad_01_F" : { 50 };
	case "C_SUV_01_F" : { 50 };
	case "C_Van_01_box_F" : { 40 };
	case "C_Van_01_transport_F" : { 40 };
	case "hgun_ACPC2_F" : { 50 };
	case "hgun_PDW2000_F" : { 50 };
	case "I_Heli_Transport_02_F" : { 25 };
	case "I_Truck_02_covered_F" : { 30 };
	case "I_Truck_02_transport_F" : { 30 };
	case "LMG_Mk200_F" : { 100 };
	case "O_Heli_Transport_04_bench_F" : { 30 };
	case "O_Heli_Transport_04_F" : { 30 };
	case "O_MRAP_02_F" : { 15 };
	case "SMG_01_F" : { 50 };
	case "SMG_02_F" : { 50 };
	case "srifle_DMR_01_F" : { 30 };
	case "srifle_DMR_03_khaki_F" : { 30 };
	case "srifle_DMR_03_multicam_F" : { 30 };
	case "srifle_DMR_03_tan_F" : { 30 };
	case "srifle_DMR_03_woodland_F" : { 30 };
	case "srifle_DMR_06_camo_F" : { 30 };
	case "srifle_DMR_06_olive_F" : { 30 };
	case "arifle_SPAR_03_khk_F" : { 30 };
	case "arifle_SPAR_03_snd_F" : { 30 };
	case "cannabis" : { 1500 };
	case "cocaine" : { 1500 };
	case "cocainep" : { 1500 };
	case "cocainepure" : { 1500 };
	case "diamond" : { 500 };
	case "diamondf" : { 200 };
	case "diamondc" : { 500 };
	case "ephedra" : { 500 };
	case "ephedrau" : { 500 };
	case "goldbar" : { 30 };
	case "heroinp" : { 1500 };
	case "heroinu" : { 1500 };
	case "cocaleaf" : { 300 };
	case "cocapaste" : { 500 };
	case "ironore" : { 1000 };
	case "iron_r" : { 1500 };
	case "marijuana" : { 1500 };
	case "marijuanam" : { 1500 };
	case "turtle" : { 500 };
	case "moonshine" : { 1000 };
	case "scotch_2" : { 1200 };
	case "scotch_3" : { 1000 };
	case "rum_1" : { 1000 };
	case "rum_2" : { 1200 };
	case "rum_3" : { 1200 };
	case "plank" : { 500 };
	case "meth" : { 1500 };
	case "oilp" : { 800 };
	case "pearl" : { 200 };
	case "salt" : { 600 };
	case "salt_r" : { 600 };
	case "rubber" : { 200 };
	default { 50 };
};