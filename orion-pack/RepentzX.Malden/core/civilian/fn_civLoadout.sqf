/*
    File: fn_civLoadout.sqf
    Author: Tobias 'Xetoxyc' Sittenauer

    Description:
    Loads the civs out with the default gear, with randomized clothing / Edited by Repentz to add custom clothing
*/
private ["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

_clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
/* Start Repentz */
_repentzHat = ["H_Booniehat_dirty","H_Booniehat_grn","H_Cap_blu"];
_repentzBackpack = ["B_TacticalPack_blk","B_Kitbag_rgr"];
//_repentzVest = ["V_Press_F","V_I_G_resistanceLeader_F"];

player addHeadgear (selectRandom _repentzHat);
player addBackpack (selectRandom _repentzBackpack);
//player addVest (selectRandom _repentzVest);
/* End Repentz */
player addUniform (selectRandom _clothings);


/* ITEMS */
player linkItem "ItemMap";
player linkItem "ItemCompass";

[] call life_fnc_playerSkins;
[] call life_fnc_saveGear;
