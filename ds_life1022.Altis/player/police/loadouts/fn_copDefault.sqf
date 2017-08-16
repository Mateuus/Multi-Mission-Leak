/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Police default outfit, also goes back to this once their deaths are over
*/

private ["_handle"];

//Delete the player's items and update ther carry weight
{
	missionNamespace setVariable [format ["DS_item_%1",_x],0];
} forEach DS_itemArray;
DS_currentWeight = 0;

//Strip the player
_handle = [] spawn DS_fnc_removeGear;
waitUntil {scriptDone _handle};

//Load player with default cop gear
player addUniform "U_Rangemaster";
player addVest "V_Rangemaster_belt";

player addMagazines ["16Rnd_9x21_Mag",7];
player addWeapon "hgun_P07_F";

player linkItem "ItemMap";
player linkItem "ItemCompass";

[] call DS_fnc_saveGear;
[] call DS_fnc_copUniform;