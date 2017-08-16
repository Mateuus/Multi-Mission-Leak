/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

private "_copRank";
_copRank = [ "GTA_copRank" ] call GTA_fnc_const;

//--- Strip
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

//--- Add clothing shit
player forceAddUniform "U_O_OfficerUniform_ocamo";
player addGoggles "G_Tactical_Clear";
player addBackpack "B_Carryall_cbr";
player addItemToBackpack "ToolKit";
player addItemToBackpack "ToolKit";
player addItemToBackpack "FirstAidKit";
player addItemToBackpack "FirstAidKit";

//--- Ender is a fucking dog
if ( _copRank == 12 ) then {

	player addHeadgear "H_Beret_blk_POLICE";

};

//--- Add items
player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles_OPFOR";
player addWeapon "Rangefinder";

//--- Vest
player addVest "V_TacVest_blk_POLICE";

//--- Taser
player addWeapon "hgun_Pistol_heavy_01_snds_F";
player addHandgunItem "11Rnd_45ACP_Mag";
player addHandgunItem "optic_MRD";

//--- Virtual items
[ true, "water", 2 ] call life_fnc_handleInv;
[ true, "rabbit", 2 ] call life_fnc_handleInv;
[ true, "spikeStrip", 1 ] call life_fnc_handleInv;

if ( _copRank > 2 ) then {

	[ true, "snapgun", 1 ] call life_fnc_handleInv;

} else {

	[ true, "lockpick", 2 ] call life_fnc_handleInv;

};
