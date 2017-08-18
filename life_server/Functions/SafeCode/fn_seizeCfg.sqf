#include <macro.h>
/*
	File: fn_seizeCfg.sqf
	Author: Tabakhase
	Slightly adapted by Daniel Larusso (Keep Calm and Roleplay)
	
	Description:
	Master configuration file for seize player everything.
	
	Parameters:
	0 = All
	1 = Weapons
	2 = Uniform
	3 = Backpack
	4 = Vest
	5 = Items
*/
private["_mode"];
_mode = [_this,0,objNull,[""]] call BIS_fnc_param;

switch(_mode) do
{
	//Primary and Secondary Weapons
	case 1: {
		[
			// Weapons
			"arifle_SDAR_F",
			"arifle_TRG20_F",
			"arifle_TRG21_F",
			"arifle_Katiba_F",
			"srifle_DMR_01_F",
			"arifle_MX_GL_F",
			"arifle_MX_GL_Black_F",
			"arifle_MX_SW_F",
			"srifle_EBR_F",
			"srifle_LRR_F",
			"srifle_GM6_F",
			"hgun_P07_snds_F",
			"hgun_PDW2000_F",
			"hgun_Pistol_heavy_01_F",
			"SMG_01_F",
			"SMG_02_F",
			"arifle_MXM_F",
			"arifle_MXC_F",
			"arifle_MX_F",
			"LMG_Mk200_F",
			"arifle_MK20_plain_F",
			"arifle_MK20C_plain_F",
			"hgun_Pistol_heavy_02_F",
			"hgun_Rook40_F",
			"hgun_ACPC2_F",
			"srifle_GM6_F",
			"hgun_Rook40_F",
			"6Rnd_Pistol_Signal_F",
			
			// Mags Optics Silencers
			"20Rnd_556x45_UW_mag",
			"30Rnd_556x45_Stanag",
			"10Rnd_762x51_Mag",
			"30Rnd_65x39_caseless_green",
			"16Rnd_9x21_Mag",
			"11Rnd_45ACP_Mag",
			"30Rnd_9x21_Mag",
			"30Rnd_65x49_caseless_mag",
			"30Rnd_65x49_caseless_mag_Tracer",
			"7Rnd_408_Mag",
			"200Rnd_65x39_cased_Box_Tracer",
			"100Rnd_65x39_caseless_mag_Tracer",
			"30Rnd_65x39_caseless_mag",
			"30Rnd_45ACP_Mag_SMG_01",
			"20Rnd_762x51_Mag",
			"6Rnd_45ACP_Cylinder",
			"5Rnd_127x108_Mag",
			"launch_NLAW_F",
			"NLAW_F",
			"9Rnd_45ACP_Mag",
			"16Rnd_9x21_Mag",
			"1Rnd_Smoke_Grenade_shell",
			"1Rnd_HE_Grenade_shell",
			"ClaymoreDirectionalMine_Remote_Mag",
			"launch_B_Titan_F",
			"Titan_AA",
			"launch_RPG32",
			"RPG32_F",
			"optic_ACO_grn",
			"optic_Holosight",
			"acc_flashlight",
			"optic_Hamr",
			"optic_Arco",
			"optic_ACO_grn_smg",
			"optic_SOS",
			"optic_MRCO",
			"acc_pointer_IR",
			"optic_Yorris",
			"optic_Nightstalker",
			"optic_LRPS",
			"muzzle_snds_H",
			"muzzle_snds_B",
			"muzzle_snds_L",
			"muzzle_snds_H_MG",
			"muzzle_snds_acp",
			"HandGrenade",
			"HandGrenade_Stone",
			"SmokeShell",
			"6Rnd_GreenSignal_F",
			"6Rnd_RedSignal_F"
		];
	};
	
	//Vests
	case 4: {
		[
			["V_HarnessOGL_gry"]
		];
	};
};