/*
	File: fn_spedesaw.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Loads the medic out with the default gear.
*/
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadGear player;
removeAllWeapons player;
removeAllAssignedItems player;
removeGoggles player;

player forceAddUniform "EG_EMS1";

player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "ItemRadio";
player linkItem "ItemWatch";
player addItem "FirstAidKit";

player addBackpack "TRYK_B_Medbag_BK";
player addItem "Medikit";
player addVest "max_paramedic_vest_red";

life_gear = [] call life_fnc_hewudefr;
