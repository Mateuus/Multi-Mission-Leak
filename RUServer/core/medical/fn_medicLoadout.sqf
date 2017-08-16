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

player addUniform "U_O_OfficerUniform_ocamo";
player addBackpack "B_FieldPack_oli";
player addItem "FirstAidKit";
player addItem "Medikit";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
