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

player addUniform "U_B_CombatUniform_mcam";
player addBackpack "B_Carryall_khk";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemRadio";
player assignItem "ItemRadio";

[true,"defibrillator",1] call life_fnc_handleInv;
[true,"toolkit",1] call life_fnc_handleInv;
[true,"donuts",10] call life_fnc_handleInv;
[true,"waterBottle",10] call life_fnc_handleInv;

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;