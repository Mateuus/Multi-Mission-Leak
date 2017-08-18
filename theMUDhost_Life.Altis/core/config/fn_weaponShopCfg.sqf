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
	case "cop_equipment":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};

			case (__GETC__(life_coplevel) == 0):
			{
				["Cadet Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["NVGoggles",nil,1000]
					]
				];
			};			
			case (__GETC__(life_coplevel) == 1):
			{
				["Constable Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["NVGoggles",nil,1000]
					]
				];
			};
			case (__GETC__(life_coplevel) == 2):
			{
				["Sergeant Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500]
					]
				];
			};
			case (__GETC__(life_coplevel) == 3):
			{
				["Lieutenant Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["HandGrenade_Stone","Flashbang",1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
			case (__GETC__(life_coplevel) == 4):
			{
				["Detective Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Hamr",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
			case (__GETC__(life_coplevel) == 5):
			{
				["SWAT Basic Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Hamr",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["SmokeShellPurple","Tear Gas Grenade",500],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
			case (__GETC__(life_coplevel) == 6):
			{
				["Captain Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Hamr",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["SmokeShellPurple","Tear Gas Grenade",500],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
			case (__GETC__(life_coplevel) == 7):
			{
				["Chief Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Hamr",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["SmokeShellPurple","Tear Gas Grenade",500],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
		};
	};
	
	case "uc_equipment":
	{
		switch(true) do
		{
			case (!license_civ_uc): {"You are not an undercover police officer!"};
			default
			{
				["Undercover Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Hamr",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
		};
	};

	case "swat_equipment":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) < 5): {"You are not a SWAT officer!"};
			
			case (__GETC__(life_coplevel) >= 5):
			{
				["SWAT Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,250],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_GreenSignal_F","Green Flare",1500],
						["NVGoggles",nil,1000],
						["HandGrenade_Stone","Flashbang",1000],
						["HandGrenade",nil,5000],
						["B_IR_Grenade",nil,5000],
						["SmokeShellPurple","Tear Gas Grenade",500],
						["APERSTripMine_Wire_Mag",nil,20000],
						["optic_ACO_grn",nil,500],
						["optic_Aco",nil,500],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_Holosight",nil,750],
						["optic_SOS",nil,1500],
						["optic_MRCO",nil,1250],
						["optic_DMS",nil,1500],
						["optic_LRPS",nil,2500],
						["optic_NVS",nil,5000],
						["optic_AMS",nil,5500],
						["optic_KHS_blk",nil,6000],
						["optic_tws",nil,7500],
						["optic_Nightstalker",nil,20000],
						["muzzle_snds_338_black",nil,7500],
						["muzzle_snds_338_sand",nil,7500],
						["muzzle_snds_H",nil,3000],
						["muzzle_snds_B",nil,3000],
						["muzzle_snds_acp",nil,2000],
						["bipod_01_F_blk",nil,5000],
						["bipod_01_F_snd",nil,5000],
						["acc_flashlight",nil,500],
						["acc_pointer_IR",nil,500]
					]
				];
			};
		};
	};
	
	case "donator_equipment":
	{
		switch(true) do
		{
			case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
			
			case (__GETC__(life_donator) == 1):
			{
				["Level 1 Donator",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,1000],
						["Rangefinder",nil,1000],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["6Rnd_RedSignal_F","Red Flare",1500]
					]
				];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				["Level 2 Donator",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,1000],
						["Rangefinder",nil,1000],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["SatchelCharge_Remote_Mag",nil,50000],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["6Rnd_RedSignal_F","Red Flare",1500]
					]
				];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				["Level 3 Donator",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,1000],
						["Rangefinder",nil,1000],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["SatchelCharge_Remote_Mag",nil,50000],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["6Rnd_RedSignal_F","Red Flare",1500]
					]
				];
			};
		};
	};
	
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			
			case (__GETC__(life_coplevel) == 0):
			{
				["Cadet Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250]
					]
				];
			};
			case (__GETC__(life_coplevel) == 1):
			{
				["Constable Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500]
					]
				];
			};

			case (__GETC__(life_coplevel) == 2):
			{
				["Sergeant Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 3):
			{
				["Lieutenant Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 4):
			{
				["Detective Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 5):
			{
				["SWAT Basic Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["arifle_MX_F",nil,13500],
						["arifle_MXC_F",nil,10000],
						["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
						["30Rnd_65x39_caseless_mag",nil,1000],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 6):
			{
				["Captain Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["arifle_MX_F",nil,13500],
						["arifle_MXC_F",nil,10000],
						["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
						["30Rnd_65x39_caseless_mag",nil,1000],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
			
			case (__GETC__(life_coplevel) == 7):
			{
				["Chief Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["arifle_MX_F",nil,13500],
						["arifle_MXC_F",nil,10000],
						["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
						["30Rnd_65x39_caseless_mag",nil,1000],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["hgun_Pistol_heavy_02_F","Special Issue",6500],
						["6Rnd_45ACP_Cylinder",nil,600]
					]
				];
			};
		};
	};
	
	case "uc_basic":
	{
		switch(true) do
		{
			case (!license_civ_uc): {"You are not an undercover police officer!"};
			default
			{
				["Undercover Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["SMG_02_F",nil,6500],
						["30Rnd_9x21_Mag",nil,900],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500]
					]
				];
			};
		};
	};

	case "swat_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) == 0): {"You are not a whitelisted officer of the law!"};
			case (__GETC__(life_coplevel) < 5): {"You must go to a police HQ to get weapons!"};
			
			case (__GETC__(life_coplevel) >= 5):
			{
				["SWAT Weapons",
					[
						["hgun_P07_snds_F","Tazer Pistol",2500],
						["16Rnd_9x21_Mag","Tazer Pistol Rounds",250],
						["arifle_sdar_F","Taser Rifle",20000],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",500],
						["srifle_DMR_02_F",nil,40000],
						["srifle_DMR_02_sniper_F",nil,40000],
						["10Rnd_338_Mag",nil,5000],
						["srifle_EBR_F",nil,20000],
						["srifle_DMR_03_F",nil,25000],
						["srifle_DMR_03_multicam_F",nil,25000],
						["srifle_DMR_03_khaki_F",nil,25000],
						["srifle_DMR_03_tan_F",nil,25000],
						["srifle_DMR_03_woodland_F",nil,25000],
						["20Rnd_762x51_Mag",nil,1200],
						["arifle_MX_GL_F",nil,17500],
						["arifle_MX_GL_Black_F",nil,17500],
						["arifle_MX_F",nil,13500],
						["arifle_MXC_F",nil,10000],
						["arifle_MXM_F",nil,15000],
						["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
						["30Rnd_65x39_caseless_mag",nil,1000],
						["1Rnd_HE_Grenade_shell",nil,5000],
						["1Rnd_Smoke_Grenade_shell",nil,750],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,2500],
						["srifle_GM6_F",nil,75000],
						["5Rnd_127x108_Mag",nil,5000],
						["5Rnd_127x108_APDS_Mag",nil,10000],
						["launch_NLAW_F",nil,50000],
						["NLAW_F",nil,10000],
						["hgun_Pistol_heavy_01_F",nil,1000],
						["11Rnd_45ACP_Mag",nil,750],
						["hgun_ACPC2_F",nil,5000],
						["9Rnd_45ACP_Mag",nil,750]
					]
				];
			};
		};
	};
	
	case "donator_basic":
	{
		switch (true) do 
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (__GETC__(life_donator) == 0): {"You are not a donator! Donate to get access to this shop!"};
			
			case (__GETC__(life_donator) == 1):
			{
				["Level 1 Donator",
					[
						["LMG_Mk200_F",nil,35000],
						["200Rnd_65x39_cased_Box",nil,7500],
						["200Rnd_65x39_cased_Box_Tracer",nil,8500],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,2500],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,1500],
						["arifle_SDAR_F",nil,5000],
						["20Rnd_556x45_UW_mag",nil,2500],
						["arifle_TRG20_F",nil,8500],
						["arifle_Mk20_F",nil,6500],
						["30Rnd_556x45_Stanag",nil,1500],
						["arifle_TRG20_F",nil,8500],
						["SMG_01_F",nil,3500],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["srifle_DMR_01_F",nil,25000],
						["10Rnd_762x51_Mag",nil,4500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["HandGrenade",nil,5000],
						["SmokeShell",nil,1500],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["APERSTripMine_Wire_Mag",nil,35000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 2):
			{
				["Level 2 Donator",
					[
						["LMG_Mk200_F",nil,35000],
						["200Rnd_65x39_cased_Box",nil,7500],
						["200Rnd_65x39_cased_Box_Tracer",nil,8500],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,2500],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,1500],
						["arifle_SDAR_F",nil,5000],
						["20Rnd_556x45_UW_mag",nil,2500],
						["arifle_TRG20_F",nil,8500],
						["arifle_Mk20_F",nil,6500],
						["30Rnd_556x45_Stanag",nil,1500],
						["arifle_TRG20_F",nil,8500],
						["SMG_01_F",nil,3500],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["srifle_DMR_01_F",nil,25000],
						["10Rnd_762x51_Mag",nil,4500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["HandGrenade",nil,5000],
						["SmokeShell",nil,1500],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["APERSTripMine_Wire_Mag",nil,35000]
					]
				];
			};
			
			case (__GETC__(life_donator) == 3):
			{
				["Level 3 Donator",
					[
						["LMG_Mk200_F",nil,35000],
						["200Rnd_65x39_cased_Box",nil,7500],
						["200Rnd_65x39_cased_Box_Tracer",nil,8500],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,2500],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,1500],
						["arifle_SDAR_F",nil,5000],
						["20Rnd_556x45_UW_mag",nil,2500],
						["arifle_TRG20_F",nil,8500],
						["arifle_Mk20_F",nil,6500],
						["30Rnd_556x45_Stanag",nil,1500],
						["arifle_TRG20_F",nil,8500],
						["SMG_01_F",nil,3500],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["srifle_DMR_01_F",nil,25000],
						["10Rnd_762x51_Mag",nil,4500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["HandGrenade",nil,5000],
						["SmokeShell",nil,1500],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["APERSTripMine_Wire_Mag",nil,35000]
					]
				];
			};
		};
	};
	
	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an EMS Medic"};
			default {
				["Hospital EMS Shop",
					[
						["ItemGPS",nil,100],
						["ItemRadio","Cell Phone",500],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000],
						["B_Carryall_cbr",nil,3500]
					]
				];
			};
		};
	};

	case "rebel_equipment":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Equipment",
					[
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,1000],
						["Rangefinder",nil,1000],
						["hgun_Pistol_Signal_F","Flare Gun",1000],
						["6Rnd_RedSignal_F","Red Flare",1500],
						["muzzle_snds_93mmg_tan",nil,7500],
						["muzzle_snds_H_MG",nil,5000],
						["muzzle_snds_L",nil,2000],
						["muzzle_snds_M",nil,3000],
						["optic_Arco",nil,1000],
						["optic_Hamr",nil,1000],
						["optic_Aco",nil,500],
						["optic_SOS",nil,1500],
						["optic_DMS",nil,1500],
						["optic_Nightstalker",nil,20000],
						["bipod_03_F_blk",nil,5000],
						["bipod_01_F_blk",nil,5000]
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
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["MMG_01_hex_F",nil,50000],
						["150Rnd_93x64_Mag",nil,10000],
						["LMG_Mk200_F",nil,35000],
						["200Rnd_65x39_cased_Box_Tracer",nil,8500],
						["MMG_02_black_F",nil,40000],
						["130Rnd_338_Mag",nil,9500],
						["srifle_LRR_F",nil,50000],
						["7Rnd_408_Mag",nil,2500],
						["srifle_DMR_05_blk_F",nil,45000],
						["srifle_DMR_05_tan_f",nil,45000],
						["10Rnd_93x64_DMR_05_Mag",nil,2000],
						["srifle_DMR_04_F",nil,40000],
						["srifle_DMR_04_Tan_F",nil,40000],
						["10Rnd_127x54_Mag",nil,1750],
						["srifle_DMR_06_camo_F",nil,22500],
						["srifle_DMR_06_olive_F",nil,20000],
						["20Rnd_762x51_Mag",nil,3500],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,1500],
						["arifle_SDAR_F",nil,5000],
						["20Rnd_556x45_UW_mag",nil,2500],
						["arifle_TRG20_F",nil,8500],
						["arifle_Mk20_F",nil,6500],
						["30Rnd_556x45_Stanag",nil,1500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["HandGrenade",nil,5000],
						["SmokeShell",nil,1500]
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
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,2500],
						["hgun_Pistol_heavy_02_F",nil,6500],
						["hgun_ACPC2_F",nil,5000],
						["hgun_PDW2000_F",nil,5000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,500],
						["9Rnd_45ACP_Mag",nil,750],
						["6Rnd_45ACP_Cylinder",nil,600],
						["30Rnd_9x21_Mag",nil,900]
					]
				];
			};
		};
	};
	
	case "gun_range":
	{
		switch(true) do
		{
			default
			{
				["Firing Range Ammo",
					[
						["16Rnd_9x21_Mag",nil,500],
						["9Rnd_45ACP_Mag",nil,750],
						["6Rnd_45ACP_Cylinder",nil,600],
						["30Rnd_9x21_Mag",nil,900]
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
						["LMG_Mk200_F",nil,35000],
						["200Rnd_65x39_cased_Box",nil,7500],
						["200Rnd_65x39_cased_Box_Tracer",nil,8500],
						["arifle_Katiba_F",nil,10000],
						["30Rnd_65x39_caseless_green",nil,1500],
						["arifle_SDAR_F",nil,5000],
						["20Rnd_556x45_UW_mag",nil,2500],
						["arifle_TRG20_F",nil,8500],
						["arifle_Mk20_F",nil,6500],
						["30Rnd_556x45_Stanag",nil,1500],
						["arifle_TRG20_F",nil,8500],
						["SMG_01_F",nil,3500],
						["30Rnd_45ACP_Mag_SMG_01",nil,1000],
						["srifle_DMR_01_F",nil,25000],
						["10Rnd_762x51_Mag",nil,4500],
						["hgun_Rook40_F",nil,2500],
						["16Rnd_9x21_Mag",nil,500],
						["HandGrenade",nil,5000],
						["SmokeShell",nil,1500],
						["ClaymoreDirectionalMine_Remote_Mag",nil,25000],
						["APERSTripMine_Wire_Mag",nil,35000]
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
				["ItemRadio","Cell Phone",500],
				["ToolKit",nil,500],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	case "bh":
	{
		["Bounty Hunter Shop",
			[
				["Binocular",nil,150],
				["Rangefinder",nil,10000],
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles_INDEP",nil,2000],
				["arifle_MXC_F",nil,10000],
				["30Rnd_65x39_caseless_mag_Tracer","Rubber Bullet Magazine",500],
				["30Rnd_65x39_caseless_mag",nil,1000],
				["arifle_sdar_F","Tazer Rifle",15000],
				["20Rnd_556x45_UW_mag","Tazer Rifle Rounds",250],
				["hgun_P07_snds_F","Tazer Pistol",5000],
				["16Rnd_9x21_Mag","Tazer Pistol Rounds",100],
				["optic_ACO_grn",nil,500],
				["optic_Aco",nil,500]
			]
		];
	};
	
	case "c3":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_c3): {"You don't have a class three license!"};
			default
			{
				["Class 3 Weaponry",
					[
						["Binocular",nil,150],
						["Rangefinder",nil,10000],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles_INDEP",nil,2000],
						["arifle_TRG21_F",nil,40000],
						["arifle_TRG20_F",nil,45000],
						["arifle_Mk20_plain_F",nil,40000],
						["arifle_Mk20C_plain_F",nil,45000],
						["arifle_SDAR_F",nil,25000],
						["hgun_Pistol_heavy_01_F",nil,13000],
						["hgun_Pistol_heavy_02_F",nil,10000],
						["optic_MRD",nil,5000],
						["optic_Yorris",nil,5000],
						["optic_Hamr",nil,7500],
						["optic_Arco",nil,5000],
						["optic_MRCO",nil,10000],
						["optic_ACO_grn",nil,3500],
						["optic_Aco",nil,3500],
						["optic_Holosight",nil,3500],
						["acc_flashlight",nil,750],
						["30Rnd_556x45_Stanag",nil,250],
						["20Rnd_556x45_UW_mag",nil,150],
						["9Rnd_45ACP_Mag",nil,100],
						["11Rnd_45ACP_Mag",nil,100],
						["6Rnd_45ACP_Cylinder",nil,100]
						
					]
				];
			};
		};
	};
	
	case "dive":
	{
		switch(true) do
		{
			case (!license_civ_dive): {"You don't have a diving license!"};
			default
			{
				["Underwater Weaponry",
					[
						["arifle_SDAR_F",nil,35000],
						["20Rnd_556x45_UW_mag",nil,250]
					]
				];
			};
		};
	};
};
