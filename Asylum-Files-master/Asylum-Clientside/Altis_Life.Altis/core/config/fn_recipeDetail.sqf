/*
	File: fn_recipeDetail.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Returns an array of virtual items which are required for crafting
	the given item class.
*/
private["_item"];
_item = _this;

_items = switch (_item) do
{
	case "CUP_C_Skoda_White_CIV";
	case "CUP_C_Datsun";
	case "Jonzie_Datsun_510";
	case "C_Hatchback_01_F" : { [["life_inv_ironore",5]] };
	case "Jonzie_Corolla";
	case "CUP_C_Golf4_red_Civ";
	case "CUP_C_Octavia_CIV";
	case "Jonzie_Mini_Cooper";
	case "C_Offroad_01_F" : { [["life_inv_ironore",10]] };
	case "Jonzie_Ceed";
	case "Jonzie_30CSL";
	case "CUP_C_LR_Transport_CTK";
	case "CUP_B_UAZ_Unarmed_CDF";
	case "CUP_B_UAZ_Open_CDF";
	case "C_SUV_01_F" : { [["life_inv_ironore",10],["life_inv_rubber",2]] };
	case "Jonzie_Raptor";
	case "Jonzie_Galant";
	case "beetle";
	case "CUP_C_SUV_TK" : { [["life_inv_rubber",3],["life_inv_ironore",13],["life_inv_oilp",10]] };
	case "C_Hatchback_01_sport_F" : { [["life_inv_rubber",3],["life_inv_ironr",13],["life_inv_oilp",10]] };
	case "C_Van_01_transport_F" : { [["life_inv_rubber",3],["life_inv_ironr",20],["life_inv_oilp",10]] };
	case "C_Van_01_box_F" : { [["life_inv_rubber",3],["life_inv_ironr",30],["life_inv_oilp",10]] };
	case "C_Heli_Light_01_civil_F" : { [["life_money",15000],["life_inv_rubber",6],["life_inv_oilp",10]] };
	case "I_Heli_Transport_02_F" : { [["life_money",30000],["life_inv_diamondf",1],["life_inv_rubber",10],["life_inv_oilp",20]] };
	case "B_Heli_Light_01_F" : { [["life_money",15000],["life_inv_rubber",6],["life_inv_diamondr",20],["life_inv_oilp",20]] };
	case "C_Offroad_01_F" : { [["life_inv_ironore",10],["life_inv_oilp",1]] };
	case "B_G_Offroad_01_F" : { [["life_inv_ironore",10],["life_inv_oilp",1]] };
	case "B_G_Offroad_01_armed_F" : { [["life_money",70000],["life_inv_diamondf",1],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",4]] };
	case "C_Boat_Civil_01_F" : { [["life_inv_ironore",10],["life_inv_turtle",2]] };
	case "C_Boat_Civil_01_rescue_F" : { [["life_inv_ironore",10],["life_inv_turtle",2]] };
	case "O_MRAP_02_F" : { [["life_money",40000],["life_inv_diamondf",2],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",6]] };
	case "I_Heli_light_03_unarmed_F" : { [["life_money",30000],["life_inv_diamondf",1],["life_inv_diamondr",20],["life_inv_oilp",10],["life_inv_rubber",10]] };
	case "O_Heli_Light_02_unarmed_F" : { [["life_money",40000],["life_inv_diamondf",1],["life_inv_diamondr",20],["life_inv_oilp",10],["life_inv_rubber",10]] };
	case "O_Heli_Transport_04_F" : { [["life_money",40000],["life_inv_diamondf",1],["life_inv_diamondr",20],["life_inv_oilp",10],["life_inv_rubber",10]] };
	case "O_Heli_Transport_04_bench_F" : { [["life_money",40000],["life_inv_diamondf",1],["life_inv_diamondr",20],["life_inv_oilp",10],["life_inv_rubber",10]] };
	case "I_Truck_02_transport_F" : { [["life_money",4000],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",4]] };
	case "I_Truck_02_covered_F" : { [["life_money",8000],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",6]] };
	case "B_Truck_01_transport_F" : { [["life_money",9000],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",6]] };
	case "B_Truck_01_box_F" : { [["life_money",14000],["life_inv_ironr",30],["life_inv_oilp",10],["life_inv_rubber",8]] };
	case "LMG_Mk200_F" : { [["life_money",20000],["life_inv_diamond",2],["life_inv_meth",30]] };
	case "RH_deagle";
	case "RH_g18";
	case "hgun_PDW2000_F" : { [["life_inv_ironore",10],["life_inv_copperr",5]] };
	case "9Rnd_45ACP_Mag";
	case "30Rnd_45ACP_Mag_SMG_01";
	case "30Rnd_556x45_Stanag";
	case "30Rnd_9x21_Mag" : {[["life_inv_ironore",1]]};
	case "RH_M6X";
	case "RH_X300";
	case "RH_X2";
	case "RH_python";
	case "RH_docter";
	case "RH_g17";
	case "hgun_ACPC2_F";
	case "CUP_hgun_Duty";
	case "CUP_hgun_Compact";
	case "CUP_hgun_Phantom";
	case "RH_fnp45";
	case "RH_gsh18";
	case "RH_kimber_nw";
	case "RH_mk2";
	case "RH_p226";
	case "hgun_ACPC2_F" : { [["life_inv_ironore",6],["life_inv_copperr",2]] };
	case "RH_vz61";
	case "SMG_02_F" : { [["life_inv_ironore",8],["life_inv_saltr",5]] };
	case "RH_tec9";
	case "RH_muzi";
	case "SMG_01_F" : { [["life_inv_ironore",10],["life_inv_saltr",7]] };
	case "hlc_rifle_ak47";
	case "hlc_rifle_ak12";
	case "hlc_rifle_aku12";
	case "hlc_rifle_ak74";
	case "hlc_rifle_aks74";
	case "hlc_rifle_aks74u";
	case "hlc_rifle_aek971";
	case "CUP_arifle_FNFAL";
	case "CUP_arifle_FNFAL_railed";
	case "CUP_srifle_LeeEnfield";
	case "30Rnd_65x39_caseless_green": { [["life_inv_heroinu",1]] };
	case "20Rnd_762x51_Mag": {[[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },1]]};
	case "arifle_Katiba_C_F" : { [["life_inv_ironore",2],["life_inv_heroinu",10]] };
	case "arifle_Katiba_F" : { [["life_inv_ironore",2],["life_inv_heroinu",10]] };
	case "srifle_DMR_01_F" : { [["life_inv_diamond",2],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "hlc_rifle_akm";
//	case "CUP_sgun_M1014";
	case "CUP_srifle_AWM_des";
	case "CUP_srifle_AWM_wdl";
	case "srifle_EBR_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_03_khaki_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_03_multicam_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_03_tan_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_03_woodland_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_06_olive_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	case "srifle_DMR_06_camo_F" : { [["life_inv_diamond",4],[if (worldName == "Altis") then { "life_inv_coke" } else { "life_inv_cocaleaf" },25]] };
	default { [] };
};

if (worldName == "Tanoa" && _item == "SMG_01_F") then { _items = [["life_inv_ironore",10],["life_inv_sugar",6]] };
if (worldName == "Tanoa" && _item == "SMG_02_F") then { _items = [["life_inv_ironore",8],["life_inv_sugar",8]] };

_items; 