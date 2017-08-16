/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call DWEV_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {

    class gun {
        name = "Billy Joe's Waffenladen";
        side = "civ";
        conditions = "lc_gun";
        items[] = {
			{ "hgun_Pistol_Signal_F","Signal Pistole",5000, -1, "" }, //VK 2500
			{ "hgun_Rook40_F", "", 25000, -1, "" }, //VK 12500
			{ "hgun_P07_F", "", 30000, -1, "" }, //VK 15000
			{ "hgun_PDW2000_F", "", 75000, -1, "" }, //VK 37500
			{ "hgun_ACPC2_F", "", 25000, -1, "" }, //VK 12500
			{ "NONE", "--- APEX Waffen ---", 0, -1, "DWEV_OwnedApexDLC" },
			{ "NONE", "Mehr Waffen mit Apex!", 0, -1, "!DWEV_OwnedApexDLC" },
			{ "hgun_Pistol_01_F", "PM 9", 40000, -1, "DWEV_OwnedApexDLC" }, // Apex //VK 20000
			{ "SMG_05_F", "Protector 9mm", 45000, -1, "DWEV_OwnedApexDLC" } // Apex //VK 22500
        };
        mags[] = {
			{ "16Rnd_9x21_Mag", "", 500, -1, "" },
			{ "30Rnd_9x21_Mag", "", 1000, -1, "" },
			{ "9Rnd_45ACP_Mag", "", 500, -1, "" },
			{ "6Rnd_GreenSignal_F", "", 500, -1, "" },
			{ "6Rnd_RedSignal_F", "", 500, -1, "" },
			{ "10Rnd_9x21_Mag", "", 500, -1, "DWEV_OwnedApexDLC" }, // Apex
			{ "30Rnd_9x21_Mag_SMG_02", "", 1000, -1, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 10000, -1, "" },
			{ "optic_Holosight_smg", "", 10000, -1, "" },
			{ "optic_Yoris", "", 10000, -1, "" }
        };
    };
	
	class genstore {
        name = "Gemischtwarenladen";
        side = "";
        conditions = "";
        items[] = {
			{ "NONE", "Zivilisten", 0, -1, "(playerSide isEqualTo civilian)" },
			{ "Binocular", "", 2000, -1, "(playerSide isEqualTo civilian)" },
			{ "ItemGPS", "", 1000, -1, "(playerSide isEqualTo civilian)" },
			{ "ItemCompass", "", 2000, -1, "(playerSide isEqualTo civilian)" },
			{ "ItemRadio","Smartphone",2000, -1, "(playerSide isEqualTo civilian)" },
			{ "ToolKit", "", 2000, -1, "(playerSide isEqualTo civilian)" },
			{ "FirstAidKit", "", 5000, -1, "(playerSide isEqualTo civilian) && lc_rebel" },
			{ "NVGoggles", "", 10000, -1, "(playerSide isEqualTo civilian)" },
			{ "NVGoggles_INDEP", "", 10000, -1, "(playerSide isEqualTo civilian)" },
			{ "NONE", "Mehr Zubehör mit Apex!", 0, -1, "!DWEV_OwnedApexDLC && (playerSide isEqualTo civilian)" },
			{ "NVGoggles_tna_F", "", 15000, -1, "DWEV_OwnedApexDLC && (playerSide isEqualTo civilian)" }, //Apex
			{ "O_NVGoggles_ghex_F", "", 15000, -1, "DWEV_OwnedApexDLC && (playerSide isEqualTo civilian)" }, //Apex
			{ "O_NVGoggles_hex_F", "", 15000, -1, "DWEV_OwnedApexDLC && (playerSide isEqualTo civilian)" }, //Apex
			{ "Rangefinder", "", 7000, -1, "lc_rebel" },			
			{ "NONE", "Staatliche Mitarbeiter", 0, -1, "!(playerSide isEqualTo civilian)" },
			{ "Binocular", "", 1000, -1, "!(playerSide isEqualTo civilian)" },
			{ "ItemGPS", "", 500, -1, "!(playerSide isEqualTo civilian)" },
			{ "ItemCompass", "", 1000, -1, "!(playerSide isEqualTo civilian)" },
			{ "ItemRadio", "Smartphone", 1000, -1, "!(playerSide isEqualTo civilian)" },
			{ "MediKit", "", 2000, -1, "(playerSide isEqualTo west) || (playerSide isEqualTo independent)" },
			{ "FirstAidKit", "", 2500, -1, "!(playerSide isEqualTo civilian)" },
			{ "ToolKit", "", 1000, -1, "!(playerSide isEqualTo civilian)" },
			{ "Rangefinder", "", 3500, -1, "!(playerSide isEqualTo civilian)" },
			{ "NVGoggles_OPFOR", "", 5000, -1, "!(playerSide isEqualTo civilian)" },
			{ "NONE", "Mehr Zubehör mit Apex!", 0, -1, "!DWEV_OwnedApexDLC && !(playerSide isEqualTo civilian)" },
			{ "O_NVGoggles_urb_F", "", 7500, -1, "DWEV_OwnedApexDLC && !(playerSide isEqualTo civilian)" }, //Apex
			{ "hgun_Pistol_Signal_F","Signal Pistole",2500, -1, "(playerSide isEqualTo independent)" }, //VK 1250
        };
        mags[] = {
			{ "6Rnd_GreenSignal_F", "", 250, -1, "(playerSide isEqualTo independent)" },
			{ "6Rnd_RedSignal_F", "", 250, -1, "(playerSide isEqualTo independent)" }
        };
        accs[] = {
			
        };
    };
	
    class cop {
        name = "Polizei Ausrüstung";
        side = "cop";
        conditions = "";
        items[] = {
			{ "SmokeShellGreen", "", 5000, -1, "" },
			{ "SmokeShellRed", "Tränengas SEK", 5000, -1, "lp_swat && (call DWEV_coplevel >= 3)" },
			{ "hgun_Pistol_heavy_01_snds_F", "Taser", 3000, -1, "" },
			{ "NONE", "Mehr ab Wachtmeister", 0, -1, "DWEV_OwnedApexDLC && call DWEV_coplevel == 1" },
			{ "NONE", "Mehr ab Wachtmeister oder Apex", 0, -1, "!DWEV_OwnedApexDLC && call DWEV_coplevel == 1" },
			{ "SMG_05_F", "", 40000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 2)" }, //Apex //VK 20000
			{ "SMG_02_F", "", 40000, -1, "call DWEV_coplevel >= 2" }, //VK 20000
			{ "arifle_MK20C_plain_F", "", 40000, -1, "call DWEV_coplevel >= 2" }, //VK 20000
			{ "NONE", "Mehr ab Oberwachtmeister", 0, -1, "DWEV_OwnedApexDLC && call DWEV_coplevel == 2" },
			{ "NONE", "Mehr ab Oberwachtmeister oder Apex", 0, -1, "!DWEV_OwnedApexDLC && call DWEV_coplevel == 2" },
			{ "arifle_SDAR_F", "", 36000, -1, "call DWEV_coplevel >= 3" }, //VK 18000
			{ "arifle_MXC_Black_F", "", 75000, -1, "call DWEV_coplevel >= 3" }, //VK 37500
			{ "arifle_CTAR_blk_F", "", 80000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 3)" }, //Apex //VK 40000
			{ "arifle_SPAR_01_blk_F", "", 75000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 3)" }, //Apex //VK 37500
			{ "NONE", "Mehr ab Hauptwachtmeister", 0, -1, "DWEV_OwnedApexDLC && call DWEV_coplevel == 3" },
			{ "NONE", "Mehr ab Hauptwachtmeister oder Apex", 0, -1, "!DWEV_OwnedApexDLC && call DWEV_coplevel == 3" },
			{ "arifle_MX_Black_F", "", 75000, -1, "call DWEV_coplevel >= 4 || lp_swat && (call DWEV_coplevel >= 3)" }, //VK 37500
			{ "arifle_Katiba_C_F", "", 75000, -1, "call DWEV_coplevel >= 4 || lp_swat && (call DWEV_coplevel >= 3)" }, //VK 37500
			{ "arifle_ARX_blk_F", "", 150000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 4) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex //VK 75000
			{ "NONE", "Mehr ab Kommissar", 0, -1, "call DWEV_coplevel == 4" },
			{ "hgun_Pistol_Signal_F","Signal Pistole",2500, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" }, //VK 1250
			{ "arifle_MXM_Black_F", "", 75000, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" }, //VK 37500
			{ "NONE", "Mehr ab Oberkommissar", 0, -1, "call DWEV_coplevel == 5" },
			{ "srifle_EBR_F", "", 500000, 250000, "call DWEV_coplevel >= 6 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "srifle_DMR_03_F", "", 1000000, 500000, "call DWEV_coplevel >= 6 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "NONE", "Mehr ab Hauptkommissar", 0, -1, "DWEV_OwnedApexDLC && call DWEV_coplevel == 6" },
			{ "NONE", "Mehr ab Hauptkommissar oder Apex", 0, -1, "!DWEV_OwnedApexDLC && call DWEV_coplevel == 6" },
			{ "arifle_SPAR_03_blk_F", "", 750000, 375000, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 7) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex
			{ "SMG_01_F", "", 45000, -1, "lp_swat && (call DWEV_coplevel >= 3)" } //VK 22500
        };
        mags[] = {
            { "11Rnd_45ACP_Mag", "", 200, -1, "" },
			{ "30Rnd_9x21_Mag", "", 200, -1, "call DWEV_coplevel >= 2" },
			{ "30Rnd_556x45_Stanag", "", 250, -1, "call DWEV_coplevel >= 2" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 200, -1, "(call DWEV_coplevel >= 2)" },
			{ "20Rnd_556x45_UW_mag", "", 250, -1, "call DWEV_coplevel >= 3" },
			{ "30Rnd_580x42_Mag_F", "", 500, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 3)" }, //Apex
			{ "30Rnd_65x39_caseless_mag", "", 1000, -1, "call DWEV_coplevel >= 3" },
			{ "30Rnd_65x39_caseless_green", "", 1000, -1, "call DWEV_coplevel >= 4 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "6Rnd_GreenSignal_F", "", 300, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "6Rnd_RedSignal_F", "", 300, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "30Rnd_65x39_caseless_mag_Tracer","Gummigeschoss MX",2000, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "20Rnd_762x51_Mag", "", 25000, -1, "call DWEV_coplevel >= 6 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 250, -1, "lp_swat && (call DWEV_coplevel >= 3)" }
        };
        accs[] = {
            { "optic_MRD", "", 3000, -1, "" },
			{ "optic_Aco", "", 5000, -1, "call DWEV_coplevel >= 2" },
			{ "optic_Mrco", "", 12500, -1, "call DWEV_coplevel >= 2" },
			{ "optic_Holosight", "", 5000, -1, "call DWEV_coplevel >= 3" },
			{ "optic_Arco_blk_F", "", 8000, -1, "call DWEV_coplevel >= 3" },
			{ "acc_flashlight", "", 1000, -1, "call DWEV_coplevel >= 3" },
			{ "optic_Hamr", "", 9000, -1, "call DWEV_coplevel >= 4 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "optic_ERCO_blk_F", "", 25000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 4) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex
			{ "muzzle_snds_H", "", 30000, -1, "call DWEV_coplevel >= 4 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "muzzle_snds_65_TI_blk_F", "", 50000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 4) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex
			{ "muzzle_snds_58_blk_F", "", 50000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 4) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex
			{ "optic_DMS", "", 25000, -1, "call DWEV_coplevel >= 5 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "optic_SOS", "", 35000, -1, "call DWEV_coplevel >= 6 || lp_swat && (call DWEV_coplevel >= 3)" },
			{ "optic_AMS", "", 70000, -1, "DWEV_OwnedApexDLC && (call DWEV_coplevel >= 7) || DWEV_OwnedApexDLC && lp_swat && (call DWEV_coplevel >= 3)" }, //Apex
			{ "muzzle_snds_acp", "", 20000, -1, "lp_swat && (call DWEV_coplevel >= 3)" },
			{ "optic_Aco_smg", "", 5000, -1, "lp_swat && (call DWEV_coplevel >= 3)" }		
        };
    };
	
	class gang {
        name = "Gangversteck";
        side = "civ";
        conditions = "lc_gun";
        items[] = {
			{ "hgun_Pistol_Signal_F","Signal Pistole",7000, -1, "" }, //VK 2500
            { "hgun_Rook40_F", "", 30000, -1, "" }, //VK 15000
            { "hgun_ACPC2_F", "", 30000, -1, "" }, //VK 15000
            { "hgun_PDW2000_F", "", 80000, -1, "" }, //VK 40000
			{ "hgun_P07_F", "", 35000, -1, "" }, //VK 17500
			{ "NONE", "--- APEX Waffen ---", 0, -1, "DWEV_OwnedApexDLC" },
			{ "NONE", "Mehr Waffen mit Apex!", 0, -1, "!DWEV_OwnedApexDLC" },
			{ "hgun_Pistol_01_F", "PM 9", 45000, -1, "DWEV_OwnedApexDLC" }, // Apex //VK 22500
			{ "SMG_05_F", "Protector 9mm", 50000, -1, "DWEV_OwnedApexDLC" } // Apex //VK 25000
        };
        mags[] = {
			{ "16Rnd_9x21_Mag", "", 1000, -1, "" },
			{ "30Rnd_9x21_Mag", "", 1200, -1, "" },
            { "9Rnd_45ACP_Mag", "", 1000, -1, "" },
			{ "6Rnd_GreenSignal_F", "", 1000, -1, "" },
			{ "6Rnd_RedSignal_F", "", 1000, -1, "" },
			{ "10Rnd_9x21_Mag", "", 1000, -1, "DWEV_OwnedApexDLC" }, // Apex
			{ "30Rnd_9x21_Mag_SMG_02", "", 1200, -1, "" }
        };
        accs[] = {
			{ "optic_ACO_grn_smg", "", 12000, -1, "" },
            { "optic_Holosight_smg", "", 12000, -1, "" },
			{ "optic_Yoris", "", 12000, -1, "" }
        };
    };
	
	class WSC {
        name = "Sicherheitsdienst Ausrüstung";
        side = "WSC";
        conditions = "";
        items[] = {
			{ "hgun_Pistol_heavy_01_snds_F","Taser",3000, -1, "" },
			{ "SMG_02_F", "", 40000, -1, "" }, //VK 20000
			{ "arifle_MK20C_plain_F", "", 40000, -1, "" }, //VK 20000
			{ "arifle_SDAR_F", "", 36000, -1, "" }, //VK 18000
			{ "arifle_MX_Black_F", "", 75000, -1, "" }, //VK 37500
			{ "arifle_MXC_Black_F", "", 75000, -1, "" }, //VK 37500
			{ "arifle_MXM_Black_F", "", 75000, -1, "" }, //VK 37500
			{ "srifle_EBR_F", "", 500000, 250000, "" },
			{ "srifle_DMR_03_F", "", 1000000, 500000, "" },
			{ "SmokeShellGreen", "", 5000, -1, "" }
        };
		mags[] = {
			{ "11Rnd_45ACP_Mag", "", 200, -1, "" },
			{ "30Rnd_9x21_Mag", "", 200, -1, "" },
			{ "30Rnd_556x45_Stanag", "", 250, -1, "" },
			{ "20Rnd_556x45_UW_mag", "", 250, -1, "" },
			{ "30Rnd_65x39_caseless_mag", "", 1000, -1, "" },
			{ "20Rnd_762x51_Mag", "", 25000, -1, "" }
        };
        accs[] = {
			{ "optic_MRD", "", 3000, -1, "" },
			{ "optic_Aco", "", 5000, -1, "" },
			{ "optic_Holosight", "", 5000, -1, "" },
			{ "optic_Arco", "", 8000, -1, "" },
			{ "optic_Hamr", "", 9000, -1, "" },
			{ "optic_Mrco", "", 12500, -1, "" },
			{ "optic_DMS", "", 25000, -1, "" },
			{ "optic_SOS", "", 35000, -1, "" },
			{ "acc_flashlight", "", 1000, -1, "" }
        };
    };
	
	class donator {
        name = "Premium Shop";
        side = "civ";
        conditions = "call DWEV_donator >= 1";
        items[] = {
			{ "hgun_Rook40_F", "", 25000, -1, "" }, //VK 12500
			{ "hgun_PDW2000_F", "", 70000, -1, "" }, //VK 37500
			{ "arifle_Mk20C_F", "", 160000, -1, "" }, //VK 80000
			{ "arifle_MXM_F", "", 600000, 300000, "" }			
        };
        mags[] = {
			{ "30Rnd_9x21_Mag", "", 800, -1, "" },
			{ "30Rnd_65x39_caseless_mag", "", 4000, -1, "" },
			{ "30Rnd_556x45_Stanag", "", 1000, -1, "" }
        };
        accs[] = {
			{ "optic_ACO_grn_smg", "", 20000, -1, "" },
			{ "optic_Holosight_smg", "", 20000, -1, "" },
			{ "optic_Arco", "", 32000, -1, "" },
        };
    };
	
	class Weaponfree {
        name = "Event Weapon free";
        side = "";
        conditions = "(playerSide isEqualTo west) || lc_gun || lc_rebel";
        items[] = {
			{ "hgun_Pistol_heavy_01_snds_F", "Taser", 3000, -1, "(call DWEV_coplevel >= 1)" },
			{ "hgun_Pistol_Signal_F","Signal Pistole",5000, -1, "(call DWEV_coplevel >= 5) || (playerSide isEqualTo civilian)" }, //VK 2500
        };
        mags[] = {
			{ "11Rnd_45ACP_Mag", "", 200, -1, "(call DWEV_coplevel >= 1)" },
			{ "6Rnd_GreenSignal_F", "", 500, -1, "(call DWEV_coplevel >= 5) || (playerSide isEqualTo civilian)" },
			{ "6Rnd_RedSignal_F", "", 500, -1, "(call DWEV_coplevel >= 5) || (playerSide isEqualTo civilian)" },
        };
        accs[] = {
        };
    };

    class rebel {
        name = "Mohammeds Rebellenausrüstung";
        side = "civ";
        conditions = "lc_rebel";
        items[] = {
			{ "SmokeShellGreen", "", 5000, -1, "" },
			{ "hgun_Rook40_F", "", 30000, -1, "" }, //VK 15000
			{ "arifle_SDAR_F", "", 72000, -1, "" }, //VK 36000
			{ "SMG_02_F", "", 80000, -1, "" }, //VK 40000
			{ "arifle_TRG20_F", "", 90000, -1, "" }, //VK 45000
			{ "arifle_TRG21_F", "", 90000, -1, "" }, //VK 45000
			{ "SMG_01_F", "", 90000, -1, "" }, //VK 45000
			{ "arifle_Katiba_F", "", 120000, -1, "" }, //VK 60000
			{ "arifle_MX_F", "", 150000, -1, "" }, //VK 75000
			{ "arifle_MXC_F", "", 150000, -1, "" }, //VK 75000
			{ "srifle_DMR_01_F", "", 1000000, 500000, "" },
			{ "srifle_EBR_F", "", 1000000, 500000, "" },
			{ "srifle_DMR_03_khaki_F", "", 2000000, 1000000, "" },
			{ "srifle_DMR_03_tan_F", "", 2000000, 1000000, "" },
			{ "srifle_DMR_03_multicam_F", "", 2000000, 1000000, "" },
			{ "srifle_DMR_03_woodland_F", "", 2000000, 1000000, "" },
			{ "NONE", "--- APEX Waffen ---", 0, -1, "DWEV_OwnedApexDLC" },
			{ "NONE", "Mehr Waffen mit Apex!", 0, -1, "!DWEV_OwnedApexDLC" },
			{ "SMG_05_F", "", 45000, -1, "DWEV_OwnedApexDLC" }, //Apex //VK 22500
			{ "arifle_CTAR_hex_F", "", 160000, -1, "DWEV_OwnedApexDLC" }, //Apex //VK 80000
			{ "arifle_CTAR_ghex_F", "", 160000, -1, "DWEV_OwnedApexDLC" }, //Apex //VK 80000
			{ "arifle_ARX_ghex_F", "", 300000, 150000, "DWEV_OwnedApexDLC" }, //Apex
			{ "arifle_ARX_hex_F", "", 300000, 150000, "DWEV_OwnedApexDLC" }, //Apex
			{ "arifle_AKS_F", "", 200000, 100000, "DWEV_OwnedApexDLC" }, //Apex
			{ "arifle_SPAR_01_khk_F", "", 150000, -1, "DWEV_OwnedApexDLC" }, //Apex //VK 75000
			{ "arifle_SPAR_01_snd_F", "", 150000, -1, "DWEV_OwnedApexDLC" }, //Apex //VK 75000
			{ "arifle_SPAR_03_khk_F", "", 1500000, 750000, "DWEV_OwnedApexDLC" }, //Apex
			{ "arifle_SPAR_03_snd_F", "", 1500000, 750000, "DWEV_OwnedApexDLC" }, //Apex
			{ "arifle_AKM_F", "", 1900000, 950000, "DWEV_OwnedApexDLC" } //Apex
        };
        mags[] = {
			{ "16Rnd_9x21_Mag", "", 400, -1, "" },
			{ "20Rnd_556x45_UW_mag", "", 250, -1, "" },
			{ "30Rnd_556x45_Stanag", "", 500, -1, "" },
			{ "30Rnd_9x21_Mag_SMG_02", "", 500, -1, "" },
			{ "30Rnd_9x21_Mag", "", 400, -1, "" },
			{ "30Rnd_45ACP_Mag_SMG_01", "", 500, -1, "" },
			{ "30Rnd_65x39_caseless_green", "", 1000, -1, "" },
			{ "30Rnd_65x39_caseless_mag", "", 2000, -1, "" },
			{ "10Rnd_762x54_Mag", "", 50000, -1, "" },
			{ "20Rnd_762x51_Mag", "", 50000, -1, "" },		
			{ "30Rnd_580x42_Mag_F", "", 1000, -1, "DWEV_OwnedApexDLC" }, //Apex
			{ "30Rnd_545x39_Mag_F", "", 2000, -1, "DWEV_OwnedApexDLC" }, //Apex
			{ "30Rnd_762x39_Mag_F", "", 60000, -1, "DWEV_OwnedApexDLC" } //Apex
        };
        accs[] = {
			{ "optic_ACO_grn", "", 8000, -1, "" },
			{ "optic_ACO_grn_smg", "", 8000, -1, "" },
			{ "optic_Holosight", "", 10000, -1, "" },
			{ "acc_flashlight", "", 2000, -1, "" },
			{ "optic_Hamr", "", 18000, -1, "" },
			{ "optic_Mrco", "", 25000, -1, "" },
			{ "optic_DMS", "", 50000, -1, "" },
			{ "optic_SOS", "", 70000, -1, "" },
			{ "optic_Aco", "", 10000, -1, "" },
			{ "optic_Arco", "", 16000, -1, "" },
			{ "optic_Holosight_smg", "", 10000, -1, "" },
			{ "optic_ERCO_khk_F","",25000, -1, "DWEV_OwnedApexDLC" }, //Apex
			{ "optic_ERCO_snd_F","",25000, -1, "DWEV_OwnedApexDLC" } //Apex
        };
    };
};
