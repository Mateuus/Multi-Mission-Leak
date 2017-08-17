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

_oldGear = life_repentz_cop_gear;
_uniform = _oldGear select 0;
_uniformItems = (_oldGear select 1) select 0;
_vest = _oldGear select 2;
_vestItems = (_oldGear select 3) select 0;
_backpack = _oldGear select 4;
_backpackItems = (_oldGear select 5) select 0;
_headGear = _oldGear select 6;
_goggles = _oldGear select 7;
_secondaryWeapon = _oldGear select 8;
_secondaryWeaponItems = (_oldGear select 9) select 0;

player addUniform _uniform;
player addVest _vest;
player addBackpack _backpack;
player addHeadGear _headGear;
player addGoggles _goggles;
player addWeapon _secondaryWeapon;

player addMagazine "11Rnd_45ACP_Mag";
player addWeapon "hgun_Pistol_heavy_01_F";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";

player addHandgunItem "optic_MRD";
player addHandgunItem "muzzle_snds_acp";

[true,"panicbutton",1] call life_fnc_handleInv;
[true,"handcuffs",1] call life_fnc_handleInv;
[true,"keys",1] call life_fnc_handleInv;
[true,"toolkit",1] call life_fnc_handleInv;
[true,"donuts",2] call life_fnc_handleInv;
[true,"waterBottle",2] call life_fnc_handleInv;
[true,"spikeStrip",1] call life_fnc_handleInv;
[true,"morphine",3] call life_fnc_handleInv;
[true,"defibrillator",1] call life_fnc_handleInv;


/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

{
	player addWeaponItem [secondaryWeapon player,_x];
} foreach _secondaryWeaponItems;

{
	player addItemToUniform _x;
} foreach _uniformItems;

{
	player addItemToVest _x;
} foreach _vestItems;

{
	player addItemToBackpack _x;
} foreach _backpackItems;

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
