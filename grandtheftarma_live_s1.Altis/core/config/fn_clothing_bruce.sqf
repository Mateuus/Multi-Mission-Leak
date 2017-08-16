/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_filter", "_return"];
_filter = [_this, 0, 0, [0]] call GTA_fnc_param;
_return = [];

//--- Shop Title Name
ctrlSetText [3103, "Bruce's Outback Outfits"];

switch _filter do {
	//--- Uniforms
	case 0:	{
    _return pushBack ["U_C_Commoner1_1", "1v1 me in jail m9", 250];
    _return pushBack ["U_C_Commoner1_2", "Hobo Outfit (Black)", 250];
    _return pushBack ["U_C_Commoner1_3", "Hobo Outfit (Blue)", 250];
    _return pushBack ["U_C_Commoner_shorts", "Hobo Outfit (Green)", 250];
    _return pushBack ["U_C_Poloshirt_blue", "Hobo Outfit (Maroon)", 250];
    _return pushBack ["U_C_Poloshirt_burgundy", "Hobo Outfit (Yellow Claw)", 250];
    _return pushBack ["U_C_Poloshirt_redwhite", "Pat", 250];
    _return pushBack ["U_C_Poloshirt_salmon", "Phil", 250];
    _return pushBack ["U_C_Poloshirt_stripped", "Manners", 250];
    _return pushBack ["U_C_Poloshirt_tricolour", "Britannia", 250];
    _return pushBack ["U_C_ShirtSurfer_shorts", "Squirtle", 250];
    _return pushBack ["U_C_TeeSurfer_shorts_1", "DnA", 250];
    _return pushBack ["U_C_TeeSurfer_shorts_2", "Monster Energy", 250];
    _return pushBack ["U_C_Poor_2", "Rag tagged clothes", 250];
    _return pushBack ["U_IG_Guerilla2_2", "Green stripped shirt & Pants", 650];
    _return pushBack ["U_IG_Guerilla3_1", "Brown Jacket & Pants", 735];
    _return pushBack ["U_IG_Guerilla2_3", "The Outback Rangler", 1200];
    _return pushBack ["U_C_HunterBody_grn", "The Hunters Look", 1500];
    _return pushBack ["U_C_WorkerCoveralls", "Mechanic Coveralls", 2500];
    _return pushBack ["U_Marshal", "White Polo", 1100];
    _return pushBack ["U_OrestesBody", "Surfing On Land", 1100];
    _return pushBack ["U_NikosBody", "Russian Hobo", 5000];
    _return pushBack ["U_NikosAgedBody", "Casual Wears", 5000];
	};

	//--- Headgear
	case 1: {
    _return pushBack ["H_Bandanna_camo", "Camo Bandanna", 500];
    _return pushBack ["H_Bandanna_surfer", "Surfer Bandanna", 500];
    _return pushBack ["H_Bandanna_gry", "Grey Bandanna", 500];
    _return pushBack ["H_Bandanna_cbr", nil, 500];
    _return pushBack ["H_Bandanna_surfer", nil, 500];
    _return pushBack ["H_Bandanna_khk", "Khaki Bandanna", 500];
    _return pushBack ["H_Bandanna_sgg", "Sage Bandanna", 500];
    _return pushBack ["H_StrawHat", "Straw Fedora", 500];
    _return pushBack ["H_BandMask_blk", "Hat & Bandanna", 500];
    _return pushBack ["H_Booniehat_tan", nil, 500];
    _return pushBack ["H_Hat_blue", nil, 500];
    _return pushBack ["H_Hat_brown", nil, 500];
    _return pushBack ["H_Hat_checker", nil, 500];
    _return pushBack ["H_Hat_grey", nil, 500];
    _return pushBack ["H_Hat_tan", nil, 500];
    _return pushBack ["H_Cap_blu", nil, 500];
    _return pushBack ["H_Cap_grn", nil, 500];
    _return pushBack ["H_Cap_grn_BI", nil, 500];
    _return pushBack ["H_Cap_oli", nil, 500];
    _return pushBack ["H_Cap_red", nil, 500];
    _return pushBack ["H_Cap_tan", nil, 500]
	};

	//--- Goggles
	case 2: {
    _return pushBack ["G_Spectacles", nil, 200];
    _return pushBack ["G_Spectacles_Tinted", nil, 200];
    _return pushBack ["G_Shades_Black", nil, 200];
    _return pushBack ["G_Shades_Green", nil, 200];
    _return pushBack ["G_Shades_Red", nil, 200];
    _return pushBack ["G_Shades_Blue", nil, 200];
    _return pushBack ["G_Squares", nil, 200];
    _return pushBack ["G_Squares_Tinted", nil, 200];
    _return pushBack ["G_Sport_BlackWhite", nil, 200];
    _return pushBack ["G_Sport_Blackyellow", nil, 200];
    _return pushBack ["G_Sport_Greenblack", nil, 200];
    _return pushBack ["G_Sport_Checkered", nil, 200];
    _return pushBack ["G_Sport_Blackred", nil, 200];
    _return pushBack ["G_Sport_Red", nil, 200];
    _return pushBack ["G_Aviator", nil, 200];
    _return pushBack ["G_Lady_Mirror", nil, 200];
    _return pushBack ["G_Lady_Dark", nil, 200];
    _return pushBack ["G_Lady_Red", nil, 200];
    _return pushBack ["G_Lady_Blue", nil, 200];
	};

	//--- Vest
	case 3: {
    _return pushBack ["V_Rangemaster_belt", nil, 5000];
    _return pushBack ["V_BandollierB_khk", nil, 7000];
    _return pushBack ["V_BandollierB_cbr", nil, 7000];
    _return pushBack ["V_BandollierB_blk", nil, 7000];
    _return pushBack ["V_BandollierB_oli", nil, 7000];
    _return pushBack ["V_HarnessOSpec_brn", nil, 10000];
    _return pushBack ["V_HarnessOSpec_gry", nil, 10000]
	};

	//--- Backpacks
	case 4:	{
    _return pushBack ["B_AssaultPack_cbr", nil, 100];

    _return pushBack ["B_FieldPack_ocamo", nil, 200];

    _return pushBack ["B_TacticalPack_oli", nil, 400];

    _return pushBack ["B_Kitbag_cbr", nil, 600];
    _return pushBack ["B_Kitbag_sgg", nil, 600];

    _return pushBack ["B_Bergen_sgg", nil, 600];

    _return pushBack ["B_Carryall_oli", nil, 1000];
    _return pushBack ["B_Carryall_khk", nil, 1000];
	};
};

_return
