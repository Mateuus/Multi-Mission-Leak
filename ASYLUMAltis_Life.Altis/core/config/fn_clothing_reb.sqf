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
		if (worldName == "Australia") then
		{
			[
				["U_IG_Guerilla1_1",nil,300],
				["U_IG_leader",nil,300],
				["U_I_CombatUniform",nil,300],
				["U_I_CombatUniform_tshirt",nil,300],
				["U_I_OfficerUniform",nil,300],
				["U_MillerBody",nil,300],
				["U_KerryBody",nil,300],
				["U_B_CombatUniform_mcam",nil,300],
				["U_B_CombatUniform_mcam_tshirt",nil,300],
				["U_B_CombatUniform_mcam_vest",nil,300],
				["U_BG_leader",nil,600],
				["CUP_U_O_SLA_MixedCam",nil,200],
				["CUP_U_O_SLA_Desert",nil,200],
				["CUP_U_O_SLA_Urban",nil,200],
				["CUP_U_O_TK_Green",nil,200],
				["CUP_U_O_TK_Officer",nil,600],
				["CUP_U_O_TK_MixedCamo",nil,200],
				["TRYK_B_TRYK_3C_T",nil,200],
				["TRYK_U_B_BLKOCP_CombatUniform",nil,200],
				["TRYK_U_B_BLKOCP_R_CombatUniformTshirt",nil,200],
				["TRYK_U_B_C01_Tsirt",nil,200],
				["TRYK_U_B_3cr",nil,200],
				["TRYK_U_B_3c",nil,200],
				["TRYK_U_B_BLK3CD_Tshirt",nil,200],
				["TRYK_U_B_Sage_Tshirt",nil,200],
				["TRYK_U_B_fleece",nil,200],
				["TRYK_U_B_fleece_UCP",nil,200],
				["TRYK_U_B_GRYOCP_CombatUniform",nil,200],
				["TRYK_U_B_GRYOCP_R_CombatUniformTshirt",nil,200],
				["TRYK_OVERALL_SAGE_BLKboots_nk_blk2",nil,200],
				["TRYK_OVERALL_nok_flesh",nil,200],
				["TRYK_U_B_MTP_CombatUniform",nil,200],
				["TRYK_U_B_MTP_R_CombatUniform",nil,200],
				["TRYK_U_B_NATO_OCPD_CombatUniform",nil,200],
				["TRYK_U_B_NATO_OCP_c_BLK_CombatUniform",nil,200],
				["TRYK_U_B_NATO_OCP_BLK_CombatUniform",nil,200],
				["TRYK_U_B_OD_OD_CombatUniform",nil,70],
				["TRYK_U_B_OD_OD_R_CombatUniform",nil,70],
				["TRYK_U_Bts_PCUs",nil,200],
				["TRYK_U_Bts_PCUGs",nil,200],
				["TRYK_U_Bts_GRYGRY_PCUs",nil,200],
				["TRYK_U_Bts_Wood_PCUs",nil,200],
				["TRYK_U_Bts_PCUODs",nil,200],
				["TRYK_U_B_PCUHs",nil,200],
				["TRYK_U_B_PCUGHs",nil,200],
				["TRYK_U_B_PCUODHs",nil,200],
				["TRYK_U_B_Snow_CombatUniform",nil,200],
				["TRYK_U_B_Snowt",nil,200],
				["TRYK_T_PAD",nil,200],
				["TRYK_B_TRYK_UCP_T",nil,200],
				["TRYK_U_B_NATO_UCP_GRY_CombatUniform",nil,200],
				["TRYK_U_B_NATO_UCP_GRY_R_CombatUniform",nil,200],
				["TRYK_B_USMC_R",nil,200],
				["TRYK_U_B_Woodland",nil,200],
				["TRYK_U_B_Woodland_Tshirt",nil,200],
				["TRYK_U_B_Wood_T",nil,200],
				["TRYK_U_B_wood3c_CombatUniform",nil,200],
				["TRYK_U_B_WOOD_MARPAT_CombatUniform",nil,200]
			];
		}
		else
		{
			[
				["U_IG_Guerilla1_1",nil,300],
				["U_IG_leader",nil,300],
				["U_I_CombatUniform",nil,300],
				["U_I_CombatUniform_tshirt",nil,300],
				["U_I_OfficerUniform",nil,300],
				["U_MillerBody",nil,300],
				["U_KerryBody",nil,300],
				["U_B_CombatUniform_mcam",nil,300],
				["U_B_CombatUniform_mcam_tshirt",nil,300],
				["U_B_CombatUniform_mcam_vest",nil,300],
				["U_BG_leader",nil,600]
			]; 
		};
	};
	
	//Hats
	case 1:
	{
		[
			["H_Booniehat_khk",nil,30],
			["H_Booniehat_indp",nil,30],
			["H_Booniehat_mcamo",nil,30],
			["H_Booniehat_grn",nil,30],
			["H_Booniehat_tan",nil,30],
			["H_Booniehat_dirty",nil,30],
			["H_Booniehat_khk_hs",nil,30],
			["H_Booniehat_dgtl",nil,30],
			["H_Cap_brn_SPECOPS",nil,30],
			["H_Cap_tan_specops_US",nil,30],
			["H_Cap_khaki_specops_UK",nil,30],
			["H_Cap_blk_Raven",nil,30],
			["H_Bandanna_camo",nil,30],
			["H_Bandanna_mcamo",nil,30],
			["H_Shemag_olive",nil,30],
			["H_ShemagOpen_khk",nil,30]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Balaclava_blk",nil,150],
			["G_Balaclava_combat",nil,150],
			["G_Balaclava_lowprofile",nil,150],
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
		if (worldName == "Australia") then
		{
			[
				["V_TacVest_brn",nil,3000],
				["V_TacVest_camo",nil,3000],
				["V_TacVest_khk",nil,3000],
				["V_TacVest_oli",nil,3000],
				["V_I_G_resistanceLeader_F",nil,3000],
				["V_PlateCarrier1_blk",nil,5000],
				["V_PlateCarrier1_rgr",nil,5000],
				["V_Chestrig_rgr",nil,200],
				["V_Chestrig_khk",nil,200],
				["V_HarnessOSpec_brn",nil,200],
				["V_HarnessOSpec_gry",nil,200],
				["V_Chestrig_blk",nil,200],
				["V_Chestrig_oli",nil,200],
				["V_HarnessO_gry",nil,200],
				["CUP_V_I_Guerilla_Jacket",nil,70],
				["CUP_V_B_PilotVest",nil,3000],
				["CUP_V_I_RACS_Carrier_Vest",nil,3500],
				["CUP_V_I_RACS_Carrier_Vest_2",nil,3500],
				["CUP_V_B_RRV_Scout",nil,300],
				["CUP_V_B_RRV_Scout2",nil,300],
				["CUP_V_B_RRV_Scout3",nil,300],
				["TRYK_V_tacSVD_BK",nil,500],
				["TRYK_V_tacSVD_OD",nil,500],
				["TRYK_V_tacv1M_BK",nil,500],
				["TRYK_V_tacv1_BK",nil,500],
				["TRYK_V_tacv1_CY",nil,500],
				["TRYK_V_tacv1",nil,500],
				["TRYK_V_tacv1L_BK",nil,500],
				["TRYK_V_tacv1L_CY",nil,500],
				["TRYK_V_tacv1L_OD",nil,500]
			];
		}
		else
		{
			[
				["V_TacVest_brn",nil,3000],
				["V_TacVest_camo",nil,3000],
				["V_TacVest_khk",nil,3000],
				["V_TacVest_oli",nil,3000],
				["V_I_G_resistanceLeader_F",nil,3000],
				["V_PlateCarrier1_blk",nil,5000],
				["V_PlateCarrier1_rgr",nil,5000],
				["V_Chestrig_rgr",nil,200],
				["V_Chestrig_khk",nil,200],
				["V_HarnessOSpec_brn",nil,200],
				["V_HarnessOSpec_gry",nil,200],
				["V_Chestrig_blk",nil,200],
				["V_Chestrig_oli",nil,200],
				["V_HarnessO_gry",nil,200]
			];
		};
	};
	
	//Backpacks
	case 4:
	{
		
		if (worldName == "Australia") then
		{
			[
				["B_Kitbag_mcamo",nil,70],
				["B_FieldPack_ocamo",nil,60],
				["B_Bergen_sgg",nil,250],
				["B_Carryall_oucamo",nil,350],
				["B_Carryall_mcamo",nil,250],
				["B_Carryall_ocamo",nil,250],
				["B_Carryall_khk",nil,250],
				["B_Carryall_cbr",nil,250],
				["CUP_B_SLA_Medicbag","Satchel",25],
				["CUP_B_ACRScout_m95",nil,40],
				["CUP_B_HikingPack_Civ",nil,250],
				["TRYK_B_Coyotebackpack",nil,200],
				["TRYK_B_Coyotebackpack_BLK",nil,200],
				["TRYK_B_Coyotebackpack_OD",nil,200],
				["TRYK_B_Coyotebackpack_WH",nil,200],
				["TRYK_B_Carryall_blk",nil,250],
				["TRYK_B_Carryall_wh",nil,250],
				["CUP_B_AssaultPack_Coyote",nil,60],
				["CUP_B_AssaultPack_Black",nil,60]
			];
		}
		else
		{
			[
				["B_Kitbag_mcamo",nil,70],
				["B_FieldPack_ocamo",nil,60],
				["B_Bergen_sgg",nil,250],
				["B_Carryall_oucamo",nil,350],
				["B_Carryall_mcamo",nil,250],
				["B_Carryall_ocamo",nil,250],
				["B_Carryall_khk",nil,250],
				["B_Carryall_cbr",nil,250]
			];
		};
	};
};

if ((_filter == 0) && ((30 in life_talents) || playerSide == west)) then
{
	_ret set [count _ret, ["U_I_GhillieSuit",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_sard",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_ard",nil,1500]];
	_ret set [count _ret, ["U_B_FullGhillie_lsh",nil,1500]];
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