/*
	Filename: fn_copLoadout.sqf

	Author: Blackd0g

	You're not allowed to use this file!
	You're not allowed to modify this file!
*/

private["_coplevel"];
[] call lhm_fnc_stripDownPlayer;
_coplevel = (call lhm_coplevel);

switch(true) do
{
	case (_coplevel in [1]): // Rekrut
	{
		player forceAddUniform "U_Competitor";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_Rangemaster_belt";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "arifle_MXC_Black_F";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [2]): // Officer
	{
		player forceAddUniform "U_Rangemaster";
		player addVest "V_Rangemaster_belt";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_TacVest_blk_POLICE";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "arifle_MXC_Black_F";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [3]): // Seargant
	{
		player forceAddUniform "U_B_CombatUniform_mcam_vest";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_PlateCarrierSpec_blk";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "srifle_EBR_F";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [4]): // Lieutenant
	{
		player forceAddUniform "U_B_SpecopsUniform_sgg";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_PlateCarrierSpec_blk";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "srifle_DMR_03_F";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [5]): // Captain
	{
		player forceAddUniform "U_B_CTRG_1";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_PlateCarrierSpec_blk";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "srifle_DMR_03_F";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";
		player addMagazine "20Rnd_762x51_Mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [6]): // Dep. Chief
	{
		player forceAddUniform "U_B_CombatUniform_mcam";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_PlateCarrierSpec_blk";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "arifle_MXC_Black_F";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

	case (_coplevel in [7]): // Chief
	{
		player forceAddUniform "U_B_CTRG_3";
		player addVest "V_TacVest_blk_POLICE";
		player addHeadGear "H_Cap_police";
		player addBackPack "B_TacticalPack_blk";
		player AddVest "V_PlateCarrierSpec_blk";

		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";

		player addWeapon "srifle_DMR_05_blk_F";
		player addMagazine "10Rnd_93x64_DMR_05_Mag";
		player addMagazine "10Rnd_93x64_DMR_05_Mag";
		player addMagazine "10Rnd_93x64_DMR_05_Mag";
		player addMagazine "10Rnd_93x64_DMR_05_Mag";

		player linkItem "ItemGPS";
		player linkItem "ItemWatch";
		player linkItem "ItemRadio";
		player linkItem "ItemMap";
		player linkItem "ItemCompass";
		player linkItem "NVGoggles";

		player addItemToBackpack "Medikit";
		player addItemToBackpack "ToolKit";
	};

};
if (needReload player == 1) then {reload player};

[] call lhm_fnc_saveGear;