/*
File: fn_imperiumLoadout.sqf
Author: Bryan "Tonic" Boardwine
Edited: Itsyuka
 
Description:
Loads the Imperium out with the default gear.
*/
private["_handle"];
_handle = [] spawn tanoarpg_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
 
//Load player with default imperium gear.
player addUniform "U_O_CombatUniform_ocamo";
 
/* Backpack */
player addBackpack "B_AssaultPack_rgr";
player addItem "ToolKit";



/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player addItem "ItemGPS";
player assignItem "ItemGPS";
 
[] call tanoarpg_fnc_saveGear;