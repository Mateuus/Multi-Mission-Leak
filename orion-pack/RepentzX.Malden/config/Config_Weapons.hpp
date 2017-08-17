class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "ItemGPS", "", 500, 50, "" },
            { "hgun_Rook40_F", "", 6500, -1, "" },
            { "hgun_Pistol_01_F", "", 7000, -1, "" }, 
            { "hgun_Pistol_heavy_02_F", "", 9850, -1, "" },
            { "hgun_ACPC2_F", "", 11500, -1, "" },
            { "hgun_PDW2000_F", "", 21000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "30Rnd_9x21_Mag", "", 200, 150, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
            { "10Rnd_9x21_Mag", "", 250, 125, "" } 
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 1250, "" },
			{ "acc_flashlight", "", 1000, 500, "" }
        };
    };

    class rebel {
        name = "Rebel Weapon Shop";
        side = "civ";
        conditions = "mav_ttm_var_rebel == 1;";
        items[] = {
            { "ItemGPS", "", 500, 50, "" },
            { "arifle_SDAR_F", "", 35000, -1, "" }, // sdar
            { "arifle_Mk20_plain_F", "", 65000, -1, "" }, // mk20
            { "arifle_TRG20_F", "", 65000, -1, "" }, // TRG20
            { "arifle_SPAR_01_khk_F", "", 80000, -1, "" }, // SPAR 5.56
            { "arifle_Katiba_F", "", 90000, -1, "" }, // Katiba
            { "arifle_MX_F", "", 95000, -1, "" }, // mx rifle 
            { "arifle_MXM_F", "", 135000, -1, "" }, // mxm
            { "arifle_CTAR_hex_F", "", 150000, -1, "" }, // car 95 
            { "srifle_DMR_07_ghex_F", "", 165000, -1, "" } // CMR
        };
        mags[] = {
            { "20Rnd_556x45_UW_mag", "", 100, 50, "" }, //5.56 x30
            { "30Rnd_556x45_Stanag", "", 100, 50, "" }, //5.56 x30
            { "30Rnd_65x39_caseless_mag", "", 100, 50, "" }, //6.5 x30
            { "30Rnd_580x42_Mag_F", "", 100, 50, "" }, //5.8 x30
            { "20Rnd_650x39_Cased_Mag_F", "", 275, 140, "" }, //6.5x20
            { "30Rnd_65x39_caseless_green", "", 100, 50, "" } //6.5x30 caseless
        };
        accs[] = {
            { "bipod_02_F_hex", "", 7500, -1, "" },
            { "optic_ACO_grn", "", 3500, -1, "" },
            { "optic_Holosight", "", 3600, -1, "" },
            { "optic_Hamr", "", 7500, -1, "" },
            { "acc_flashlight", "", 1000, -1, "" },
            { "optic_DMS", "", 12750, 1375, "" },
            { "optic_KHS_blk", "", 14750, 175, "" },
            { "optic_ERCO_snd_F", "", 4750, 175, "" },
            { "optic_NVS", "", 44750, 8375, "" }
        };
    };

    class terrorist {
        name = "Terrorist Weapon Shop";
        side = "civ";
        conditions = "mav_ttm_var_terrorist == 1;";
        items[] = {
            { "ItemGPS", "", 500, 50, "" },
            { "arifle_Mk20_plain_F", "", 65000, -1, "" }, // mk20
            { "arifle_TRG20_F", "", 65000, -1, "" }, // TRG20
            { "arifle_SPAR_01_khk_F", "", 80000, -1, "" }, // SPAR 5.56
            { "arifle_Katiba_F", "", 90000, -1, "" }, // Katiba
            { "arifle_MX_F", "", 95000, -1, "" }, // mx rifle 
            { "arifle_MXM_F", "", 135000, -1, "" }, // mxm
            { "arifle_CTAR_hex_F", "", 150000, -1, "" }, // car 95 
            { "srifle_DMR_07_ghex_F", "", 165000, -1, "" }, // CMR
            { "arifle_AKS_F", "", 72000, -1, "" }, 
            { "arifle_AKM_F", "", 158000, -1, "" }, 
            { "srifle_DMR_06_olive_F", "", 190000, -1, "" }, // mk14
            { "srifle_EBR_F", "", 230000, -1, "" }, // Mk18
            { "arifle_ARX_ghex_F", "", 218000, -1, "" }, 
            { "arifle_SPAR_02_khk_F", "", 180000, -1, "" }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_F", "", 300, 150, "" }, 
            { "30Rnd_545x39_Mag_F", "", 300, 150, "" }, 
            { "10Rnd_93x64_DMR_05_Mag", "", 175, 140, "" },
            { "30Rnd_580x42_Mag_F", "", 125, 60, "" },
            { "150Rnd_762x54_Box", "", 625, 60, "" },
            { "30Rnd_556x45_Stanag", "", 300, 150, "" }, //5.56 x30
            { "30Rnd_65x39_caseless_mag", "", 300, 150, "" }, //6.5 x30
            { "20Rnd_650x39_Cased_Mag_F", "", 275, 140, "" }, //6.5x20
            { "30Rnd_65x39_caseless_green", "", 100, 250, "" }, //6.5x30 caseless
            { "20Rnd_762x51_Mag", "", 225, 60, "" }, // 7.62x20
            { "150Rnd_556x45_Drum_Mag_F", "", 625, 60, "" } // 7.62x20

        };
        accs[] = {
            { "bipod_02_F_hex", "", 7500, -1, "" },
            { "optic_ACO_grn", "", 3500, -1, "" },
            { "optic_Holosight", "", 3600, -1, "" },
            { "optic_Hamr", "", 7500, -1, "" },
            { "acc_flashlight", "", 1000, -1, "" },
            { "optic_DMS", "", 12750, 1375, "" },
            { "optic_KHS_blk", "", 14750, 175, "" },
            { "optic_ERCO_snd_F", "", 4750, 175, "" },
            { "optic_NVS", "", 44750, 8375, "" }
        };
    };

    class donator {
        name = "Donator Weapon Shop";
        side = "civ";
        conditions = "call life_donorlevel >= 1";
        items[] = {
            { "ItemGPS", "", 500, 50, "" },
            { "arifle_Mk20_plain_F", "", 65000, -1, "" }, // mk20
            { "arifle_TRG20_F", "", 65000, -1, "" }, // TRG20
            { "arifle_SPAR_01_khk_F", "", 80000, -1, "" }, // SPAR 5.56
            { "arifle_Katiba_F", "", 90000, -1, "" }, // Katiba
            { "arifle_MX_F", "", 95000, -1, "" }, // mx rifle 
            { "arifle_MXM_F", "", 135000, -1, "" }, // mxm
            { "arifle_CTAR_hex_F", "", 150000, -1, "" }, // car 95 
            { "srifle_DMR_07_ghex_F", "", 165000, -1, "" }, // CMR
            { "arifle_AKS_F", "", 72000, -1, "" }, 
            { "arifle_AKM_F", "", 158000, -1, "" }, 
            { "srifle_DMR_06_olive_F", "", 190000, -1, "" }, // mk14
            { "srifle_EBR_F", "", 230000, -1, "" }, // Mk18
            { "arifle_ARX_ghex_F", "", 218000, -1, "" }, 
            { "arifle_SPAR_02_khk_F", "", 180000, -1, "" }
        };
        mags[] = {
            { "30Rnd_762x39_Mag_F", "", 300, 150, "" }, 
            { "30Rnd_545x39_Mag_F", "", 300, 150, "" }, 
            { "10Rnd_93x64_DMR_05_Mag", "", 175, 140, "" },
            { "30Rnd_580x42_Mag_F", "", 125, 60, "" },
            { "150Rnd_762x54_Box", "", 625, 60, "" },
            { "30Rnd_556x45_Stanag", "", 300, 150, "" }, //5.56 x30
            { "30Rnd_65x39_caseless_mag", "", 300, 150, "" }, //6.5 x30
            { "20Rnd_650x39_Cased_Mag_F", "", 275, 140, "" }, //6.5x20
            { "30Rnd_65x39_caseless_green", "", 100, 250, "" }, //6.5x30 caseless
            { "20Rnd_762x51_Mag", "", 225, 60, "" }, // 7.62x20
            { "150Rnd_556x45_Drum_Mag_F", "", 625, 60, "" } // 7.62x20

        };
        accs[] = {
            { "bipod_02_F_hex", "", 7500, -1, "" },
            { "optic_ACO_grn", "", 3500, -1, "" },
            { "optic_Holosight", "", 3600, -1, "" },
            { "optic_Hamr", "", 7500, -1, "" },
            { "acc_flashlight", "", 1000, -1, "" },
            { "optic_DMS", "", 12750, 1375, "" },
            { "optic_KHS_blk", "", 14750, 175, "" },
            { "optic_ERCO_snd_F", "", 4750, 175, "" },
            { "optic_NVS", "", 44750, 8375, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, -1, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, -1, "" },
            { "hgun_ACPC2_F", "", 4500, -1, "" },
            { "hgun_PDW2000_F", "", 9500, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950, -1, "" },
			{ "acc_flashlight", "", 1000, -1, "" }
        };
    };


    //Basic Shops
    class genstore {
        name = "Malden General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Malden Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, 75, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 250, 25, "" },
            { "ItemCompass", "", 250, 25, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "medkit", "", 200, 50, "" }
        };
        mags[] = {};
        accs[] = {};
    };
///////////////////////////////////////////////////
//cop
///////////////////////////////////////////////////

//Cop Shops
    class cop_basic {
        name = "Malden Cop Shop";
        side = "cop";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 100, 50, "" },
            { "hgun_Pistol_heavy_01_F", $STR_W_items_StunPistol, 4000, -1, "" },
            { "SMG_05_F", "", 3000, -1, "call life_coplevel >= 1" },
            { "SMG_02_F", "", 3000, -1, "call life_coplevel >= 1" }, 
            { "arifle_Mk20_plain_F", "", 5000, -1, "call life_coplevel >= 1" },
            { "arifle_SPAR_01_blk_F", "", 6000, -1, "call life_coplevel >= 1" },
            { "arifle_MX_Black_F", "", 7000, -1, "call life_coplevel >= 2" },
            { "arifle_MXM_Black_F", "", 12000, -1, "call life_coplevel >= 3" },
            { "srifle_DMR_07_blk_F", "", 14000, -1, "call life_coplevel >= 4" },
            { "arifle_SPAR_03_blk_F", "", 15000, -1, "call life_coplevel >= 5" },
            { "srifle_DMR_03_F", "", 18000, -1, "call life_coplevel >= 6" }
        };
        mags[] = {
            { "30Rnd_9x21_Mag", "", 13, -1, "call life_coplevel >= 1" },
            { "30Rnd_9x21_Mag_SMG_02", "", 13, -1, "call life_coplevel >= 1" },
            { "30Rnd_556x45_Stanag", "", 13, -1, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 20, -1, "call life_coplevel >= 1" },
            { "20Rnd_650x39_Cased_Mag_F", "", 20, -1, "call life_coplevel >= 1" },
            { "20Rnd_762x51_Mag", "", 20, -1, "call life_coplevel >= 1" },
            { "11Rnd_45ACP_Mag", "", 20, -1, "call life_coplevel >= 1" }
        };
        accs[] = {
            { "muzzle_snds_acp", "", 750, 375, "call life_coplevel >= 1" },
            { "bipod_01_F_blk", "", 5750, 1375, "call life_coplevel >= 1" },
            { "optic_MRD", "", 2750, 1375, "call life_coplevel >= 1" },
            { "acc_flashlight", "", 750, 375, "call life_coplevel >= 1" },
            { "optic_Holosight", "", 1200, 600, "call life_coplevel >= 1" },
            { "optic_Arco", "", 2500, 1250, "call life_coplevel >= 1" },
            { "optic_Aco", "", 1500, 250, "call life_coplevel >= 1" },
            { "optic_MRCO", "", 3500, 1250, "call life_coplevel >= 1" },
            { "optic_ERCO_blk_F", "", 2750, 1375, "call life_coplevel >= 1" },
            { "optic_DMS", "", 4750, 1375, "call life_coplevel >= 2" },
            { "optic_KHS_blk", "", 5750, 1375, "call life_coplevel >= 2" },
            { "optic_AMS", "", 6500, 1250, "call life_coplevel >= 3" },
            { "optic_NVS", "", 20750, 4375, "call life_coplevel >= 2" }
        };
    };

    class cop_advanced {
        name = "Malden Advanced Cop Shop";
        side = "cop";
        conditions = "mav_ttm_var_advCop == 1;";
        items[] = {
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
			{ "ItemMap", "", 100, 50, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 1700, -1, "" },
            { "hgun_Pistol_heavy_01_F", $STR_W_items_StunPistol, 2000, -1, "" },
            { "arifle_SPAR_01_blk_F", "", 10000, -1, "call life_coplevel >= 3" },
            { "arifle_ARX_blk_F", "", 14000, -1, "call life_coplevel >= 5" },
            { "arifle_SPAR_02_blk_F", "", 26000, -1, "call life_coplevel >= 6" }, 
            { "arifle_AK12_F", "", 40000, -1, "call life_coplevel >= 6" }, 
            //{ "srifle_DMR_04_F", "", 30000, -1, "call life_coplevel >= 6" }, 
            //{ "LMG_Mk200_F", "", 50000, -1, "call life_coplevel >= 7" },
            //{ "srifle_LRR_F", "", 72000, -1, "call life_coplevel >= 7" },
            { "launch_B_Titan_short_F", "Anti-Fuel launcher", 10000, -1, "call life_coplevel >= 3" }
        };
        mags[] = {
            { "10Rnd_127x54_Mag", "", 100, -1, "call life_coplevel >= 1" },
            //{ "200Rnd_65x39_cased_Box", "", 100, -1, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_green", "", 40, -1, "call life_coplevel >= 1" },
            { "150Rnd_556x45_Drum_Mag_F", "", 100, -1, "call life_coplevel >= 1" },
            { "30Rnd_580x42_Mag_F", "", 100, -1, "call life_coplevel >= 3" },
            { "30Rnd_762x39_Mag_F", "", 10, -1, "call life_coplevel >= 1" }
            //{ "7Rnd_408_Mag", "", 200, -1, "call life_coplevel >= 4" }
        };
        accs[] = {
            { "muzzle_snds_acp", "", 750, 375, "call life_coplevel >= 1" },
            { "bipod_01_F_blk", "", 5750, 1375, "call life_coplevel >= 1" },
            { "optic_MRD", "", 2750, 1375, "call life_coplevel >= 1" },
            { "acc_flashlight", "", 750, 375, "call life_coplevel >= 1" },
            { "optic_Holosight", "", 1200, 600, "call life_coplevel >= 1" },
            { "optic_Arco", "", 2500, 1250, "call life_coplevel >= 1" },
            { "optic_Aco", "", 1500, 250, "call life_coplevel >= 1" },
            { "optic_MRCO", "", 3500, 1250, "call life_coplevel >= 1" },
            { "optic_ERCO_blk_F", "", 2750, 1375, "call life_coplevel >= 1" },
            { "optic_DMS", "", 4750, 1375, "call life_coplevel >= 2" },
            { "optic_KHS_blk", "", 5750, 1375, "call life_coplevel >= 2" },
            { "optic_AMS", "", 6500, 1250, "call life_coplevel >= 3" },
            { "optic_NVS", "", 20750, 4375, "call life_coplevel >= 2" }
        };
    };

    //Medic Shops
    class cop_boat {
            name = "store";
            side = "cop";
            conditions = "";
            items[] = {
                { "arifle_SDAR_F", "", 3000, 50, "call life_coplevel >= 1" }
            };
            mags[] = {
                { "20Rnd_556x45_UW_mag", "", 20, -1, "call life_coplevel >= 1" }
        };
    };
};
