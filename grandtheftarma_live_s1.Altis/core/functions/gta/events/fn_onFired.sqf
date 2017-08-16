/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params ["", "_weapon", "_muzzle", "", "_ammo", "", "_projectile"];

//--- Record combat tick
GTA_combat_lastTick = diag_tickTime;

//--- Advanced rebel restrictions
if (
  playerSide == civilian
  && {!license_civ_advrebel}
  && (_weapon isKindOf ["MMG_02_base_F", configFile >> "CfgWeapons"]    //--- SPMG
  || {_weapon isKindOf ["LMG_Mk200_F", configFile >> "CfgWeapons"]}     //--- MK200
  || {_weapon isKindOf ["DMR_02_base_F", configFile >> "CfgWeapons"]}   //--- MAR-10
  || {_weapon isKindOf ["DMR_04_base_F", configFile >> "CfgWeapons"]}   //--- ASP
  || {_weapon isKindOf ["DMR_05_base_F", configFile >> "CfgWeapons"]}   //--- Cyrus
  || {_weapon isKindOf ["DMR_03_base_F", configFile >> "CfgWeapons"]}   //--- Mk-I
  || {_weapon isKindOf ["EBR_base_F", configFile >> "CfgWeapons"]})     //--- Mk18
) then {
  deleteVehicle _projectile;
};

//--- Civilian restrictions
if (playerSide == civilian && {_ammo in ["G_40mm_HE", "M_Titan_AA"]}) then {
  deleteVehicle _projectile;
};
