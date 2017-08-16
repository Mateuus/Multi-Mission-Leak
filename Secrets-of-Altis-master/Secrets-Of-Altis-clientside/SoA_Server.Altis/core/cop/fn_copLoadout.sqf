/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

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
player addBackpack "B_Carryall_khk";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addMagazine "B_9x21_Ball";
player addWeapon "hgun_P07_snds_F";
player selectWeapon "hgun_P07_snds_F";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";

[] call life_fnc_saveGear;
[] call life_fnc_updateClothing;