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

player forceAddUniform "U_I_CombatUniform";
player addVest "V_PlateCarrierH_CTRG";
player addHeadgear "H_HelmetB_light_snakeskin";

if (["GTA_milRank"] call GTA_fnc_const < 4) then {
  player addBackpack "B_AssaultPack_Kerry";
};

player addGoggles "G_Tactical_Black";
player addWeapon "Rangefinder";
player linkItem "ItemMap";
player linkItem (["ItemGPS", "B_UavTerminal"] select (["GTA_milRank"] call GTA_fnc_const >= 4));
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles_OPFOR";

player addItem "FirstAidKit";
player addItem "FirstAidKit";

player addWeapon "hgun_Pistol_heavy_01_snds_F";
player addHandgunItem "optic_MRD";
player addHandgunItem "11Rnd_45ACP_Mag";
player removeHandgunItem "muzzle_snds_acp";

//--- Virtual items
[true, "water", 2] call life_fnc_handleInv;
[true, "ration_small", 2] call life_fnc_handleInv;
[true, "snapgun", 1] call life_fnc_handleInv;
[true, "spikeStrip", 1] call life_fnc_handleInv;
