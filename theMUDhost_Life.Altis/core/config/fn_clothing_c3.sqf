/*
	File: fn_clothing_c3.sqf
	Author: Kevin
	
	Description:
	Master configuration file for C3 shop.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Mercenary Clothing"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
			["U_IG_Guerilla2_1",nil,5000],
			["U_OG_Guerilla2_2",nil,5000],
			["U_OG_Guerilla3_1",nil,5000],
			["U_BG_Guerilla3_2",nil,5000],
			["U_BG_Guerilla2_1",nil,5000]
			
		];
	};
	
	//Hats
	case 1:
	{
		[
			["H_MilCap_oucamo",nil,1200],
			["H_Bandanna_camo",nil,650],
			["H_Bandanna_khk_hs",nil,1000],
			["H_Cap_blk_CMMG",nil,1000],
			["H_Cap_brn_SPECOPS",nil,1000],
			["H_Cap_tan_specops_US",nil,1000],
			["H_Cap_khaki_specops_UK",nil,1000],
			["H_Cap_grn_BI",nil,1000],
			["H_Cap_blk_Raven",nil,1000],
			["H_MilCap_mcamo",nil,1000],
			["H_MilCap_dgtl",nil,1500],
			["H_MilCap_gry",nil,1500]
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
			["G_Lowprofile",nil,30]
		];
	};
	
	//Vest
	case 3:
	{
		[
			["V_TacVest_khk",nil,12500],
			["V_TacVest_brn",nil,12500],
			["V_TacVest_camo",nil,12500],
			["V_TacVest_oli",nil,12500],
			["V_Rangemaster_belt",nil,2500]
		];
	};
	
	//Backpacks
	case 4:
	{
		[
			["B_Kitbag_mcamo",nil,3000],
			["B_FieldPack_ocamo",nil,1250],
			["B_Bergen_sgg",nil,3000],
			["B_Carryall_mcamo",nil,4000],
			["B_Carryall_cbr",nil,4000]

		];
	};
};