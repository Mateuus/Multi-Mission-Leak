/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Police default outfit, also goes back to this once their deaths are over
*/
//Delete all their items and fix weight
{
	missionNamespace setVariable[_x,0];
}forEach DS_itemArray;
DS_currentWeight = 0;

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
player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";

[] call DS_cop_saveCopGear;
[] call DS_fnc_copuniform;