/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.

private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
//Load player with default cop gear.
player addUniform "U_B_CombatUniform_mcam";
player addVest "";

player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";

player addBackpack "B_AssaultPack_blk";

[true,"defibrillator",1] call life_fnc_handleInv;
[true,"panicbutton",1] call life_fnc_handleInv;
[true,"toolkit",1] call life_fnc_handleInv;
[true,"donuts",5] call life_fnc_handleInv;
[true,"waterBottle",5] call life_fnc_handleInv;

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
*/

#include "..\..\script_macros.hpp"
/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Cookie
    
    Description:
    Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//clothing specific
if (FETCH_CONST(life_coplevel) == 1) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 2) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 3) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 4) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 5) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_blk_POLICE";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 6) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_blk_POLICE";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 7) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_02";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 8) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_02";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 9) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_Colonel";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 10) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Beret_Colonel";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 11) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 12) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

if (FETCH_CONST(life_coplevel) == 13) then {
player addUniform "U_B_CombatUniform_mcam";
player addHeadgear "H_Cap_police";
player addGoggles "G_Aviator";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_AssaultPack_blk";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemRadio";
player assignItem "ItemRadio";
};

[true,"defibrillator",1] call life_fnc_handleInv;
[true,"panicbutton",1] call life_fnc_handleInv;
[true,"toolkit",1] call life_fnc_handleInv;
[true,"donuts",5] call life_fnc_handleInv;
[true,"waterBottle",5] call life_fnc_handleInv;

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;