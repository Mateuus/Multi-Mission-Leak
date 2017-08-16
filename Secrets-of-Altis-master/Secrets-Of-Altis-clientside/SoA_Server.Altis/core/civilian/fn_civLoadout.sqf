/*
	File: fn_civLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the civs out with the default gear.
*/
private["_handle"];

_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_rnd = round(random 1);
if(_rnd == 1) then {
	player forceaddUniform "U_Rangemaster";
} else {
	player forceAddUniform "U_Marshal";
};

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

[true,"toiletpaper",1] call life_fnc_handleinv;

if(!life_newplayer) then {[] call life_fnc_saveGear};
[] call life_fnc_updateClothing;