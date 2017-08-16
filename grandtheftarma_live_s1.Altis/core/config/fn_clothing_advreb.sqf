/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_filter", "_return"];
_filter = [ _this, 0, 0, [0]] call GTA_fnc_param;
_return = [];

//--- Shop Title Name
ctrlSetText [ 3103, "Advanced Rebel Clothing"];

switch _filter do {
  //--- Uniforms
  case 0:	{
    _return pushBack ["U_I_G_resistanceLeader_F", nil, 50000];
    _return pushBack ["U_I_G_Story_Protagonist_F", nil, 50000];
    _return pushBack ["U_I_FullGhillie_ard", nil, 100000];
    _return pushBack ["U_I_FullGhillie_sard", nil, 100000];
    _return pushBack ["U_I_FullGhillie_lsh", nil, 100000];
  };

  //--- Headgear
  case 1:	{
    _return pushBack ["H_HelmetB_light", nil, 15000];
    _return pushBack ["H_HelmetB_light_black", nil, 15000];
    _return pushBack ["H_HelmetB_light_sand", nil, 15000];
    _return pushBack ["H_HelmetB_light_desert", nil, 15000];
    _return pushBack ["H_HelmetB_light_snakeskin", nil, 15000];
    _return pushBack ["H_HelmetB_light_grass", nil, 15000];

    _return pushBack ["H_HelmetB", nil, 20000];
    _return pushBack ["H_HelmetB_sand", nil, 20000];
    _return pushBack ["H_HelmetB_desert", nil, 20000];
    _return pushBack ["H_HelmetB_black", nil, 20000];
    _return pushBack ["H_HelmetB_snakeskin", nil, 20000];
    _return pushBack ["H_HelmetB_camo", nil, 20000];
    _return pushBack ["H_HelmetB_paint", nil, 20000];

    _return pushBack ["H_HelmetSpecB", nil, 25000];
    _return pushBack ["H_HelmetSpecB_blk", nil, 25000];
    _return pushBack ["H_HelmetSpecB_paint2", nil, 25000];
    _return pushBack ["H_HelmetSpecB_snakeskin", nil, 25000];
    _return pushBack ["H_HelmetSpecB_sand", nil, 25000];
    _return pushBack ["H_HelmetSpecB_paint1", nil, 25000];
  };

  //--- Goggles
  case 2:	{

  };

  //--- Vests
  case 3:	{
    _return pushBack ["V_I_G_resistanceLeader_F", nil, 20000];

    //_return pushBack ["V_PlateCarrier2_rgr", nil, 100000];
    //_return pushBack ["V_PlateCarrierH_CTRG", nil, 100000];
    _return pushBack ["V_PlateCarrier2_blk", nil, 100000];
    _return pushBack ["V_PlateCarrierIA2_dgtl", nil, 100000];

    _return pushBack ["V_PlateCarrierIAGL_dgtl", nil, 140000];
    _return pushBack ["V_PlateCarrierIAGL_oli", nil, 140000];
    _return pushBack ["V_PlateCarrierGL_blk", nil, 140000];
    _return pushBack ["V_PlateCarrierGL_mtp", nil, 140000];
    _return pushBack ["V_PlateCarrierGL_rgr", nil, 140000];
  };

  //--- Backpacks
  case 4:	{
  };
};

_return
