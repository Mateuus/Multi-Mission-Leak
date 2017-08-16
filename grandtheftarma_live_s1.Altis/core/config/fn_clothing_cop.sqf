/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_filter", "_copRank", "_return"];
_filter = [_this, 0, 0, [0]] call GTA_fnc_param;
_copRank = "GTA_copRank" call GTA_fnc_const;
_return = [];

//--- Shop Title Name
ctrlSetText [3103, "Police Clothing"];

switch _filter do {
  //--- Uniforms
  case 0:	{
    _return pushBack ["U_O_OfficerUniform_ocamo", "Hi-Vis Uniform", 0];

    if (_copRank >= 3) then {
      _return pushBack ["U_B_CombatUniform_mcam", "Police Uniform", 0];
      _return pushBack ["U_B_Wetsuit", nil, 0];
    };
  };

  //--- Hats
  case 1: {
    _return pushBack ["H_Bandanna_camo", nil, 0];
    _return pushBack ["H_Bandanna_surfer", nil, 0];
    _return pushBack ["H_Bandanna_gry", nil, 0];
    _return pushBack ["H_Bandanna_cbr", nil, 0];
    _return pushBack ["H_Bandanna_surfer", nil, 0];
    _return pushBack ["H_Bandanna_khk", nil, 0];
    _return pushBack ["H_Bandanna_sgg", nil, 0];
    _return pushBack ["H_BandMask_blk", nil, 0];
    _return pushBack ["H_Cap_blu", nil, 0];
    _return pushBack ["H_Cap_grn", nil, 0];
    _return pushBack ["H_Cap_grn_BI", nil, 0];
    _return pushBack ["H_Cap_oli", nil, 0];
    _return pushBack ["H_Cap_red", nil, 0];
    _return pushBack ["H_Cap_tan", nil, 0];
    _return pushBack ["H_Booniehat_tan", nil, 0];
    _return pushBack ["H_RacingHelmet_1_white_F", "Quadbike Helmet", 0];
    _return pushBack ["H_Cap_police", nil, 0];

    if ( _copRank >= 6 ) then {
      _return pushBack ["H_HelmetB_light_black", nil, 0];
    };

    if ( _copRank >= 2 ) then {
      _return pushBack ["H_Watchcap_blk", nil, 0];
    };

    if( _copRank >= 7 ) then {
      _return pushBack ["H_Beret_blk_POLICE", nil, 0];
    };
  };

  //--- Glasses
  case 2: {
    _return pushBack ["G_Tactical_Clear", nil, 0];
    _return pushBack ["G_Spectacles_Tinted", nil, 0];
    _return pushBack ["G_Diving", nil, 0];
    _return pushBack ["G_Aviator", nil, 0];
    _return pushBack ["G_Shades_Green", nil, 0];
    _return pushBack ["G_Shades_Blue", nil, 0];
    _return pushBack ["G_Shades_Black", nil, 0];
    _return pushBack ["G_Shades_Red", nil, 0];
  };

  //--- Vest
  case 3: {
    _return pushBack ["V_Rangemaster_belt", nil, 0];
    _return pushBack ["V_BandollierB_blk", nil, 0];
    _return pushBack ["V_TacVest_blk_POLICE", nil, 0];

    if ( _copRank >= 3 ) then {
      _return pushBack ["V_PlateCarrier1_blk", nil, 0];
      _return pushBack ["V_RebreatherB", nil, 0];
    };

    if ( _copRank >= 6 ) then {
      _return pushBack ["V_PlateCarrier2_blk", nil, 0];
    };
  };

  //--- Backpacks
  case 4: {
    _return pushBack ["B_AssaultPack_cbr", nil, 0];
    _return pushBack ["B_FieldPack_cbr", nil, 0];
    _return pushBack ["B_Kitbag_cbr", nil, 0];
    _return pushBack ["B_TacticalPack_oli", nil, 0];
    _return pushBack ["B_Carryall_oli", nil, 0];

    if ( _copRank >= 5 ) then {
    _return pushBack ["B_Parachute", nil, 0];
    };

    //if ( _copRank >= 7 ) then {
    //	_return pushBack ["B_UAV_01_backpack_F", nil, 0];
    //};
  };
};

_return
