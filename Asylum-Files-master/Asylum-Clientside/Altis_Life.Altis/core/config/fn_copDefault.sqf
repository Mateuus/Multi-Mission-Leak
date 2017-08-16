/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

//Load player with default cop gear.

if (worldName == "Tanoa") then 
{
	if (life_copLevel >= 4) then { player forceAddUniform "U_B_GEN_Commander_F" }
	else { player forceAddUniform "U_B_GEN_Soldier_F" };
	if (79 in life_talents) then { player addVest "V_TacVest_gen_F" }
	else { player addVest "V_Rangemaster_belt" };
	if (life_copLevel >= 4) then { player addHeadgear "H_Beret_gen_F" } else { player addHeadgear "H_MilCap_gen_F" };
}
else
{
	if (life_copLevel >= 4) then { player forceAddUniform "U_B_CombatUniform_mcam_worn" }
	else { player forceAddUniform "U_Rangemaster" };
	if (79 in life_talents) then { player addVest "V_tacVest_blk_police" }
	else { player addVest "V_Rangemaster_belt" };
	player addHeadgear "H_Cap_police";
};

player linkItem "ItemMap";
player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "NVGoggles_OPFOR";
player linkItem "Binocular";
player linkItem "ItemGPS";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "FirstAidKit";

player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";
if (77 in life_talents && life_copLevel >= 2) then
{
	[player, "arifle_SPAR_01_blk_F", 6, "30Rnd_556x45_Stanag_Tracer_Green"] call BIS_fnc_addWeapon;
	player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "30Rnd_556x45_Stanag";
	player addMagazine "30Rnd_556x45_Stanag";
}
else
{
	[player, "SMG_05_F", 7, "30Rnd_9x21_Mag_SMG_02_Tracer_Yellow"] call BIS_fnc_addWeapon;
};
player addPrimaryWeaponItem "optic_ACO_grn_smg";

[] call life_fnc_saveGear;
[] call life_fnc_equipGear;