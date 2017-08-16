/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private ["_filter", "_return"];
_filter = [_this, 0, 0, [0]] call GTA_fnc_param;
_return = [];
ctrlSetText [3103, "Press Clothing"];

switch _filter do {
  //--- Uniforms
  case 0: {
    _return pushBack ["U_C_Journalist", nil, 500];
  };

  //--- Headgear
  case 1: {
    _return pushBack ["H_Cap_press", nil, 500];
  };

  //--- Glasses
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
    _return pushBack ["V_Press_F", nil, 5000];
  };

  //--- Backpacks
  case 4: {

  };
};

_return
