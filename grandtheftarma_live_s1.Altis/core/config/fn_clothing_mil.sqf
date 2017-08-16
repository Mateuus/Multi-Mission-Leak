/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */


private ["_filter", "_milRank", "_return"];
_filter = [_this, 0, 0, [0]] call GTA_fnc_param;
_milRank = "GTA_milRank" call GTA_fnc_const;
_return = [];

//--- Shop Title Name
ctrlSetText [3103, "NATO Clothing"];

switch _filter do {
  //--- Uniforms
  case 0:	{
    _return pushBack ["U_I_CombatUniform", "Combat Uniform MTP (BAF)", 0];
    _return pushBack ["U_I_CombatUniform_tshirt", "Combat Uniform MTP Rolled (BAF)", 0];
    _return pushBack ["U_I_GhillieSuit", "Combat Uniform MTP Ghillie (BAF)", 0];

    _return pushBack ["U_B_CombatUniform_mcam", nil, 0];
    _return pushBack ["U_B_CombatUniform_mcam_tshirt", nil, 0];
    _return pushBack ["U_B_CombatUniform_mcam_vest", nil, 0];
    _return pushBack ["U_B_survival_uniform", nil, 0];

    if (_milRank >= 3) then {
      _return pushBack ["U_B_CTRG_1", nil, 0];
      _return pushBack ["U_B_CTRG_2", nil, 0];
      _return pushBack ["U_B_CTRG_3", nil, 0];
    };

    if (_milRank >= 4) then {
      _return pushBack ["U_B_GhillieSuit", nil, 0];
      _return pushBack ["U_B_FullGhillie_ard", nil, 0];
      _return pushBack ["U_B_FullGhillie_sard", nil, 0];
      _return pushBack ["U_B_FullGhillie_lsh", nil, 0];
    };

    _return pushBack ["U_B_Wetsuit", nil, 0];
    _return pushBack ["U_Rangemaster", nil, 0];
    _return pushBack ["U_Competitor", nil, 0];
  };

  //--- Headgear
  case 1: {
    _return pushBack ["H_HelmetB", nil, 0];
    _return pushBack ["H_HelmetB_sand", nil, 0];
    _return pushBack ["H_HelmetB_desert", nil, 0];
    _return pushBack ["H_HelmetB_black", nil, 0];
    _return pushBack ["H_HelmetB_snakeskin", nil, 0];
    _return pushBack ["H_HelmetB_camo", nil, 0];

    _return pushBack ["H_HelmetB_light", nil, 0];
    _return pushBack ["H_HelmetB_light_black", nil, 0];
    _return pushBack ["H_HelmetB_light_sand", nil, 0];
    _return pushBack ["H_HelmetB_light_desert", nil, 0];
    _return pushBack ["H_HelmetB_light_snakeskin", nil, 0];

    _return pushBack ["H_HelmetSpecB", nil, 0];
    _return pushBack ["H_HelmetSpecB_blk", nil, 0];
    _return pushBack ["H_HelmetSpecB_paint2", nil, 0];
    _return pushBack ["H_HelmetSpecB_snakeskin", nil, 0];
    _return pushBack ["H_HelmetSpecB_sand", nil, 0];

    _return pushBack ["H_HelmetCrew_B", nil, 0];

    _return pushBack ["H_Cap_headphones", nil, 0];
    _return pushBack ["H_Cap_tan_specops_US", nil, 0];
    _return pushBack ["H_Cap_usblack", nil, 0];
    _return pushBack ["H_Cap_khaki_specops_UK", nil, 0];
    _return pushBack ["H_Cap_blk", nil, 0];

    _return pushBack ["H_Watchcap_blk", nil, 0];
    _return pushBack ["H_Watchcap_khk", nil, 0];
    _return pushBack ["H_Watchcap_camo", nil, 0];

    _return pushBack ["H_Booniehat_mcamo", nil, 0];
    _return pushBack ["H_Booniehat_khk_hs", nil, 0];

    _return pushBack ["H_Bandanna_khk_hs", nil, 0];

    if (_milRank >= 5) then {
      _return pushBack ["H_Beret_02", nil, 0];
    };
  };

  //--- Glasses
  case 2:	{
    _return pushBack ["G_Combat", nil, 0];
    _return pushBack ["G_Lowprofile", nil, 0];
    _return pushBack ["G_Tactical_Clear", nil, 0];
    _return pushBack ["G_Tactical_Black", nil, 0];
    _return pushBack ["G_Shades_Red", nil, 0];
    _return pushBack ["G_Shades_Green", nil, 0];
    _return pushBack ["G_Shades_Blue", nil, 0];
    _return pushBack ["G_Shades_Black", nil, 0];
    _return pushBack ["G_Diving", nil, 0];
    _return pushBack ["G_Balaclava_blk", nil, 0];
    _return pushBack ["G_Balaclava_combat", nil, 0];
    _return pushBack ["G_Balaclava_lowprofile", nil, 0];
    _return pushBack ["G_Balaclava_oli", nil, 0];
  };

  //--- Vest
  case 3:	{
    _return pushBack ["V_Rangemaster_belt", nil, 0];
    _return pushBack ["V_BandollierB_rgr", nil, 0];
    _return pushBack ["V_Chestrig_rgr", nil, 0];
    _return pushBack ["V_TacVest_oli", nil, 0];

    _return pushBack ["V_PlateCarrier1_rgr", nil, 0];
    _return pushBack ["V_PlateCarrier2_rgr", nil, 0];

    _return pushBack ["V_PlateCarrierL_CTRG", nil, 0];
    _return pushBack ["V_PlateCarrierH_CTRG", nil, 0];

    /*if (_milRank >= 4) then {
      _return pushBack ["V_PlateCarrier1_blk", nil, 0];
      _return pushBack ["V_PlateCarrier2_blk", nil, 0];
      _return pushBack ["V_PlateCarrierGL_blk", nil, 0];
    };*/

    _return pushBack ["V_PlateCarrierGL_rgr", nil, 0];
    _return pushBack ["V_PlateCarrierGL_mtp", nil, 0];

    _return pushBack ["V_RebreatherB", nil, 0];
  };

  //--- Backpacks
  case 4: {
    _return pushBack ["B_AssaultPack_rgr", nil, 0];
    _return pushBack ["B_AssaultPack_blk", nil, 0];
    _return pushBack ["B_AssaultPack_Kerry", "UK Assault Pack", 0];

    _return pushBack ["B_Kitbag_rgr", nil, 0];
    _return pushBack ["B_Kitbag_mcamo", nil, 0];

    _return pushBack ["B_Bergen_sgg", nil, 0];

    _return pushBack ["B_Carryall_khk", nil, 0];
    _return pushBack ["B_Carryall_cbr", nil, 0];
    _return pushBack ["B_Carryall_mcamo", nil, 0];

    if (_milRank >= 4) then {
      _return pushBack ["B_Static_Designator_01_weapon_F", nil, 0];
      _return pushBack ["B_UAV_01_backpack_F", nil, 0];
    };
  };
};

_return
