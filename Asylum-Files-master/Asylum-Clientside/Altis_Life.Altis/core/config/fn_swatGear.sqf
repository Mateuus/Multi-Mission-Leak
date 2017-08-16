/*
	File: fn_swatGear.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Loads equipment based on SWAT role
*/

private ["_role","_water"];

_role = [_this,0,0,[0]] call BIS_fnc_param;
_water = [_this,1,false,[false]] call BIS_fnc_param;

removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

if (worldName == "Australia") then
{
	switch (_role) do
	{
		case 0: // Assault
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
				player addBackpack "B_AssaultPack_blk";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			for "_i" from 1 to 3 do {player addItemToVest "RH_20Rnd_57x28_FN";};
			for "_i" from 1 to 4 do {player addItemToVest "hlc_30rnd_556x45_SPR";};
			for "_i" from 1 to 5 do {player addItemToVest "hlc_30rnd_556x45_EPR";};
			for "_i" from 1 to 2 do {player addItem "SmokeShell";};
			for "_i" from 1 to 2 do {player addItem "MiniGrenade";};
			player addHeadgear "TRYK_H_PASGT_BLK";
			player addGoggles "G_Balaclava_blk";
			player addWeapon "hlc_rifle_CQBR";
			player addPrimaryWeaponItem "CUP_acc_Flashlight";
			player addPrimaryWeaponItem "CUP_optic_HoloBlack";
			player linkItem "ItemGPS";
		};
		case 1: // Recon
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			for "_i" from 1 to 2 do {player addItemToVest "RH_20Rnd_57x28_FN";};
			for "_i" from 1 to 3 do {player addItemToVest "hlc_30Rnd_9x19_B_MP5";};
			for "_i" from 1 to 4 do {player addItemToVest "hlc_30Rnd_9x19_SD_MP5";};
			for "_i" from 1 to 2 do {player addItem "MiniGrenade";};
			for "_i" from 1 to 4 do {player addItem "SmokeShell";};
			player addHeadgear "TRYK_H_DELTAHELM_NV";
			player addItemToVest "SmokeShell";
			player addItemToVest "SmokeShellGreen";
			player addBackpack "B_UAV_01_backpack_F";
			player addGoggles "G_Balaclava_blk";
			player addWeapon "hlc_smg_mp5sd5";
			player addPrimaryWeaponItem "optic_ACO_grn_smg";
			player linkItem "B_UavTerminal";
		};
		case 2: // Leader
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			//for "_i" from 1 to 3 do {player addItemToUniform "CUP_8Rnd_B_Beneli_74Slug";};
			//for "_i" from 1 to 4 do {player addItemToVest "CUP_8Rnd_B_Beneli_74Pellets";};
			for "_i" from 1 to 10 do {player addItemToVest "CUP_15Rnd_9x19_M9";};
			for "_i" from 1 to 3 do {player addItemToVest "hlc_30Rnd_9x19_SD_MP5";};
			player addHeadgear "TRYK_H_PASGT_BLK";
			player addItemToVest "SmokeShell";
			player addItemToVest "SmokeShellGreen";
			for "_i" from 1 to 2 do {player addItem "MiniGrenade";};
			
			player addBackpack "B_AssaultPack_blk";
			player addItemToBackpack "Medikit";
			for "_i" from 1 to 6 do {player addItemToBackpack "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItemToBackpack "SmokeShell";};
			player addGoggles "G_Balaclava_combat";
			this addWeapon "CUP_hgun_BallisticShield_Armed";
			//this addWeapon "CUP_sgun_M1014";
			//this addPrimaryWeaponItem "optic_ACO_grn";
			this addWeapon "hlc_smg_mp5k";
			player linkItem "ItemGPS";
			life_inv_ladder = 1;
		};
	};

	for "_i" from 1 to 2 do {player addItemToVest "Chemlight_green";};
	player addWeapon "RH_fn57";
}
else
{
	switch (_role) do
	{
		case 0: // Assault
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
				player addBackpack "B_AssaultPack_blk";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			if(life_deploySWAT select 2 > 100) then {player addBackpack "B_Parachute"; player addVest "V_PlateCarrier1_blk"};
			for "_i" from 1 to 10 do {player addItem "20Rnd_762x51_Mag";};
			for "_i" from 1 to 2 do {player addItem "SmokeShell";};
			for "_i" from 1 to 3 do {player addItem "MiniGrenade";};
			for "_i" from 1 to 6 do {player addItem "FirstAidKit";};
			player addItem "SmokeShell";
			player addItem "SmokeShellGreen";
			player addItem "11Rnd_45ACP_Mag";
			player addHeadgear "H_CrewHelmetHeli_B";
			player addGoggles "G_Balaclava_blk";
			player addWeapon "srifle_DMR_03_F";
			player addPrimaryWeaponItem "acc_pointer_IR";
			player addPrimaryWeaponItem "optic_Hamr";
			player linkItem "ItemGPS";
		};
		case 1: // Recon
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			if(life_deploySWAT select 2 > 100) then {player addBackpack "B_Parachute"; player addVest "V_PlateCarrier1_blk"} else {player addBackpack "B_UAV_01_backpack_F"};
			for "_i" from 1 to 4 do {player addItem "30Rnd_556x45_Stanag_Tracer_Green";};
			for "_i" from 1 to 5 do {player addItem "30Rnd_556x45_Stanag";};
			for "_i" from 1 to 2 do {player addItem "MiniGrenade";};
			for "_i" from 1 to 4 do {player addItem "SmokeShell";};
			for "_i" from 1 to 6 do {player addItem "FirstAidKit";};
			player addItem "SmokeShell";
			player addItem "SmokeShellGreen";
			player addGoggles "G_Balaclava_blk";
			player addWeapon "arifle_Mk20_F";
			player addPrimaryWeaponItem "muzzle_snds_acp";
			player addPrimaryWeaponItem "optic_ACO_grn";
			player linkItem "B_UavTerminal";
		};
		case 2: // Leader
		{
			if (_water) then
			{
				player forceAddUniform "U_B_Wetsuit";
				player addVest "V_RebreatherB";
			}
			else
			{
				player forceAddUniform "U_B_CombatUniform_mcam_worn";
				player addVest "V_PlateCarrier1_blk";
			};
			if(life_deploySWAT select 2 > 100) then {player addBackpack "B_Parachute"; player addVest "V_PlateCarrier1_blk"} else {player addBackpack "B_AssaultPack_blk"};
			for "_i" from 1 to 10 do {player addItem "20Rnd_762x51_Mag";};
			player addItem "SmokeShell";
			player addItem "SmokeShellGreen";
			for "_i" from 1 to 2 do {player addItem "MiniGrenade";};
			for "_i" from 1 to 2 do {player addItem "11Rnd_45ACP_Mag";};
			player addItemToBackpack "Medikit";
			for "_i" from 1 to 6 do {player addItem "FirstAidKit";};
			for "_i" from 1 to 5 do {player addItem "SmokeShell";};
			player addGoggles "G_Balaclava_combat";
			player addWeapon "srifle_DMR_03_F";
			player addPrimaryWeaponItem "acc_pointer_IR";
			player addPrimaryWeaponItem "optic_Hamr";
			player linkItem "ItemGPS";
			life_inv_ladder = 1;
		};
	};

	//for "_i" from 1 to 2 do {player addItemToVest "Chemlight_green";};
	player addWeapon "hgun_Pistol_heavy_01_F";
};

player addWeapon "Rangefinder";
player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "NVGoggles_OPFOR";

[player,"TFAegis"] call bis_fnc_setUnitInsignia;
[] call life_fnc_equipGear;