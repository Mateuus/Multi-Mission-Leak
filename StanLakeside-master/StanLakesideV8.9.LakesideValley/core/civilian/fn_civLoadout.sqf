/*
	File: fn_civLoadout.sqf
	
	Edited: Itsyuka
	
	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};
player addUniform "A3LShirt";
/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addBackpack "B_AssaultPack_cbr";
[] call life_fnc_saveGear;