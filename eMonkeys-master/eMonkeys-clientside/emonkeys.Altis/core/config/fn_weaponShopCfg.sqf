
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist"};
			default
			{
				["Altis Polizei Shop",
					[
						["ItemGPS",nil,5000],
                        ["NVGoggles_OPFOR",nil,5000],
                        ["Medikit",nil,2500],
                        ["ToolKit",nil,2500],
                        ["Rangefinder",nil,5000],
                        ["ItemRadio","Handy",100],
                        ["Chemlight_red",nil,100],
                        ["Chemlight_yellow",nil,100],
                        ["Chemlight_green",nil,100],
                        ["Chemlight_blue",nil,100],
						["SmokeShellYellow",nil,500],
						["SmokeShellGreen",nil,500],
						["SmokeShellRed",nil,500],
						["SmokeShellPurple",nil,500],
						["SmokeShellOrange",nil,500],
						["SmokeShellBlue",nil,500],
                        ["B_UavTerminal",nil,1000],
                        ["ItemWatch",nil,100],
                        ["ItemCompass",nil,100],
                        ["ItemMap",nil,100]
					]
				];
			};
		};
	};
	
	case "cop_waffen":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein Polizist!"};
			case ((call EMonkeys_coplevel) == 0): {"Du bist kein Polizist!"};
			case ((call EMonkeys_coplevel) == 1):
			{
				["Polizei Anwärter Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
                        ["30Rnd_9x21_Mag",nil,1000]
					]
				];
			};
			case ((call EMonkeys_coplevel) == 2):
			{
				["Polizeimeister Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
						["30Rnd_9x21_Mag",nil,1000],
						["hgun_PDW2000_F","PDW 2000 9mm",5000],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45 ACP",5000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","45 ACP Leuchtspur Grün",1000],
						["SMG_02_F","Sting 9mm",5000],
						["30Rnd_9x21_Mag",nil,1000],
                        ["arifle_TRG21_F","TRG 21 5.56mm",20000],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm Leuchtspur Rot",2000],
						["30Rnd_556x45_Stanag",nil,2000],				
                        ["optic_Holosight_smg",nil,2000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Aco_smg",nil,2000],
						["optic_ACO_grn_smg",nil,2000],
						["optic_Arco",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_Hamr",nil,10000],
						["acc_flashlight",nil,2000],
						["acc_pointer_IR",nil,2000]
					]
				];
			};
			case ((call EMonkeys_coplevel) == 3):
			{
				["POM Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
						["30Rnd_9x21_Mag",nil,1000],
						["hgun_PDW2000_F","PDW 2000 9mm",5000],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45 ACP",5000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green","45 ACP Leuchtspur Grün",1000],
						["SMG_02_F","Sting 9mm",5000],
						["30Rnd_9x21_Mag",nil,1000],
                        ["arifle_TRG21_F","TRG 21 5.56mm",20000],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm Leuchtspur Rot",2000],
						["30Rnd_556x45_Stanag",nil,2000],
						["arifle_Mk20_F","MK 20 5.56mm",25000],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm Leuchtspur Rot",2000],
						["30Rnd_556x45_Stanag",nil,2000],
						["arifle_sdar_F","SDAR 5.56mm UW Waffe",5000],
						["20Rnd_556x45_UW_mag","5.56mm UW-Mun",2000],
						["arifle_MXC_Black_F","MXC 6.5",50000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["optic_Holosight_smg",nil,2000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Aco_smg",nil,2000],
						["optic_ACO_grn_smg",nil,2000],
						["optic_Arco",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_Hamr",nil,10000],
						["acc_flashlight",nil,2000],
						["acc_pointer_IR",nil,2000]
					]
				];
			};
			case ((call EMonkeys_coplevel) == 4):
			{
				["PHM Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45 ACP",5000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["SMG_02_F","Sting 9mm",5000],
						["30Rnd_9x21_Mag",nil,1000],
						["arifle_MXC_Black_F","MXC 6.5",50000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MX_Black_F","MX 6.5",60000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_Mk20_F",nil,25000],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm Leuchtspur Rot",2000],
						["30Rnd_556x45_Stanag",nil,2000],
						["arifle_TRG21_F","TRG 21 5.56",20000],
						["30Rnd_556x45_Stanag_Tracer_Red","5.56mm Leuchtspur Rot",2000],
						["30Rnd_556x45_Stanag",nil,2000],
						["arifle_sdar_F","SDAR 5.56mm UW Waffe",5000],
						["20Rnd_556x45_UW_mag","5.56mm UW Munition",2000],
						["optic_Arco",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_Hamr",nil,10000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Aco_smg",nil,2000],
						["bipod_01_F_blk","Zweibein",5000],
						["acc_flashlight",nil,2000],
						["acc_pointer_IR",nil,2000]
					]
				];
			};
			case ((call EMonkeys_coplevel) == 5):
			{
				["PK (SEK) Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
                        ["30Rnd_9x21_Mag",nil,1000],
                        ["SMG_02_F","Sting 9mm",5000],
                        ["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45. ACP",5000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["arifle_TRG20_F","TRG-20 5.56mm",10000],
						["arifle_TRG21_F","TRG-21 5.56mm",10000],					
						["arifle_Mk20_plain_F","Mk20 5.56mm",10000],
						["arifle_Mk20C_plain_F","Mk20C 5.56mm",10000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["srifle_EBR_F","MK 18 7.62mm",100000],
                        ["muzzle_snds_B",nil,20000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["srifle_DMR_03_F","MK 1 7.62mm",100000],
                        ["muzzle_snds_B",nil,20000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["arifle_MXM_Black_F","MXM 6.5",75000],
                        ["muzzle_snds_H",nil,10000],
                        ["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
                        ["30Rnd_65x39_caseless_mag",nil,2000],
                        ["arifle_MXC_Black_F","MXC 6.5",50000],
                        ["muzzle_snds_H",nil,10000],
                        ["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
                        ["30Rnd_65x39_caseless_mag",nil,2000],
                        ["arifle_MX_Black_F","MX 6.5",50000],
                        ["muzzle_snds_H",nil,10000],
                        ["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
                        ["30Rnd_65x39_caseless_mag",nil,2000],
                        ["arifle_MX_GL_Black_F","MXGL 6.5",50000],
                        ["muzzle_snds_H",nil,10000],
                        ["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
                        ["30Rnd_65x39_caseless_mag",nil,2000],
                        ["3Rnd_UGL_FlareWhite_F","Leuchtgranate MXGL",100],
                        ["3Rnd_Smoke_Grenade_shell","Rauchgranate MXGL (Weiß)",100],
                        ["arifle_MX_SW_Black_F","MX SW 6.5",50000],
                        ["muzzle_snds_H_SW","SD MX SW",10000],
                        ["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100er Gurt LS Rot",2000],
                        ["100Rnd_65x39_caseless_mag",nil,2000],
						["LMG_Mk200_F",nil,100000],
						["200Rnd_65x39_cased_Box",nil,2500],
                        ["arifle_sdar_F","SDAR 5.56mm UW Waffe",5000],
                        ["20Rnd_556x45_UW_mag","5.56mm UW Munition",2000],
                        ["optic_LRPS",nil,20000],
                        ["optic_DMS",nil,20000],
                        ["optic_SOS",nil,20000],
                        ["optic_AMS",nil,20000],
                        ["optic_KHS_blk",nil,20000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_Aco",nil,2000],
                        ["optic_ACO_grn",nil,2000],
                        ["optic_Hamr",nil,10000],
						["optic_ACO_grn_smg",nil,2000],
                        ["optic_Aco_smg",nil,2000],
						["optic_Holosight",nil,10000],
                        ["optic_Holosight_smg",nil,10000],
                        ["bipod_01_F_blk","Zweibein",5000],
                        ["acc_flashlight",nil,2000],
                        ["acc_pointer_IR",nil,2000],
						["3Rnd_SmokeOrange_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeBlue_Grenade_shell",nil,2000],
						["3Rnd_SmokePurple_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeYellow_Grenade_shell",nil,2000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeRed_Grenade_shell",nil,2000],
						["3Rnd_Smoke_Grenade_shell",nil,2000],
                        ["SmokeShell","Rauchgranate (Weiß)",100],
                        ["HandGrenade_Stone","Blendgranate",3000],
                        ["B_UavTerminal",nil,1000]
					]
				];
			};
			case ((call EMonkeys_coplevel) == 6):
			{
				["POK/PHK/PSK Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_02_F","Sting 9mm",5000],
                        ["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45. ACP",5000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["arifle_TRG20_F","TRG-20 5.56mm",10000],
						["arifle_TRG21_F","TRG-21 5.56mm",10000],					
						["arifle_Mk20_plain_F","Mk20 5.56mm",10000],
						["arifle_Mk20C_plain_F","Mk20C 5.56mm",10000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["srifle_EBR_F","MK 18 7.62mm",100000],
						["muzzle_snds_B",nil,20000],
						["20Rnd_762x51_Mag",nil,2000],
						["srifle_DMR_03_F","MK 1 7.62mm",100000],
						["muzzle_snds_B",nil,20000],
						["20Rnd_762x51_Mag",nil,2000],
						["arifle_MXM_Black_F","MXM 6.5",75000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MXC_Black_F","MXC 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MX_Black_F","MX 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MX_GL_Black_F","MXGL 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["3Rnd_UGL_FlareWhite_F","Leuchtgranate MXGL",100],
						["3Rnd_Smoke_Grenade_shell","Rauchgranate MXGL (Weiß)",100],
						["arifle_MX_SW_Black_F","MX SW 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100er Gurt LS Rot",2000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["LMG_Mk200_F",nil,100000],
						["200Rnd_65x39_cased_Box",nil,2500],
						["arifle_sdar_F","SDAR 5.56mm UW Waffe",5000],
						["20Rnd_556x45_UW_mag","5.56mm UW Munition",2000],
						["optic_LRPS",nil,20000],
						["optic_DMS",nil,20000],
						["optic_SOS",nil,20000],
						["optic_AMS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["optic_MRCO",nil,10000],
						["optic_Arco",nil,10000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Hamr",nil,10000],
						["optic_ACO_grn_smg",nil,2000],
                        ["optic_Aco_smg",nil,2000],
                        ["optic_Holosight_smg",nil,10000],
						["optic_Holosight",nil,10000],
						["bipod_01_F_blk","Zweibein",5000],
						["acc_flashlight",nil,2000],
						["acc_pointer_IR",nil,2000],
						["3Rnd_SmokeOrange_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeBlue_Grenade_shell",nil,2000],
						["3Rnd_SmokePurple_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeYellow_Grenade_shell",nil,2000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeRed_Grenade_shell",nil,2000],
						["3Rnd_Smoke_Grenade_shell",nil,2000],
                        ["SmokeShell","Rauchgranate (Weiß)",100],
						["HandGrenade_Stone","Blendgranate",3000],
						["B_UavTerminal",nil,1000]
					]
				];
			};
			case ((call EMonkeys_coplevel) >= 7):
			{
				["Polizeiführungs Shop",
					[
						["hgun_P07_snds_F","Tazerpistole",500],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_02_F","Sting 9mm",5000],
                        ["30Rnd_9x21_Mag",nil,1000],
						["SMG_01_F","Vermin 45. ACP",5000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["arifle_TRG20_F","TRG-20 5.56mm",10000],
						["arifle_TRG21_F","TRG-21 5.56mm",10000],					
						["arifle_Mk20_plain_F","Mk20 5.56mm",10000],
						["arifle_Mk20C_plain_F","Mk20C 5.56mm",10000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,1000],
						["srifle_EBR_F","MK 18 7.62mm",100000],
						["muzzle_snds_B",nil,20000],
						["20Rnd_762x51_Mag",nil,2000],
						["srifle_DMR_03_F","MK 1 7.62mm",100000],
						["muzzle_snds_B",nil,20000],
						["20Rnd_762x51_Mag",nil,2000],
						["arifle_MXM_Black_F","MXM 6.5",75000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MXC_Black_F","MXC 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MX_Black_F","MX 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["arifle_MX_GL_Black_F","MXGL 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["30Rnd_65x39_caseless_mag_Tracer","6.5mm Leuchtspur Rot",2000],
						["30Rnd_65x39_caseless_mag",nil,2000],
						["3Rnd_UGL_FlareWhite_F","Leuchtgranate MXGL",100],
						["3Rnd_Smoke_Grenade_shell","Rauchgranate MXGL (Weiß)",100],
						["arifle_MX_SW_Black_F","MX SW 6.5",50000],
						["muzzle_snds_H",nil,20000],
						["100Rnd_65x39_caseless_mag_Tracer","6.5mm 100er Gurt LS Rot",2000],
						["100Rnd_65x39_caseless_mag",nil,2000],
						["LMG_Mk200_F",nil,100000],
						["200Rnd_65x39_cased_Box",nil,2500],
						["MMG_02_black_F",nil,100000],
						["130Rnd_338_Mag",nil,2500],
						["arifle_sdar_F","SDAR 5.56mm UW Waffe",5000],
						["20Rnd_556x45_UW_mag","5.56mm UW Munition",2000],
						["optic_LRPS",nil,20000],
						["optic_DMS",nil,20000],
						["optic_SOS",nil,20000],
						["optic_AMS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["optic_MRCO",nil,10000],
						["optic_Arco",nil,10000],
						["optic_Aco",nil,2000],
						["optic_ACO_grn",nil,2000],
						["optic_Hamr",nil,10000],
						["optic_ACO_grn_smg",nil,2000],
                        ["optic_Aco_smg",nil,2000],
                        ["optic_Holosight_smg",nil,10000],
						["optic_Holosight",nil,10000],
						["bipod_01_F_blk","Zweibein",5000],
						["acc_flashlight",nil,2000],
						["acc_pointer_IR",nil,2000],
						["3Rnd_SmokeOrange_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeBlue_Grenade_shell",nil,2000],
						["3Rnd_SmokePurple_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeYellow_Grenade_shell",nil,2000],
						["3Rnd_SmokeGreen_Grenade_shell",nil,2000],
                        ["3Rnd_SmokeRed_Grenade_shell",nil,2000],
						["3Rnd_Smoke_Grenade_shell",nil,2000],
                        ["SmokeShell","Rauchgranate (Weiß)",100],
						["HandGrenade_Stone","Blendgranate",3000],
						["B_UavTerminal",nil,1000]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"Du bist kein Medic"};
			default {
				["Sanitäter-Shop",
					[
						["Medikit",nil,100],
						["ToolKit",nil,5000],
						["NVGoggles",nil,10000],
						["ItemGPS",nil,10000],
						["ItemCompass",nil,100],
						["ItemWatch",nil,100],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100],
						["B_Kitbag_cbr",nil,3000],
						["ItemRadio","Handy",100]
					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (!(side player in [east,civilian])): {"Du bist kein Zivilist"};
			case (!license_civ_rebel): {"Du hast keine Waffenschieber-Lizenz"};
			default
			{
				["Waffenschieber-Shop",
					[
						["srifle_DMR_01_F",nil,260000],
						["arifle_Mk20_F",nil,160000],
						["arifle_Mk20C_F",nil,160000],
						["arifle_SDAR_F",nil,160000],
						["arifle_TRG21_F","TRG 21 5.56",160000],
						["arifle_TRG20_F","TRG 20 5.56",160000],
						["arifle_Katiba_C_F",nil,230000],
						["optic_Aco",nil,21000],
						["optic_ACO_grn",nil,21000],
						["optic_Arco",nil,81000],
						["optic_Hamr",nil,81000],
						["optic_Holosight",nil,21000],
						["optic_MRCO",nil,81000],
						["acc_flashlight",nil,5000],
						["acc_pointer_IR",nil,5000],
						["10Rnd_762x54_Mag",nil,16000],
						["30Rnd_65x39_caseless_green",nil,11000],
						["20Rnd_556x45_UW_mag","SDAR Mun",8000],
						["30Rnd_556x45_Stanag",nil,11000],
						["NVGoggles",nil,10000],
						["Binocular",nil,10000],
						["Medikit",nil,6000],
						["ToolKit",nil,5000],
						["ItemRadio","Handy",100],
						["ItemGPS",nil,10000],
						["ItemCompass",nil,250],
						["ItemWatch",nil,250]
					]
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (!(side player in [east,civilian])): {"Du bist kein Zivilist"};
			case (!license_civ_gun): {"Du hast keine Waffenlizenz"};
			default
			{
				["Waffenladen",
					[
						["hgun_Rook40_F",nil,40000],
						["hgun_Pistol_heavy_01_F",nil,60000],
						["hgun_Pistol_heavy_02_F",nil,60000],
						["hgun_ACPC2_F",nil,60000],
						["hgun_PDW2000_F",nil,80000],
						["SMG_02_F",nil,80000],
						["SMG_01_F",nil,100000],
						["optic_Yorris",nil,10000],
						["optic_MRD",nil,10000],
						["optic_Holosight_smg",nil,10000],
						["optic_Aco_smg",nil,15000],
						["optic_ACO_grn_smg",nil,15000],
						["30Rnd_9x21_Mag",nil,5000],
						["9Rnd_45ACP_Mag",nil,5000],
						["6Rnd_45ACP_Cylinder",nil,3000],
						["11Rnd_45ACP_Mag",nil,3000],
						["30Rnd_45ACP_Mag_SMG_01",nil,5000]
					]
				];
			};
		};
	};
	
	case "VIP":
	{
		switch(true) do
		{
			case (EMonkeys_VIP == 0): {"Du bist kein VIP"};
			case (EMonkeys_VIP == 1):
			{
				["VIP Shop",
					[
						["srifle_DMR_01_F",nil,230000],
						["arifle_Katiba_C_F",nil,170000],
						["arifle_TRG21_F","TRG 21 5.56",120000],
						["arifle_TRG20_F","TRG 20 5.56",120000],
						["arifle_Mk20_F",nil,120000],
						["arifle_Mk20C_F",nil,120000],
						["arifle_SDAR_F",nil,120000],
						["hgun_PDW2000_F",nil,70000],
						["SMG_02_F",nil,70000],
						["SMG_01_F",nil,85000],
						["hgun_Rook40_F",nil,30000],
						["hgun_Pistol_heavy_01_F",nil,45000],
						["hgun_Pistol_heavy_02_F",nil,45000],
						["hgun_ACPC2_F",nil,45000],
						["optic_MRCO",nil,60000],
						["optic_Arco",nil,60000],
						["optic_Aco",nil,15000],
						["optic_ACO_grn",nil,15000],
						["optic_Hamr",nil,60000],
						["optic_Aco_smg",nil,12000],
						["optic_ACO_grn_smg",nil,12000],
						["optic_Holosight_smg",nil,12000],
						["optic_Yorris",nil,7500],
						["optic_MRD",nil,7500],
						["acc_flashlight",nil,3500],
						["acc_pointer_IR",nil,3500],
						["10Rnd_762x54_Mag",nil,10000],
						["30Rnd_65x39_caseless_green",nil,10000],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,10000],
						["1Rnd_Smoke_Grenade_shell",nil,3000],
						["UGL_FlareWhite_F",nil,3000],
						["30Rnd_556x45_Stanag",nil,9000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,9000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,9000],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,9000],
						["20Rnd_556x45_UW_mag","SDAR Mun",6500],
						["30Rnd_9x21_Mag",nil,3500],
						["9Rnd_45ACP_Mag",nil,2500],
						["6Rnd_45ACP_Cylinder",nil,1500],
						["11Rnd_45ACP_Mag",nil,1500],
						["30Rnd_45ACP_Mag_SMG_01",nil,3500],
						["NVGoggles",nil,7000],
						["Rangefinder",nil,15000],
						["Medikit",nil,3000],
						["ToolKit",nil,3500],
						["ItemGPS",nil,7000],
						["ItemCompass",nil,200],
						["ItemRadio","Handy",100],
						["ItemWatch",nil,200]
					]
				];
			};
			
			case (EMonkeys_VIP == 2):
			{
				["Super VIP Shop",
					[
						["srifle_DMR_01_F",nil,190000],
						["arifle_Katiba_C_F",nil,130000],
						["arifle_TRG21_F","TRG 21 5.56",85000],
						["arifle_TRG20_F","TRG 20 5.56",85000],
						["arifle_Mk20_F",nil,85000],
						["arifle_Mk20C_F",nil,85000],
						["arifle_SDAR_F",nil,85000],
						["hgun_PDW2000_F",nil,50000],
						["SMG_02_F",nil,50000],
						["SMG_01_F",nil,60000],
						["hgun_Rook40_F",nil,30000],
						["hgun_Pistol_heavy_01_F",nil,40000],
						["hgun_Pistol_heavy_02_F",nil,40000],
						["hgun_ACPC2_F",nil,30000],
						["optic_MRCO",nil,40000],
						["optic_Arco",nil,40000],
						["optic_Aco",nil,10000],
						["optic_ACO_grn",nil,10000],
						["optic_Hamr",nil,40000],
						["optic_Aco_smg",nil,10000],
						["optic_ACO_grn_smg",nil,10000],
						["optic_Holosight_smg",nil,10000],
						["optic_Yorris",nil,5000],
						["optic_MRD",nil,5000],
						["acc_flashlight",nil,2500],
						["acc_pointer_IR",nil,3000],
						["10Rnd_762x54_Mag",nil,7500],
						["30Rnd_65x39_caseless_green",nil,8000],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,8000],
						["1Rnd_Smoke_Grenade_shell",nil,2000],
						["UGL_FlareWhite_F",nil,2000],
						["30Rnd_556x45_Stanag",nil,8000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,8000],
						["30Rnd_556x45_Stanag_Tracer_Green",nil,8000],
						["30Rnd_556x45_Stanag_Tracer_Yellow",nil,8000],
						["20Rnd_556x45_UW_mag","SDAR Mun",5000],
						["30Rnd_9x21_Mag",nil,2500],
						["9Rnd_45ACP_Mag",nil,2500],
						["6Rnd_45ACP_Cylinder",nil,1500],
						["11Rnd_45ACP_Mag",nil,1500],
						["30Rnd_45ACP_Mag_SMG_01",nil,2500],
						["NVGoggles",nil,5000],
						["Rangefinder",nil,12000],
						["Medikit",nil,2000],
						["ToolKit",nil,2500],
						["ItemGPS",nil,5000],
						["ItemCompass",nil,100],
						["ItemWatch",nil,100],
						["ItemRadio","Handy",100],
						["hgun_Pistol_Signal_F",nil,5000],
						["6Rnd_RedSignal_F",nil,500]
					]
				];
			};
			
		};	
	};

	case "genstore":
	{
		["Batman's stuff Shop",
			[
				["NVGoggles",nil,10000],
				["Medikit",nil,3500],
				["ItemRadio","Handy",100],
				["ToolKit",nil,5000],
				["ItemGPS",nil,10000],
				["ItemCompass",nil,100],
				["ItemWatch",nil,100],
				["ItemMap",nil,100],
				["Chemlight_red",nil,500],
				["Chemlight_yellow",nil,500],
				["Chemlight_green",nil,500],
				["Chemlight_blue",nil,500]
			]
		];
	};
	
	case "tankshop":
	{
		["Tankstellenshop Altis",
			[
				
				["ToolKit",nil,25000],
				["ItemRadio","Handy",100]			
			]
		];
	};
	
	case "crafting":
	{
		["Crafting Zone",
			[	
				["ToolKit",nil,8000]				
			]
		];
	};

	case "apstore":
	{
		switch(true) do
		{
			case ((["AP"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein AP"};
			default
			{
				["Altis Presse Shop",
					[
						["NVGoggles",nil,10000],
						["ItemRadio","Handy",100],
						["ToolKit",nil,5000],
						["ItemGPS",nil,10000],
				        ["ItemCompass",nil,100],
				        ["ItemWatch",nil,100],
				        ["ItemMap",nil,100],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]
					]
				];
			};
		};
	};
	
	////////////////////////////////////////////////////Gruppierungen\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
	case "KSKstore":
	{
		switch(true) do
		{
			case ((["KSK"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der SOG"};
			default
			{
				["KSK Shop",
					[
						["NVGoggles",nil,10000],
						["ToolKit",nil,8000],
						["ItemRadio","Handy",100],
						["ItemGPS",nil,10000],
				        ["ItemCompass",nil,100],
				        ["ItemWatch",nil,100],
						["hgun_Pistol_heavy_01_F",nil,60000],
						["optic_MRD",nil,10000],
						["optic_Arco",nil,80000],
						["optic_Hamr",nil,80000],
						["30Rnd_9x21_Mag",nil,1000],
						["11Rnd_45ACP_Mag",nil,3000],
						["1Rnd_Smoke_Grenade_shell",nil,4000],
						["1Rnd_SmokeRed_Grenade_shell",nil,4000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]
					]
				];
			};
		};
	};
	
	case "PSstore":
	{
		switch(true) do
		{
			case ((["PS"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der PS"};
			default
			{
				["PS Shop",
					[
						["NVGoggles",nil,10000],
						["ToolKit",nil,8000],
						["ItemRadio","Handy",100],
						["ItemGPS",nil,10000],
				        ["ItemCompass",nil,100],
				        ["ItemWatch",nil,100],
						["hgun_Pistol_heavy_01_F",nil,60000],
						["optic_MRD",nil,10000],
						["optic_Arco",nil,80000],
						["optic_Hamr",nil,80000],
						["16Rnd_9x21_Mag",nil,5000],
						["11Rnd_45ACP_Mag",nil,3000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]	
					]
				];
			};
		};
	};	
	
	case "SOAstore":
	{
		switch(true) do
		{
			case ((["SOA"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der SOA"};
			case ((["SOA"] call EMonkeys_fnc_permLevel) < 3): {"Du benötigst Level 3"};
			default
			{
				["SOA Shop",
					[
						["NVGoggles",nil,10000],
						["ToolKit",nil,8000],
						["ItemRadio","Handy",100],
						["ItemGPS",nil,10000],
				        ["ItemCompass",nil,100],
				        ["ItemWatch",nil,100],
						["hgun_Pistol_heavy_01_F",nil,60000],
						["optic_MRD",nil,10000],
						["30Rnd_9x21_Mag",nil,3000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["30Rnd_556x45_Stanag",nil,5000],
						["11Rnd_45ACP_Mag",nil,3000],
						["Chemlight_red",nil,100],
						["Chemlight_yellow",nil,100],
						["Chemlight_green",nil,100],
						["Chemlight_blue",nil,100]	
					]
				];
			};
		};
	};
	
	case "DMstore":
	{
		switch(true) do
		{
			case ((["DM"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der DM"};
			default{"gruppen_fail"};
		};
	};
	
	case "GSCstore":
	{
		switch(true) do
		{
			case ((["GSC"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der GSC"};
			default{"gruppen_fail"};
		};
	};
	
	case "FFstore":
	{
		switch(true) do
		{
			case ((["FF"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der FF"};
			default{"gruppen_fail"};
		};
	};
	
	case "BWAstore":
	{
		switch(true) do
		{
			case ((["BWA"] call EMonkeys_fnc_permLevel) < 1): {"Du bist kein Mitglied der BWA"};
			default{"gruppen_fail"};
		};
	};
	
	case "AaMstore":
	{
		switch(true) do
		{
			case (call EMonkeys_adminlevel < 1): {"Du kannst diesen Händler nicht nutzen"};
			default
			{
				["AaM Shop",
					[
						["hgun_Pistol_heavy_01_F",nil,0]
					]
				];
			};
		};
	};
};