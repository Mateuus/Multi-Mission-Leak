/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Tanoa RPG  Rebellenkleider"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_I_pilotCoveralls",nil,7500],
			["U_I_CombatUniform_tshirt",nil,40000],
			["U_I_CombatUniform",nil,40000],
			["U_C_HunterBody_grn",nil,5000],
			["U_IG_Guerilla1_1",nil,5000],
			["U_OG_Guerilla2_3","Guerilla Leader",10000],
			["U_B_T_Soldier_AR_F",nil,10000],
			["U_I_C_Soldier_Bandit_2_F",nil,25000],
			["U_B_T_Soldier_F",nil,25000],
			["U_I_G_resistanceLeader_F",nil,25000],
			["U_I_C_Soldier_Para_1_F","Paramilitär TShirt",25000],
            ["U_I_C_Soldier_Para_2_F","Paramilitär Jacke",25000],
            ["U_I_C_Soldier_Para_3_F","Paramilitär Shirt",25000],
            ["U_I_C_Soldier_Para_4_F","Paramilitär Muskelshirt",25000],
            ["U_I_C_Soldier_Para_5_F","Paramilitär Shorts",25000],
			["U_B_GhillieSuit",nil,50000],
			["U_O_T_Sniper_F",nil,50000],
			["U_I_GhillieSuit",nil,50000],
			["U_O_FullGhillie_lsh",nil,100000],
			["U_O_FullGhillie_sard",nil,100000],
			["U_O_FullGhillie_ard",nil,100000],
			["U_B_T_FullGhillie_tna_F",nil,100000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_HelmetIA_camo",nil,10000],
			["H_HelmetIA",nil,10000],
			["H_HelmetLeaderO_ocamo",nil,15000],
			["H_HelmetCrew_I",nil,25000],
			["H_Watchcap_blk",nil,1500],
			["H_MilCap_ocamo",nil,3500],
			["H_Cap_tan_specops_US",nil,2500],
			["H_Cap_khaki_specops_UK",nil,2500],
			["H_Booniehat_mcamo",nil,2500],
			["H_Bandanna_mcamo",nil,1000],
			["H_Cap_blk_Raven",nil,8500],
			["H_Shemag_khk",nil,50000],
			["H_Shemag_olive",nil,50000],
			["H_Booniehat_indp",nil,5500],
			["H_HelmetLeader0_ghex_F",nil,16500],
			["H_CrewHelmetHeli_I",nil,16500],
			["H_HelmetB_Enh_tna_F",nil,16500],
			["H_HelmetSpec0_ghex_F",nil,16500],
			["H_HelmetB_Light_tna_F",nil,16500],
			["H_HelmetB_tna_F",nil,16500],
			["H_HelmetCrew_0_ghex_F",nil,1500000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Shades_Black",nil,25],
			["G_Shades_Blue",nil,20],
			["G_Sport_Blackred",nil,20],
			["G_Sport_Checkered",nil,20],
			["G_Sport_Blackyellow",nil,20],
			["G_Sport_BlackWhite",nil,20],
			["G_Squares",nil,10],
			["G_Lowprofile",nil,30],
			["G_Combat",nil,55],
			["G_Balaclava_TI_tna_F",nil,1000],
            ["G_Balaclava_TI_G_tna_F",nil,1000],
            ["G_Balaclava_TI_blk_F",nil,1000],
            ["G_Balaclava_TI_G_blk_F",nil,1000],
            ["G_Combat_Goggles_tna_F",nil,100],
			["G_Balaclava_oli",nil,1000]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_BandollierB_khk",nil,5000],
			["V_PlateCarrier1_rgr",nil,10000],
			["V_Chestrig_khk",nil,30000],
			["V_TacVest_khk",nil,7500],
			["V_HarnessO_brn",nil,15000],
			["V_HarnessOGL_brn",nil,15000],
			["V_PlateCarrierIA1_dgtl",nil,150000],
			["V_PlateCarrierL_CTRG",nil,200000],
			["V_PlateCarrierH_CTRG",nil,300000],
			["V_PlateCarrier2_rgr_noflag_F",nil,320000],
			["V_PlateCarrier3_rgr",nil,350000],
            ["V_PlateCarrier2_tna_F",nil,380000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_cbr",nil,2500],
			["B_Kitbag_mcamo",nil,4500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_ocamo",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000],
			["B_Bergen_dgtl_F",nil,30000],
			["B_Bergen_mcamo_F",nil,30000],
			["B_Bergen_tna_F",nil,30000]
		];
	};
};