#include "..\script_macros.hpp"
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

switch(_shop) do {
	case "cop_cadet": {
        switch(true) do {
            case (playerSide != west): {"Du bist kein Cop!"};
            default {
                ["Altis Cadet Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["muzzle_snds_L",nil,250],
                        ["Binocular",nil,150],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,50],
                        ["Medikit",nil,250],
                        ["NVGoggles_OPFOR",nil,1000],
                        ["ItemWatch",nil,120],
                        ["ItemCompass",nil,20],
                        ["ItemGPS",nil,100]
                    ]
                ];
            };
        };
    };
 
    case "cop_deputy":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 2): {"You are not at a Deputy officer rank!"};
            default
            {
                ["Altis Deputy Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],                        
                        ["SMG_05_F",nil,15000],
						["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
 
    case "cop_officer":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 3): {"You are not at a sergeant rank!"};
            default
            {
                ["Altis Officer Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
   
    case "cop_detectiv":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 4): {"You are not at a Detectiv rank!"};
            default
            {
                ["Altis Detectiv Shop",
                    [  
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
   
    case "cop_inspector":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 5): {"You are not at a Inspector rank!"};
            default
            {
                ["Altis Inspector Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
   
    case "cop_commissioner":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 6): {"You are not at a Commissioner rank!"};
            default
            {
                ["Altis Commissioner Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["srifle_DMR_03_F",nil,130000],
                        ["srifle_EBR_F",nil,130000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["arifle_AK12_F",nil,135000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["DemoCharge_Remote_Mag",nil,30000],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["SmokeShellBlue",nil,1000],
                        ["SmokeShellRed",nil,1000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
 
    case "cop_major":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 7): {"You are not at a Major rank!"};
            default
            {
                ["Altis Major Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["srifle_DMR_03_F",nil,130000],
                        ["srifle_EBR_F",nil,130000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["arifle_AK12_F",nil,135000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["DemoCharge_Remote_Mag",nil,30000],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["SmokeShellBlue",nil,1000],
                        ["SmokeShellRed",nil,1000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70]
                    ]
                ];
            };
        };
    };
   
    case "cop_dea":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 8): {"You are not at a FBI rank!"};
            default
            {
                ["Altis FBI Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["B_UavTerminal",nil,5000],
                        ["hgun_Pistol_Signal_F",nil,15000],
                        ["6Rnd_GreenSignal_F",nil,60],
                        ["6Rnd_RedSignal_F",nil,60],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_CTAR_blk_F",nil,20000],
                        ["30Rnd_580x42_Mag_F",nil,500],
                        ["muzzle_snds_58_blk_F",nil,850],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_SPAR_02_blk_F",nil,30000],
                        ["150Rnd_556x45_Drum_Mag_F",nil,3000],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["arifle_Katiba_F",nil,80000],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_H",nil,2500],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["srifle_DMR_03_F",nil,130000],
                        ["srifle_EBR_F",nil,130000],
                        ["arifle_SPAR_03_blk_F",nil,160000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["arifle_AK12_GL_F",nil,135000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["1Rnd_SmokeRed_Grenade_shell",nil,3000],
                        ["1Rnd_SmokeBlue_Grenade_shell",nil,3000],
                        ["LMG_Zafir_F",nil,250000],
                        ["150Rnd_762x54_Box",nil,10000],
                        ["srifle_DMR_05_blk_F",nil,250000],
                        ["10Rnd_93x64_DMR_05_Mag",nil,3000],
                        ["muzzle_snds_93mmg",nil,2500],
                        ["srifle_DMR_02_F",nil,250000],
                        ["10Rnd_338_Mag",nil,3000],
                        ["muzzle_snds_338_black",nil,2500],
                        ["srifle_LRR_F",nil,400000],
                        ["7Rnd_408_Mag",nil,10000],
                        ["srifle_LRR_tna_F",nil,400000],
                        ["7Rnd_408_Mag",nil,10000],
                        ["srifle_GM6_F",nil,400000],                  
                        ["5Rnd_127x108_Mag",nil,10000],
                        ["srifle_GM6_F",nil,400000],                  
                        ["5Rnd_127x108_Mag",nil,10000],
                        ["launch_RPG32_ghex_F",nil,700000],
                        ["RPG32_F",nil,90000],
                        ["RPG32_HE_F",nil,150000],
                        ["launch_RPG7_F",nil,650000],
                        ["RPG7_F",nil,60000],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["DemoCharge_Remote_Mag",nil,30000],
                        ["MineDetector",nil,12500],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_ERCO_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["SmokeShellBlue",nil,1000],
                        ["SmokeShellRed",nil,1000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70],
                        ["SmokeShellYellow","Reizgas",30000]
                    ]
                ];
            };
        };
    };
   
    case "cop_swat":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 9): {"You are not at a S.W.A.T rank!"};
            default
            {
                ["Altis S.W.A.T Shop",
                    [  
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["B_UavTerminal",nil,5000],
                        ["hgun_Pistol_Signal_F",nil,15000],
                        ["6Rnd_GreenSignal_F",nil,60],
                        ["6Rnd_RedSignal_F",nil,60],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_CTAR_blk_F",nil,20000],
                        ["30Rnd_580x42_Mag_F",nil,500],
                        ["muzzle_snds_58_blk_F",nil,850],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_SPAR_02_blk_F",nil,30000],
                        ["150Rnd_556x45_Drum_Mag_F",nil,3000],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["arifle_Katiba_F",nil,80000],
                        ["arifle_ARX_blk_F",nil,60000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_H",nil,2500],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["srifle_DMR_03_F",nil,130000],
                        ["srifle_EBR_F",nil,130000],
                        ["arifle_SPAR_03_blk_F",nil,160000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["arifle_AK12_GL_F",nil,135000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["1Rnd_SmokeRed_Grenade_shell",nil,3000],
                        ["1Rnd_SmokeBlue_Grenade_shell",nil,3000],
                        ["LMG_Zafir_F",nil,250000],
                        ["150Rnd_762x54_Box",nil,10000],
                        ["srifle_DMR_05_blk_F",nil,250000],
                        ["10Rnd_93x64_DMR_05_Mag",nil,3000],
                        ["muzzle_snds_93mmg",nil,2500],
                        ["srifle_DMR_02_F",nil,250000],
                        ["10Rnd_338_Mag",nil,3000],
                        ["muzzle_snds_338_black",nil,2500],
                        ["srifle_LRR_F",nil,400000],
                        ["7Rnd_408_Mag",nil,10000],
                        ["srifle_LRR_tna_F",nil,400000],
                        ["7Rnd_408_Mag",nil,10000],
                        ["srifle_GM6_F",nil,400000],                  
                        ["5Rnd_127x108_Mag",nil,10000],
                        ["srifle_GM6_F",nil,400000],                  
                        ["5Rnd_127x108_Mag",nil,10000],
                        ["launch_RPG32_ghex_F",nil,700000],
                        ["RPG32_F",nil,90000],
                        ["RPG32_HE_F",nil,150000],
                        ["launch_RPG7_F",nil,650000],
                        ["RPG7_F",nil,60000],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["DemoCharge_Remote_Mag",nil,30000],
                        ["MineDetector",nil,12500],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_ERCO_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["SmokeShellBlue",nil,1000],
                        ["SmokeShellRed",nil,1000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70],
                        ["SmokeShellYellow","Reizgas",30000]
                    ]
                ];
            };
        };
    };
 
    case "cop_marshal":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 10): {"You are not at a Marshal rank!"};
            default
            {
                ["Altis Marshal Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",2000],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",50],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",100],
                        ["B_UavTerminal",nil,5000],
                        ["hgun_Pistol_Signal_F",nil,15000],
                        ["6Rnd_GreenSignal_F",nil,60],
                        ["6Rnd_RedSignal_F",nil,60],
                        ["arifle_sdar_F","Taser Rifle",15000],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",250],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["SMG_02_F",nil,15000],
                        ["SMG_05_F",nil,15000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,300],
                        ["muzzle_snds_L",nil,750],
                        ["arifle_CTAR_blk_F",nil,20000],
                        ["30Rnd_580x42_Mag_F",nil,500],
                        ["muzzle_snds_58_blk_F",nil,850],
                        ["arifle_CTARS_blk_F",nil,100000],
                        ["100Rnd_580x42_Mag_F",nil,500],
                        ["muzzle_snds_58_blk_F",nil,850],
                        ["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_SPAR_02_blk_F",nil,30000],
                        ["150Rnd_556x45_Drum_Mag_F",nil,3000],
                        ["muzzle_snds_M",nil,900],
                        ["arifle_MXC_Black_F",nil,30000],
                        ["arifle_MX_Black_F",nil,60000],
                        ["arifle_MXM_Black_F",nil,80000],
                        ["30Rnd_65x39_caseless_mag",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["arifle_ARX_blk_F",nil,70000],
                        ["arifle_Katiba_F",nil,80000],
                        ["30Rnd_65x39_caseless_green",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1500],
                        ["LMG_Mk200_F",nil,190000],
                        ["200Rnd_65x39_cased_Box",nil,20000],
                        ["muzzle_snds_H_MG",nil,2500],
                        ["srifle_DMR_07_blk_F",nil,95000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1000],
                        ["muzzle_snds_H",nil,1500],
                        ["srifle_DMR_03_F",nil,130000],
                        ["srifle_DMR_06_camo_F",nil,130000],
                        ["srifle_EBR_F",nil,130000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["arifle_AK12_GL_F",nil,135000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["1Rnd_SmokeRed_Grenade_shell",nil,3000],
                        ["1Rnd_SmokeBlue_Grenade_shell",nil,3000],
                        ["arifle_AKM_F",nil,100000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["arifle_SPAR_03_blk_F",nil,160000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["LMG_Zafir_F",nil,250000],
                        ["150Rnd_762x54_Box",nil,10000],
                        ["srifle_DMR_05_blk_F",nil,250000],
                        ["10Rnd_93x64_DMR_05_Mag",nil,3000],
                        ["muzzle_snds_93mmg",nil,2500],
                        ["srifle_DMR_02_F",nil,250000],
                        ["10Rnd_338_Mag",nil,3000],
                        ["muzzle_snds_338_black",nil,2500],
                        ["srifle_LRR_F",nil,400000],
                        ["srifle_LRR_tna_F",nil,400000],
                        ["7Rnd_408_Mag",nil,10000],
                        ["srifle_GM6_F",nil,400000],                  
                        ["5Rnd_127x108_Mag",nil,10000],
                        ["launch_RPG32_ghex_F",nil,700000],
                        ["RPG32_F",nil,90000],
                        ["RPG32_HE_F",nil,150000],
                        ["Rangefinder","Range Finder",20000],
                        ["bipod_01_F_blk",nil,1000],
                        ["HandGrenade_Stone",nil,1700],
                        ["DemoCharge_Remote_Mag",nil,30000],
                        ["MineDetector",nil,12500],
                        ["optic_Holosight",nil,1000],
                        ["optic_hamr",nil,1000],
                        ["optic_Aco",nil,1000],
                        ["optic_ACO_grn_smg",nil,1000],
                        ["optic_MRCO",nil,1300],
                        ["optic_Arco_blk_F",nil,1300],
                        ["optic_ERCO_blk_F",nil,1300],
                        ["optic_NVS",nil,2500],
                        ["optic_AMS",nil,2500],
                        ["optic_LRPS",nil,3000],
                        ["optic_KHS_blk",nil,3000],
                        ["optic_SOS",nil,3000],
                        ["SmokeShellBlue",nil,1000],
                        ["SmokeShellRed",nil,1000],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,70],
                        ["SmokeShellYellow","Reizgas",30000]
                    ]
                ];
            };
        };
    };
   
    case "cop_chief":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Cop!"};
            case (FETCH_CONST(ES_coplevel) < 12): {"You are not at a Chief rank!"};
            default
            {
                ["Altis Police Chief Shop",
                    [
                        ["hgun_P07_snds_F","Taser Pistol",1],
                        ["16Rnd_9x21_Mag","16-Schuss Taser Magazine",1],
                        ["30Rnd_9x21_Mag","30-Schuss Taser Magazine",1],
                        ["B_UavTerminal",nil,1],
                        ["hgun_Pistol_Signal_F",nil,1],
                        ["6Rnd_GreenSignal_F",nil,1],
                        ["6Rnd_RedSignal_F",nil,1],
                        ["arifle_sdar_F","Taser Rifle",1],
                        ["30Rnd_556x45_Stanag","Taser Rifle Magazine",1],
                        ["20Rnd_556x45_UW_mag",nil,1],
                        ["SMG_02_F",nil,1],
                        ["SMG_05_F",nil,1],
                        ["30Rnd_9x21_Mag_SMG_02",nil,1],
                        ["muzzle_snds_L",nil,1],
                        ["arifle_CTAR_blk_F",nil,1],
                        ["30Rnd_580x42_Mag_F",nil,1],
                        ["muzzle_snds_58_blk_F",nil,1],
                        ["arifle_CTARS_blk_F",nil,1],
                        ["100Rnd_580x42_Mag_F",nil,1],
                        ["muzzle_snds_58_blk_F",nil,1],
                        ["arifle_SPAR_01_blk_F",nil,1],
                        ["30Rnd_556x45_Stanag",nil,1],
                        ["muzzle_snds_M",nil,1],
                        ["arifle_SPAR_02_blk_F",nil,1],
                        ["150Rnd_556x45_Drum_Mag_F",nil,1],
                        ["muzzle_snds_M",nil,1],
                        ["arifle_MXC_Black_F",nil,1],
                        ["arifle_MX_Black_F",nil,1],
                        ["arifle_MXM_Black_F",nil,1],
                        ["30Rnd_65x39_caseless_mag",nil,1],
                        ["muzzle_snds_H",nil,1],
                        ["arifle_ARX_blk_F",nil,1],
                        ["arifle_Katiba_F",nil,1],
                        ["30Rnd_65x39_caseless_green",nil,1],
                        ["10Rnd_50BW_Mag_F",nil,1],
                        ["muzzle_snds_H",nil,1],
                        ["muzzle_snds_65_TI_blk_F","Typ 115 Schalldämpfer",1],
                        ["LMG_Mk200_F",nil,100000],
                        ["200Rnd_65x39_cased_Box",nil,1],
                        ["muzzle_snds_H_MG",nil,1],
                        ["srifle_DMR_07_blk_F",nil,1],
                        ["20Rnd_650x39_Cased_Mag_F",nil,1],
                        ["muzzle_snds_H",nil,1],
                        ["srifle_DMR_03_F",nil,1],
                        ["srifle_DMR_06_camo_F",nil,1],
                        ["srifle_EBR_F",nil,1],
                        ["20Rnd_762x51_Mag",nil,1],
                        ["muzzle_snds_B",nil,1],
                        ["arifle_AK12_GL_F",nil,1],
                        ["30Rnd_762x39_Mag_F",nil,1],
                        ["muzzle_snds_B",nil,1],
                        ["1Rnd_SmokeRed_Grenade_shell",nil,1],
                        ["1Rnd_SmokeBlue_Grenade_shell",nil,1],
                        ["arifle_AKM_F",nil,1],
                        ["30Rnd_762x39_Mag_F",nil,1],
                        ["arifle_SPAR_03_blk_F",nil,1],
                        ["20Rnd_762x51_Mag",nil,1],
                        ["muzzle_snds_B",nil,1],
                        ["LMG_Zafir_F",nil,1],
                        ["150Rnd_762x54_Box",nil,1],
                        ["srifle_DMR_05_blk_F",nil,1],
                        ["10Rnd_93x64_DMR_05_Mag",nil,1],
                        ["muzzle_snds_93mmg",nil,1],
                        ["srifle_DMR_02_F",nil,1],
                        ["10Rnd_338_Mag",nil,1],
                        ["muzzle_snds_338_black",nil,1],
                        ["srifle_LRR_F",nil,1],
                        ["srifle_LRR_tna_F",nil,1],
                        ["7Rnd_408_Mag",nil,1],
                        ["srifle_GM6_F",nil,1],                  
                        ["5Rnd_127x108_Mag",nil,1],
                        ["launch_RPG32_ghex_F",nil,1],
                        ["RPG32_F",nil,100000],
                        ["RPG32_HE_F",nil,100000],
                        ["launch_RPG7_F",nil,100000],
                        ["RPG7_F",nil,100000],
                        ["Rangefinder","Range Finder",1],
                        ["bipod_01_F_blk",nil,1],
                        ["HandGrenade_Stone",nil,1],
                        ["DemoCharge_Remote_Mag",nil,1],
                        ["MineDetector",nil,1],
                        ["optic_Holosight",nil,1],
                        ["optic_hamr",nil,1],
                        ["optic_Aco",nil,1],
                        ["optic_ACO_grn_smg",nil,1],
                        ["optic_MRCO",nil,1],
                        ["optic_Arco_blk_F",nil,1],
                        ["optic_ERCO_blk_F",nil,1],
                        ["optic_NVS",nil,1],
                        ["optic_AMS",nil,1],
                        ["optic_LRPS",nil,1],
                        ["optic_KHS_blk",nil,1],
                        ["optic_SOS",nil,1],
                        ["SmokeShellBlue",nil,1],
                        ["SmokeShellRed",nil,1],
                        ["acc_pointer_IR",nil,1],
                        ["acc_flashlight",nil,1],
                        ["SmokeShellYellow","Reizgas",1]
                    ]
                ];
            };
        };
    };
	//neu Tanoa defence
	
	
	case "tdf":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_tdf): {"Du hast keine Tactial Force Ausbildungs!"};
			default
			{
				["Tactical Defence Force",
					[
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,17000],					
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],
					
						["arifle_TRG20_F",nil,50000],
						["srifle_DMR_01_F",nil,120000],
                        ["10Rnd_762x54_Mag",nil,5000],
						["arifle_SPAR_01_blk_F",nil,25000],
                        ["30Rnd_556x45_Stanag",nil,500],
						["arifle_SPAR_03_blk_F",nil,160000],
                        ["20Rnd_762x51_Mag",nil,2000],
						["arifle_SDAR_F",nil,40000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],	
						["hgun_Pistol_Signal_F",nil,10000],
						["6Rnd_GreenSignal_F",nil,1000],
						["6Rnd_RedSignal_F",nil,1000],
						["hgun_Rook40_F",nil,15000],
						["hgun_PDW2000_F",nil,40000],
						["16Rnd_9x21_Mag",nil,1500],
						["muzzle_snds_L",nil,5000],
						["SMG_01_F",nil,50000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1500 ],
						["muzzle_snds_acp",nil,1250],
						["SMG_02_F",nil,55500 ],			
						["30Rnd_9x21_Mag",nil,1250],
						["muzzle_snds_L",nil,1500 ],				
						["arifle_Katiba_F",nil,125000 ],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,500 ],
						["muzzle_snds_H",nil,1250 ],
						["arifle_MX_F",nil,180000 ],
						["arifle_MXC_F",nil,160000 ],
						["arifle_MX_GL_F",nil,200000 ],
						["30Rnd_65x39_caseless_mag",nil,5000 ],				
						["arifle_Mk20_plain_F",nil,80000 ],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],
						["srifle_DMR_06_olive_F",nil,325000],				
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_03_tan_F",nil,380000],
						["20Rnd_762x51_Mag",nil,5000],										
						["optic_ACO_grn",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Hamr",nil,16500],
						["optic_MRCO",nil,18000],
						["optic_SOS",nil,25000],
						["UGL_FlareRed_F",nil,500]
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
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[
						["hgun_P07_khk_F",nil,15000],
                        ["hgun_Rook40_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
                        ["muzzle_snds_L",nil,1000],
						["hgun_Pistol_01_F",nil,17000],					
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],
						["arifle_TRG20_F",nil,50000],
                        ["arifle_SDAR_F",nil,40000],
                        ["30Rnd_556x45_Stanag",nil,300],
                        ["20Rnd_556x45_UW_mag",nil,125],
						["srifle_DMR_01_F",nil,120000],
						["10Rnd_762x54_Mag",nil,5000],
						["hgun_Pistol_Signal_F",nil,10000],
						["6Rnd_GreenSignal_F",nil,1000],
						["6Rnd_RedSignal_F",nil,1000],
						["hgun_PDW2000_F",nil,40000],
                        ["SMG_02_F",nil,55500 ],
						["30Rnd_9x21_Mag",nil,1500],
						["muzzle_snds_L",nil,5000],
						["SMG_01_F",nil,50000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1500 ],
						["muzzle_snds_acp",nil,1250],				
						["arifle_Katiba_F",nil,125000 ],
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,500 ],
						["muzzle_snds_H",nil,1250 ],
						["arifle_MX_F",nil,180000 ],
						["arifle_MXC_F",nil,160000 ],
						["arifle_MX_GL_F",nil,200000 ],
						["30Rnd_65x39_caseless_mag",nil,5000 ],				
						["arifle_Mk20_plain_F",nil,80000 ],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],
						["srifle_DMR_06_olive_F",nil,325000],				
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_03_tan_F",nil,380000],
						["20Rnd_762x51_Mag",nil,5000],										
						["optic_ACO_grn",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Hamr",nil,16500],
						["optic_MRCO",nil,18000],
						["optic_SOS",nil,25000],
                        ["optic_ACO_grn",nil,3500],
                        ["optic_Holosight",nil,3600],
                        ["acc_flashlight",nil,1000],
                        ["optic_Hamr",nil,7500],
                        ["UGL_FlareRed_F",nil,500]
					]
				];
			};
		};
	};
	
	case "don":
	{
		switch(true) do
		{
			case (FETCH_CONST(ES_donator) < 1): {"Du bist kein Donator!"};
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			default
			{
				["Mohammed's Donator Shop",
					[
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,12500],
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["100Rnd_580x42_Mag_F",nil,5500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],
						
						["arifle_MXC_Black_F",nil,160000],
						["arifle_MX_Black_F",nil,180000],
						["arifle_MX_GL_Black_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,5000],
						["arifle_Mk20_F",nil,80000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1000],
						["srifle_DMR_06_camo_F",nil,325000],
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_03_F",nil,325000],
						["20Rnd_762x51_Mag",nil,5000],							
						["optic_ACO_grn",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_Hamr",nil,16500],
						["optic_MRCO",nil,18000],
						["optic_SOS",nil,25000],
						["UGL_FlareWhite_F",nil,500],
						["UGL_FlareGreen_F",nil,500],
						["UGL_FlareRed_F",nil,500],
						["UGL_FlareYellow_F",nil,500 ]
					]
				];
			};
		};
	};
	
	case "reb2":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			case (!license_civ_soeldner): {"Du hast keine Söldner Ausbildung!"};
			default
			{
				["Söldner Ausrüstung",
					[
					
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,12500],
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AK12_F",nil,250000],
						["arifle_AK12_GL_F",nil,270000],
						["30Rnd_762x39_Mag_F",nil,6000],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],
					
						["arifle_TRG20_F",nil,45000],
                        ["arifle_SDAR_F",nil,35000],
                        ["20Rnd_556x45_UW_mag",nil,125],
                        ["30Rnd_556x45_Stanag",nil,300],
						["srifle_DMR_01_F",nil,100000],
                        ["10Rnd_762x54_Mag",nil,3500],		
						["hgun_Pistol_Signal_F",nil,10000],
						["6Rnd_GreenSignal_F",nil,1000],
						["6Rnd_RedSignal_F",nil,1000],
						["hgun_Rook40_F",nil,15000],           
						["16Rnd_9x21_Mag",nil,1000],
						["muzzle_snds_L",nil,1000],				
						["hgun_Pistol_heavy_02_F", nil, 17500],
						["6Rnd_45ACP_Cylinder",nil,10000],		
						["SMG_01_F",nil,45000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1500],
						["muzzle_snds_acp",nil,1250],
						["SMG_02_F",nil,40000],	
                        ["hgun_PDW2000_F",nil,35000],		
						["30Rnd_9x21_Mag",nil,1250],
						["muzzle_snds_L",nil,1500],				
						["arifle_Katiba_F",nil,100000],			
						["arifle_Katiba_GL_F",nil,115000],				
						["arifle_Katiba_C_F",nil,90000],		
						["30Rnd_65x39_caseless_green",nil,500],
						["muzzle_snds_H",nil,1250],				
						["arifle_MXC_F",nil,135000],
						["arifle_MX_F",nil,160000],
						["arifle_MX_GL_F",nil,175000],
						["arifle_MX_SW_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,5000],		
						["arifle_Mk20C_plain_F",nil,65000],
						["arifle_Mk20_plain_F",nil,70000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],
						["srifle_DMR_06_olive_F",nil,325000],
						["srifle_DMR_03_tan_F",nil,350000],
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_LRR_F",nil,1250000],
						["7Rnd_408_Mag",nil,15000],
						["bipod_01_F_snd",nil,15000],		
						["optic_ACO_grn",nil,5000],
						["optic_Holosight",nil,5000],
						["optic_MRCO",nil,18000],
						["optic_SOS",nil,25000],
                        ["optic_ACO_grn",nil,3500],
                        ["acc_flashlight",nil,1000],
                        ["optic_Hamr",nil,7500],
                        ["optic_Yorris",nil,1000],  
						["UGL_FlareGreen_F",nil,500]
					]
				];
			};
		};
	};
	
	case "don2":
	{
		switch(true) do
		{
			case (FETCH_CONST(ES_donator) < 2): {"Du bist kein Donator!"};
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			default
			{
				["Mohammed's Donator Shop",
					[		
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,12500],
                        ["10Rnd_9x21_Mag",nil,1200],
						["arifle_AK12_F",nil,250000],
						["arifle_AK12_GL_F",nil,270000],
						["30Rnd_762x39_Mag_F",nil,6000],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],
					
						["arifle_MXC_Black_F",nil,135000],
						["arifle_MX_Black_F",nil,160000],
						["arifle_MX_GL_Black_F",nil,175000],
						["arifle_MX_SW_Black_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,5000],				
						["arifle_Mk20_F",nil,70000],
						["arifle_Mk20C_F",nil,650000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1000],
						["srifle_DMR_06_camo_F",nil,325000],
						["srifle_DMR_03_F",nil,325000],
						["srifle_DMR_03_woodland_F",nil,100000],
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_LRR_camo_F",nil,1250000],
						["7Rnd_408_Mag",nil,15000],
                        ["optic_ACO_grn",nil,5000],
                        ["optic_Holosight",nil,5000],
                        ["optic_Hamr",nil,16500],
                        ["optic_MRCO",nil,18000],
                        ["optic_SOS",nil,25000],
                        ["bipod_02_F_tan",nil,20000],
                        ["bipod_02_F_hex",nil,20000],
                        ["bipod_03_F_oli",nil,20000],
						["UGL_FlareWhite_F",nil,500],
						["UGL_FlareGreen_F",nil,500],
						["UGL_FlareRed_F",nil,500],
						["UGL_FlareYellow_F",nil,500]
					]
				];
			};
		};
	};
	
	case "reb3":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			case (!license_civ_soeldner): {"Du hast keine Söldner Ausbildung!"};
			case (!license_civ_millitear): {"Du hast keine Militär Ausbildung!"};
			default
			{
				["Militär Ausrüstung",
					[
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,12500],
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AK12_F",nil,250000],
						["arifle_AK12_GL_F",nil,270000],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
                        ["arifle_AKS_F",nil,80000],
                        ["30Rnd_545x39_Mag_F",nil,10000],
						["arifle_CTARS_blk_F",nil,300000],
						["100Rnd_580x42_Mag_F",nil,5500],			
						["arifle_CTAR_blk_F",nil,275000],
						["arifle_CTAR_GL_blk_F",nil,275000],
						["30Rnd_580x42_Mag_F",nil,2500],
						["srifle_DMR_07_ghex_F",nil,175000],	
						["srifle_DMR_07_blk_F",nil,175000],
						["srifle_DMR_07_hex_F",nil,175000],
						["20Rnd_650x39_Cased_Mag_F",nil,10000],	
                        ["srifle_DMR_01_F",nil,90000],
                        ["10Rnd_762x54_Mag",nil,5000],
                        ["muzzle_snds_B",nil,2500],				
						["LMG_03_F",nil,1750000],
						["200Rnd_556x45_Box_F",nil,40000],						
						["arifle_ARX_blk_F",nil,200000],
						["arifle_ARX_hex_F",nil,200000],
						["30Rnd_65x39_caseless_green",nil,15000],	
						["arifle_SPAR_01_khk_F",nil,244000],
                        ["arifle_TRG20_F",nil,40000],
                        ["arifle_SDAR_F",nil,30000],
						["30Rnd_556x45_Stanag",nil,10000],
                        ["20Rnd_556x45_UW_mag",nil,125],
						["arifle_SPAR_03_khk_F",nil,350000],
						["20Rnd_762x51_Mag",nil,15000],						
						["hgun_Pistol_Signal_F",nil,7000],
						["6Rnd_GreenSignal_F",nil,1000],
						["6Rnd_RedSignal_F",nil,1000],
						["hgun_Rook40_F",nil,10000],
						["16Rnd_9x21_Mag",nil,1000],
						["muzzle_snds_L",nil,1000],				
						["hgun_Pistol_heavy_02_F", nil, 12500],
						["6Rnd_45ACP_Cylinder",nil,1000],
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,25000],
						["muzzle_snds_acp",nil,1000],
						["hgun_PDW2000_F",nil,30000],
                        ["SMG_02_F",nil,35000],
						["30Rnd_9x21_Mag",nil,1500],
						["muzzle_snds_L",nil,5000],
						["SMG_01_F",nil,40000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1500],
						["muzzle_snds_acp",nil,1250],			
						["arifle_Katiba_F",nil,80000],			
						["arifle_Katiba_GL_F",nil,100000],				
						["arifle_Katiba_C_F",nil,80000],		
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,500],
						["muzzle_snds_H",nil,1250],				
						["arifle_MX_F",nil,140000],
						["arifle_MXC_F",nil,125000],
						["arifle_MX_GL_F",nil,160000],
						["arifle_MX_SW_F",nil,180000],
                        ["arifle_MXM_F",nil,200000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,28000],			
						["arifle_Mk20_plain_F",nil,60000],
						["arifle_Mk20C_plain_F",nil,55000],
						["arifle_Mk20_GL_plain_F",nil,70000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],			
						["srifle_EBR_F",nil,300000],
						["srifle_DMR_06_olive_F",nil,325000],				
						["srifle_DMR_03_tan_F",nil,325000],
						["20Rnd_762x51_Mag",nil,5000],				
						["srifle_DMR_02_sniper_F",nil,450000],
						["10Rnd_338_Mag",nil,5000],
                        ["muzzle_snds_338_green",nil,10000],
                        ["muzzle_snds_338_sand",nil,10000],
                        ["muzzle_snds_338_black",nil,1000],						
						["srifle_DMR_05_tan_f",nil,450000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],	
                        ["muzzle_snds_93mmg",nil,10000],
                        ["muzzle_snds_93mmg_tan",nil,10000],		
						["LMG_Mk200_F",nil,500000],
						["200Rnd_65x39_cased_Box_Tracer",nil,20000],				
						["muzzle_snds_H_MG",nil,5000],
						["LMG_Zafir_F",nil,550000],
						["150Rnd_762x54_Box_Tracer",nil,20000],			
						["srifle_LRR_F",nil,1100000],
						["7Rnd_408_Mag",nil,25000],			
						["srifle_GM6_F",nil,1600000],
						["5Rnd_127x108_Mag",nil,25000],			
						["UGL_FlareGreen_F",nil,500],
                        ["bipod_01_F_snd",nil,15000],       
                        ["optic_ACO_grn",nil,5000],
						["optic_Hamr",nil,8000],
						["optic_MRCO",nil,8000],
						["optic_SOS",nil,8000],
						["optic_DMS",nil,8000],
						["optic_Holosight",nil,1500],
						["optic_LRPS",nil,8000],
						["optic_NVS",nil,8000],
						["optic_Arco",nil,8000],
						["optic_AMS_khk",nil,10000],
						["optic_AMS_snd",nil,10000],
						["optic_AMS",nil,10000],
						["optic_KHS_blk",nil,10000],
						["optic_KHS_hex",nil,10000],
						["optic_KHS_old",nil,10000],
						["optic_KHS_tan",nil,10000],
                        ["optic_Yorris",nil,1000],
                        ["acc_flashlight",nil,1000]
					]
				];
			};
		};
	};
	
	case "don3":
	{
		switch(true) do
		{
			case (FETCH_CONST(ES_donator) < 3): {"Du bist kein Donator!"};
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			case (!license_civ_millitear): {"Du hast keine Militear Ausbildungs Lizenz!"};
			default
			{
				["Mohammed's Jihadi Shop",
					[	
						["hgun_P07_khk_F",nil,15000],
                        ["16Rnd_9x21_Mag",nil,1200],
						["hgun_Pistol_01_F",nil,12500],
						["10Rnd_9x21_Mag",nil,1200],
						["arifle_AK12_F",nil,250000],
						["arifle_AK12_GL_F",nil,270000],
						["arifle_AKM_F",nil,140000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_CTARS_blk_F",nil,200000],
						["100Rnd_580x42_Mag_F",nil,5500],
						["arifle_AKS_F",nil,80000],
						["30Rnd_545x39_Mag_F",nil,10000],						
						["arifle_CTAR_blk_F",nil,275000],
						["arifle_CTAR_GL_blk_F",nil,275000],
						["30Rnd_580x42_Mag_F",nil,2500],
						["srifle_DMR_07_ghex_F",nil,175000],	
						["srifle_DMR_07_blk_F",nil,175000],
						["srifle_DMR_07_hex_F",nil,175000],
						["20Rnd_650x39_Cased_Mag_F",nil,10000],					
						["LMG_03_F",nil,1750000],
						["200Rnd_556x45_Box_F",nil,40000],						
						["arifle_ARX_blk_F",nil,200000],
						["arifle_ARX_hex_F",nil,200000],
						["30Rnd_65x39_caseless_green",nil,15000],	
						["arifle_SPAR_01_khk_F",nil,244000],
                        ["arifle_SDAR_F",nil,30000],
                        ["arifle_TRG20_F",nil,40000],
						["30Rnd_556x45_Stanag",nil,10000],	
                        ["20Rnd_556x45_UW_mag",nil,125],
						["arifle_Katiba_F",nil,80000],
                        ["30Rnd_65x39_caseless_green",nil,550],
                        ["muzzle_snds_H",nil,1250], 
						["srifle_DMR_01_F",nil,90000],
						["10Rnd_762x54_Mag",nil,5000],	
                        ["muzzle_snds_B",nil,2500],
						["arifle_MXC_Black_F",nil,125000],
						["arifle_MX_Black_F",nil,140000],
						["arifle_MX_GL_Black_F",nil,160000],
						["arifle_MX_SW_Black_F",nil,180000],
						["arifle_MXM_Black_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,5000],	
                        ["muzzle_snds_H",nil,1250], 
						["arifle_Mk20_F",nil,60000],				
						["arifle_Mk20C_F",nil,55000],			
						["arifle_Mk20_GL_F",nil,70000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1000],
                        ["arifle_SPAR_03_khk_F",nil,150000],		
						["srifle_DMR_06_camo_F",nil,325000],
						["srifle_DMR_03_F",nil,325000],
						["srifle_DMR_03_woodland_F",nil,325000],
						["srifle_DMR_03_khaki_F",nil,325000],
						["20Rnd_762x51_Mag",nil,5000],			
						["srifle_DMR_02_camo_F",nil,450000],
						["10Rnd_338_Mag",nil,5000],	
                        ["muzzle_snds_338_green",nil,10000],
                        ["muzzle_snds_338_sand",nil,10000],
                        ["muzzle_snds_338_black",nil,1000],		
						["srifle_LRR_camo_F",nil,1100000],
						["7Rnd_408_Mag",nil,15000],			
						["srifle_GM6_camo_F",nil,1600000],
						["5Rnd_127x108_Mag",nil,25000],			
						["optic_ACO_grn",nil,5000],			
						["optic_Hamr",nil,8000],
						["optic_MRCO",nil,8000],
						["optic_SOS",nil,8000],
						["optic_DMS",nil,8000],
						["optic_Holosight",nil,1500],
						["optic_LRPS",nil,8000],
						["optic_NVS",nil,8000],
						["optic_Arco",nil,8000],
						["optic_AMS_khk",nil,10000],
						["optic_AMS_snd",nil,10000],
						["optic_AMS",nil,10000],
						["optic_KHS_blk",nil,10000],
						["optic_KHS_hex",nil,10000],
						["optic_KHS_old",nil,10000],
						["optic_KHS_tan",nil,10000],
                        ["acc_flashlight",nil,1000],  				
						["bipod_01_F_snd",nil,15000],
						["bipod_01_F_mtp",nil,15000],
						["bipod_02_F_blk",nil,15000],
						["bipod_02_F_tan",nil,15000],
						["bipod_02_F_hex",nil,15000],
						["bipod_03_F_oli",nil,20000],
						["UGL_FlareWhite_F",nil,500],
						["UGL_FlareGreen_F",nil,500],
						["UGL_FlareRed_F",nil,500],
						["UGL_FlareYellow_F",nil,500]
					]
				];
			};
		};
	};
	
	case "markt":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"Du hast keine Rebellen Ausbildungs Lizenz!"};
			case (!license_civ_soeldner): {"Du hast keine Soeldner Ausbildung!"};
			case (!license_civ_millitear): {"Du hast keine Militär Ausbildung!"};
			case (!license_civ_markt): {"Du hast keine Schwarzmarkt Ausbildung!"};
			default
			{
				["Schwarzmarkt Ausrüstung",
					[
						["hgun_P07_khk_F",nil,10000],
						["hgun_Pistol_01_F",nil,250],
						["16Rnd_9x21_Mag",nil,1200],
						["10Rnd_9x21_Mag",nil,1200],
						
						["arifle_AK12_F",nil,190000],
						["arifle_AK12_GL_F",nil,180000],
						["arifle_AKM_F",nil,100000],
						["30Rnd_762x39_Mag_F",nil,4500],
						["arifle_CTARS_blk_F",nil,180000],
						["100Rnd_580x42_Mag_F",nil,5500],
						["arifle_AKS_F",nil,70000],
						["30Rnd_545x39_Mag_F",nil,10000],						
						["arifle_CTAR_blk_F",nil,225000],
						["arifle_CTAR_GL_blk_F",nil,225000],
						["30Rnd_580x42_Mag_F",nil,2500],
						["srifle_DMR_07_ghex_F",nil,155000],	
						["srifle_DMR_07_blk_F",nil,155000],
						["srifle_DMR_07_hex_F",nil,155000],
						["20Rnd_650x39_Cased_Mag_F",nil,10000],					
						["LMG_03_F",nil,1450000],
						["200Rnd_556x45_Box_F",nil,30000],						
						["arifle_ARX_blk_F",nil,160000],
						["arifle_ARX_hex_F",nil,160000],
						["30Rnd_65x39_caseless_green",nil,15000],	
						["arifle_SPAR_01_khk_F",nil,214000],
						["30Rnd_556x45_Stanag",nil,10000],	
						["arifle_SPAR_03_khk_F",nil,130000],
						["20Rnd_762x51_Mag",nil,15000],
						["20Rnd_650x39_Cased_Mag_F",nil,20000],
						
						
						
						["arifle_TRG20_F",nil,20000],
						["arifle_Katiba_F",nil,60000],
						["srifle_DMR_01_F",nil,60000],
                        ["10Rnd_762x54_Mag",nil,5000],
						["arifle_SDAR_F",nil,20000],
						["optic_ACO_grn",nil,3500],
						["optic_Holosight",nil,3600],
						["acc_flashlight",nil,1000],
						["optic_Hamr",nil,7500],
						["30Rnd_9x21_Mag",nil,200],
						["20Rnd_556x45_UW_mag",nil,125],
						["30Rnd_556x45_Stanag",nil,300],
						["10Rnd_762x51_Mag",nil,500],
						["30Rnd_65x39_caseless_green",nil,275],						
						["hgun_Pistol_Signal_F",nil,7000],
						["6Rnd_GreenSignal_F",nil,1000],
						["6Rnd_RedSignal_F",nil,1000],
						["hgun_Rook40_F",nil,10000],
						["16Rnd_9x21_Mag",nil,1000],
						["muzzle_snds_L",nil,1000],				
						["hgun_Pistol_heavy_02_F", "", 12500],
						["6Rnd_45ACP_Cylinder",nil,1000],
						["optic_Yorris",nil,1000],
						["hgun_ACPC2_F",nil,17500],
						["9Rnd_45ACP_Mag",nil,25000],
						["muzzle_snds_acp",nil,1000],
						["hgun_PDW2000_F",nil,30000],
						["16Rnd_9x21_Mag",nil,1500],
						["muzzle_snds_L",nil,5000],
						["SMG_01_F",nil,40000],
						["30Rnd_45ACP_Mag_SMG_01_tracer_green",nil,1500],
						["muzzle_snds_acp",nil,1250],
						["SMG_02_F",nil,35000],			
						["30Rnd_9x21_Mag",nil,1250],
                        ["30Rnd_9x21_Mag_SMG_02",nil,1250],
						["muzzle_snds_L",nil,1500],				
						["arifle_Katiba_F",nil,80000],			
						["arifle_Katiba_GL_F",nil,100000],				
						["arifle_Katiba_C_F",nil,80000],		
						["30Rnd_65x39_caseless_green_mag_Tracer",nil,500],
						["muzzle_snds_H",nil,1250],				
						["arifle_SDAR_F",nil,30000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,5000],
						["arifle_MX_F",nil,140000],
						["arifle_MXC_F",nil,125000],
						["arifle_MX_GL_F",nil,160000],
						["arifle_MX_SW_F",nil,180000],
						["100Rnd_65x39_caseless_mag_Tracer",nil,28000],
						["arifle_MXM_F",nil,200000],
						["30Rnd_65x39_caseless_mag",nil,5000],				
						["arifle_Mk20_plain_F",nil,60000],
						["arifle_Mk20C_plain_F",nil,55000],
						["arifle_Mk20_GL_plain_F",nil,70000],
						["30Rnd_556x45_Stanag_Tracer_Red",nil,1500],			
						["srifle_DMR_01_F",nil,90000],
						["10Rnd_762x54_Mag",nil,5000],
						["srifle_EBR_F",nil,300000],
						["20Rnd_762x51_Mag",nil,1500],
						["srifle_DMR_06_olive_F",nil,325000],				
						["20Rnd_762x51_Mag",nil,5000],
						["srifle_DMR_03_tan_F",nil,325000],
						["20Rnd_762x51_Mag",nil,5000],				
						["srifle_DMR_02_sniper_F",nil,450000],
						["10Rnd_338_Mag",nil,5000],							
						["srifle_DMR_05_tan_f",nil,450000],
						["10Rnd_93x64_DMR_05_Mag",nil,5000],			
						["LMG_Mk200_F",nil,500000],
						["200Rnd_65x39_cased_Box_Tracer",nil,20000],				
						["muzzle_snds_H_MG",nil,5000],
						["LMG_Zafir_F",nil,550000],
						["150Rnd_762x54_Box_Tracer",nil,20000],			
						["srifle_LRR_F",nil,1100000],
						["7Rnd_408_Mag",nil,25000],			
						["srifle_GM6_F",nil,1600000],
						["5Rnd_127x108_Mag",nil,25000],			
						["bipod_01_F_snd",nil,15000],		
						["optic_ACO_grn",nil,5000],

						["launch_RPG32_F",nil,1400000],		
						["RPG32_F",nil,150000],		
						["launch_RPG7_F",nil,1050000],
						["RPG7_F",nil,100000],
						["UGL_FlareGreen_F",nil,500],
						["optic_Hamr",nil,8000],
						["optic_MRCO",nil,8000],
						["optic_SOS",nil,8000],
						["optic_DMS",nil,8000],
						["optic_Holosight",nil,1500],
						["optic_LRPS",nil,8000],
						["optic_NVS",nil,8000],
						["optic_Arco",nil,8000],
						["optic_AMS_khk",nil,10000],
						["optic_AMS_snd",nil,10000],
						["optic_AMS",nil,10000],
						["optic_KHS_blk",nil,10000],
						["optic_KHS_hex",nil,10000],
						["optic_KHS_old",nil,10000],
						["optic_KHS_tan",nil,10000],
						["muzzle_snds_93mmg",nil,10000],
						["muzzle_snds_93mmg_tan",nil,10000],
						["muzzle_snds_338_green",nil,10000],
						["muzzle_snds_338_sand",nil,10000],
						["muzzle_snds_338_black",nil,1000],
						["muzzle_snds_B",nil,2500],
						["muzzle_snds_H_MG",nil,750],
						["muzzle_snds_H",nil,1250]
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
						["hgun_Rook40_F",nil,6500],
						["hgun_Pistol_heavy_02_F",nil,9850],
						["hgun_ACPC2_F",nil,11500],
						["hgun_PDW2000_F",nil,20000],
						["optic_ACO_grn_smg",nil,2500],
						["V_Rangemaster_belt",nil,4900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
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
						["hgun_Rook40_F",nil,1500],
						["hgun_Pistol_heavy_02_F",nil,2500],
						["hgun_ACPC2_F",nil,4500],
						["hgun_PDW2000_F",nil,9500],
						["optic_ACO_grn_smg",nil,950],
						["V_Rangemaster_belt",nil,1900],
						["16Rnd_9x21_Mag",nil,25],
						["9Rnd_45ACP_Mag",nil,45],
						["6Rnd_45ACP_Cylinder",nil,50],
						["30Rnd_9x21_Mag",nil,75]
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
				["ToolKit",nil,250],
				["FirstAidKit",nil,150],
				["NVGoggles",nil,2000],
				["Chemlight_red",nil,300],
				["Chemlight_yellow",nil,300],
				["Chemlight_green",nil,300],
				["Chemlight_blue",nil,300]
			]
		];
	};
	
	case "med_basic": {
		switch (true) do {
			case (playerSide != independent): {"Du bist kein Feuerwehr Mann"};
			default {
				["Fire Department Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_FieldPack_ocamo",nil,3000]
					]
				];
			};
		};
	};
};
