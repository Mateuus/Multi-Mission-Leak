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
    _return pushBack ["U_I_CombatUniform", nil, 0];
    _return pushBack ["U_B_Wetsuit", nil, 0];
  };

  //--- Headgear
  case 1: {
    _return pushBack ["H_HelmetB_light_black", nil, 0];
  };

  //--- Glasses
  case 2:	{
    _return pushBack ["G_Tactical_Clear", nil, 0];
    _return pushBack ["G_Tactical_Black", nil, 0];
    _return pushBack ["G_Diving", nil, 0];
    _return pushBack ["G_Balaclava_blk", nil, 0];
    _return pushBack ["G_Balaclava_combat", nil, 0];
    _return pushBack ["G_Balaclava_lowprofile", nil, 0];
  };

  //--- Vest
  case 3:	{
    _return pushBack ["V_TacVest_blk_POLICE", nil, 0];
    _return pushBack ["V_PlateCarrier1_blk", nil, 0];
    _return pushBack ["V_PlateCarrier2_blk", nil, 0];
    _return pushBack ["V_RebreatherB", nil, 0];
  };

  //--- Backpacks
  case 4: {
    _return pushBack ["B_AssaultPack_blk", nil, 0];
    _return pushBack ["B_Carryall_blk", nil, 0];
    _return pushBack ["B_UAV_01_backpack_F", nil, 0];
  };
};

_return
