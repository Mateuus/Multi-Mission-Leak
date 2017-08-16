/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
_handle = [] spawn ES_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

player addUniform "U_I_C_Soldier_Bandit_4_F";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

/*
if (ES_xp_lvl >= 1 && { hmd player == "" }) then { player linkItem "NVGoggles"; };
*/

[] call ES_fnc_saveGear;
if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; }; };