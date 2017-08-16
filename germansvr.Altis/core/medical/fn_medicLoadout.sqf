#include "..\..\script_macros.hpp"
/*
    File: fn_medicLoadout.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Loads the medic out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_MillerBody";
player addBackpack "B_Kitbag_sgg";
player addItem "FirstAidKit";
player addItem "FirstAidKit";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";


[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
