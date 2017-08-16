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
ctrlSetText[3103,"Rebellen Kleidung"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[

			["U_B_CombatUniform_mcam",nil,20000],
			["U_B_CombatUniform_mcam_tshirt",nil,20000],
			["U_O_CombatUniform_ocamo",nil,20000],
			
			["U_B_SpecopsUniform_sgg",nil,20000],
			["U_O_CombatUniform_oucamo",nil,20000],
			["U_O_SpecopsUniform_ocamo",nil,20000],
			["U_O_SpecopsUniform_blk",nil,20000],
			["U_O_PilotCoveralls",nil,20000],
			
			["U_O_OfficerUniform_ocamo",nil,20000],
			["U_I_CombatUniform_tshirt",nil,20000],
			["U_I_CombatUniform_shortsleeve",nil,20000],
			["U_I_OfficerUniform",nil,20000],
			
			["U_MillerBody",nil,20000],
			["U_KerryBody",nil,20000],
			["U_IG_Guerilla1_1",nil,20000],
			["U_BG_leader",nil,20000],
			["U_OG_Guerilla1_1",nil,20000],
			
			["U_OG_leader",nil,20000],
			["U_B_CTRG_2",nil,20000],
			["U_B_CTRG_3",nil,20000],
			["U_B_CTRG_Soldier_urb_1_F",nil,20000],
			["U_B_CTRG_Soldier_urb_2_F",nil,20000],
			["U_B_CTRG_Soldier_urb_3_F",nil,20000],
			["U_B_CTRG_Soldier_F",nil,20000],
			["U_B_CTRG_Soldier_3_F",nil,20000],
			["U_B_CTRG_Soldier_2_F",nil,20000],
			["U_B_survival_uniform",nil,20000],

			
			["U_I_G_Story_Protagonist_F",nil,20000],
			["U_I_G_resistanceLeader_F",nil,20000],
			["U_O_T_Officer_F",nil,20000],
			["U_I_C_Soldier_Para_1_F",nil,20000],
			["U_I_C_Soldier_Para_2_F",nil,20000],
			["U_I_C_Soldier_Para_3_F",nil,20000],
			["U_I_C_Soldier_Para_4_F",nil,20000],
			["U_B_GhillieSuit",nil,100000],
			["U_O_GhillieSuit",nil,100000],
			["U_I_GhillieSuit",nil,100000],
			["U_B_T_Sniper_F",nil,100000],
			["U_O_T_Sniper_F",nil,100000],
			
			["U_B_FullGhillie_lsh",nil,150000],
			["U_B_FullGhillie_sard",nil,150000],
			["U_B_FullGhillie_ard",nil,150000],
			["U_O_FullGhillie_lsh",nil,150000],
			["U_O_FullGhillie_sard",nil,150000],
			
			["U_O_FullGhillie_ard",nil,150000],
			["U_I_FullGhillie_lsh",nil,150000],
			["U_I_FullGhillie_sard",nil,150000],
			["U_B_T_FullGhillie_tna_F",nil,150000],
			["U_O_T_FullGhillie_tna_F",nil,150000],
			["U_I_FullGhillie_ard",nil,150000]


			
		];
	};
	
	//Hats
	case 1:
	{
		[

			["H_HelmetB",nil,20000],
			["H_HelmetB_camo",nil,20000],
			["H_HelmetB_paint",nil,20000],
			["H_HelmetB_light",nil,20000],
			["H_Booniehat_khk",nil,10000],
			["H_Booniehat_oli",nil,10000],
			["H_Booniehat_indp",nil,10000],
			["H_Booniehat_mcamo",nil,10000],
			["H_Booniehat_grn",nil,10000],
			["H_Booniehat_tan",nil,10000],
			["H_Booniehat_dirty",nil,10000],
			["H_Booniehat_dgtl",nil,10000],
			["H_Booniehat_khk_hs",nil,1000],
			["H_HelmetB_plain_mcamo",nil,20000],
			["H_HelmetB_plain_blk",nil,30000],
			["H_HelmetSpecB",nil,20000],
			["H_HelmetSpecB_paint1",nil,20000],
			["H_HelmetSpecB_paint2",nil,20000],
			["H_HelmetSpecB_blk",nil,30000],
			["H_HelmetIA",nil,20000],
			["H_HelmetIA_net",nil,20000],
			["H_HelmetIA_camo",nil,20000],
			["H_Helmet_Kerry",nil,20000],
			["H_HelmetB_grass",nil,20000],
			["H_HelmetB_snakeskin",nil,20000],
			["H_HelmetB_desert",nil,20000],
			["H_HelmetB_sand",nil,20000],
			["H_HelmetB_blk",nil,30000],
			["H_Cap_red",nil,10000],
			["H_Cap_blu",nil,10000],
			["H_Cap_oli",nil,10000],
			["H_Cap_tan",nil,10000],
			["H_Cap_blk",nil,10000],
			["H_Cap_blk_CMMG", nil,10000],
			["H_Cap_brn_SPECOPS",nil,10000],
			["H_Cap_tan_specops_US",nil,10000],
			["H_Cap_khaki_specops_UK",nil,10000],
			["H_Cap_grn",nil,10000],
			["H_Cap_grn_BI",nil,10000],
			["H_Cap_blk_Raven",nil,10000],
			["H_Cap_blk_ION",nil,10000],
			["H_Cap_oli_hs",nil,10000],
			["H_Cap_press",nil,10000],
			["H_Cap_usblack",nil,10000],
			["H_Cap_surfer",nil,10000],
			["H_HelmetCrew_B",nil,20000],
			["H_HelmetCrew_O",nil,20000],
			["H_HelmetCrew_I",nil,20000],
			["H_PilotHelmetFighter_B",nil,20000],
			["H_PilotHelmetFighter_O",nil,20000],
			["H_PilotHelmetFighter_I",nil,20000],
			["H_PilotHelmetHeli_B",nil,20000],
			["H_PilotHelmetHeli_O",nil,20000],
			["H_PilotHelmetHeli_I",nil,20000],
			["H_CrewHelmetHeli_B",nil,20000],
			["H_CrewHelmetHeli_O",nil,20000],
			["H_CrewHelmetHeli_I",nil,20000],
			["H_HelmetO_ocamo",nil,20000],
			["H_HelmetO_oucamo",nil,20000],
			["H_HelmetLeaderO_ocamo",nil,20000],
			["H_HelmetLeaderO_oucamo",nil,20000],
			["H_HelmetSpecO_ocamo",nil,20000],
			["H_HelmetSpecO_blk",nil,20000],
			["H_MilCap_ocamo",nil,10000],
			["H_MilCap_mcamo",nil,10000],
			["H_MilCap_oucamo",nil,10000],
			["H_MilCap_rucamo",nil,10000],
			["H_MilCap_dgtl",nil,10000],
			["H_HelmetB_light_grass",nil,20000],
			["H_HelmetB_light_snakeskin",nil,20000],
			["H_HelmetB_light_desert",nil,20000],
			["H_HelmetB_light_sand",nil,20000],
			["H_Bandanna_surfer",nil,1000],
			["H_Bandanna_khk",nil,1000],
			["H_Bandanna_khk_hs",nil,1000],
			["H_Bandanna_cbr",nil,1000],
			["H_Bandanna_sgg",nil,1000],
			["H_Bandanna_sand",nil,1000],
			["H_Bandanna_surfer_blk",nil,1000],
			["H_Bandanna_surfer_grn",nil,1000],
			["H_Bandanna_gry",nil,1000],
			["H_Bandanna_blu",nil,1000],
			["H_Bandanna_camo",nil,1000],
			["H_Bandanna_mcamo",nil,1000],
			["H_BandMask_blk",nil,15000],
			["H_BandMask_khk",nil,15000],
			["H_BandMask_reaper",nil,15000],
			["H_BandMask_demon",nil,15000],
			["H_Shemag_khk",nil,50000],
			["H_Shemag_tan",nil,50000],
			["H_Shemag_olive",nil,50000],
			["H_Shemag_olive_hs",nil,50000],
			["H_ShemagOpen_khk",nil,50000],
			["H_ShemagOpen_tan",nil,50000],
			["H_Watchcap_blk",nil,1000],
			["H_Watchcap_cbr",nil,1000],
			["H_Watchcap_khk",nil,1000],
			["H_Watchcap_camo",nil,1000],
			["H_Watchcap_sgg",nil,1000],
			["H_StrawHat",nil,1000],
            ["H_StrawHat_dark",nil,1000],
			["H_TurbanO_blk",nil,1000],
			["H_Hat_blue",nil,1000],
            ["H_Hat_brown",nil,1000],
			["H_Hat_camo",nil,1000],
			["H_Hat_grey",nil,1000],
			["H_Hat_checker",nil,1000],
			["H_Hat_tan",nil,1000],
			["H_Cap_red",nil,1000],
			["H_Cap_blu",nil,1000],
			["H_Cap_oli",nil,1000],
			["H_Cap_tan",nil,1000],
			["H_Cap_blk",nil,1000],
			["H_Cap_blk_CMMG",nil,1000],
			["H_Cap_brn_SPECOPS",nil,1000],
			["H_Cap_tan_specops_US",nil,1000],
			["H_Cap_khaki_specops_UK",nil,1000],
			["H_Cap_grn",nil,1000],
			["H_Cap_grn_BI",nil,1000],
			["H_Cap_blk_Raven",nil,1000],
			["H_Cap_blk_ION",nil,1000],
			["H_Cap_oli_hs",nil,1000],
			["H_Cap_press",nil,1000],
			["H_Cap_usblack",nil,1000],
			["H_Cap_surfer",nil,1000]
		];
	};
	
	//Glasses
	case 2:
	{
		[
			["G_Lowprofile",nil,50],
			["G_Tactical_Black",nil,50],
			["G_Tactical_Clear",nil,50],
			["G_Aviator",nil,50],
			["G_Spectacles",nil,50],
			["G_Spectacles_Tinted",nil,50],
			["G_Squares",nil,50],
			["G_Squares_Tinted",nil,50],
			["G_Shades_Black",nil,50],
			["G_Shades_Blue",nil,50],
			["G_Shades_Green",nil,50],
			["G_Shades_Red",nil,50],
			["G_Sport_Blackred",nil,50],
			["G_Sport_BlackWhite",nil,50],
			["G_Sport_Blackyellow",nil,50],
			["G_Sport_Checkered",nil,50],
			["G_Sport_Greenblack",nil,50],
			["G_Sport_Red",nil,50],
			["G_Lady_Blue",nil,50],
			["G_Lady_Dark",nil,50],
			["G_Lady_Mirror",nil,50],
			["G_Lady_Red",nil,50],
			["G_Goggles_VR",nil,50]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_Press_F",nil,5000],
			["V_Chestrig_rgr",nil,5000],
			["V_BandollierB_rgr",nil,7000],
			["V_TacVest_oli",nil,25000],
			["V_PlateCarrierIA2_dgtl",nil,70000],
			["V_PlateCarrier2_rgr",nil,120000]

		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_AssaultPack_khk",nil,3500],
			["B_AssaultPack_dgtl",nil,3500],
			["B_AssaultPack_rgr",nil,3500],
			["B_AssaultPack_sgg",nil,3500],
			["B_AssaultPack_blk",nil,3500],
			["B_AssaultPack_cbr",nil,3500],
			["B_AssaultPack_mcamo",nil,3500],
			["B_Kitbag_mcamo",nil,3500],
			["B_Kitbag_sgg",nil,3500],
			["B_Kitbag_cbr",nil,3500],
			["B_TacticalPack_oli",nil,3500],
			["B_FieldPack_blk",nil,3500],
			["B_FieldPack_ocamo",nil,3500],
			["B_FieldPack_oucamo",nil,3500],
			["B_FieldPack_cbr",nil,3500],
			["B_Bergen_sgg",nil,3500],
			["B_Bergen_mcamo",nil,3500],
			["B_Kitbag_cbr",nil,3500],
			["B_Bergen_rgr",nil,3500],
			["B_Bergen_blk",nil,3500],
			["B_OutdoorPack_blk",nil,3500],
			["B_OutdoorPack_tan",nil,3500],
			["B_OutdoorPack_blu",nil,3500],
			["B_HuntingBackpack",nil,3500],
			["B_Carryall_ocamo",nil,3500],
			["B_Carryall_oucamo",nil,3500],
			["B_Carryall_mcamo",nil,3500],
			["B_ViperLightHarness_hex_F",nil,3500],
			["B_ViperLightHarness_oli_F",nil,3500],
			["B_ViperLightHarness_khk_F",nil,3500],
			["B_ViperLightHarness_blk_F",nil,3500],
			["B_ViperLightHarness_ghex_F",nil,3500],
			["B_Carryall_oli",nil,3500],
			["B_Carryall_khk",nil,3500],
			["B_Carryall_cbr",nil,3500]
			
		];
	};
};