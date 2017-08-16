#include "..\..\macros.hpp"
/*
	File: fn_onPutItem.sqf
	Author: By Division-Wolf e.V. - Sandmann
	Description:
	Save for Duping
*/
private["_unit","_item"];

_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_container = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
_item = [_this,2,"",[""]] call BIS_fnc_param;

//systemChat format ["### DEBUG ### onPutItem: %1",_this];

if(isNull _unit OR _item == "") exitWith {};

//systemChat format ["%1 Legt _item %2 von _container %3",_unit,_item,_container];

switch((side player)) do
{
	case west: {};
	case civilian:
	{
		if
		(_item in
			[
				// Waffen, Magazine und Granaten
				"SmokeShellRed","20Rnd_762x51_Mag","10Rnd_762x54_Mag","hgun_Pistol_heavy_01_snds_F","SMG_02_F","arifle_MK20C_plain_F","arifle_SDAR_F","arifle_MXC_F","arifle_Katiba_F","hgun_Pistol_Signal_F","arifle_MX_F","arifle_MXM_F",
				"srifle_EBR_F","srifle_DMR_03_F","arifle_MX_Black_F","arifle_MXM_Black_F","arifle_MXC_Black_F","arifle_TRG20_F","arifle_TRG21_F","SMG_01_F","arifle_Katiba_C_F","srifle_DMR_01_F","srifle_DMR_03_khaki_F","srifle_DMR_03_tan_F",
				"srifle_DMR_03_multicam_F","srifle_DMR_03_woodland_F","hgun_Rook40_F","hgun_P07_F","hgun_PDW2000_F","hgun_ACPC2_F","arifle_Mk20C_F","SMG_05_F","arifle_MXM_khk_F","arifle_MX_khk_F","arifle_MXC_khk_F","arifle_SPAR_03_khk_F",
				"arifle_SPAR_03_snd_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_blk_F","arifle_SPAR_03_blk_F","SmokeShellBlue","hgun_P07_khk_F","hgun_Pistol_01_F","30Rnd_65x39_caseless_green","30Rnd_762x39_Mag_F",
				"30Rnd_580x42_Mag_F","arifle_CTAR_ghex_F","arifle_CTAR_hex_F","arifle_CTAR_blk_F","arifle_AKM_F","arifle_ARX_hex_F","arifle_ARX_ghex_F","arifle_ARX_blk_F","10Rnd_9x21_Mag",
				//Scopes und Schalldämpfer
				"optic_Mrco","optic_DMS","optic_SOS","muzzle_snds_H","muzzle_snds_acp","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","optic_AMS_khk","optic_AMS_snd","optic_AMS","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F",
				"muzzle_snds_65_TI_blk_F","muzzle_snds_65_TI_ghex_F","muzzle_snds_65_TI_hex_F","muzzle_snds_58_blk_F","muzzle_snds_58_hex_F","muzzle_snds_58_ghex_F",
				// Uniformen
				"U_C_Scientist","U_I_GhillieSuit","U_O_GhillieSuit","U_O_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_B_T_Sniper_F","U_O_T_Sniper_F",
				// Kopfbedeckung und Brillen
				"G_Balaclava_combat","G_Combat",
				// Westen
				"V_PlateCarrier1_blk","V_PlateCarrierSpec_blk","V_RebreatherB","V_RebreatherIA","V_PlateCarrierIA2_dgtl","V_PlateCarrierIA1_dgtl","V_I_G_resistanceLeader_F","V_TacVestIR_blk","V_TacVestCamo_khk","V_TacVest_oli","V_TacVest_khk",
				// Rucksäcke
				"B_Carryall_khk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Bergen_sgg","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_blk","B_Parachute","B_Bergen_hex_F","B_Bergen_tna_F","B_Bergen_mcamo_F","B_Bergen_dgtl_F"
			]
		) then
		{
			[3] call SOCK_fnc_updatePartial;
		};
	};
	case independent: {};
};
