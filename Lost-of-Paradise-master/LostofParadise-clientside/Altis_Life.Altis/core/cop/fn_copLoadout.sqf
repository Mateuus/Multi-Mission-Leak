/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the cops out with the default gear.
	Edited: Itsyuka
*/

private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "U_B_CombatUniform_mcam";
player addVest "V_TacVest_blk_POLICE";
player addBackpack "B_Carryall_cbr";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addMagazine "11Rnd_45ACP_Mag";
player addWeapon "hgun_Pistol_heavy_01_F";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemWatch";
player assignItem "ItemWatch";
player addItem "ItemGPS";
player assignItem "ItemGPS";

if(backpack player != "") then {(unitBackpack player) setObjectTextureGlobal [0,""];};

[] call life_fnc_saveGear;