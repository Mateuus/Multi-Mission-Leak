/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
[] call lhm_fnc_stripDownPlayer;

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player forceAddUniform (_clothings select (floor(random (count _clothings))));

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";

if (needReload player == 1) then {reload player};
[] call lhm_fnc_saveGear;