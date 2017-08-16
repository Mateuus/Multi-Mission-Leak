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
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,1000],
			["U_IG_leader",nil,1000],
			["U_O_CombatUniform_ocamo",nil,1000],
			["U_I_G_resistanceLeader_F",nil,10610],
			["U_I_G_Story_Protagonist_F",nil,10610],			
			["U_O_PilotCoveralls",nil,1000],
			["U_O_CombatUniform_oucamo",nil,1000],
			["U_O_SpecopsUniform_ocamo",nil,1000],
			["U_O_SpecopsUniform_blk",nil,1000],
			["U_O_OfficerUniform_ocamo",nil,1000],
			["U_B_T_Sniper_F",nil,1000],
			["U_O_T_Officer_F",nil,1000],
			["U_B_CombatUniform_mcam_vest",nil,1000],
			["U_B_T_Soldier_SL_F",nil,1000],
			["U_B_T_Soldier_F",nil,1000],
			["U_B_T_Soldier_AR_F",nil,1000],
			["U_I_CombatUniform_shortsleeve",nil,1000],
			["U_I_CombatUniform_tshirt",nil,1000],
			["U_O_GhillieSuit",nil,75000],
			["U_B_FullGhillie_sard",nil,150000],
			["U_B_T_FullGhillie_tna_F",nil,250000],
			["U_C_Scientist","Schutzanzug",30000]
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_Booniehat_dgtl",nil,100],
			["H_Cap_brn_SPECOPS",nil,100],
			["H_Cap_tan_specops_US",nil,100],
			["H_Cap_khaki_specops_UK",nil,100],
			["H_Cap_blk_Raven",nil,100],
			["H_Bandanna_camo",nil,100],
			["H_Bandanna_mcamo",nil,100],
			["H_Shemag_tan","NoName Maske",50000],
			["H_Shemag_olive","NoName Maske",50000],
			["H_Shemag_khk","NoName Maske",50000],
			["H_ShemagOpen_khk","NoName Maske",50000],
			["H_Beret_blk",nil,150],
			["H_Beret_grn",nil,850],
			["H_Beret_red",nil,850],
			["H_Watchcap_blk",nil,850],
			["H_Watchcap_camo",nil,850],
		    ["H_Watchcap_sgg",nil,850],
			["H_Booniehat_tna_F",nil,850],
			["H_HelmetB_tna_F",nil,850],
			["H_HelmetCrew_O_ghex_F",nil,850],
			["H_HelmetB_Enh_tna_F",nil,850],
			["H_HelmetB_Light_tna_F",nil,850],
			["H_MilCap_tna_F",nil,850],
			["H_MilCap_ghex_F",nil,850],
			["H_HelmetLeaderO_ghex_F",nil,850]
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
			["G_Bandanna_shades",nil,100]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_TacVest_camo",nil,10500],
			["V_BandollierB_cbr",nil,4500],
			["V_HarnessO_brn",nil,7500],
			["V_TacVest_blk",nil,7500],
			["V_HarnessOGL_ghex_F",nil,4500],
			["V_HarnessO_ghex_F",nil,4500],
			["V_BandollierB_ghex_F",nil,4500],
			["V_TacChestrig_cbr_F",nil,4500],
			["V_TacChestrig_grn_F",nil,4500],
			["V_TacChestrig_oli_F",nil,4500]
			//["V_HarnessOGL_brn","Sprengweste",1500000]
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
			["B_FieldPack_ghex_F",nil,3000],
			["B_Bergen_sgg",nil,4500],
			["B_Kitbag_cbr",nil,4500],
			["B_Carryall_oli",nil,5000],
			["B_Carryall_khk",nil,5000],
			["B_Carryall_cbr",nil,5000],
			["B_Carryall_mcamo",nil,5000],
			["B_Carryall_oucamo",nil,5000],
			["B_Carryall_ocamo",nil,5000],
			["B_Bergen_dgtl_F",nil,10000],
			["B_Bergen_mcamo_F",nil,10000],
			["B_Bergen_tna_F",nil,10000],
			["B_Parachute",nil,15000]
		];
	};
};