#include "..\..\script_macros.hpp"
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player forceAddUniform "U_B_CombatUniform_mcam";
player addBackpack "B_Kitbag_sgg";
player addHeadgear "H_Cap_marshal";
player addGoggles "G_Sport_Blackred";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemRadio";
player assignItem "ItemRadio"; 
player addItem "ItemGPS";
player assignItem "ItemGPS"; 

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;