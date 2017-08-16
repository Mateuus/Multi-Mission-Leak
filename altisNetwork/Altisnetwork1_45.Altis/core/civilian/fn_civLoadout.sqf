/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer
    
    Description:
    Loads the civs out with the default gear, with randomized clothing.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
player addUniform (selectRandom _clothings);

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";

player addItem "ItemCompass";
player assignItem "ItemCompass";

player addItem "ItemRadio";
player assignItem "ItemRadio";

//-- Starting Gear
//[true,"toolkit",1] call life_fnc_handleInv;
//[true,"donuts",10] call life_fnc_handleInv;
//[true,"waterBottle",10] call life_fnc_handleInv;

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;

//-- Civilian Perks

//-- Starting With a Bigger Backpack
if ([life_currentExpPerks, "Backpackperk"] call mav_ttm_fnc_hasPerk) then {
    player addBackpack "B_AssaultPack_cbr";
};

if ([life_currentExpPerks, "Backpackperk_2"] call mav_ttm_fnc_hasPerk) then {
    player addBackpack "B_Carryall_oli";
};

if ([life_currentExpPerks, "Backpackperk_3"] call mav_ttm_fnc_hasPerk) then {
    player addBackpack "B_Bergen_dgtl_F";
};

//-- Starting With a GPS
if ([life_currentExpPerks, "GPSperk"] call mav_ttm_fnc_hasPerk) then {
    player addItem "ItemGPS";
	player assignItem "ItemGPS";
};

//-- Starting With a NVG - 
if ([life_currentExpPerks, "NVGperk"] call mav_ttm_fnc_hasPerk) then {
    player linkItem "NVGoggles";
};

//-- Starting With a ToolKit - 
if ([life_currentExpPerks, "Toolkitperk"] call mav_ttm_fnc_hasPerk) then {
    [true,"toolkit",1] call life_fnc_handleInv;
};