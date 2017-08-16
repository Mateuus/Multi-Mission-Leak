/*
	File: fn_clothing_bruce.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Bruce's Outback Outfits.
*/
private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Bruce's Outback Outfits"];

switch (_filter) do
{
	//Uniforms
	case 0:
	{
		[
		    ["U_C_Poloshirt_blue","Poloshirt Blue",250],
		    ["U_C_Poloshirt_burgundy","Poloshirt Burgundy",275],
		    ["U_C_Poloshirt_salmon","Poloshirt Salmon",175],
		    ["U_C_Poloshirt_stripped","Poloshirt stripped",125],
		    ["U_C_Poor_2","Rag tagged clothes",250],
		    ["U_IG_Guerilla2_2","Green stripped shirt & Pants",650],
		    ["U_IG_Guerilla3_1","Brown Jacket & Pants",735],
		    ["U_IG_Guerilla2_3","The Outback Rangler",1200],
		    ["U_C_HunterBody_grn","The Hunters Look",1500],
			["U_I_C_Soldier_Bandit_4_F",nil,1500],
			["U_I_C_Soldier_Bandit_5_F",nil,1500],
			["U_I_C_Soldier_Bandit_3_F",nil,1500],
			["U_I_C_Soldier_Bandit_2_F",nil,1500],
			["U_I_C_Soldier_Bandit_1_F",nil,1500],
			["U_C_Man_casual_5_F",nil,3500],
			["U_C_Man_casual_4_F",nil,3500],
			["U_C_Man_casual_6_F",nil,3500],
			["U_C_man_sport_3_F",nil,2500],
			["U_C_man_sport_2_F",nil,2500],
			["U_C_man_sport_1_F",nil,2500],
			["U_C_Man_casual_1_F",nil,3500],
			["U_C_Man_casual_2_F",nil,3500],
			["U_C_Man_casual_3_F",nil,3500],
		    ["U_OrestesBody","Surfing On Land",1500],
		    ["U_NikosAgedBody","Casual Wears",5000],
		    ["U_C_Journalist", "Presse Kleidung", 5000]
		];
	};
	
	//Hats
	case 1:
	{
		[

			["H_Booniehat_khk", "Booniehat Khaki", 100],
			["H_Booniehat_oli", "Booniehat Oliv", 100],
			["H_Booniehat_indp", "Booniehat Khaki", 100],
			["H_Booniehat_mcamo", "Booniehat MTP", 100],
			["H_Booniehat_grn", "Booniehat Green", 100],
			["H_Booniehat_tan", "Booniehat Sand", 100],
			["H_Booniehat_dirty", "Booniehat Dirty", 100],
			["H_Booniehat_dgtl", "Booniehat AAF", 100],
			["H_Booniehat_khk_hs", "Booniehat Khaki Headset", 100],
			["H_Cap_red", "	Cap Red", 100],
			["H_Cap_blu", "Cap Blue", 100],
			["H_Cap_oli", "Cap Olive", 100],
			["H_Cap_tan", "Cap Tan", 100],
			["H_Cap_blk", "Cap Black", 100],
			["H_Cap_grn", "Cap Green", 100],
			["H_Cap_grn_BI", "Bohemia Cap", 100],
			["H_Cap_blk_Raven", "Cap AAF", 100],
			["H_Cap_blk_ION", "Cap ION", 100],
			["H_Cap_oli_hs", "Cap Olive", 100],
			["H_Cap_press", "Presse Cap", 100],
			["H_Cap_usblack", "Black Cap", 100],
			["H_Cap_surfer", "Surfer Cap", 100],
			["H_Bandanna_surfer", "Surfer Bandanna", 100],
			["H_Bandanna_khk", "Khaki Bandanna", 100],
			["H_Bandanna_khk_hs", "Khaki Bandanna Headset", 100],
			["H_Bandanna_cbr", "Coyote Bandanna", 100],
			["H_Bandanna_sgg", "Sage Bandanna", 100],
			["H_Bandanna_sand", "Sand Bandanna", 100],
			["H_Bandanna_surfer_blk", "Surfer Bandanna Black", 100],
			["H_Bandanna_surfer_grn", "Surfer Bandanna Green", 100],
			["H_Bandanna_gry", "Grey Bandanna", 100],
			["H_Bandanna_blu", "Blue Bandanna", 100],
			["H_Bandanna_camo", "Camo Bandanna", 100],
			["H_Watchcap_blk", "Beanie", 100],
			["H_Watchcap_cbr", "Beanie Coyote", 100],
			["H_Watchcap_khk", "Beanie Khaki", 100],
			["H_Watchcap_camo", "Beanie Green", 100],
			["H_Watchcap_sgg", "Beanie Sage", 100],
			["H_StrawHat", "Strohhut", 100],
            ["H_StrawHat_dark", "Strohhut Dunkel", 100],
			["H_TurbanO_blk", "Black Turban", 100],
			["H_Hat_blue", "Hat Blue", 100],
            ["H_Hat_brown", "Hat Brown", 100],
			["H_Hat_camo", "Hat Camo", 100],
			["H_Hat_grey", "Hat Grey", 100],
			["H_Hat_checker", "Hat Checker", 100],
			["H_Hat_tan", "Hat Tan", 100],
			["H_Cap_grn","Cap Green",100],
			["H_Cap_grn_BI","Bohemia Cap",100],
			["H_Cap_blk_Raven","Cap AAF",100],
			["H_Cap_blk_ION","Cap ION",100],
			["H_Cap_oli_hs","Cap Olive",100],
			["H_Cap_press","Presse Cap",100],
			["H_Cap_usblack","Black Cap",100],
			["H_Cap_surfer","Surfer Cap",100]
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

			["V_Press_F", "Presse Weste", 5000]
		];
	};
	
	//Backpacks
	case 4:
	{
		[

			["B_AssaultPack_khk","Assault Pack Light Green",3500],
			["B_AssaultPack_dgtl","Assault Pack Desert Camo",3500],
			["B_AssaultPack_rgr","Assault Pack Olive Green",3500],
			["B_AssaultPack_sgg","Assault Pack Sage",3500],
			["B_AssaultPack_blk","Assault Pack Black",3500],
			["B_AssaultPack_cbr","Assault Pack Tan",3500],
			["B_AssaultPack_mcamo","Assault Pack Woodland Camo",3500],
			["B_Kitbag_mcamo","Kitbag Woodland Camo",3500],
			["B_Kitbag_sgg","Kitbag Sage",3500],
			["B_Kitbag_cbr","Kitbag Tan",3500],
			["B_TacticalPack_oli","Tacticalpack Olive",3500],
			["B_FieldPack_blk","Field Pack Black", 3500],
			["B_FieldPack_ocamo","Field Pack Desert Camo",3500],
			["B_FieldPack_oucamo","Field Pack Blue Camo",3500],
			["B_FieldPack_cbr","Field Pack Tan",3500],
			["B_Bergen_sgg","Bergen Sage",3500],
			["B_Bergen_mcamo","Bergen Woodland Camo",3500],
			["B_Bergen_rgr","Bergen Olive Green",3500],
			["B_Bergen_blk","Bergen Black",3500],
			["B_OutdoorPack_blk","Outdoor Pack Black",3500],
			["B_OutdoorPack_tan","Outdoor Pack Tan",3500],
			["B_OutdoorPack_blu","Outdoor Pack Blue",3500],
			["B_HuntingBackpack","Hunting Backpack",3500],
			["B_Carryall_ocamo","Carryall Desert Camo",3500],
			["B_Carryall_oucamo","Carryall Blue Camo",3500],
			["B_Carryall_mcamo","Carryall Woodland Camo",3500],
			["B_ViperLightHarness_hex_F",nil,3500],
			["B_ViperLightHarness_oli_F",nil,3500],
			["B_ViperLightHarness_khk_F",nil,3500],
			["B_ViperLightHarness_blk_F",nil,3500],
			["B_ViperLightHarness_ghex_F",nil,3500],
			["B_Carryall_oli","Carryall Olive Green",3500],
			["B_Carryall_khk","Carryall Khaki",3500],
			["B_Carryall_cbr","Carryall Tan",3500]
		];
	};
};