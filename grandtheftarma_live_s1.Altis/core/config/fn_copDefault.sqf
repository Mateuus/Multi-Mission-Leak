#include <macro.h>
/*
	File: fn_copDefault.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Default cop configuration.
*/
//Strip the player down
removeAllWeapons player;
{ player removeMagazine _x; } foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
// removeGoggles player;
removeHeadGear player;
{ player unassignItem _x; player removeItem _x; } foreach (assignedItems player);
if(hmd player != "") then { player unlinkItem (hmd player); };

player addUniform "U_Rangemaster";
player addItem "ItemMap";
player assignItem "ItemMap";
player addItem "ItemCompass";
player assignItem "ItemCompass";
player addItem "ItemGPS";
player assignItem "ItemGPS";
player addWeapon "Binocular";
player assignItem "Binocular";
player addItem "NVGoggles_OPFOR";
player assignItem "NVGoggles_OPFOR";
player addItem "ItemRadio";
player assignItem "ItemRadio";

/* Load player with default cop gear.
switch (__GETC__(GTA_copRank)) do
{

	case 1: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Cap_blk";
		player addVest "V_Rangemaster_belt";
		player addBackpack "B_FieldPack_blk";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 2: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Cap_blk";		
		player addVest "V_TacVestIR_blk";
		player addBackpack "B_FieldPack_blk";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 3: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Cap_blk";		
		player addVest "B_FieldPack_blk";
		player addBackpack "B_Carryall_cbr";
		player addWeapon "hgun_P07_snds_F";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addMagazine "30Rnd_9x21_Mag";
		player addWeapon "SMG_02_ACO_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 4: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Cap_blk";		
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MXC_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 5: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Cap_blk";		
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 6: 
	{
		player addUniform "U_Rangemaster";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addHeadgear "H_Watchcap_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
	case 7: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};

		case 8: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
		case 9: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
		case 10: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
		case 11: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
		case 12: 
	{
		player addUniform "U_Rangemaster";
		player addHeadgear "H_Watchcap_blk";
		player addVest "V_PlateCarrier1_blk";
		player addBackpack "B_Bergen_blk";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addMagazine "30Rnd_65x39_caseless_mag";
		player addWeapon "hgun_P07_snds_F";
		player addWeapon "arifle_MX_SW_Hamr_pointer_F";
		player addWeapon "ItemMap";
		player assignItem "ItemMap";
		player addWeapon "ItemCompass";
		player assignItem "ItemCompass";
		player addWeapon "ItemGPS";
		player assignItem "ItemGPS";
		player addWeapon "Binocular";
		player assignItem "Binocular";
		player addWeapon "NVGoggles";
		player assignItem "NVGoggles";
	};
	
};
*/


//[player] call life_func_cop_skin;
[player] execVM "scripts\fn_cop_skin.sqf";

[] call life_fnc_saveGear;