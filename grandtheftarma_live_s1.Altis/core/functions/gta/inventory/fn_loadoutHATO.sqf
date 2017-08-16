/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

//--- Strip
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

//--- Add
player forceAddUniform "U_B_CombatUniform_mcam_vest";

player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemRadio";
player linkItem "ItemWatch";

player addBackpack "B_Carryall_khk";
player additem "Toolkit";
