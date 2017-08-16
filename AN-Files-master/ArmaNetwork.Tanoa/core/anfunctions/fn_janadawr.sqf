/*
	File: fn_janadawr.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka

	Description:
	Loads the cops out with the default gear.
*/

removeUniform player;
removeVest player;
removeBackpackGlobal player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

player forceAddUniform ([] call life_fnc_cruzeputrustu);
player addVest "V_Rangemaster_belt";
player addBackpack "AM_PoliceBelt";

player addWeapon "DDOPP_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";
player addMagazine "DDOPP_1Rnd_X26";

/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemWatch";

life_gear = [] call life_fnc_hewudefr;
