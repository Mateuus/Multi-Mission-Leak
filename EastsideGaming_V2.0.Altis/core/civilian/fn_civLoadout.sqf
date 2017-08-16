/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description:
    Loads the civs out with the default gear, with randomized clothing.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_C_Poloshirt_blue";

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
