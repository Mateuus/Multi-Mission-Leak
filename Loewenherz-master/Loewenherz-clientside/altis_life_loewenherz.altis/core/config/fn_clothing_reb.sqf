/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Master configuration file for Reb shop.
*/
private["_filter"];
_filter = param [0,0,[0]];
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla1_1",nil,5000],
			["U_I_G_Story_Protagonist_F",nil,7500],
			["U_I_G_resistanceLeader_F",nil,11500],
			["U_O_SpecopsUniform_ocamo",nil,17500],
			["U_O_PilotCoveralls",nil,15610],
			["U_IG_leader","Guerilla Leader",15340],
			["U_O_GhillieSuit",nil,50000],
			["U_B_GhillieSuit",nil,50000],
			["U_I_GhillieSuit",nil,50000],
			["U_O_FullGhillie_lsh",nil,50000],
			["U_B_FullGhillie_ard",nil,50000],
			["U_O_FullGhillie_ard",nil,50000],
			["U_I_FullGhillie_ard",nil,50000],
			["U_B_FullGhillie_sard",nil,50000],
			["U_O_FullGhillie_sard",nil,50000],
			["U_I_FullGhillie_sard",nil,50000],
			["U_B_FullGhillie_lsh",nil,50000],
			["U_O_FullGhillie_lsh",nil,50000],
			["U_I_FullGhillie_lsh",nil,50000],
			["U_B_CombatUniform_mcam_vest",nil,12500],
			["U_B_survival_uniform",nil,15000],
			["U_I_CombatUniform_shortsleeve",nil,10000],
			["U_I_CombatUniform",nil,10000],
			["U_B_CombatUniform_mcam_tshirt",nil,9000],
			["U_B_CombatUniform_mcam_worn",nil,10000],
			["U_B_CTRG_1",nil,9000],
			["U_O_Wetsuit",nil,15000]

		];
	};

	//Hats
	case 1:
	{
		[
			["H_ShemagOpen_tan",nil,850],
			["H_Shemag_olive",nil,850],
			["H_ShemagOpen_khk",nil,800],
			["H_HelmetO_ocamo",nil,2500],
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_mcamo",nil,650],
			["H_Bandanna_camo",nil,650],
			["H_Watchcap_cbr",nil,650],
			["H_Booniehat_khk_hs",nil,650],
			["H_Booniehat_dgtl",nil,650],
			["H_MilCap_dgtl",nil,650]
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
			["G_O_Diving",nil,30]
		];
	};

	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,15000],
			["V_TacVest_oli",nil,15000],
			["V_TacVest_brn",nil,15000],
			["V_PlateCarrierIA2_dgtl",nil,45000],
			["V_PlateCarrierIA1_dgtl",nil,45000],
			["V_BandollierB_cbr",nil,5000],
			["V_HarnessOGL_brn","Suicide Vest",600000],
			["V_HarnessO_brn",nil,5000],
			["V_RebreatherIA",nil,15000]
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
			["B_Carryall_khk",nil,5000]
		];
	};
};