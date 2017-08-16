/*
	File: fn_medicLoadout.sqf
	Author: TheTotenkopf
*/

//Gear+Items
player addItemToBackpack "Medikit";
player addItemToBackpack "ToolKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "NVGoggles";
player assignItem "NVGoggles";
player removeItem "ItemRadio";
player addGoggles "G_Aviator";
player addWeapon "Binocular";
player addItemToUniform "Chemlight_yellow";
player addItemToUniform "Chemlight_yellow";
player addItemToUniform "Chemlight_yellow";
player addItemToUniform "Chemlight_yellow";
player addItemToUniform "Chemlight_yellow";

[] call tanoarpg_fnc_setSkinns;