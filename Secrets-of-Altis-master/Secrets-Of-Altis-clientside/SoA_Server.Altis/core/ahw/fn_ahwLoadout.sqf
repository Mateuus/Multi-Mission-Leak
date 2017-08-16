#include <macro.h>
/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/

private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};


RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;
{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);



[]spawn
{
	//Load player with default medic gear.
	player forceaddUniform "U_Rangemaster";
	player addBackpack "B_Carryall_cbr";
	player addItem "NVGoggles";
	player addItem "Medikit";
	player addItem "FirstAidKit";
	player addItem "FirstAidKit";
	player addItem "ToolKit";
	player addItem "ItemMap";
	player assignItem "ItemMap";
	player addItem "ItemCompass";
	player assignItem "ItemCompass";
	player addItem "ItemGPS";
	player assignItem "ItemGPS";
	[true,"tablette",5] call life_fnc_handleInv;
	[true,"lockpick",2] call life_fnc_handleInv;	

	[] call life_fnc_saveGear;
	[] call life_fnc_updateClothing;
};