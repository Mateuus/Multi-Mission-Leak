/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_filter", "_return"];
_filter = [_this, 0, 0, [0]] call GTA_fnc_param;
_return = [];

//--- Shop Title Name
ctrlSetText [ 3103, "Rebel Clothing"];

switch _filter do {
  //--- Uniforms
  case 0:	{
    _return pushBack ["U_BG_Guerrilla_6_1", nil, 10000];
    _return pushBack ["U_BG_Guerilla1_1", nil, 10000];
    _return pushBack ["U_BG_Guerilla2_2", nil, 10000];
    _return pushBack ["U_BG_Guerilla2_1", nil, 10000];
    _return pushBack ["U_BG_Guerilla2_3", nil, 10000];
    _return pushBack ["U_BG_Guerilla3_1", nil, 10000];
    _return pushBack ["U_IG_Guerilla2_1", nil, 10000];
    _return pushBack ["U_IG_Guerilla1_1", nil, 10000];
    _return pushBack ["U_BG_leader", nil, 10000];
    _return pushBack ["U_O_OfficerUniform_ocamo", nil, 15000];
    _return pushBack ["U_I_OfficerUniform", nil, 15000];
    _return pushBack ["U_I_CombatUniform_shortsleeve", nil, 15000];
    //_return pushBack ["U_O_CombatUniform_ocamo", nil, 25000];
    //_return pushBack ["U_O_CombatUniform_oucamo", nil, 25000];
    //_return pushBack ["U_O_GhillieSuit", nil, 50000];
    _return pushBack ["U_I_GhillieSuit", nil, 75000];
    //_return pushBack ["U_O_PilotCoveralls", nil, 20000];
    _return pushBack ["U_I_PilotCoveralls", nil, 20000];
    _return pushBack ["U_O_Wetsuit", nil, 5000];
  };

  //--- Headgear
  case 1:	{
    _return pushBack ["H_Bandanna_blu", nil, 500];
    _return pushBack ["H_Bandanna_camo", nil, 500];
    _return pushBack ["H_Bandanna_cbr", nil, 500];
    _return pushBack ["H_Bandanna_gry", nil, 500];
    _return pushBack ["H_Bandanna_khk", nil, 500];
    _return pushBack ["H_Bandanna_mcamo", nil, 500];
    _return pushBack ["H_Bandanna_sgg", nil, 500];
    _return pushBack ["H_Bandanna_sand", nil, 500];
    _return pushBack ["H_Bandanna_surfer", nil, 500];
    _return pushBack ["H_Bandanna_surfer_blk", nil, 500];
    _return pushBack ["H_Bandanna_surfer_grn", nil, 500];
    _return pushBack ["H_Watchcap_blk", nil, 500];
    _return pushBack ["H_Watchcap_camo", nil, 500];
    _return pushBack ["H_Watchcap_cbr", nil, 500];
    _return pushBack ["H_Watchcap_khk", nil, 500];
    _return pushBack ["H_Watchcap_sgg", nil, 500];
    _return pushBack ["H_Booniehat_khk", nil, 500];
    _return pushBack ["H_Booniehat_indp", nil, 500];
    _return pushBack ["H_Booniehat_mcamo", nil, 500];
    _return pushBack ["H_Booniehat_oli", nil, 500];
    _return pushBack ["H_Booniehat_tan", nil, 500];
    _return pushBack ["H_ShemagOpen_khk", nil, 500];
    _return pushBack ["H_Shemag_olive", nil, 500];
    _return pushBack ["H_Shemag_khk", nil, 500];
    _return pushBack ["H_StrawHat", nil, 500];
    _return pushBack ["H_StrawHat_dark", nil, 500];

    _return pushBack ["H_Cap_brn_SPECOPS", nil, 500];
    _return pushBack ["H_Cap_blk_Raven", nil, 500];
    _return pushBack ["H_Cap_blk", nil, 500];
    _return pushBack ["H_Cap_oli_hs", nil, 500];

    _return pushBack ["H_MilCap_ocamo", nil, 500];
    _return pushBack ["H_MilCap_dgtl", nil, 500];
    _return pushBack ["H_MilCap_gry", nil, 500];
    _return pushBack ["H_MilCap_oucamo", nil, 500];

    _return pushBack ["H_Beret_blk", nil, 5000];

    _return pushBack ["H_HelmetCrew_O", nil, 15000];
    _return pushBack ["H_HelmetCrew_I", nil, 15000];

    _return pushBack ["H_HelmetIA", nil, 15000];
    _return pushBack ["H_HelmetO_ocamo", nil, 15000];
    _return pushBack ["H_HelmetLeaderO_ocamo", nil, 15000];
    _return pushBack ["H_HelmetO_oucamo", nil, 15000];
    _return pushBack ["H_HelmetLeaderO_oucamo", nil, 15000];
    _return pushBack ["H_HelmetSpecO_ocamo", nil, 15000];
    _return pushBack ["H_HelmetSpecO_blk", nil, 15000];
  };

  //--- Goggles
  case 2:	{
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
    _return pushBack ["G_O_Diving", nil, 200];
    _return pushBack ["G_I_Diving", nil, 200];
    _return pushBack ["G_Goggles_VR", nil, 200];

    _return pushBack ["G_Tactical_Black", nil, 1000];
    _return pushBack ["G_Tactical_Clear", nil, 1000];
    _return pushBack ["G_Combat", nil, 1000];
    _return pushBack ["G_Lowprofile", nil, 1000];

    _return pushBack ["G_Balaclava_blk", nil, 4000];
    _return pushBack ["G_Balaclava_oli", nil, 4000];
    _return pushBack ["G_Balaclava_combat", nil, 4000];
    _return pushBack ["G_Balaclava_lowprofile", nil, 4000];
    _return pushBack ["G_Bandanna_blk", nil, 4000];
    _return pushBack ["G_Bandanna_oli", nil, 4000];
    _return pushBack ["G_Bandanna_khk", nil, 4000];
    _return pushBack ["G_Bandanna_tan", nil, 4000];
    _return pushBack ["G_Bandanna_beast", nil, 4000];
    _return pushBack ["G_Bandanna_shades", nil, 4000];
    _return pushBack ["G_Bandanna_sport", nil, 4000];
    _return pushBack ["G_Bandanna_aviator", nil, 4000];
  };

  //--- Vests
  case 3:	{
    _return pushBack ["V_Rangemaster_belt", nil, 5000];

    _return pushBack ["V_BandollierB_khk", nil, 7000];
    _return pushBack ["V_BandollierB_cbr", nil, 7000];
    _return pushBack ["V_BandollierB_rgr", nil, 7000];
    _return pushBack ["V_BandollierB_blk", nil, 7000];
    _return pushBack ["V_BandollierB_oli", nil, 7000];

    _return pushBack ["V_Chestrig_khk", nil, 10000];
    _return pushBack ["V_Chestrig_rgr", nil, 10000];
    _return pushBack ["V_Chestrig_blk", nil, 10000];
    _return pushBack ["V_Chestrig_oli", nil, 10000];

    _return pushBack ["V_HarnessOGL_brn", nil, 10000];
    _return pushBack ["V_HarnessOGL_gry", nil, 10000];
    _return pushBack ["V_HarnessOSpec_brn", nil, 10000];
    _return pushBack ["V_HarnessOSpec_gry", nil, 10000];

    _return pushBack ["V_TacVest_blk", nil, 20000];
    _return pushBack ["V_TacVest_brn", nil, 20000];
    _return pushBack ["V_TacVest_camo", nil, 20000];
    _return pushBack ["V_TacVest_khk", nil, 20000];
    _return pushBack ["V_TacVest_oli", nil, 20000];
    _return pushBack ["V_TacVestIR_blk", nil, 30000];

    //_return pushBack ["V_PlateCarrier1_rgr", nil, 60000];
    //_return pushBack ["V_PlateCarrierL_CTRG", nil, 60000];
    _return pushBack ["V_PlateCarrier1_blk", nil, 60000];
    _return pushBack ["V_PlateCarrierIA1_dgtl", nil, 60000];

    _return pushBack ["V_RebreatherIR", nil, 5000];
  };

  //--- Backpacks
  case 4:	{
    _return pushBack ["B_AssaultPack_blk", nil, 100];
    _return pushBack ["B_AssaultPack_ocamo", nil, 100];
    _return pushBack ["B_AssaultPack_dgtl", nil, 100];
    _return pushBack ["B_AssaultPack_sgg", nil, 100];
    _return pushBack ["B_AssaultPack_khk", nil, 100];
    _return pushBack ["B_AssaultPack_cbr", nil, 100];

    _return pushBack ["B_FieldPack_ocamo", nil, 200];
    _return pushBack ["B_FieldPack_blk", nil, 200];
    _return pushBack ["B_FieldPack_cbr", nil, 200];
    _return pushBack ["B_FieldPack_oli", nil, 200];
    _return pushBack ["B_FieldPack_khk", nil, 200];
    _return pushBack ["B_FieldPack_oucamo", nil, 200];

    _return pushBack ["B_TacticalPack_ocamo", nil, 400];
    _return pushBack ["B_TacticalPack_oli", nil, 400];
    _return pushBack ["B_TacticalPack_blk", nil, 400];

    _return pushBack ["B_Kitbag_rgr", nil, 600];
    _return pushBack ["B_Kitbag_sgg", nil, 600];
    _return pushBack ["B_Kitbag_cbr", nil, 600];
    _return pushBack ["B_Kitbag_rgr", nil, 600];
    _return pushBack ["B_Kitbag_sgg", nil, 600];
    _return pushBack ["B_Kitbag_cbr", nil, 600];

    _return pushBack ["B_Bergen_blk", nil, 600];
    _return pushBack ["B_Bergen_mcamo", nil, 600];
    _return pushBack ["B_Bergen_rgr", nil, 600];
    _return pushBack ["B_Bergen_sgg", nil, 600];

    _return pushBack ["B_Carryall_oli", nil, 1000];
    _return pushBack ["B_Carryall_khk", nil, 1000];
    _return pushBack ["B_Carryall_cbr", nil, 1000];
    _return pushBack ["B_Carryall_ocamo", nil, 1000];
    _return pushBack ["B_Carryall_mcamo", nil, 1000];
    _return pushBack ["B_Carryall_oucamo", nil, 1000];
    _return pushBack ["B_Parachute", nil, 10000];
  };
};

_return
