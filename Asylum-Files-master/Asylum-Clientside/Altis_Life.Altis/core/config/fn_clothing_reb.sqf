/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

_ret = switch (_filter) do
{
	//Uniforms
	case 0:
	{ 
		[
			["U_IG_Guerilla1_1",nil,300],
			["U_IG_leader",nil,300],
			["U_I_G_resistanceLeader_F",nil,300],
			["U_I_G_Story_Protagonist_F",nil,300],
			["U_I_CombatUniform",nil,300],
			["U_I_CombatUniform_tshirt",nil,300],
			["U_I_OfficerUniform",nil,300],
			["U_O_CombatUniform_ocamo",nil,6000],
			["U_OG_Guerrilla_6_1",nil,300],
			["U_MillerBody",nil,300],
			["U_KerryBody",nil,300],
			["U_B_CombatUniform_mcam",nil,300],
			["U_B_CombatUniform_mcam_tshirt",nil,300],
			["U_B_CombatUniform_mcam_vest",nil,300],
			["U_B_CTRG_Soldier_F",nil,300],
			["U_B_CTRG_Soldier_3_F",nil,300],
			["U_B_CTRG_Soldier_2_F",nil,300],
			["U_B_CTRG_Soldier_urb_1_F",nil,300],
			["U_B_CTRG_Soldier_urb_2_F",nil,300],
			["U_B_CTRG_Soldier_urb_3_F",nil,300],
			["U_I_C_Soldier_Para_1_F",nil,300],
			["U_I_C_Soldier_Para_2_F",nil,300],
			["U_I_C_Soldier_Para_3_F",nil,300],
			["U_I_C_Soldier_Para_4_F",nil,300],
			["U_I_C_Soldier_Para_5_F",nil,300]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,30],
			["H_Shemag_tan","Shemag (Pattern)",30],
			["H_Shemag_olive",nil,30],
			["H_Shemag_olive_hs",nil,30],
			["H_ShemagOpen_khk",nil,30],
			["H_Cap_grn_BI",nil,30],
			["H_Cap_blk_ION",nil,30],
			["H_Cap_blk_CMMG",nil,30],
			["H_Cap_brn_SPECOPS",nil,30],
			["H_Cap_tan_specops_US",nil,30],
			["H_Cap_khaki_specops_UK",nil,30],
			["H_Cap_blk_Raven",nil,30],
			["H_Cap_oli_hs",nil,30],
			["H_MilCap_ocamo",nil,30],
			["H_MilCap_mcamo",nil,30],
			["H_MilCap_oucamo",nil,30],
			["H_MilCap_dgtl",nil,30],
			["H_MilCap_gry",nil,30],
			["H_MilCap_blue",nil,30],
			["H_MilCap_tna_F",nil,30],
			["H_MilCap_ghex_F",nil,30],
			["H_Hat_camo",nil,30],
			["H_Cap_headphones",nil,30],
			["H_Booniehat_tna_F",nil,30],
			["H_Booniehat_oli",nil,30],
			["H_Booniehat_mcamo",nil,30],
			["H_Booniehat_grn",nil,30],
			["H_Booniehat_tan",nil,30],
			["H_Booniehat_dgtl",nil,30],
			["H_Booniehat_khk_hs",nil,30],
			["H_Bandanna_camo",nil,30],
			["H_Bandanna_khk_hs",nil,30],
			["H_Bandanna_mcamo",nil,30],
			["H_Watchcap_blk",nil,30],
			["H_Watchcap_sgg",nil,30],
			["H_Watchcap_khk",nil,30],
			["H_Watchcap_camo",nil,30],
			["H_Watchcap_cbr",nil,30]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Goggles_VR",nil,150],
			["G_Balaclava_blk",nil,150],
			["G_Balaclava_combat",nil,150],
			["G_Balaclava_lowprofile",nil,150],
			["G_Balaclava_TI_blk_F",nil,200],
			["G_Balaclava_TI_G_blk_F",nil,200],
			["G_Balaclava_TI_tna_F",nil,200],
			["G_Balaclava_TI_G_tna_F",nil,200],
			["G_Balaclava_oli",nil,150],
			["G_Bandanna_aviator",nil,150],
			["G_Bandanna_beast",nil,150],
			["G_Bandanna_blk",nil,150],
			["G_Bandanna_khk",nil,150],
			["G_Bandanna_oli",nil,150],
			["G_Bandanna_shades",nil,150],
			["G_Bandanna_sport",nil,150],
			["G_Bandanna_tan",nil,150],
			["G_Shades_Black",nil,4],
			["G_Shades_Blue",nil,4],
			["G_Sport_Blackred",nil,4],
			["G_Sport_Checkered",nil,4],
			["G_Sport_Blackyellow",nil,4],
			["G_Sport_BlackWhite",nil,4],
			["G_Squares",nil,6],
			["G_Lowprofile",nil,5],
			["G_Combat",nil,5]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_brn",nil,3000],
			["V_TacVest_camo",nil,3000],
			["V_TacVest_khk",nil,3000],
			["V_TacVest_oli",nil,3000],
			["V_I_G_resistanceLeader_F",nil,3000],
			["V_PlateCarrier1_blk",nil,5000],
			["V_PlateCarrier1_rgr_noflag_F",nil,5000],
			["V_PlateCarrier1_tna_F",nil,5000],
	//		["V_PlateCarrierL_CTRG",nil,5000],
	//		["V_PlateCarrierH_CTRG",nil,5000],
	//		["V_PlateCarrier_Kerry",nil,5000],
	//		["V_PlateCarrier2_rgr",nil,5000],
	//		["V_PlateCarrierIA1_dgtl",nil,4000],
	//		["V_PlateCarrierIA2_dgtl",nil,5000],
	//		["V_PlateCarrierIAGL_dgtl",nil,7500],
			["V_Chestrig_rgr",nil,200],
			["V_Chestrig_khk",nil,200],
	//		["V_Chestrig_oli",nil,200],
			["V_HarnessOSpec_brn",nil,200],
			["V_HarnessOSpec_gry",nil,200],
			["V_Chestrig_blk",nil,200],
			["V_Chestrig_oli",nil,200],
			["V_HarnessO_gry",nil,200]
		];
	};
	
	//Backpacks
	case 4:
	{
		
		[
			["B_AssaultPack_dgtl",nil,250],
			["B_AssaultPack_ocamo",nil,250],
			["B_AssaultPack_blk",nil,250],
			["B_AssaultPack_cbr",nil,250],
			["B_AssaultPack_mcamo",nil,250],
			["B_AssaultPack_rgr",nil,250],
			["B_AssaultPack_khk",nil,250],			
			["B_AssaultPack_sgg",nil,250],
			["B_AssaultPack_tna_F",nil,250],
			["B_FieldPack_ocamo",nil,250],
			["B_FieldPack_khk",nil,250],
			["B_FieldPack_oucamo",nil,250],
			["B_FieldPack_cbr",nil,250],
			["B_FieldPack_blk",nil,250],
			["B_FieldPack_ghex_F",nil,250],
			["B_Kitbag_rgr",nil,250],
			["B_Kitbag_cbr",nil,250],
			["B_Kitbag_mcamo",nil,250],
			["B_Kitbag_sgg",nil,250],
			["B_TacticalPack_ocamo",nil,250],
			["B_TacticalPack_oli",nil,250],
			["B_Bergen_sgg",nil,250],
			["B_Bergen_mcamo",nil,250],
			["B_Bergen_rgr",nil,250],
			["B_Bergen_blk",nil,250],
			["B_Carryall_oli",nil,250],
			["B_Carryall_ocamo",nil,250],
			["B_Carryall_oucamo",nil,250],
			["B_Carryall_mcamo",nil,250],
			["B_Carryall_cbr",nil,250],
			["B_Carryall_ghex_F",nil,250],
			["B_Carryall_khk",nil,250],
			["B_ViperHarness_blk_F",nil,350],
			["B_ViperHarness_ghex_F",nil,350],
			["B_ViperHarness_hex_F",nil,350],
			["B_ViperHarness_khk_F",nil,350],
			["B_ViperHarness_oli_F",nil,350],
			["B_ViperLightHarness_blk_F",nil,300],
			["B_ViperLightHarness_ghex_F",nil,300],
			["B_ViperLightHarness_hex_F",nil,300],
			["B_ViperLightHarness_khk_F",nil,300],
			["B_ViperLightHarness_oli_F",nil,300]
		];
	};
};

if ((_filter == 0) && ((30 in life_talents) || playerSide == west)) then
{
//	_ret pushBack ["U_B_GhillieSuit",nil,1500];
//	_ret pushBack ["U_O_GhillieSuit",nil,1500];
	_ret set [count _ret, ["U_I_GhillieSuit",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_sard",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_ard",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_lsh",nil,1500]];
	_ret set [count _ret, ["U_B_T_FullGhillie_tna_F",nil,1500]];
};

if ((_filter == 0) && 8 in life_lootRewards) then
{
	_ret pushBack ["U_O_GhillieSuit",nil,6000];
};

if ((_filter == 0) && 9 in life_lootRewards) then
{
	_ret pushBack ["U_O_PilotCoveralls",nil,5000];
};

if ((_filter == 1) && 6 in life_lootRewards) then
{
	_ret pushBack ["H_HelmetB_light",nil,1500];
};

if ((_filter == 1) && 7 in life_lootRewards) then
{
	_ret pushBack ["H_HelmetB_light_snakeskin",nil,1500];
};

if ((_filter == 3)&&(33 in life_talents)) then
{
	_ret set [count _ret, ["V_HarnessOGL_brn","Suicide vest",50000]];
};

if ((_filter == 0) && life_donator >= 2) then
{
	_ret set[count _ret,["U_B_CTRG_1",nil,1000]];
	_ret set[count _ret,["U_B_CTRG_2",nil,1000]];
	_ret set[count _ret,["U_B_CTRG_3",nil,1000]];
};

_ret;