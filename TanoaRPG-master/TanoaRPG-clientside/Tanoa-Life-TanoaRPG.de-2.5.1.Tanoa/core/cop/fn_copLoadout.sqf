/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn tanoarpg_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addBackpack "B_Carryall_cbr";
player addHeadgear "H_Cap_police";

player addItemToBackpack "ToolKit";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addBackpack "B_AssaultPack_rgr";
player addItem "ToolKit";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player addItem "Rangefinder";
player assignItem "Rangefinder";

player addWeapon "hgun_Rook40_snds_F";
for "_i" from 1 to 5 do { player addMagazine "30Rnd_9x21_Mag"; };

life_inv_donuts = 2;
life_inv_coffee = 2;
life_inv_spikeStrip = 2;
life_inv_painkillers = 5;




[] call tanoarpg_fnc_saveGear;