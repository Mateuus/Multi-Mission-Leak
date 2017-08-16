/*
	File: fn_seizeCfg.sqf
	Author: Tabakhase
	Modified by: cat24max and Daniel Larusso
	
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

_ret = [
	// Weapons
	"srifle_EBR_F",
	"srifle_GM6_F",
	"srifle_LRR_F",
	"LMG_Mk200_F",
	"hgun_P07_F",
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_Pistol_heavy_01_F",
	"hgun_Pistol_heavy_01_snds_F",
	"hgun_Pistol_heavy_02_F",
	"hgun_PDW2000_F",
	"hgun_Pistol_Signal_F",
	"arifle_Katiba_F",
	"arifle_Katiba_C_F",
	"arifle_Katiba_GL_F",
	"arifle_MXC_F",
	"arifle_MXC_Black_F",
	"arifle_MX_F",
	"arifle_MX_Black_F",
	"arifle_MX_GL_F",
	"arifle_MX_GL_Black_F",
	"arifle_MX_SW_F",
	"arifle_MX_SW_Black_F",
	"arifle_MXM_F",
	"arifle_MXM_Black_F",
	"arifle_SDAR_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_TRG21_GL_F",
	"arifle_Mk20_F",
	"arifle_Mk20_plain_F",
	"arifle_Mk20C_F",
	"arifle_Mk20C_plain_F",
	"arifle_Mk20_GL_F",
	"arifle_Mk20_GL_plain_F",
	"launch_B_Titan_F",
	"launch_I_Titan_F",
	"launch_O_Titan_F",
	"launch_B_Titan_short_F",
	"launch_I_Titan_short_F",
	"launch_O_Titan_short_F",
	"LMG_Zafir_F",
	"SMG_01_F",
	"SMG_02_F",
	"srifle_DMR_01_F",
	
	// Mags
	"30Rnd_556x45_Stanag",
	"20Rnd_556x45_UW_mag",
	"30Rnd_65x39_caseless_mag",
	"30Rnd_65x39_caseless_green",
	"20Rnd_762x51_Mag",
	"7Rnd_408_Mag",
	"5Rnd_127x108_Mag",
	"100Rnd_65x39_caseless_mag",
	"200Rnd_65x39_cased_Box",
	"30Rnd_9x21_Mag",
	"16Rnd_9x21_Mag",
	"RPG32_F",
	"RPG32_HE_F",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_Smoke_Grenade_shell",
	"1Rnd_SmokeGreen_Grenade_shell",
	"3Rnd_SmokeGreen_Grenade_shell",
	"HandGrenade_Stone",
	"SmokeShell",
	"SmokeShellGreen",
	"200Rnd_65x39_Belt",
	"ATMine_Range_Mag",
	"APERSMine_Range_Mag",
	"APERSBoundingMine_Range_Mag",
	"SLAMDirectionalMine_Wire_Mag",
	"APERSTripMine_Wire_Mag",
	"ClaymoreDirectionalMine_Remote_Mag",
	"SatchelCharge_Remote_Mag",
	"DemoCharge_Remote_Mag",
	"30Rnd_45ACP_Mag_SMG_01",
	"9Rnd_45ACP_Mag",
	"150Rnd_762x51_Box",
	"11Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"10Rnd_762x51_Mag",
	"5Rnd_127x108_APDS_Mag",
	"6Rnd_GreenSignal_F",
	"6Rnd_RedSignal_F"
];

_ret;