/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["_unit", "_container", "_item"];
_type = (_item call BIS_fnc_itemType) select 1;
_remove = false;

private _isItemAdvRebel = [
  _item,
  [
    "U_I_G_resistanceLeader_F", "U_I_G_Story_Protagonist_F", "U_I_FullGhillie_lsh", "U_I_FullGhillie_ard", "U_I_FullGhillie_sard",
    "V_I_G_resistanceLeader_F", "V_PlateCarrierGL_rgr", "V_PlateCarrierIAGL_dgtl", "V_PlateCarrier2_rgr", "V_PlateCarrierIA2_dgtl"
  ],
  configFile >> "CfgWeapons"
] call GTA_fnc_isKindOf;

//--- Advanced rebel restrictions
if (playerSide == civilian && {_isItemAdvRebel} && {!license_civ_advrebel}) exitWith {
  //--- Remove the item
  if (_type == "Uniform") then {
    removeUniform player;
  } else {
    removeVest player;
  };

  //--- Warning hint
  [1, "This item is restricted and can only be used by Advanced Rebels", ["Warning", "#ff8800"]] call GTA_fnc_broadcast;
};

//--- Refresh uniform and backpack textures
if (_type in ["Uniform", "Backpack"]) then {
	[[player, uniform player, uniformContainer player], "GTA_fnc_setUnitTextures"] call GTA_fnc_remoteExec;
};
