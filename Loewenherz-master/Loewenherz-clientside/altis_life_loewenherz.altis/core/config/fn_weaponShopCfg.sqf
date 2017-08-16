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
_shop = param [0,"",[""]];
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

switch(_shop) do
{
	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			default
			{
				["Cop Shop",
					[
						["arifle_MXC_Black_F","MXC Negra", 30000],
						["arifle_sdar_F","Taser Rifle",20000],
						["hgun_P07_snds_F","Stun Pistol",2000],
						["hgun_P07_F",nil,7500],
						["Binocular",nil,150],
						["ItemGPS",nil,100],
						["ToolKit",nil,250],
						["muzzle_snds_L",nil,650],
						["FirstAidKit",nil,150],
						["Medikit",nil,1000],
						["NVGoggles",nil,2000],
						["16Rnd_9x21_Mag","Taser Ammo",50],
						["20Rnd_556x45_UW_mag","Taser Rifle Magazine",125],
						["30Rnd_65x39_caseless_mag",nil, 150],
						["hgun_Pistol_Signal_F",nil,1750],
						["6Rnd_GreenSignal_F",nil,70],
						["6Rnd_RedSignal_F",nil,70]
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
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_Kitbag_cbr","Medical Backpack",3000]
					]
				];
			};
		};
	};

	case "cop_patrol":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(lhm_coplevel) < 2): {"You are not at a patrol officer rank!"};
			default
			{
				["Patrol Officer Shop",
					[
						["arifle_MX_Black_F",nil,35000], //invisible
						["arifle_Mk20_F",nil,50000],  // Blackd0g
						["SMG_02_ACO_F",nil,30000],
						["MineDetector",nil,1000],
						["optic_Aco",nil,1000], //invisible
						["acc_flashlight",nil,750],
						["optic_Holosight",nil,1200],
						["optic_Arco",nil,2500],
						["optic_MRCO",nil,10000], // Blackd0g
						["muzzle_snds_H",nil,2750],
						["SmokeShellgreen",nil,1000], // Blackd0g
						["SmokeShell",nil,1000], // Blackd0g
						["30Rnd_65x39_caseless_mag",nil,130],
						["30Rnd_9x21_Mag",nil,250],
						["muzzle_snds_M",nil,2000], // Blackd0g
						["30Rnd_556x45_Stanag",nil,200],	 // Blackd0g
						["bipod_01_F_blk",nil,5000]
					]
				];
			};
		};
	};

	case "cop_sergeant":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(lhm_coplevel) < 3): {"You are not at a sergeant rank!"};
			default
			{
				["Sergeant Officer Shop",
					[
						["SMG_02_ACO_F",nil,15000],
						["srifle_EBR_F",nil, 150000],
						["hgun_ACPC2_F",nil,17500],
						["arifle_MXM_Black_F",nil,75000], // invisible
						["arifle_MX_GL_Black_F","MX Negra GL",30000],				// Blackd0g
						["1Rnd_SmokeGreen_Grenade_shell","GL GAS",1000], // Blackd0g
						["optic_Arco",nil,2500],
						["optic_MRCO",nil,10000], // Blackd0g
						["optic_Hamr",nil,10000], // Iwan
						["muzzle_snds_H",nil,2750],
						["30Rnd_65x39_caseless_mag",nil,100],
						["20Rnd_762x51_Mag",nil, 300],
						["30Rnd_9x21_Mag",nil,60],
						["9Rnd_45ACP_Mag",nil,200],
						["SmokeShellgreen",nil,500], // Blackd0g
						["3Rnd_SmokeGreen_Grenade_shell",nil,1500], // Blackd0g
						["3Rnd_Smoke_Grenade_shell",nil,1500], // Blackd0g
						["Rangefinder",nil,15000], // invisible
						["3Rnd_UGL_FlareWhite_F",nil,1500], //invisible
						["acc_pointer_IR",nil,1500] //invisible
					]
				];
			};
		};
	};

	case "cop_lieutenant": // invisible
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(lhm_coplevel) < 4): {"You are not at a Lieutenant rank!"};
			default
			{
				["Lieutenant Officer Shop",
					[
						["srifle_DMR_04_F",nil, 250000],
						["srifle_DMR_03_F",nil, 150000],
						["20Rnd_762x51_Mag",nil, 300],
						["10Rnd_127x54_Mag",nil, 5001],
						["muzzle_snds_B",nil,10000],
						["optic_SOS",nil, 25000],
						["optic_LRPS",nil, 30000],
						["optic_AMS",nil, 30000]
					]
				];
			};
		};
	};
	case "cop_captain": // Blackd0g
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(lhm_coplevel) < 5): {"You are not at a captain rank!"};
			default
			{
				["Captain Shop",
					[
						["srifle_LRR_F",nil, 200000],
						["srifle_DMR_02_F",nil, 200000],
						["srifle_DMR_05_blk_F",nil, 200000],
						["10Rnd_338_Mag",nil, 5000],
						["7Rnd_408_Mag",nil, 5000],
						["10Rnd_93x64_DMR_05_Mag",nil, 5000],
						["muzzle_snds_B",nil,10000],
						["B_UAV_01_backpack_F",nil,750000],
						["B_UavTerminal",nil,150000],
						["optic_SOS",nil, 25000],
						["muzzle_snds_338_black",nil, 10000],
						["muzzle_snds_93mmg",nil, 10000]
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
						["arifle_TRG20_F",nil,25000],
						["arifle_TRG21_F",nil,28000],
						["arifle_TRG21_GL_F",nil,45000], //Teebaron
						["arifle_Katiba_F",nil,50000],
						["arifle_Katiba_C_F",nil,40000],
						// ["srifle_DMR_01_F",nil,50000],  Iwan
						["srifle_DMR_06_camo_F",nil,120000],
						["srifle_DMR_04_Tan_F",nil,80000],
						["20Rnd_762x51_Mag",nil,3000],
						["optic_ACO_grn",nil,5000],
						["optic_KHS_hex",nil,40000],
						["optic_LRPS",nil,50000],
						["optic_Holosight",nil,5000],
						["optic_Arco","ARCO",15000],
						["optic_MRCO","MRCO",15000],
						["optic_AMS",nil,40000],
						["optic_DMS",nil, 40000],
						["acc_flashlight",nil,50],
						["optic_Hamr",nil,15000],
						["optic_SOS",nil,40000], // Iwan
						["optic_NVS",nil,30000], // Iwan
						["muzzle_snds_M",nil,10000], // Iwan
						["Rangefinder",nil,35000], // Blackd0g
						["30Rnd_9x21_Mag",nil,500],
						["10Rnd_127x54_Mag",nil,5000],
						["30Rnd_556x45_Stanag",nil,500],
						["1Rnd_SmokeRed_Grenade_shell",nil,5000],//Teebaron
						["1Rnd_SmokeOrange_Grenade_shell",nil,5000],//Teebaron
						["UGL_FlareWhite_F",nil,5000],//Teebaron
						["UGL_FlareRed_F",nil,5000],//Teebaron
						["10Rnd_762x51_Mag",nil,1500],
						["launch_RPG32_F",nil,300000], // Blackd0g
						["RPG32_F",nil,150000], // Blackd0g
						["bipod_02_F_tan",nil,7500],
						["30Rnd_65x39_caseless_green",nil,500],
						["hgun_Pistol_Signal_F",nil,3500],
						["6Rnd_GreenSignal_F",nil,100],
						["6Rnd_RedSignal_F",nil,100],
						["ItemGPS","GPS",150],
						["ToolKit",nil,1000],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,10000]
					]
				];
			};
		};
	};

		case "gang_area":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Barney´s Shop",
					[
						["arifle_TRG20_F",nil,20000],
						["arifle_TRG21_F",nil,22000],
						["arifle_TRG21_GL_F",nil,35000], //Teebaron
						["arifle_Katiba_F",nil,30000],
						["srifle_DMR_04_Tan_F",nil,70000],
						["arifle_Katiba_C_F",nil,25000],
						// ["srifle_DMR_01_F",nil,50000],  Iwan
						["srifle_DMR_06_camo_F",nil,70000],
						["20Rnd_762x51_Mag",nil,1000],
						["arifle_SDAR_F",nil,17000],
						["optic_ACO_grn",nil,2500],
						["optic_KHS_hex",nil,20000],
						["optic_LRPS",nil,20000],
						["optic_Holosight",nil,2500],
						["optic_Arco","ARCO",7000],
						["optic_MRCO","MRCO",7000],
						["acc_flashlight",nil,500],
						["optic_Hamr",nil,5000],
						["optic_SOS",nil,15000], // Iwan
						["optic_AMS",nil,10000],
						["optic_NVS",nil,22000], // Iwan
						["muzzle_snds_M",nil,3000], // Iwan
						["Rangefinder",nil,15000], // Blackd0g
						["10Rnd_127x54_Mag",nil,3000],
						["30Rnd_9x21_Mag",nil,100],
						["30Rnd_556x45_Stanag",nil,200],
						["1Rnd_SmokeRed_Grenade_shell",nil,5000],//Teebaron
						["1Rnd_SmokeOrange_Grenade_shell",nil,5000],//Teebaron
						["10Rnd_762x51_Mag",nil,500],
						["launch_RPG32_F",nil,250000], // Blackd0g
						["RPG32_F",nil,140000], // Blackd0g
						["bipod_02_F_tan",nil,5000],
						["30Rnd_65x39_caseless_green",nil,200],
						["hgun_Pistol_Signal_F",nil,2500],
						["6Rnd_GreenSignal_F",nil,50],
						["6Rnd_RedSignal_F",nil,50],
						["ItemGPS","GPS",150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["NVGoggles",nil,2000]
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
						["arifle_SDAR_F",nil,30000],
						["SMG_01_F",nil,25000],
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,10000],
						["hgun_ACPC2_F",nil,11000],
						["hgun_PDW2000_F",nil,20000],
						["hgun_Pistol_Signal_F",nil,3000],
						["optic_ACO_grn_smg",nil,5000],
						["V_Rangemaster_belt",nil,5000],
						["30Rnd_556x45_Stanag",nil,500],
						["16Rnd_9x21_Mag",nil,250],
						["30Rnd_45ACP_Mag_SMG_01",nil,500],
						["9Rnd_45ACP_Mag",nil,50],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,500],
						["20Rnd_556x45_UW_mag",nil,100]
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
						["hgun_Rook40_F",nil,2000],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,10000],
						["SMG_01_F",nil,20000],
						["optic_ACO_grn_smg",nil,2000],
						["V_Rangemaster_belt",nil,2000],
						["16Rnd_9x21_Mag",nil,100],
						["9Rnd_45ACP_Mag",nil,50],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,200],
						["30Rnd_45ACP_Mag_SMG_01",nil,200],
						["hgun_Pistol_Signal_F",nil,3000],
						["6Rnd_GreenSignal_F",nil,100],
						["6Rnd_RedSignal_F",nil,100]


					]
				];
			};
		};
	};

	case "genstore":
	{
		["General Store",
			[
				["Binocular",nil,150],
				["ItemMap",nil,100],
				["ItemWatch",nil,100],
				["ItemCompass",nil,100],
				["ItemGPS",nil,100],
				["ToolKit",nil,1000],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,10000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "bloodwyn":
	{
		["General Store",
			[
				["Binocular",nil,300],
				["ItemMap",nil,300],
				["ItemWatch",nil,300],
				["ItemCompass",nil,300],
				["ItemGPS",nil,300],
				["ToolKit",nil,300],
				["FirstAidKit",nil,300],
				["NVGoggles",nil,300],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};

	case "don-store":
	{
		["Secret Market",
			[
				["hgun_Rook40_F",nil,6500],
				["hgun_PDW2000_F",nil,20000],
				["hgun_pistol_heavy_01_F",nil,5850],
				["arifle_Mk20C_plain_F",nil,25000],
				["srifle_DMR_02_camo_F",nil,175000], //mar
				["srifle_DMR_02_sniper_F",nil,175000], //mar
				["ClaymoreDirectionalMine_Remote_Mag",nil,30000],
				["ATMine_Range_Mag",nil,250000],
				["srifle_DMR_01_F",nil,50000],
				["srifle_GM6_f",nil,150000],
				["5Rnd_127x108_Mag",nil,5000],
				["10Rnd_338_Mag",nil,5000],
				["10Rnd_762x54_Mag",nil,500],
				["optic_SOS",nil,20000],
				["optic_ACO_grn_smg",nil,3500],
				["optic_MRCO",nil,10000],
				["muzzle_snds_H",nil,2500],
				["muzzle_snds_M",nil,2000],
				["bipod_02_F_tan",nil,7500],
				["NVGoggles",nil,2000],
				["ToolKit",nil,250],
				["itemgps",nil,150],
				["Rangefinder",nil,15000],
				["FirstAidKit",nil,25],
				["16Rnd_9x21_Mag",nil,25],
				["30Rnd_9x21_Mag",nil,75],
				["11Rnd_45ACP_Mag",nil,85],
				["30Rnd_556x45_Stanag",nil,125],
				["V_PlateCarrierSpec_mtp",nil,20000]
			]
		];
	};

	case "modstore":
	{
		["Radios (benoetigt Mod)",
			[
				["tf_rf7800str","RF-7800S-TR ~2KM",500],
				["tf_anprc154","AN/PRC-154 ~2KM",500],
				["tf_pnr1000a","PNR-1000A ~2KM",500],
				["tf_anprc152","AN/PRC-152 ~5KM",700],
				["tf_anprc148jem","AN/PRC148-JEM ~5KM",700],
				["tf_fadak","FADAK ~5KM",700],
				["tf_rt1523g","RT-1523G (ASIP) ~20KM",1000],
				["tf_anprc155","AN/PRC-155 ~20KM",1000],
				["tf_mr3000","MR3000 ~20KM",1000],
				["tf_anarc210","AN/ARC-201 ~40KM/Air",1000],
				["tf_anarc164","AN-ARC-164 ~40KM/Air",1000],
				["tf_mr6000l","MR6000L ~40KM/Air",1000]
			]
		];
	};

};
