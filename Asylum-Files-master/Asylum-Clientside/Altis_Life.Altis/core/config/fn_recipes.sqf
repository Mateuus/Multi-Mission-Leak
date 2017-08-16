/*
	File: fn_recipes.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Recipes for crafting items
*/
private["_shop"];
_shop = _this;
_items = [];

_items = switch (worldName) do
{
	case "Australia":
	{
		switch (_shop) do
		{
			case "vehicles" : { ["CUP_C_Skoda_White_CIV","CUP_C_Datsun","Jonzie_Datsun_510","C_Hatchback_01_F","Jonzie_Corolla","CUP_C_Golf4_red_Civ","C_Offroad_01_F","CUP_C_Octavia_CIV","Jonzie_Mini_Cooper","Jonzie_Ceed","Jonzie_30CSL","CUP_C_LR_Transport_CTK","CUP_B_UAZ_Unarmed_CDF","CUP_B_UAZ_Open_CDF","Jonzie_Raptor","Jonzie_Galant","beetle","CUP_C_SUV_TK","C_Van_01_box_F"] };
			case "blackmarket" : { ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","CUP_B_UAZ_MG_CDF","CUP_B_LR_MG_CZ_W","RH_tec9","RH_muzi","RH_vz61","hlc_rifle_ak47","hlc_rifle_ak12","hlc_rifle_aku12","hlc_rifle_ak74","hlc_rifle_aks74","hlc_rifle_aks74u","hlc_rifle_aek971","CUP_arifle_FNFAL","CUP_arifle_FNFAL_railed","CUP_srifle_LeeEnfield","hlc_rifle_akm","CUP_srifle_AWM_des","CUP_srifle_AWM_wdl"] };
			case "weapons" : { ["RH_python","RH_g17","hgun_ACPC2_F","CUP_hgun_Duty","CUP_hgun_Compact","CUP_hgun_Phantom","RH_deagle","RH_fnp45","RH_g18","RH_gsh18","RH_kimber_nw","RH_mk2","RH_p226"] };
			default { [] };
		};
	};
	case "Stratis":
	{
		switch (_shop) do
		{
			case "vehicles" : { ["C_Hatchback_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F"] };
			case "blackmarket" : { ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","arifle_Katiba_F","arifle_Katiba_C_F","LMG_Mk200_F","srifle_DMR_01_F","srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_F"] };
			case "weapons" : { ["hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_F"] };
			default { [] };
		};
	};
	case "Tanoa":
	{
		switch (_shop) do
		{
			case "vehicles" : { ["C_Hatchback_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","C_Heli_Light_01_civil_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"] };
			case "blackmarket" : { ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","30Rnd_65x39_caseless_green","20Rnd_762x51_Mag","arifle_Katiba_F","arifle_Katiba_C_F","LMG_Mk200_F","srifle_DMR_01_F","srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_F"] };
			case "weapons" : { ["30Rnd_45ACP_Mag_SMG_01","30Rnd_9x21_Mag","9Rnd_45ACP_Mag","hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_F"] };
			default { [] };
		};
	};
	default
	{
		switch (_shop) do
		{
			case "vehicles" : { ["C_Hatchback_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Van_01_transport_F","C_Van_01_box_F","I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_box_F","C_Heli_Light_01_civil_F","B_Heli_Light_01_F","I_Heli_Transport_02_F","O_Heli_Light_02_unarmed_F"] };
			case "blackmarket" : { ["B_G_Offroad_01_F","B_G_Offroad_01_armed_F","O_MRAP_02_F","I_Heli_light_03_unarmed_F","O_Heli_Light_02_unarmed_F","30Rnd_65x39_caseless_green","20Rnd_762x51_Mag","arifle_Katiba_F","arifle_Katiba_C_F","LMG_Mk200_F","srifle_DMR_01_F","srifle_EBR_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_03_tan_F","srifle_DMR_03_woodland_F","srifle_DMR_06_olive_F","srifle_DMR_06_camo_F"] };
			case "weapons" : { ["30Rnd_45ACP_Mag_SMG_01","30Rnd_9x21_Mag","9Rnd_45ACP_Mag","hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_F"] };
			default { [] };
		};
	};
};

_items;