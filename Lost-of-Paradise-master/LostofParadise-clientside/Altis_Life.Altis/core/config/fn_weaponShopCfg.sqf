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
    case "cop_shop":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Polizist"};
            case (__GETC__(life_coplevel) == 1): {                               //Rekrutenshop
                ["Rekrutenshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,100000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_SPAR_01_blk_F",nil,100000],    //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["optic_Hamr",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["rangefinder",nil,30000],
                        ["ItemGPS",nil,100],
                        ["ItemWatch",nil,450],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["Medikit",nil,1000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["G_Combat_Goggles_tna_F",nil,2000],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000]
                    ]
                ];
            };
            
            case (__GETC__(life_coplevel) == 2): {                                                   //Zollshop
                ["Zollshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_Mk20_F",nil,100000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["arifle_SPAR_01_blk_F",nil,100000],
                        ["arifle_SPAR_01_GL_blk_F",nil,100000], //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["optic_Hamr",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["rangefinder",nil,30000],
                        ["ItemGPS",nil,100],
                        ["ItemWatch",nil,450],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["Medikit",nil,1000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_L",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000]
                    ]
                ];
            };
            case (__GETC__(life_coplevel) == 3): {
                ["Officershop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],       //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],    //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],         //Apex CAR-95
                        ["arifle_SPAR_01_blk_F",nil,100000],    //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000], //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],        //Spar 16 Apex
                        ["optic_Hamr",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["SmokeShellYellow",nil,750],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000]
                    ]
                ];
            };
            case (__GETC__(life_coplevel) == 4&&!license_cop_swat): {
                ["Corporalshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],    
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],                //Mk18
                        ["20Rnd_762x51_Mag",nil,100],               //Mk18 Muni
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000]
                    ]
                ];
            };
			case (__GETC__(life_coplevel) == 4&&license_cop_swat): {                                                //SWAT Azubi
                ["SWAT Azubishop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],               //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],            //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],                 //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],             //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],          //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],            //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],         //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],                //Spar 16 Apex
                        ["srifle_EBR_F",nil,100000],                    //Mk18
                        ["20Rnd_762x51_Mag",nil,100],                   //Mk18 Muni
                        ["optic_Hamr",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["SmokeShellYellow",nil,750],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000]
                    ]
                ];
            };	
            case (__GETC__(life_coplevel) == 5&&!license_cop_swat): {
                ["Sergeantshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
                        ["srifle_DMR_02_F",nil,100000],             //mar10 cop
                        ["10Rnd_338_Mag",nil,100],                  //mar10
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000],
                        ["B_UAV_01_backpack_F",nil,1000]
                    ]
                ];
            };
			case (__GETC__(life_coplevel) == 5&&license_cop_swat): {
                ["SWAT Mitgliedsshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],    
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],                //Mk18
                        ["20Rnd_762x51_Mag",nil,100],               //Mk18 Muni
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
						["arifle_AK12_F",nil,100000], 				//Apex AK12
                        ["arifle_AK12_GL_F",nil,100000],            //Apex AK12
                        ["30Rnd_762x39_Mag_F",nil,100],             //Apex AK12
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000]
                    ]
                ];
            };
            case (__GETC__(life_coplevel) == 6&&!license_cop_swat): {
                ["Lieutenantshop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
                        ["srifle_DMR_02_F",nil,100000],             //mar10 cop
                        ["10Rnd_338_Mag",nil,100],                  //mar10
                        ["srifle_DMR_05_blk_F",nil,100000],         //cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2000],        //cyrus
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
                        ["LMG_Mk200_F",nil,100000],
                        ["200Rnd_65x39_cased_Box",nil,100],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,100],
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["srifle_LRR_F",nil,100000],
                        ["srifle_LRR_tna_F",nil,100000],
                        ["7Rnd_408_Mag",nil,100],
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_93mmg",nil,2000],
                        ["muzzle_snds_H_MG",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000],
                        ["B_UAV_01_backpack_F",nil,1000]
                    ]
                ];
            };
            case (__GETC__(life_coplevel) == 6&&license_cop_swat): {
                ["SWAT Commandershop",
                    [
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
                        ["srifle_DMR_02_F",nil,100000],             //mar10 cop
                        ["10Rnd_338_Mag",nil,100],                  //mar10
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
						["arifle_AK12_F",nil,100000], 				//Apex AK12
                        ["arifle_AK12_GL_F",nil,100000],            //Apex AK12
                        ["30Rnd_762x39_Mag_F",nil,100],             //Apex AK12
                        ["LMG_Mk200_F",nil,100000],
                        ["200Rnd_65x39_cased_Box",nil,100],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,100],
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["srifle_LRR_F",nil,100000],
                        ["srifle_LRR_tna_F",nil,100000],
                        ["7Rnd_408_Mag",nil,100],
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000],
                        ["B_UAV_01_backpack_F",nil,1000]
                    ]
                ];
            };
            case (__GETC__(life_coplevel) == 7): {
                ["Leadershop",
                    [      
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,100000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["arifle_MX_SW_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["srifle_EBR_F",nil,100000],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
                        ["srifle_DMR_02_F",nil,100000],             //mar10 cop
                        ["10Rnd_338_Mag",nil,100],                  //mar10
                        ["srifle_DMR_05_blk_F",nil,100000],         //cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2000],        //cyrus
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
                        ["LMG_Mk200_F",nil,100000],
                        ["200Rnd_65x39_cased_Box",nil,100],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,100],
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["srifle_LRR_F",nil,100000],
                        ["srifle_LRR_tna_F",nil,100000],
                        ["7Rnd_408_Mag",nil,100],
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_93mmg",nil,2000],
                        ["muzzle_snds_H_MG",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000],
                        ["B_UAV_01_backpack_F",nil,1000]
                    ]
                ];
            };
            default{};
        };
    };
   
    case "med_basic":
    {
        switch (true) do
        {
            case (playerSide != independent): {"Du bist kein Notarzt"};
            default {
                ["PRS Shop",
                    [
                        ["U_C_WorkerCoveralls",nil,1],
                        ["ItemGPS",nil,100],
                        ["ItemWatch",nil,450],
                        ["Binocular",nil,150],
                        ["rangefinder",nil,5000],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["Medikit",nil,500],
                        ["NVGoggles",nil,200],
                        ["O_NVGoggles_ghex_F",nil,200],
                        ["NVGoggles_OPFOR",nil,200],
                        ["G_Combat_Goggles_tna_F",nil,2000],
                        ["Chemlight_red",nil,100],
                        ["Chemlight_yellow",nil,100],
                        ["Chemlight_green",nil,100],
                        ["Chemlight_blue",nil,100],
                        ["U_B_Wetsuit",nil,1000],
                        ["G_Diving",nil,500],
                        ["V_RebreatherB",nil,1000],
                        ["B_Carryall_oli",nil,5000],
                        ["B_Carryall_khk",nil,5000],
                        ["B_Carryall_cbr",nil,5000],
                        ["B_Carryall_mcamo",nil,5000],
                        ["B_Carryall_oucamo",nil,5000],
                        ["B_Carryall_ocamo",nil,5000]
                    ]
                ];
            };
        };
    };
   
    case "cop_swat":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Polizist!"};
            case (!license_cop_swat): {"Du bist nicht beim SWAT!"};
            default
            {
                ["SWAT Shop",
                    [      
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["hgun_P07_snds_F","Scharfe Pistole",10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["hgun_Pistol_Signal_F",nil,1000],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                       
                        ["SMG_02_F",nil,10000],
                        ["30Rnd_9x21_Mag",nil,100],
                        ["SMG_05_F",nil,10000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_TRG20_F",nil,10000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow","Tazer Munition",100],
                        ["30Rnd_556x45_Stanag","Scharfe Munition",100],
                        ["arifle_MX_SW_Black_F",nil,100000],
                        ["arifle_MX_SW_F",nil,100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_Black_F",nil,100000],
                        ["arifle_MXC_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["100Rnd_65x39_caseless_mag",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_SPAR_01_blk_F",nil,100000],        //Spar 16 Apex
                        ["arifle_SPAR_01_GL_blk_F",nil,100000],     //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],            //Spar 16 Apex
                        ["arifle_SPAR_03_blk_F",nil,100000],        //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,100],               //Spar 17 Apex
                        ["arifle_AK12_GL_F",nil,100000],            //Apex AK12
                        ["30Rnd_762x39_Mag_F",nil,100],             //Apex AK12
                        ["srifle_EBR_F",nil,100000],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["srifle_DMR_04_F",nil,100000],             //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,100],               //asp1
                        ["srifle_DMR_02_F",nil,100000],             //mar10 cop
                        ["10Rnd_338_Mag",nil,100],                  //mar10
                        ["srifle_DMR_05_blk_F",nil,100000],         //cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2000],        //cyrus
                        ["srifle_DMR_03_F",nil,100000],             //mk1 cop
                        ["20Rnd_762x51_Mag",nil,100],               //mk1
                        ["srifle_DMR_06_olive_F",nil,100000],       //mk14
                        ["20Rnd_762x51_Mag",nil,100],               //mk14
                        ["LMG_Mk200_F",nil,100000],
                        ["200Rnd_65x39_cased_Box",nil,100],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,100],
                        ["LMG_03_F",nil,100000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["srifle_LRR_F",nil,100000],
                        ["srifle_LRR_tna_F",nil,100000],
                        ["7Rnd_408_Mag",nil,100],
                       
                        ["optic_Hamr",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_SOS",nil,10000],
                        ["optic_DMS",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["optic_AMS",nil,10000],        //visir
                        ["optic_AMS_khk",nil,10000],    //visir
                        ["optic_AMS_snd",nil,10000],    //visir
                        ["optic_KHS_blk",nil,10000],    //visir
                        ["optic_KHS_hex",nil,10000],    //visir
                        ["optic_KHS_old",nil,10000],    //visir
                        ["optic_KHS_tan",nil,10000],    //visir
                        ["SmokeShellgreen",nil,250],
                        ["SmokeShellYellow",nil,250],
                        ["HandGrenade_Stone","Flashbang",500],
                        ["Binocular",nil,300],
                        ["rangefinder",nil,300],
                        ["Laserdesignator",nil,30000],
                        ["ItemGPS",nil,250],
                        ["ItemWatch",nil,250],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,250],
                        ["Medikit",nil,250],
                        ["NVGoggles",nil,2000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_L",nil,2000],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_B",nil,2000],
                        ["muzzle_snds_H_MG",nil,2000],
                        ["muzzle_snds_65_TI_blk_F",nil,2000],
                        ["muzzle_snds_58_wdm_F",nil,2000],
                        ["muzzle_snds_B_khk_F",nil,2000],
                        ["muzzle_snds_B_snd_F",nil,2000],
                        ["muzzle_snds_H_MG_khk_F",nil,2000],
                        ["muzzle_snds_H_MG_blk_F",nil,2000],
                        ["muzzle_snds_65_TI_ghex_F",nil,2000],
                        ["muzzle_snds_65_TI_hex_F",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["bipod_01_F_mtp",nil,10000],
                        ["bipod_01_F_snd",nil,10000],
                        ["bipod_02_F_blk",nil,10000],
                        ["bipod_02_F_hex",nil,10000],
                        ["bipod_02_F_tan",nil,10000],
                        ["bipod_03_F_blk",nil,10000],
                        ["bipod_03_F_oli",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000],
                        ["B_UavTerminal",nil,1000],
                        ["B_UAV_01_backpack_F",nil,1000]
                    ]
                ];
            };
        };
    };
	
	case "zollshop":
    {
        switch(true) do
        {
            case (playerSide != west): {"Du bist kein Polizist!"};
            case (!license_cop_zoll): {"Du bist nicht beim Zoll!"};
            default
            {
                ["Zoll Shop",
                    [      
                        ["hgun_Pistol_heavy_01_F","Taser Pistole",2000],
                        ["11Rnd_45ACP_Mag",nil,100],
                        ["optic_MRD","Tazer ACP Visier",10000],
                        ["SMG_05_F",nil,100000],
                        ["30Rnd_9x21_Mag_SMG_02",nil,100],
                        ["arifle_Mk20_F",nil,100000],
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["arifle_CTAR_blk_F",nil,100000],           //Apex CAR-95
                        ["arifle_CTAR_GL_blk_F",nil,100000],        //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,100],             //Apex CAR-95
                        ["srifle_DMR_07_blk_F",nil,100000],         //CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],      //CMR Apex
                        ["arifle_MX_Black_F",nil,100000],
						["arifle_MX_F","UndercoverwaffeONLY",100000],
                        ["arifle_MXM_Black_F",nil,100000],
                        ["arifle_MX_GL_Black_F",nil,100000],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["arifle_SPAR_01_blk_F",nil,100000],
                        ["arifle_SPAR_01_GL_blk_F",nil,100000], //Spar 16 Apex
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["optic_Hamr",nil,10000],
                        ["optic_MRCO",nil,10000],
                        ["optic_Holosight",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Arco",nil,10000],
                        ["optic_ERCO_blk_F",nil,10000],
                        ["rangefinder",nil,30000],
                        ["ItemGPS",nil,100],
                        ["ItemWatch",nil,450],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["Medikit",nil,1000],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["UGL_FlareWhite_F",nil,100],
                        ["UGL_FlareGreen_F",nil,100],
                        ["UGL_FlareRed_F",nil,100],
                        ["1Rnd_Smoke_Grenade_shell",nil,100],
                        ["1Rnd_SmokePurple_Grenade_shell",nil,100],
                        ["1Rnd_SmokeYellow_Grenade_shell",nil,100],
                        ["1Rnd_SmokeGreen_Grenade_shell",nil,100],
                        ["muzzle_snds_acp",nil,500],
                        ["muzzle_snds_M",nil,2000],
                        ["muzzle_snds_H",nil,2000],
                        ["muzzle_snds_L",nil,2000],
                        ["bipod_01_F_blk",nil,10000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,2000]
                    ]
                ];
            };
        };
    };
   
    case "rebel":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_rebel): {"Du hast kein Rebellen Training!"};
            default
            {
                ["Rebellen Waffenshop",
                    [
                        ["arifle_TRG20_F",nil,150000],
                        ["30Rnd_556x45_Stanag",nil,2500],
                        ["arifle_Katiba_F",nil,270000],
                        ["30Rnd_65x39_caseless_green",nil,2500],
                        ["30Rnd_65x39_caseless_green_mag_Tracer",nil,2500],
                        ["arifle_AKS_F",nil,285000], //Apex AKS74U
                        ["30Rnd_545x39_Mag_F",nil,2500], //Apex AKS74U
                        ["arifle_CTAR_hex_F",nil,290000],  //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,2500], //Apex CAR-95
                        ["arifle_MX_F",nil,300000],
                        ["arifle_MX_khk_F",nil,300000],
                        ["arifle_MXC_F",nil,300000],
                        ["arifle_MXC_khk_F",nil,300000],
                        ["arifle_MXM_khk_F",nil,750000],
                        ["arifle_MXM_F",nil,750000],
                        ["30Rnd_65x39_caseless_mag",nil,2500],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,2500],
                        ["srifle_DMR_01_F",nil,450000],
                        ["10Rnd_762x54_Mag",nil,2500],
                        ["srifle_DMR_06_olive_F",nil,1200000], //MK14
                        ["20Rnd_762x51_Mag",nil,2500], //MK14
                        ["srifle_DMR_04_tan_F",nil,2000000],//asp1
                        ["10Rnd_127x54_Mag",nil,2500], //asp1
                        ["srifle_DMR_02_sniper_F",nil,1600000], //mar10
                        ["10Rnd_338_Mag",nil,2500],//mar10
                        ["srifle_DMR_05_blk_F",nil,1600000],//Cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2500],//Cyrus
                        ["srifle_DMR_03_tan_F",nil,1000000],//mk1 civ
                        ["20Rnd_762x51_Mag",nil,2500],//mk1
                        ["srifle_EBR_F",nil,1400000],
                        ["20Rnd_762x51_Mag",nil,2500],
                        ["arifle_SPAR_03_khk_F",nil,1700000], //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,2500], //Spar 17 Apex
                        ["LMG_Mk200_F",nil,1300000],
                        ["200Rnd_65x39_cased_Box",nil,2500],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,2500],
                        ["LMG_03_F",nil,1500000],                   //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,2500],            //LMI Apex
                        ["arifle_SDAR_F",nil,150000],
                        ["20Rnd_556x45_UW_mag",nil,2500],
                        ["30Rnd_556x45_Stanag",nil,2500],
                        ["30Rnd_556x45_Stanag_Tracer_Red",nil,2500],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,2500],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,2500],
                        ["srifle_GM6_F",nil,2100000],
                        ["5Rnd_127x108_Mag",nil,4000],
                        ["srifle_DMR_07_ghex_F",nil,1000000],//CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2500],//CMR Apex
                        ["acc_pointer_IR",nil,2500],
                        ["optic_SOS",nil,180000],
                        ["optic_AMS",nil,120000], //visir
                        ["optic_AMS_khk",nil,120000], //visir
                        ["optic_AMS_snd",nil,120000], //visir
                        ["optic_KHS_blk",nil,120000], //visir
                        ["optic_KHS_hex",nil,120000], //visir
                        ["optic_KHS_old",nil,120000], //visir
                        ["optic_KHS_tan",nil,120000], //visir
                        ["optic_DMS",nil,90000],
                        ["optic_MRCO",nil,15000],
                        ["optic_Arco",nil,25000],
                        ["optic_ACO_grn",nil,15000],
                        ["optic_Aco",nil,15000],
                        ["optic_Hamr",nil,7500],
                        ["optic_Holosight",nil,12500],
                        ["optic_ERCO_khk_F",nil,25000],
                        ["optic_ERCO_snd_F",nil,25000],
                        ["bipod_01_F_blk",nil,100000],
                        ["bipod_01_F_mtp",nil,100000],
                        ["bipod_01_F_snd",nil,100000],
                        ["bipod_02_F_blk",nil,100000],
                        ["bipod_02_F_hex",nil,100000],
                        ["bipod_02_F_tan",nil,100000],
                        ["bipod_03_F_blk",nil,100000],
                        ["bipod_03_F_oli",nil,100000],
                        ["muzzle_snds_acp",nil,25000],
                        ["muzzle_snds_H",nil,25000],
                        ["muzzle_snds_93mmg",nil,25000],
                        ["muzzle_snds_M",nil,25000],
                        ["muzzle_snds_B",nil,25000],
                        ["muzzle_snds_H_MG",nil,25000],
                        ["muzzle_snds_65_TI_blk_F",nil,25000],
                        ["muzzle_snds_58_wdm_F",nil,25000],
                        ["muzzle_snds_B_khk_F",nil,25000],
                        ["muzzle_snds_B_snd_F",nil,25000],
                        ["muzzle_snds_H_MG_khk_F",nil,25000],
                        ["muzzle_snds_H_MG_blk_F",nil,25000],
                        ["muzzle_snds_65_TI_ghex_F",nil,25000],
                        ["muzzle_snds_65_TI_hex_F",nil,25000],
                        ["rangefinder",nil,5000],
                        ["NVGoggles_OPFOR",nil,5000],
                        ["O_NVGoggles_ghex_F",nil,5000],
                        ["G_Combat_Goggles_tna_F",nil,5000],
                        ["acc_flashlight",nil,1000],
                        ["SmokeShellOrange",nil,1500]
                    ]
                ];
            };
        };
    };
   
    case "gun":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_gun): {"Du hast keinen Waffenschein!"};
            default
            {
                ["Billy Joe's Firearms",
                    [
                        ["hgun_Rook40_F",nil,50000],
                        ["30Rnd_9x21_Mag",nil,1000],
                        ["hgun_ACPC2_F",nil,70000],
                        ["9Rnd_45ACP_Mag",nil,1000],
                        ["hgun_Pistol_heavy_02_F",nil,85000],
                        ["6Rnd_45ACP_Cylinder",nil,1000],
                        ["hgun_Pistol_01_F",nil,120000],        //PM09 Apex
                        ["10Rnd_9x21_Mag",nil,1000],        //PM09 Apex
                        ["SMG_01_F",nil,100000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,1000],
                        ["arifle_SPAR_01_khk_F",nil,250000],//SPAR-16 Apex
                        ["30Rnd_556x45_Stanag",nil,1000],//SPAR-16 Apex
                        ["SMG_05_F",nil,140000],        //Protector Apex
                        ["30Rnd_9x21_Mag_SMG_02",nil,1000],         //Protector Apex
                        ["hgun_PDW2000_F",nil,150000],
                        ["16Rnd_9x21_Mag",nil,1000],
                        ["arifle_Mk20_F",nil,200000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["optic_ACO_grn",nil,10000],
                        ["optic_Aco",nil,10000],
                        ["hgun_Pistol_Signal_F",nil,40000],
                        ["6Rnd_GreenSignal_F",nil,5000],
                        ["6Rnd_RedSignal_F",nil,5000],
                        ["V_Rangemaster_belt",nil,20000]
                    ]
                ];
            };
        };
    };
   
    case "kartell":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_kartell): {"Du bist kein Kartell Mitglied!"};
            default
            {
                ["Kartell Shop",
                    [
                        ["arifle_AK12_F",nil,500000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["arifle_AKM_F",nil,200000],
                        ["30Rnd_762x39_Mag_F",nil,2000],
                        ["arifle_SPAR_01_snd_F",nil,150000],
                        ["30Rnd_556x45_Stanag",nil,2000],
                        ["arifle_SPAR_03_snd_F",nil,500000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["srifle_DMR_07_hex_F",nil,300000],
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],
                        ["srifle_GM6_ghex_F",nil,1400000],
                        ["5Rnd_127x108_Mag",nil,2000],
                        ["U_I_C_Soldier_Para_1_F",nil,2000],
                        ["U_I_C_Soldier_Para_2_F",nil,2000],
                        ["U_I_C_Soldier_Para_3_F",nil,2000],
                        ["U_I_C_Soldier_Para_5_F",nil,2000],
                        ["U_I_C_Soldier_Para_4_F",nil,2000],
                        ["U_I_C_Soldier_Camo_F",nil,2000],
                        ["B_Carryall_ghex_F",nil,5000],
						["hgun_Rook40_F",nil,50000],
                        ["30Rnd_9x21_Mag",nil,1000],
                        ["hgun_ACPC2_F",nil,70000],
                        ["9Rnd_45ACP_Mag",nil,1000]
                    ]
                ];
            };
        };
    };
   
    case "donator1":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_donator1): {"Du bist kein Donator"};
            default
            {
                ["Donator Waffen Shop",
                    [
                        ["SMG_01_F",nil,50000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,1000],
                        ["hgun_PDW2000_F",nil,75000],
                        ["16Rnd_9x21_Mag",nil,1000],
                        ["arifle_Mk20_F",nil,100000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["arifle_TRG20_F",nil,75000],
                        ["30Rnd_556x45_Stanag",nil,2000],
                        ["arifle_Katiba_F",nil,135000],
                        ["30Rnd_65x39_caseless_green",nil,2000],
                        ["30Rnd_65x39_caseless_green_mag_Tracer",nil,2000],
                        ["arifle_CTAR_hex_F",nil,145000],  //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,2000], //Apex CAR-95
                        ["arifle_MX_F",nil,150000],
                        ["arifle_MX_khk_F",nil,150000],
                        ["arifle_MXC_F",nil,135000],
                        ["arifle_MXC_khk_F",nil,135000],
                        ["arifle_MXM_khk_F",nil,300000],
                        ["arifle_MXM_F",nil,300000],
                        ["30Rnd_65x39_caseless_mag",nil,2000],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,2000],
                        ["arifle_AKS_F",nil,140000], //Apex AKS74U
                        ["30Rnd_545x39_Mag_F",nil,2000], //Apex AKS74U
                        ["srifle_DMR_01_F",nil,225000],
                        ["10Rnd_762x54_Mag",nil,2000],
                        ["srifle_DMR_06_olive_F",nil,600000], //MK14
                        ["20Rnd_762x51_Mag",nil,2000], //MK14
                        ["srifle_DMR_04_tan_F",nil,1000000],//asp1
                        ["10Rnd_127x54_Mag",nil,2000], //asp1
                        ["srifle_DMR_02_sniper_F",nil,800000], //mar10
                        ["10Rnd_338_Mag",nil,2000],//mar10
                        ["srifle_DMR_05_blk_F",nil,800000],//cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2000],//cyrus
                        ["srifle_DMR_03_tan_F",nil,500000],//mk1 civ
                        ["20Rnd_762x51_Mag",nil,2000],//mk1
                        ["arifle_SPAR_03_khk_F",nil,900000], //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,2000], //Spar 17 Apex
                        ["srifle_EBR_F",nil,700000],
                        ["20Rnd_762x51_Mag",nil,2000],
                        ["LMG_Mk200_F",nil,650000],
                        ["200Rnd_65x39_cased_Box",nil,2000],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,2000],
                        ["LMG_03_F",nil,750000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["arifle_SDAR_F",nil,75000],
                        ["20Rnd_556x45_UW_mag",nil,2000],
                        ["30Rnd_556x45_Stanag",nil,2000],
                        ["30Rnd_556x45_Stanag_Tracer_Red",nil,2000],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,2000],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,2000],
                        ["srifle_GM6_F",nil,1050000],
                        ["5Rnd_127x108_Mag",nil,2000],
                        ["srifle_DMR_07_ghex_F",nil,500000],//CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,2000],//CMR Apex
                        ["acc_pointer_IR",nil,2000],
                        ["optic_SOS",nil,90000],
                        ["optic_AMS",nil,60000], //visir
                        ["optic_AMS_khk",nil,60000], //visir
                        ["optic_AMS_snd",nil,60000], //visir
                        ["optic_KHS_blk",nil,60000], //visir
                        ["optic_KHS_hex",nil,60000], //visir
                        ["optic_KHS_old",nil,60000], //visir
                        ["optic_KHS_tan",nil,60000], //visir
                        ["optic_DMS",nil,45000],
                        ["optic_MRCO",nil,7500],
                        ["optic_Arco",nil,12500],
                        ["optic_ACO_grn",nil,7500],
                        ["optic_Aco",nil,7500],
                        ["optic_Hamr",nil,3500],
                        ["optic_ERCO_khk_F",nil,12000],
                        ["optic_ERCO_snd_F",nil,12000],
                        ["optic_Holosight",nil,7500],
                        ["bipod_01_F_blk",nil,50000],
                        ["bipod_01_F_mtp",nil,50000],
                        ["bipod_01_F_snd",nil,50000],
                        ["bipod_02_F_blk",nil,50000],
                        ["bipod_02_F_hex",nil,50000],
                        ["bipod_02_F_tan",nil,50000],
                        ["bipod_03_F_blk",nil,50000],
                        ["bipod_03_F_oli",nil,50000],
                        ["muzzle_snds_acp",nil,13000],
                        ["muzzle_snds_H",nil,12500],
                        ["muzzle_snds_M",nil,12500],
                        ["muzzle_snds_B",nil,12500],
                        ["muzzle_snds_93mmg",nil,12500],
                        ["muzzle_snds_H_MG",nil,12500],
                        ["muzzle_snds_65_TI_blk_F",nil,12500],
                        ["muzzle_snds_58_wdm_F",nil,12500],
                        ["muzzle_snds_B_khk_F",nil,12500],
                        ["muzzle_snds_B_snd_F",nil,12500],
                        ["muzzle_snds_H_MG_khk_F",nil,12500],
                        ["muzzle_snds_H_MG_blk_F",nil,12500],
                        ["muzzle_snds_65_TI_ghex_F",nil,12500],
                        ["muzzle_snds_65_TI_hex_F",nil,12500],
                        ["rangefinder",nil,2500],
                        ["NVGoggles_OPFOR",nil,2500],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["G_Combat_Goggles_tna_F",nil,2000],
                        ["acc_flashlight",nil,500],
                        ["SmokeShellOrange",nil,750]
                    ]
                ];
            };
        };
    };
   
    case "bhc1":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_bhc): {"Du bist kein BHC Member"};
            default
            {
                ["BHC Shop",
                    [
                        ["hgun_Pistol_Signal_F",nil,20000],
                        ["6Rnd_GreenSignal_F",nil,1500],
                        ["6Rnd_RedSignal_F",nil,1500],
                        ["hgun_ACPC2_F",nil,10000],
                        ["9Rnd_45ACP_Mag",nil,250],
                        ["hgun_Rook40_F",nil,15000],
                        ["30Rnd_9x21_Mag",nil,250],
                        ["hgun_Pistol_heavy_02_F",nil,20000],
                        ["6Rnd_45ACP_Cylinder",nil,250],
                        ["hgun_PDW2000_F",nil,37000],
                        ["16Rnd_9x21_Mag",nil,250],
                        ["arifle_Mk20_F",nil,75000],
                        ["30Rnd_556x45_Stanag",nil,1000],
                        ["arifle_CTAR_hex_F",nil,145000],  //Apex CAR-95
                        ["30Rnd_580x42_Mag_F",nil,2000], //Apex CAR-95
                        ["SMG_01_F",nil,60000],
                        ["30Rnd_45ACP_Mag_SMG_01",nil,250],
                        ["arifle_AKS_F",nil,140000], //Apex AKS74U
                        ["30Rnd_545x39_Mag_F",nil,250], //Apex AKS74U
                        ["arifle_TRG20_F",nil,75000],
                        ["30Rnd_556x45_Stanag",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Red",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,250],
                        ["arifle_Katiba_F",nil,135000],
                        ["30Rnd_65x39_caseless_green",nil,250],
                        ["30Rnd_65x39_caseless_green_mag_Tracer",nil,250],
                        ["arifle_MX_F",nil,150000],
                        ["arifle_MX_khk_F",nil,150000],
                        ["arifle_MXC_F",nil,135000],
                        ["arifle_MXC_khk_F",nil,135000],
                        ["arifle_MXM_khk_F",nil,300000],
                        ["arifle_MXM_F",nil,300000],
                        ["30Rnd_65x39_caseless_mag",nil,250],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,250],
                        ["srifle_DMR_01_F",nil,225000],
                        ["10Rnd_762x51_Mag",nil,250],
                        ["arifle_SDAR_F",nil,75000],
                        ["20Rnd_556x45_UW_mag",nil,250],
                        ["30Rnd_556x45_Stanag",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Red",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,250],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,250],
                        ["srifle_GM6_F",nil,1100000],
                        ["5Rnd_127x108_Mag",nil,250],
                        ["srifle_DMR_07_ghex_F",nil,1000000],//CMR Apex
                        ["20Rnd_650x39_Cased_Mag_F",nil,250],//CMR Apex
                        ["srifle_EBR_F",nil,275000],
                        ["20Rnd_762x51_Mag",nil,250],
                        ["LMG_Mk200_F",nil,750000],
                        ["200Rnd_65x39_cased_Box",nil,500],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,500],
                        ["LMG_03_F",nil,750000],                    //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["srifle_DMR_04_F",nil,380000], //ASP 1 schwarz
                        ["10Rnd_127x54_Mag",nil,2500], //asp1
                        ["srifle_DMR_02_F",nil,800000], //mar10 cop
                        ["10Rnd_338_Mag",nil,2500],//mar10
                        ["srifle_DMR_05_blk_F",nil,800000],//cyrus
                        ["10Rnd_93x64_DMR_05_Mag",nil,2000],//cyrus
                        ["srifle_DMR_03_F",nil,310000], //mk1 cop
                        ["20Rnd_762x51_Mag",nil,2500],//mk1
                        ["arifle_SPAR_03_khk_F",nil,900000], //Spar 17 Apex
                        ["20Rnd_762x51_Mag",nil,2000], //Spar 17 Apex
                        ["srifle_DMR_06_olive_F",nil,500000],//mk14
                        ["20Rnd_762x51_Mag",nil,2500],//mk14
                        ["bipod_01_F_blk",nil,50000],
                        ["bipod_01_F_mtp",nil,50000],
                        ["bipod_01_F_snd",nil,50000],
                        ["bipod_02_F_blk",nil,50000],
                        ["bipod_02_F_hex",nil,50000],
                        ["bipod_02_F_tan",nil,50000],
                        ["bipod_03_F_blk",nil,50000],
                        ["bipod_03_F_oli",nil,50000],
                        ["acc_pointer_IR",nil,2500],
                        ["acc_flashlight",nil,1000],
                        ["optic_AMS",nil,60000], //visir
                        ["optic_AMS_khk",nil,60000], //visir
                        ["optic_AMS_snd",nil,60000], //visir
                        ["optic_KHS_blk",nil,60000], //visir
                        ["optic_KHS_hex",nil,60000], //visir
                        ["optic_KHS_old",nil,60000], //visir
                        ["optic_KHS_tan",nil,60000], //visir
                        ["optic_SOS",nil,90000],
                        ["optic_DMS",nil,90000],
                        ["optic_ERCO_khk_F",nil,12000],
                        ["optic_ERCO_snd_F",nil,12000],
                        ["optic_ACO_grn",nil,5000],
                        ["optic_Aco",nil,5000],
                        ["optic_MRCO",nil,1500],
                        ["optic_Hamr",nil,7500],
                        ["optic_Arco",nil,2500],
                        ["optic_Holosight",nil,6000],
                        ["muzzle_snds_acp",nil,25000],
                        ["muzzle_snds_H",nil,25000],
                        ["muzzle_snds_M",nil,25000],
                        ["muzzle_snds_93mmg",nil,25000],
                        ["muzzle_snds_B",nil,25000],
                        ["muzzle_snds_H_MG",nil,25000],
                        ["muzzle_snds_65_TI_blk_F",nil,12500],
                        ["muzzle_snds_58_wdm_F",nil,12500],
                        ["muzzle_snds_B_khk_F",nil,12500],
                        ["muzzle_snds_B_snd_F",nil,12500],
                        ["muzzle_snds_H_MG_khk_F",nil,12500],
                        ["muzzle_snds_H_MG_blk_F",nil,12500],
                        ["muzzle_snds_65_TI_ghex_F",nil,12500],
                        ["muzzle_snds_65_TI_hex_F",nil,12500],
                        ["SmokeShellOrange",nil,100],
                        ["Laserdesignator",nil,5000],
                        ["rangefinder",nil,5000],
                        ["Binocular",nil,150],
                        ["ItemGPS",nil,100],
                        ["ToolKit",nil,250],
                        ["FirstAidKit",nil,150],
                        ["NVGoggles_OPFOR",nil,2000],
                        ["O_NVGoggles_ghex_F",nil,2000],
                        ["G_Combat_Goggles_tna_F",nil,2000],
                        ["Chemlight_red",nil,300],
                        ["Chemlight_yellow",nil,300],
                        ["Chemlight_green",nil,300],
                        ["Chemlight_blue",nil,300],
                        ["V_PlateCarrier1_blk",nil,1000]
                    ]
                ];
            };
        };
    };
   
    case "presse1":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_presse): {"Du nicht bei der Presse"};
            default
            {
                ["Priester Shop",
                    [
                    //  ["U_C_PriestBody",nil,1000]
                    //  ["H_Cap_press",nil,1000],
                    //  ["V_Press_F",nil,1000],
                    //  ["B_Carryall_ocamo",nil,5000]
                    ]
                ];
            };
        };
    };
   
    case "admin1":
    {
        switch(true) do
        {
            case (playerSide != civilian): {"Nur für Zivilisten!"};
            case (!license_civ_admin1): {"Du bist kein Admin"};
            default
            {
                ["Admin Waffen Shop",
                    [
                        ["arifle_TRG20_F",nil,100],
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["30Rnd_556x45_Stanag_Tracer_Red",nil,100],
                        ["30Rnd_556x45_Stanag_Tracer_Green",nil,100],
                        ["30Rnd_556x45_Stanag_Tracer_Yellow",nil,100],
                        ["arifle_Katiba_F",nil,100],
                        ["30Rnd_65x39_caseless_green",nil,100],
                        ["30Rnd_65x39_caseless_green_mag_Tracer",nil,100],
                        ["arifle_MX_F",nil,100],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["arifle_MXC_F",nil,100],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["arifle_MXM_F",nil,100],
                        ["arifle_MXM_Black_F",nil,100],
                        ["30Rnd_65x39_caseless_mag",nil,100],
                        ["30Rnd_65x39_caseless_mag_Tracer",nil,100],
                        ["srifle_DMR_01_F",nil,100],
                        ["10Rnd_762x51_Mag",nil,100],
                        ["arifle_SDAR_F",nil,100],
                        ["20Rnd_556x45_UW_mag",nil,100],
                        ["30Rnd_556x45_Stanag",nil,100],
                        ["srifle_GM6_F",nil,100],
                        ["5Rnd_127x108_Mag",nil,100],
                        ["5Rnd_127x108_APDS_Mag",nil,100],
                        ["srifle_LRR_F",nil,100],
                        ["srifle_LRR_tna_F",nil,100],
                        ["7Rnd_408_Mag",nil,100],
                        ["srifle_EBR_F",nil,100],
                        ["20Rnd_762x51_Mag",nil,100],
                        ["LMG_Mk200_F",nil,100],
                        ["200Rnd_65x39_cased_Box",nil,100],
                        ["200Rnd_65x39_cased_Box_Tracer",nil,100],
                        ["LMG_03_F",nil,100],                   //LMI Apex
                        ["200Rnd_556x45_Box_F",nil,100],            //LMI Apex
                        ["launch_RPG32_F",nil,100],
                        ["RPG32_F",nil,100],
                        ["RPG32_HE_F",nil,100],
                        ["launch_NLAW_F",nil,100],
                        ["NLAW_F",nil,100],
                        ["launch_Titan_short_F",nil,100],
                        ["Titan_AT",nil,100],
                        ["Titan_AP",nil,100],
                        ["launch_Titan_F",nil,100],
                        ["Titan_AA",nil,100],
                        ["LMG_Zafir_F",nil,100],
                        ["150Rnd_762x51_Box",nil,100],
                        ["150Rnd_762x51_Box_Tracer",nil,100],
                        ["hgun_Pistol_Signal_F",nil,100],
                        ["6Rnd_GreenSignal_F",nil,100],
                        ["6Rnd_RedSignal_F",nil,100],
                        ["acc_pointer_IR",nil,100],
                        ["acc_flashlight",nil,100],
                        ["optic_Hamr",nil,100],
                        ["optic_Arco",nil,100],
                        ["optic_Aco",nil,100],
                        ["optic_ACO_grn",nil,100],
                        ["optic_Holosight",nil,100],
                        ["optic_SOS",nil,100],
                        ["optic_MRCO",nil,100],
                        ["optic_DMS",nil,100],
                        ["optic_LRPS",nil,100],
                        ["optic_NVS",nil,100],
                        ["optic_Nightstalker",nil,100],
                        ["optic_tws",nil,100],
                        ["muzzle_snds_H",nil,100],
                        ["muzzle_snds_L",nil,100],
                        ["muzzle_snds_M",nil,100],
                        ["muzzle_snds_B",nil,100],
                        ["muzzle_snds_H_MG",nil,100],
                        ["Laserdesignator",nil,30000],
                        ["DemoCharge_Remote_Mag",nil,100],
                        ["SatchelCharge_Remote_Mag",nil,100],
                        ["ATMine_Range_Mag",nil,100],
                        ["ClaymoreDirectionalMine_Remote_Mag",nil,100],
                        ["APERSMine_Range_Mag",nil,100],
                        ["APERSBoundingMine_Range_Mag",nil,100],
                        ["SLAMDirectionalMine_Wire_Mag",nil,100],
                        ["APERSTripMine_Wire_Mag",nil,100],
                        ["HandGrenade_Stone",nil,100],
                        ["HandGrenade",nil,100],
                        ["MiniGrenade",nil,100],
                        ["SmokeShell",nil,100],
                        ["SmokeShellYellow",nil,100],
                        ["SmokeShellGreen",nil,100],
                        ["SmokeShellRed",nil,100],
                        ["SmokeShellPurple",nil,100],
                        ["SmokeShellOrange",nil,100],
                        ["SmokeShellBlue",nil,100],
                        ["B_IR_Grenade",nil,100],
                        ["O_IR_Grenade",nil,100],
                        ["I_IR_Grenade",nil,100]
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
                ["rangefinder",nil,5000],
                ["ItemGPS",nil,100],
                ["ItemCompass",nil,100],
                ["ItemMap",nil,100],
                ["ToolKit",nil,250],
                ["FirstAidKit",nil,150],
                ["NVGoggles",nil,2000],
                ["NVGoggles_tna_F",nil,2000],
                ["Chemlight_red",nil,1000],
                ["Chemlight_yellow",nil,1000],
                ["Chemlight_green",nil,1000],
                ["Chemlight_blue",nil,1000]
            ]
        ];
    };
};