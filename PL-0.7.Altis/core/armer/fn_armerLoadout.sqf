/*
	File: fn_armerLoadout.sqf
	Author: BlackScaryZ

	Description:
	Stuff de l'armée pas terminer
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Man_casual_4_F","U_C_Man_casual_5_F","U_C_Man_casual_6_F"];
player addUniform (_clothings select (floor(random (count _clothings))));

/* ITEMS */
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

[] call life_fnc_saveGear;
