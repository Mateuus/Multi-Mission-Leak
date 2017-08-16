/*
    File: fn_copLoadout.sqf
    Author: Bryan "Tonic" Boardwine
    Edited: Itsyuka

    Description:
    Loads the cops out with the default gear.
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";

player addMagazine "11Rnd_45ACP_Mag";
player addWeapon "hgun_Pistol_heavy_01_snds_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemGPS";
player linkItem "ItemRadio";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
