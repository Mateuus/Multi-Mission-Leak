#include <macro.h>
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
			case (playerSide != west): {"Du bist dein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 2): {"nicht berechtigt!"};
			default
			{
				["Recruit",
					[
						["hgun_P07_snds_F","Taser Pistol",1000],
						["16Rnd_9x21_Mag",nil,250]					
					]
				];
			};
		};
	};
	
	case "cop_gear":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (license_cop_mrsf): {"Du bist kein NLPD-Beamter!"};
			default
			{
				["Cop Zubehör",
					[				
						["Binocular",nil,150],
						["Rangefinder",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_OPFOR",nil,2000],
						["ItemCompass",nil,500],
						["bipod_01_F_blk",nil,5000],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	case "mrsf_cop":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 12): {"Du siehst nicht aus wie der Chief"};
			
			default
			{
				["MRSF",
					[
						["Binocular",nil,150],
						["Rangefinder",nil,150],
						["arifle_MX_F",nil,150000],
						["30Rnd_65x39_caseless_mag",nil,2500],
						["SMG_02_F",nil,25000],
						["30Rnd_9x21_Mag",nil,1000],
						["hgun_P07_snds_F",nil,2500],
						["16Rnd_9x21_Mag",nil,2500],
						["bipod_01_F_snd",nil,5000],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,10000],
						["optic_MRCO",nil,10000],
						["optic_Hamr",nil,10000],
						["ItemGPS",nil,100],
						["ItemMap",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,150],
						["NVGoggles_INDEP",nil,2000],
						["U_I_CombatUniform_tshirt",nil,2000],
						["U_I_OfficerUniform",nil,2500],						
						["V_TacVest_oli",nil,10000],
						["V_PlateCarrier1_rgr",nil,20000],
						["B_Carryall_oli",nil,3500],
						["H_Helmet_Kerry",nil,3500],
						["H_MilCap_dgtl",nil,2000],
						["H_MilCap_mcamo",nil,2000],
						["ItemCompass",nil,500],
						["SmokeShellOrange",nil,1500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 3): {"Du bist kein Officer!"};
			case (__GETC__(life_customLevel) == 6): {"Du bist SWAT Mitglied, benutz deinen eigenen Shop!"};
			default
			{
				["Officer",
					[
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["arifle_MXC_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Hamr",nil,1500]
					]
				];
			};
		};
	};

	case "cop_wrtofficer":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 4): {"Du bist kein Wrt. Officer"};
			case (__GETC__(life_customLevel) == 6): {"Du bist SWAT Mitglied, benutz deinen eigenen Shop!"};
			default
			{
				["Wrt. Officer",
					[
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500]
					]
				];
			};
		};
	};

	case "cop_senofficer":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 5): {"Du bist keine Senior Officer"};
			case (__GETC__(life_customLevel) == 6): {"Du bist SWAT Mitglied, benutz deinen eigenen Shop!"};
			default
			{
				["Senior Officer",
					[
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXC_Black_F",nil,15000],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500]

					]
				];
			};
		};
	};

	case "cop_2ndsergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 6): {"Du bist kein Sergeant!"};
			case (__GETC__(life_customLevel) == 6): {"Du bist SWAT Mitglied, benutz deinen eigenen Shop!"};
			
			default
			{
				["Sergeant",
					[
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_MXM_Black_F",nil,35000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_Katiba_F",nil,35000],
						["30Rnd_65x39_caseless_green",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]
					]
				];
			};
		};
	};
	
	case "cop_1stsergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter"};
			case (__GETC__(life_coplevel) < 7): {"Zum Glück bist du noch kein 1st Sergeant!"};
			default
			{
				["1st Sergeant",
					[
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,35000],
						["arifle_MXC_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_SOS",nil,20000],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]

					]
				];
			};
		};
	};
	
	case "cop_detective":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 8): {"Du bist kein Detective"};
			default
			{
				["Detective",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_EBR_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]
					]
				];
			};
		};
	};
	
	case "cop_2ndlieut":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 9): {"Du bist kein Lieutenant"};
			default
			{
				["Lieutenant",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_DMR_03_F",nil,70000],
						["srifle_DMR_06_olive_F",nil,65000],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["20Rnd_762x51_Mag",nil,250],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]

					]
				];
			};
		};
	};
	
	case "cop_1stlieut":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 10): {"Du bist doch kein 1st Lieutenant"};
			default
			{
				["1st Lieutenant",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_DMR_03_F",nil,70000],
						["srifle_DMR_06_olive_F",nil,65000],
						["20Rnd_762x51_Mag",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,35000],
						["arifle_MXC_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]

					]
				];
			};
		};
	};
	
	case "cop_captain":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 11): {"Hahah als ob du ein Captain bist."};
			default
			{
				["Captain",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_DMR_03_F",nil,70000],
						["srifle_EBR_F",nil,70000],
						["srifle_DMR_06_olive_F",nil,65000],
						["20Rnd_762x51_Mag",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,35000],
						["arifle_MXC_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["optic_AMS",nil,30000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]

					]
				];
			};
		};
	};
	
	case "cop_director":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (__GETC__(life_coplevel) < 12): {"Du siehst nicht aus wie der Chief"};
			default
			{
				["Chief Shop",
					[
						["arifle_SPAR_03_blk_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["srifle_DMR_07_blk_F",nil,30000],
						["20Rnd_650x39_Cased_Mag_F",nil,250],
						["arifle_SPAR_01_blk_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,250],
						["srifle_LRR_F",nil,140000],
						["7Rnd_408_Mag",nil,1400],
						["srifle_GM6_F",nil,140000],
						["5Rnd_127x108_Mag",nil,1400],
						["srifle_EBR_F",nil,140000],
						["srifle_DMR_02_F",nil,100000],
						["10Rnd_338_Mag",nil,250],
						["srifle_DMR_03_F",nil,70000],
						["srifle_EBR_F",nil,70000],
						["srifle_DMR_06_olive_F",nil,65000],
						["20Rnd_762x51_Mag",nil,250],
						["LMG_MK200_F",nil,100000],
						["200Rnd_65x39_cased_Box",nil,250],
						["arifle_MX_Black_F",nil,15000],
						["arifle_MXM_Black_F",nil,35000],
						["arifle_MXC_Black_F",nil,15000],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_ERCO_blk_F",nil,1500],
						["optic_SOS",nil,20000],
						["optic_KHS_blk",nil,20000],
						["optic_AMS",nil,30000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]
					]
				];
			};
		};
	};
	
	case "cop_adf":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (!license_cop_adf): {"Du kein Mitglied der A.D.F"};
			default
			{
			["A.D.F",
					[	
						["srifle_DMR_03_khaki_F",nil,25000],
						["srifle_DMR_06_camo_F",nil,25000],
						["20Rnd_762x51_Mag",nil,250],
						["LMG_MK200_F",nil,60000],
						["200Rnd_65x39_cased_Box",nil,250],
						["arifle_MXC_Black_F",nil,17500],
						["30Rnd_65x39_caseless_mag",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_SDAR_F",nil,400],
						["20Rnd_556x45_UW_mag",nil,50],
						["arifle_TRG21_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,100],
						["hgun_PDW2000_F",nil,25000],
						["30Rnd_9x21_Mag",nil,100],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500]
					]
				];
			};
		};
	};
	case "cop_swat":
	{
		switch(true) do
		{
			case (playerSide != west): {"Du bist kein NLPD-Beamter!"};
			case (!license_cop_swat): {"Du kein Mitglied des S.R.T"};
			default
			{
			["S.R.T",
					[		
						["srifle_EBR_F",nil,140000],
						["srifle_DMR_03_F",nil,70000],
						["20Rnd_762x51_Mag",nil,250],
						["arifle_MX_GL_Black_F",nil,30000],
						["arifle_MXM_Black_F",nil,35000],
						["arifle_MXC_Black_F",nil,17500],
						["30Rnd_65x39_caseless_mag",nil,250],
						["1Rnd_Smoke_Grenade_shell",nil,250],
						["UGL_FlareWhite_F",nil,250],
						["arifle_MX_SW_Black_F",nil,50000],
						["100Rnd_65x39_caseless_mag",nil,250],
						["arifle_TRG21_F",nil,15000],
						["30Rnd_556x45_Stanag",nil,100],
						["hgun_PDW2000_F",nil,25000],
						["30Rnd_9x21_Mag",nil,100],
						["acc_flashlight",nil,1500],
						["optic_Holosight",nil,1500],
						["optic_Arco",nil,1500],
						["optic_MRCO",nil,1500],
						["optic_Hamr",nil,1500],
						["optic_SOS",nil,20000],
						["HandGrenade_Stone","Flashbang",5700],
						["SmokeShell",nil,500],
						["SmokeShellBlue",nil,500],
						["1Rnd_Smoke_Grenade_shell",nil,500]

					]
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du bist kein Rebell!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[			
						["SMG_02_F",nil,60000],
						["30Rnd_9x21_Mag",nil,200],
						["SMG_01_F",nil,60000],
						["30Rnd_45ACP_Mag_SMG_01",nil,1500],
						["arifle_AKS_F",nil,75000],
						["30Rnd_545x39_Mag_F",nil,500],
						["arifle_Mk20_F",nil,75000],
						["arifle_TRG21_F",nil,75000],
						["arifle_TRG20_F",nil,70000],
						["arifle_Mk20C_F",nil,70000],
						["30Rnd_556x45_Stanag",nil,2500],
						["arifle_SPAR_01_snd_F",nil,110000],
						["arifle_SPAR_01_khk_F",nil,110000],
						["30Rnd_556x45_Stanag",nil,3000],
						["LMG_03_F",nil,500000],
						["200Rnd_556x45_Box_F",nil,8000],
						["arifle_CTAR_ghex_F",nil,140000],
						["arifle_CTAR_hex_F",nil,140000],
						["30Rnd_580x42_Mag_F",nil,3500],
						["arifle_Katiba_F",nil,350000],
						["30Rnd_65x39_caseless_green",nil,5000],
						["arifle_MXC_F",nil,300000],
						["arifle_MXC_khk_F",nil,300000],
						["arifle_MX_F",nil,320000],
						["arifle_MX_khk_F",nil,320000],
						["arifle_MXM_F",nil,700000],
						["arifle_MXM_khk_F",nil,700000],
						["30Rnd_65x39_caseless_mag",nil,5000],
						["srifle_DMR_07_hex_F",nil,700000],
						["srifle_DMR_07_ghex_F",nil,700000],
						["20Rnd_650x39_Cased_Mag_F",nil,5000],
						["arifle_MX_SW_F",nil,500000],
						["arifle_MX_SW_khk_F",nil,500000],
						["100Rnd_65x39_caseless_mag",nil,8000],
						["LMG_Mk200_F",nil,1500000],
						["200Rnd_65x39_cased_Box",nil,10000],
						["srifle_DMR_01_F",nil,850000],
						["10Rnd_762x54_Mag",nil,10000],
						["optic_ACO_grn",nil,15000],
						["optic_Aco_smg",nil,15000],
						["optic_Holosight",nil,5000],
						["optic_MRCO",nil,30000],
						["optic_Arco",nil,30000],
						["optic_ERCO_snd_F",nil,30000],
						["optic_ERCO_khk_F",nil,30000],
						["optic_Hamr",nil,30000],
						["optic_SOS",nil,200000],
						["optic_AMS_khk",nil,300000],
						["Rangefinder",nil,60000],
						["bipod_01_F_snd",nil,1000],
						["bipod_01_F_mtp",nil,1000],
						["bipod_02_F_tan",nil,1000],
						["bipod_02_F_hex",nil,1000],
						["bipod_03_F_oli",nil,1000],
						["SmokeShellGreen",nil,5000],
						["acc_flashlight",nil,1000],
						["acc_pointer_IR",nil,1500]
					]
				];
			};
		};
	};
	case "bm":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_bm): {"Du hast keinen Zutritt zum Schwarzmarkt!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[			
						["SMG_02_F",nil,100],
						["30Rnd_9x21_Mag",nil,200],
						["SMG_01_F",nil,150],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["arifle_Mk20_F",nil,200],
						["arifle_TRG21_F",nil,200],
						["arifle_TRG20_F",nil,300],
						["arifle_Mk20C_F",nil,200],
						["30Rnd_556x45_Stanag",nil,50],
						["arifle_CTAR_ghex_F",nil,140],
						["arifle_CTAR_hex_F",nil,140],
						["30Rnd_580x42_Mag_F",nil,30],
						["LMG_03_F",nil,50],
						["200Rnd_556x45_Box_F",nil,800],
						["arifle_MXC_F",nil,500],
						["arifle_MX_F",nil,500],
						["arifle_MXM_F",nil,500],
						["arifle_MXC_Black_F",nil,170],
						["arifle_MX_Black_F",nil,170],
						["arifle_MXM_Black_F",nil,350],
						["30Rnd_65x39_caseless_mag",nil,200],
						["arifle_Katiba_F",nil,550],
						["30Rnd_65x39_caseless_green",nil,750],
						["arifle_MX_SW_F",nil,500],
						["100Rnd_65x39_caseless_mag",nil,500],
						["LMG_Mk200_F",nil,500],
						["200Rnd_65x39_cased_Box",nil,500],
						["srifle_DMR_01_F",nil,600],
						["10Rnd_762x54_Mag",nil,100],
						["srifle_EBR_F",nil,650],
						["srifle_DMR_03_khaki_F",nil,100],
						["srifle_DMR_06_camo_F",nil,500],
						["srifle_DMR_03_F",nil,700],
						["srifle_EBR_F",nil,700],
						["srifle_DMR_06_olive_F",nil,600],
						["srifle_DMR_02_F",nil,100],
						["srifle_LRR_F",nil,1400],
						["7Rnd_408_Mag",nil,140],
						["srifle_GM6_F",nil,1400],
						["5Rnd_127x108_Mag",nil,140],
						["10Rnd_338_Mag",nil,250],
						["20Rnd_762x51_Mag",nil,250],
						["launch_RPG32_F",nil,2500],
						["RPG32_F",nil,2500],
						["LMG_Zafir_F",nil,200],
						["150Rnd_762x54_Box_Tracer",nil,200],
						["optic_ACO_grn",nil,500],
						["optic_Aco_smg",nil,500],
						["optic_Holosight",nil,500],
						["optic_MRCO",nil,150],
						["optic_Arco",nil,150],
						["optic_Hamr",nil,150],
						["optic_SOS",nil,500],
						["bipod_01_F_snd",nil,300],
						["bipod_01_F_mtp",nil,300],
						["bipod_02_F_tan",nil,300],
						["bipod_02_F_hex",nil,300],
						["bipod_03_F_oli",nil,300],
						["SmokeShellGreen",nil,200],
						["acc_flashlight",nil,70],
						["acc_pointer_IR",nil,10]
					]
				];
			};
		};
	};
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Pistol_01_F",nil,12000],
						["16Rnd_9x21_Mag",nil,450],
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,450],
						["hgun_Pistol_heavy_02_F",nil,20000],
						["6Rnd_45ACP_Cylinder",nil,500],
						["hgun_PDW2000_F",nil,30000],
						["30Rnd_9x21_Mag",nil,1000],
						["SMG_05_F",nil,30000],
						["30Rnd_9x21_Mag_SMG_02",nil,1000],
						["arifle_SDAR_F",nil,40000],
						["20Rnd_556x45_UW_mag",nil,650],
						["optic_Yorris",nil,2500],
						["optic_MRD",nil,2500],
						["V_Rangemaster_belt",nil,10000]
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					[
						["hgun_Rook40_F",nil,5000],
						["16Rnd_9x21_Mag",nil,250],
						["hgun_Pistol_heavy_02_F",nil,5000],
						["6Rnd_45ACP_Cylinder",nil,250],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,250],
						["hgun_PDW2000_F",nil,20000],
						["30Rnd_9x21_Mag",nil,250],
						["optic_ACO_grn_smg",nil,1000]
					]
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150],
				["ItemGPS",nil,100],
				["ItemMap",nil,100],
				["ToolKit",nil,5000],
				["FirstAidKit",nil,750],
				["NVGoggles",nil,5000],
				["Chemlight_red",nil,500],
				["Chemlight_yellow",nil,500],
				["Chemlight_green",nil,500],
				["Chemlight_blue",nil,500]
			]
		];
	};
	
	case "med_gear":
	{
		switch(true) do
		{
			case (playerSide != independent): {"Du bist dein Medic!"};
			default
			{
				["Medic Zubehör",
					[				
						["Binocular",nil,150],
						["Rangefinder",nil,150],
						["ItemGPS",nil,100],
						["ItemMap",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,150],
						["NVGoggles",nil,2000],
						["NVGoggles_OPFOR",nil,2000],
						["U_I_CombatUniform",nil,200],
						["ItemCompass",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};	
	
	case "mrsf":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_mrsf): {"Du bist kein Mitglied des MRSFs!"};
			default
			{
				["MRSF Ausrüstung",
					[				
						["ItemGPS",nil,100],
						["ItemMap",nil,100],
						["ToolKit",nil,2500],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000],
						["U_I_CombatUniform_tshirt",nil,2000],
						["ItemCompass",nil,500],
						["Chemlight_red",nil,300],
						["Chemlight_yellow",nil,300],
						["Chemlight_green",nil,300],
						["Chemlight_blue",nil,300]
					]
				];
			};
		};
	};
	case "fanshop":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			
			default
			{
				["DFB - Trikots und mehr",
					[				
						["U_C_Commoner1_1","Deutschland-Trikot",1500],
						["U_C_Poloshirt_redwhite","Trikot Schweinsteiger",1500],
						["U_C_Poloshirt_tricolour","Trikot Müller",1500],
						["SmokeShellRed","Rauchbombe Rot",10000],
						["SmokeShellBlue","Rauchbombe Blau",10000],
						["SmokeShellGreen","Rauchbombe Grün",10000]
					]
				];
			};
			
		};
	};	
};
