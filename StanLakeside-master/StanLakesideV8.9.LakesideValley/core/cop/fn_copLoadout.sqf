/*
	File: fn_copLoadout.sqf
	
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
*/
private["_handle"];
_handle = [] spawn life_fnc_stripDownPlayer;
waitUntil {scriptDone _handle};

//Load player with default cop gear.
player addUniform "A3L_Sheriff_Uniform";
// Add shortrange radio
player addItem "tf_anprc152"; 
player assignItem "tf_anprc152";
player addBackpack "AM_PoliceBelt";
player addWeapon "cl3_taserM26_Yellow";
player addMagazine "cl3_taserm26mag_mpx";
player addMagazine "cl3_taserm26mag_mpx";
player addMagazine "cl3_taserm26mag_mpx";
player addMagazine "cl3_taserm26mag_mpx";
player addMagazine "cl3_taserm26mag_mpx";
player addMagazine "cl3_taserm26mag_mpx";
player addItem "cg_atf_bandage_i";
player addItem "cg_atf_bandage_i";
player addItem "cg_atf_bandage_i";
player addItem "cg_atf_bandage_i";
player addItem "cg_atf_bandage_i";
player addItem "CG_Pro_Item_i";
player addItem "CG_ATF_Handcuffs_i";
player addItem "CG_Spikes_Collapsed";
player addItem "CG_Spikes_Collapsed";
player addItem "CG_Spikes_Collapsed";
player addItem "CG_Spikes_Collapsed";
player addItem "CG_Spikes_Collapsed";
player addItem "Radar_Gun";
player addItem "ToolKit";

/* ITEMS */
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "tf_anprc152";
player assignItem "tf_anprc152";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addItem "Mattaust_Keys";
player assignItem "Mattaust_Keys";
[] call life_fnc_saveGear;
