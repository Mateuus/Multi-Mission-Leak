/*
	File: fn_detectiveGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Loads the detective out with the default gear.
*/

//{missionNamespace setVariable[_x,0];} forEach life_inv_items;
life_carryWeight = 0;

removeAllContainers player;
removeAllWeapons player;
removeHeadGear player;
_uniforms = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_OG_Guerilla3_1","U_OG_Guerilla3_2","U_IG_Guerilla2_1","U_IG_Guerilla2_2","U_IG_Guerilla2_3","U_C_HunterBody_grn","U_OrestesBody","U_NikosBody","U_I_G_resistanceLeader_F","U_I_G_Story_Protagonist_F"];
_backpacks = ["B_Carryall_oucamo","B_Bergen_sgg"];
player forceAddUniform (_uniforms select (floor (random (count _uniforms))));
player addBackpack (_backpacks select (floor (random (count _backpacks))));
player addVest "V_BandollierB_cbr";

if (worldName == "Australia") then 
{
	(unitBackpack player) addMagazineCargoGlobal ["RH_15Rnd_9x19_M9",5];
	player addWeapon "RH_m9";
	(unitBackpack player) addWeaponCargo ["hlc_smg_MP5N",1];
	(unitBackpack player) addItemCargo ["V_tacVest_blk_police",1];
	(unitBackpack player) addItemCargo ["H_Cap_police",1];
	(unitBackpack player) addMagazineCargoGlobal ["hlc_30Rnd_9x19_SD_MP5",5];
	(unitBackpack player) addMagazineCargoGlobal ["hlc_30Rnd_9x19_B_MP5",3];
	(unitBackpack player) addMagazineCargoGlobal ["SmokeShell",3];
	(unitBackpack player) addMagazineCargoGlobal ["MiniGrenade",3];
	player linkItem "ItemMap";
	player linkItem "ItemGPS";
	player linkItem "ItemCompass";
	player linkItem "NVGoggles";
}
else
{

player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addMagazine "16Rnd_9x21_Mag";
player addWeapon "hgun_P07_snds_F";
player linkItem "ItemMap";
player linkItem "ItemGPS";
player linkItem "ItemCompass";
player linkItem "NVGoggles";

(unitBackpack player) addWeaponCargo ["arifle_Mk20_F",1];
(unitBackpack player) addItemCargo ["V_tacVest_blk_police",1];
(unitBackpack player) addItemCargo ["H_Cap_police",1];
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "30Rnd_556x45_Stanag_Tracer_Green";
player addMagazine "SmokeShell";
player addMagazine "SmokeShell";
player addMagazine "SmokeShell";
player addMagazine "MiniGrenade";
player addMagazine "MiniGrenade";
};

//[true,"defib",1] call life_fnc_handleInv;
//[true,"painkillers",5] call life_fnc_handleInv;
//[true,"bloodbag",4] call life_fnc_handleInv;
//[true,"splint",3] call life_fnc_handleInv;
//[true,"redgull",4] call life_fnc_handleInv;
if (life_donator > 1 && life_inv_debitCard < 1) then { [true,"debitcard",1] call life_fnc_handleInv; };
[] call life_fnc_saveGear;
