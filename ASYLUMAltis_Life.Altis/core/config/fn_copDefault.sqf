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
if (life_copLevel >= 4) then { player forceAddUniform "U_B_CombatUniform_mcam_worn" }
else { player forceAddUniform "U_Rangemaster" };
if (79 in life_talents) then { player addVest "V_tacVest_blk_police" }
else { player addVest "V_Rangemaster_belt" };
player addHeadgear "H_Cap_police";
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

if (worldName == "Australia") then 
{
	player addMagazine "RH_15Rnd_9x19_M9";
	player addMagazine "RH_15Rnd_9x19_M9";
	player addMagazine "RH_15Rnd_9x19_M9";
	player addMagazine "RH_15Rnd_9x19_M9";
	player addMagazine "RH_15Rnd_9x19_M9";
	player addWeapon "RH_m9";
	if (77 in life_talents) then
	{
		player addMagazine "hlc_30Rnd_9x19_SD_MP5";
		player addMagazine "hlc_30Rnd_9x19_SD_MP5";
		player addMagazine "hlc_30Rnd_9x19_SD_MP5";
		player addMagazine "hlc_30Rnd_9x19_SD_MP5";
		player addMagazine "hlc_30Rnd_9x19_SD_MP5";
		player addMagazine "hlc_30Rnd_9x19_B_MP5";
		player addMagazine "hlc_30Rnd_9x19_B_MP5";
		player addMagazine "hlc_30Rnd_9x19_B_MP5";
		player addWeapon "hlc_smg_MP5N";
		player addPrimaryWeaponItem "optic_Aco";
	};
}
else
{
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	if (77 in life_talents) then
	{
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
		player addWeapon "arifle_Mk20_F";
		player addPrimaryWeaponItem "optic_ACO_grn_smg";
	};
};

[] call life_fnc_saveGear;
[] call life_fnc_equipGear;