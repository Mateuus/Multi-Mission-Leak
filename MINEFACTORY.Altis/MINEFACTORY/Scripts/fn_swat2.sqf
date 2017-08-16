/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
if(life_atmcash < 20000) exitWith {hint "Du hast nicht genug Cash!";};
if(!license_cop_swat) exitWith {hint "Du bist kein SEK!";};
removeUniform player;
removeVest player;
removeGoggles player;
removeHeadGear player;
removeBackpack player;
//Load player with default cop gear.
player addUniform "U_B_Wetsuit";
player addBackpack "B_Carryall_cbr";
player addHeadgear "H_HelmetB_light_black";
player addGoggles "G_Balaclava_combat";
player addVest  "V_RebreatherB";

player addWeapon "hgun_P07_F";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "30Rnd_9x21_Mag";
player addMagazine "Laserbatteries";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "Laserdesignator";
player assignItem "Laserdesignator";

[true,"heal",3] call life_fnc_handleInv;
[true,"redgull",15] call life_fnc_handleInv;