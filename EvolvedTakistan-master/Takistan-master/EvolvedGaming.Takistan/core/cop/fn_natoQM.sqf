#include <macro.h>
/*
    File: fn_natoQM.sqf
    Author: blaster
	For: EvolvedGaming 

    Description:
    NATO Quartermaster 
*/

private["_vendor","_class","_cost"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_class = [_this,3,"",[""]] call BIS_fnc_param;
//Error check
if(EQUAL(_class,"") OR (player distance _vendor > 10)) exitWith {};

//place holder remove if custom price set.
_cost = 12000;
if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
SUB(CASH,_cost);

removeHeadgear player:
removeGoggles player;
removeVest player;
removeBackpack player;
removeUniform player;
removeAllWeapons player:
removeAllAssignedItems player;


switch (_class) do
	{
	case "gunner":
		{
			player forceAddUniform "TRYK_U_B_BLKTAN_CombatUniform";
			player addItemToUniform "FirstAidKit";
			player addItemToUniform "Chemlight_green";
			player addVest "TRYK_V_ArmorVest_Delta2";
			player addItemToVest "FirstAidKit";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
			player addItemToVest "SmokeShellOrange";
			player addItemToVest "SmokeShellPurple";
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_green";};
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_blue";};
			player addItemToVest "CUP_HandGrenade_M67";
			player addItemToVest "DemoCharge_Remote_Mag";
			player addBackpack "TRYK_B_Kitbag_blk";
			for "_i" from 1 to 4 do {player addItemToBackpack "CUP_200Rnd_TE4_Red_Tracer_556x45_M249";};
			player addHeadgear "H_HelmetB_light_black";
			player addGoggles "TRYK_US_ESS_Glasses";

			//comment "Add weapons";
			player addWeapon "CUP_lmg_M249_para";
			player addPrimaryWeaponItem "CUP_acc_ANPEQ_2";
			player addPrimaryWeaponItem "CUP_optic_ACOG";
			player addWeapon "CUP_hgun_Compact";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Rangefinder";

			//comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "tf_microdagr";
			player linkItem "tf_anprc152_4";
			player linkItem "TRYK_G_bala_ess_NV";
		};
	case "recon":
		{
		//_cost = 12000
		//if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
		//SUB(CASH,_cost);
			player forceAddUniform "U_B_FullGhillie_lsh";
			player addItemToUniform "FirstAidKit";
			player addItemToUniform "Chemlight_green";
			for "_i" from 1 to 3 do {player addItemToUniform "Trixie_10x127_Mag";};
			player addVest "TRYK_V_ArmorVest_Delta2";
			player addItemToVest "FirstAidKit";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
			player addItemToVest "SmokeShellBlue";
			player addItemToVest "SmokeShellPurple";
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_green";};
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_blue";};
			player addItemToVest "CUP_HandGrenade_M67";
			player addItemToVest "DemoCharge_Remote_Mag";
			for "_i" from 1 to 2 do {player addItemToVest "Trixie_10x127_HEIAP_Mag";};
			player addBackpack "TRYK_B_Kitbag_blk";
			for "_i" from 1 to 6 do {player addItemToBackpack "Trixie_10x127_HEIAP_Mag";};
			player addHeadgear "H_HelmetB_light_black";
			player addGoggles "TRYK_US_ESS_Glasses";

			//comment "Add weapons";
			player addWeapon "Trixie_M107";
			player addPrimaryWeaponItem "CUP_acc_ANPEQ_2";
			player addPrimaryWeaponItem "Trixie_ANPVS10_Net";
			player addWeapon "CUP_hgun_Compact";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Rangefinder";

			//comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "tf_microdagr";
			player linkItem "tf_anprc152_4";
			player linkItem "TRYK_G_bala_ess_NV";
		};
	case "wood":
		{
			player forceAddUniform "TRYK_U_B_AOR2_BLK_CombatUniform";
			player addItemToUniform "FirstAidKit";
			player addItemToUniform "Chemlight_green";
			for "_i" from 1 to 2 do {player addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";};
			player addVest "TRYK_V_ArmorVest_Delta2";
			player addItemToVest "FirstAidKit";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
			player addItemToVest "SmokeShellBlue";
			player addItemToVest "SmokeShellPurple";
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_green";};
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_blue";};
			player addItemToVest "CUP_HandGrenade_M67";
			player addItemToVest "DemoCharge_Remote_Mag";
			for "_i" from 1 to 3 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			player addBackpack "TRYK_B_Kitbag_blk";
			for "_i" from 1 to 3 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			player addHeadgear "H_HelmetB_light_black";
			player addGoggles "TRYK_US_ESS_Glasses";
			 
			//comment "Add weapons";
			player addWeapon "rhs_weap_mk18_grip2_KAC";
			player addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
			player addPrimaryWeaponItem "rhsusf_acc_anpeq15";
			player addPrimaryWeaponItem "CUP_optic_ACOG";
			player addWeapon "CUP_hgun_Compact";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Rangefinder";
			 
			//comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "tf_microdagr";
			player linkItem "tf_anprc152_4";
			player linkItem "TRYK_G_bala_ess_NV";
		};
	case "des":
		{
			player forceAddUniform "TRYK_U_B_BLKTAN_CombatUniform";
			player addItemToUniform "FirstAidKit";
			player addItemToUniform "Chemlight_green";
			player addItemToUniform "rhs_mag_30Rnd_556x45_Mk318_Stanag";
			player addVest "TRYK_V_ArmorVest_Delta2";
			player addItemToVest "FirstAidKit";
			for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
			player addItemToVest "SmokeShellBlue";
			player addItemToVest "SmokeShellPurple";
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_green";};
			for "_i" from 1 to 4 do {player addItemToVest "Chemlight_blue";};
			player addItemToVest "CUP_HandGrenade_M67";
			player addItemToVest "DemoCharge_Remote_Mag";
			for "_i" from 1 to 3 do {player addItemToVest "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			player addBackpack "TRYK_B_Kitbag_blk";
			for "_i" from 1 to 3 do {player addItemToBackpack "rhs_mag_30Rnd_556x45_Mk262_Stanag";};
			player addHeadgear "H_HelmetB_light_black";
			player addGoggles "TRYK_US_ESS_Glasses";

			//comment "Add weapons";
			player addWeapon "rhs_weap_mk18_grip2_KAC";
			player addPrimaryWeaponItem "rhsusf_acc_rotex5_grey";
			player addPrimaryWeaponItem "rhsusf_acc_anpeq15";
			player addPrimaryWeaponItem "CUP_optic_ACOG";
			player addWeapon "CUP_hgun_Compact";
			player addHandgunItem "muzzle_snds_L";
			player addWeapon "Rangefinder";

			//comment "Add items";
			player linkItem "ItemMap";
			player linkItem "ItemCompass";
			player linkItem "tf_microdagr";
			player linkItem "tf_anprc152_4";
			player linkItem "TRYK_G_bala_ess_NV";
		};
	case "DMR":
	{
		//_cost = 12000
		//if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
		//SUB(CASH,_cost);
		player forceAddUniform "TRYK_U_B_BLK3CD";
		player addItemToUniform "FirstAidKit";
		player addItemToUniform "Chemlight_green";
		player addItemToUniform "10Rnd_338_Mag";
		player addVest "TRYK_V_ArmorVest_Delta2";
		player addItemToVest "FirstAidKit";
		for "_i" from 1 to 4 do {player addItemToVest "CUP_10Rnd_9x19_Compact";};
		player addItemToVest "SmokeShellBlue";
		player addItemToVest "SmokeShellPurple";
		for "_i" from 1 to 4 do {player addItemToVest "Chemlight_green";};
		for "_i" from 1 to 4 do {player addItemToVest "Chemlight_blue";};
		player addItemToVest "CUP_HandGrenade_M67";
		player addItemToVest "DemoCharge_Remote_Mag";
		for "_i" from 1 to 2 do {player addItemToVest "10Rnd_338_Mag";};
		player addBackpack "TRYK_B_Kitbag_blk";
		for "_i" from 1 to 5 do {player addItemToBackpack "10Rnd_338_Mag";};
		player addHeadgear "H_HelmetB_light_black";
		player addGoggles "TRYK_US_ESS_Glasses";

		//comment "Add weapons";
		player addWeapon "srifle_DMR_02_camo_F";
		player addPrimaryWeaponItem "muzzle_snds_338_green";
		player addPrimaryWeaponItem "acc_pointer_IR";
		player addPrimaryWeaponItem "optic_AMS_khk";
		player addWeapon "CUP_hgun_Compact";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		//comment "Add items";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "tf_microdagr";
		player linkItem "tf_anprc152_4";
		player linkItem "TRYK_G_bala_ess_NV";
		};
	/*case "scout":
		{
		//_cost = 12000
		//if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
		//SUB(CASH,_cost);
		player forceAddUniform "rhs_uniform_cu_ucp";
		for "_i" from 1 to 4 do {player addItemToUniform "FirstAidKit";};
		player addVest "rhsusf_iotv_ucp_Squadleader";
		for "_i" from 1 to 6 do {player addItemToVest "16Rnd_9x21_Mag";};
		for "_i" from 1 to 9 do {player addItemToVest "CUP_5Rnd_86x70_L115A1";};
		player addBackpack "B_AssaultPack_Kerry";
		for "_i" from 1 to 4 do {player addItemToBackpack "FirstAidKit";};
		player addItemToBackpack "ToolKit";
		player addHeadgear "rhs_Booniehat_ucp";
		player addGoggles "rhs_googles_black";

		player addWeapon "CUP_srifle_AWM_des";
		player addWeapon "hgun_P07_F";
		player addHandgunItem "muzzle_snds_L";
		player addWeapon "Rangefinder";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "tf_anprc152_3";
		player linkItem "ItemGPS";
		};
	case "combatmedic":
		{
		//_cost = 12000
		//if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
		//SUB(CASH,_cost);
		player forceAddUniform "rhs_uniform_cu_ucp";
		player addVest "rhsusf_iotv_ucp_Medic";
		for "_i" from 1 to 8 do {player addItemToVest "CUP_20Rnd_762x51_B_SCAR";};
		for "_i" from 1 to 3 do {player addItemToVest "DDOPP_1Rnd_X26";};
		player addBackpack "TRYK_B_Medbag_ucp";
		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
		for "_i" from 1 to 4 do {player addItemToBackpack "DDOPP_1Rnd_X26";};
		player addHeadgear "rhsusf_ach_helmet_ucp";
		player addGoggles "rhs_googles_black";

		player addWeapon "CUP_arifle_Mk17_STD";
		player addWeapon "DDOPP_X26";
		player addWeapon "Rangefinder";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "tf_anprc152_3";
		player linkItem "ItemGPS";
		};*/
	case "pilot":
		{
		//_cost = 12000
		//if(CASH < _cost) exitWith {hint format[localize "STR_House_NotEnough"]};
		//SUB(CASH,_cost);
		player forceAddUniform "rhs_uniform_cu_ucp";
		player addVest "rhsusf_iotv_ucp_Squadleader";
		for "_i" from 1 to 4 do {player addItemToVest "DDOPP_1Rnd_X26";};
		for "_i" from 1 to 6 do {player addItemToVest "CUP_20Rnd_762x51_B_SCAR";};
		player addBackpack "B_AssaultPack_Kerry";
		for "_i" from 1 to 2 do {player addItemToBackpack "ToolKit";};
		player addHeadgear "H_Cap_usblack";
		player addGoggles "rhs_googles_black";

		player addWeapon "CUP_arifle_Mk17_STD";
		player addWeapon "DDOPP_X26";
		player addWeapon "Rangefinder";

		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "ItemWatch";
		player linkItem "tf_anprc152_3";
		player linkItem "ItemGPS";
		};
	default {[];};
	
};



//To add virtual items use:
[true,"mre",5] call life_fnc_handleInv;
[true,"waterBottle",5] call life_fnc_handleInv;
[true,"redgull",5] call life_fnc_handleInv;


hint "The selected requisition order has been filed.";