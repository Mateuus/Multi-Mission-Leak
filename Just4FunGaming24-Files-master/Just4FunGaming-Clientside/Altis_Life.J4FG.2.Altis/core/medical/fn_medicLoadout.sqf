/*
File: fn_medicLoadout.sqf
Author: Bryan "Tonic" Boardwine
Description:
Loads the medic out with the default gear.
*/
[] call XY_fnc_stripDownPlayer;

player forceAddUniform "U_B_CTRG_1";
player addBackpack "B_Bergen_mcamo";
player addItem "MediKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";