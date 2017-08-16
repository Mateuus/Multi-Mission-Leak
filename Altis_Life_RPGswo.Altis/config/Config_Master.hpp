/*
    Master-Einstellungen für verschiedene Funktionen und Funktionalität
*/
class DWEV_Settings
{
	/* Player Data Saving */
	save_virtualItems = true; //Save Virtual items all sides
	saved_virtualItems_civ[] = { "kopflampe", "titan", "muell", "gussform", "farbeblau", "stoff", "verband", "traubenzucker", "kraftriegel", "redshot", "shovel", "beer", "wp_zimt", "wp_curry", "wp_pfeffer", "wp_salt", "wp_diamond", "wp_silberbar", "wp_goldberuf", "wp_copper", "wp_iron", "wp_glass", "wp_oil", "reifen", "kokosbananamilk", "schoko", "magmap", "kohlep", "platinp", "lehmp", "tropenholzp", "tabakp", "kautschukp", "zuckerrohrp", "kakaop", "platin", "salatp", "salatb", "curry", "curryp", "zimt", "zimtp", "sechouse", "kokos", "kokosp", "banana", "bananap", "melon", "melonp", "lehm", "kautschuk", "tropenholz", "kakao", "tabak", "magma", "schlafmohn", "zuckerrohr", "kohle", "apfelsaft", "pfirsichsaft", "golderz", "goldberuf", "silbererz", "silberbar", "ring", "pilzsuppe", "pilz", "pfeffer", "pfefferp", "grapes", "vodka", "schnuller", "muschel", "perlen", "perlenk", "kartoffel", "kartoffelp", "pommes", "salat", "storagebig", "storagesmall", "cement", "rock", "diamondc", "diamond", "peach", "redgull", "tbacon", "glass", "salt_r","salt","sand","copper_r","iron_r","ironore","copperore","pickaxe","fuelE","fuelF","coffee","donuts","water","fishingpoles","catshark","mullet","tuna","mackerel","ornate","salema","rabbit","apple","oilp","oilu" }; //Array of virtual items that can be saved on Zivilist
	saved_virtualItems_other[] = { "donuts","coffee","redgull", "spikeStrip", "schnuller", "fuelF","fuelE","defusekit","water","tbacon","kidney","pille","kopflampe","defibrillator" }; //Array of virtual items that can be saved on polizei,feuerwehr und sicherheitsdienst
	save_weapons = true; //Allow civilians to save weapons on them?
	
	/* Medical System Configurations */
    revive_fee = 1500; //Revive fee that players have to pay and medics only EMS(independent) are rewarded with this amount.
    hospital_heal_fee = 100; //Fee to heal at a hospital NPC //KaiSandmann noch einbauen
	
	/* Jail System Configurations */
	jail_seize_vItems[] = { "anakondastreckv","krokostreckv","kriegsschrottstreckv","schlafmohnstreckv","reliktestreckv","krokov","reliktev","schlafmohnv","anakondav","kriegsschrottv","hammer","lockpick","uranium1","uranium2","uranium3","uranium4","uranium5","pille","ipuranium","zauberpilzge","zauberpilz","zaupilz","methge","meth","methpla","methst","dmtge","dmt","bufo","kroete","ksuppe","schenkel","moonshine","turtle","nitrov2","nitro","chemikalie","kevlar","ozelotpelz","schwarzmarktoel","goldbar","handschellen","spikeStrip","kidney","boltcutter","blastingcharge","skalpell","alarmanlage","cocainege","cocainep","cocaine","joint","marijuanage","marijuana","cannabis","heroinsp","heroinge","fahrsperre","heroinp","heroinu" }; //Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.

	
    /* Basis System Einstellungen */
    respawn_timer = 5; // Zeit zum Respawnen in Sekunden   Mindestens 5 Sekunden.
	respawn_wait = 7; // Zeit zum Respawnen, wenn man die Feuerwehr gerufen hat in Minuten

    /* Clothing System Configurations */
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_oli", "G_Balaclava_lowprofile", "G_Bandanna_blk", "G_Bandanna_tan", "G_Bandanna_oli", "G_Bandanna_beast", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_aviator", "G_Balaclava_combat", "U_I_GhillieSuit", "U_O_GhillieSuit", "U_B_T_Sniper_F", "U_O_T_Sniper_F", "G_Sport_Blackred" };

	/* Escape Menu Configuration */
    escapeMenu_timer = 35; //Time required to pass before you can click the abort button in the escape menu.

    /* Vehicle System Configurations */
    chopShop_vehicles[] = { "Car", "Truck", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
    vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F","C_Kart_01_Blu_F","C_Kart_01_Red_F","C_Kart_01_Fuel_F","C_Kart_01_Vrana_F","C_Kart_01_F","C_Kart_01_green_F","C_Kart_01_orange_F","C_Kart_01_white_F","C_Kart_01_yellow_F","C_Kart_01_black_F" }; //Vehicles that can only be rented and not purchased. (Last only for the session)

    /* Vehicle Purchase Prices */
    vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_COP = .5; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_MEDIC = .5; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_OPFOR = .5; // -- NOT IN USE -- Simply left in for east support.

    /* Vehicle Rental Prices */
    vehicle_rental_multiplier_CIVILIAN = .5; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_COP = .5; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_MEDIC = .5; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_OPFOR = .5; // -- NOT IN USE -- Simply left in for east support.

    /* Vehicle Sell Prices */
    vehicle_sell_multiplier_CIVILIAN = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_COP = .5; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_MEDIC = .5; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_OPFOR = .5; // -- NOT IN USE -- Simply left in for east support.

    /* "Other" Vehicle Prices */
    vehicle_chopShop_multiplier = .35; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
    vehicle_cop_impound_multiplier = .1; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
	vehicle_verwahrstelle_multiplier = .3; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier 	Wert zum auslösen aus der verahrstelle
	vehicle_schrottplatz_multiplier = .5; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier 	Wert zum zurückkaufen vom schrottplatz
	
	/* Clothing System Configurations */
	clothing_noTP = false;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)

	animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" };
    disableCommanderView = true; //false - Group leaders can access the commander view. true [default] - Group leaders cannot access the commander view.
                                 //Commander/tactical view is accessed via pressing . [NUM] by default. It raises the camera significantly higher and steeper above the player in order to give a boarder tactical view of the surrounding area.
	
	ApexItemList[] = 	{
						// Kleidung
						"U_C_Man_casual_5_F","U_C_Man_casual_6_F","U_C_man_sport_2_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F","U_C_man_sport_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_1_F","U_C_man_sport_3_F","U_C_Man_casual_1_F","U_C_Man_casual_2_F","U_C_Man_casual_4_F",
						// Kopfbedeckung Zivilist
						"H_Cap_oli_Syndikat_F","H_Cap_blk_Syndikat_F","H_Booniehat_tna_F","H_Helmet_Skate","H_Cap_tan_Syndikat_F","H_Cap_grn_Syndikat_F",
						// Kleidung Rebellen
						"U_B_T_Soldier_AR_F","U_B_T_Soldier_SL_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_3_F","U_O_V_Soldier_Viper_hex_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_GEN_Soldier_F","U_B_T_Sniper_F","U_O_T_Sniper_F","U_O_T_Sniper_F","U_B_T_Soldier_F","U_B_CTRG_Soldier_F","U_B_GEN_Commander_F","U_O_T_Soldier_F","U_O_V_Soldier_Viper_F","U_I_C_Soldier_Camo_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_3_F","U_B_CTRG_Soldier_urb_2_F","U_O_T_Officer_F","U_B_T_FullGhillie_tna_F",
						//Kopfbedeckung Rebellen
						"H_HelmetB_TI_tna_F","H_HelmetCrew_O_ghex_F","H_MilCap_ghex_F","H_MilCap_tna_F","H_Cap_tan_Syndikat_F","H_HelmetB_Light_tna_F","H_HelmetB_tna_F","H_HelmetO_ghex_F",
						// Rucksäche
						"B_FieldPack_ghex_F","B_AssaultPack_tna_F","B_Carryall_ghex_F","B_ViperLightHarness_khk_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_oli_F","B_ViperLightHarness_ghex_F","B_ViperHarness_oli_F","B_ViperHarness_khk_F","B_ViperHarness_ghex_F","B_ViperHarness_blk_F","B_ViperHarness_hex_F","B_Bergen_dgtl_F",
						// Westen
						"V_BandollierB_ghex_F","V_HarnessO_ghex_F","V_HarnessOGL_ghex_F","V_TacChestrig_cbr_F","V_TacChestrig_oli_F","V_TacChestrig_grn_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F",
						//Sonstiges
						"O_NVGoggles_urb_F","NVGoggles_tna_F","O_NVGoggles_ghex_F","O_NVGoggles_hex_F",
						//Waffen
						"SMG_05_F","hgun_Pistol_01_F","arifle_CTAR_blk_F","arifle_SPAR_01_blk_F","arifle_CTAR_hex_F","arifle_CTAR_ghex_F","arifle_ARX_ghex_F","arifle_ARX_hex_F","arifle_AKS_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_AKM_F",
						//Magazine
						"10Rnd_9x21_Mag","30Rnd_580x42_Mag_F","30Rnd_545x39_Mag_F","30Rnd_762x39_Mag_F",
						//aufsätze
						"optic_ERCO_blk_F","muzzle_snds_65_TI_blk_F","muzzle_snds_58_blk_F","optic_AMS","optic_ERCO_khk_F","optic_ERCO_snd_F"
						};
					 
	VIPItemList_LvL_1[] = 	{
							// Brillen Level 1
							"G_Shades_Blue","G_Sport_Blackred","G_Sport_Checkered","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Greenblack",
							// Zivilisten Kopfbedeckung Level 1
							"H_Cap_grn","H_Cap_grn_BI","H_Cap_blk_Raven","H_Cap_blk_ION","H_Cap_oli_hs","H_Cap_press","H_Cap_usblack","H_Cap_surfer","H_Cap_marshal","H_Hat_blue","H_Hat_camo","H_Hat_grey","H_Hat_checker","H_Hat_tan","H_Cap_oli_Syndikat_F","H_Cap_blk_Syndikat_F"
							};
					 
	VIPItemList_LvL_2[] =	{
							// Brillen Level 2
							"G_Shades_Green","G_Shades_Red","G_Sport_Red","G_Lady_Mirror","G_Lady_Dark","G_Lady_Blue","G_Aviator","G_Lowprofile",
							// Zivilisten Kopfbedeckung Level 2
							"H_StrawHat","H_TurbanO_blk","H_StrawHat_dark","H_Bandanna_blu","H_Bandanna_camo","H_Bandanna_mcamo","H_Bandanna_surfer","H_Bandanna_surfer_grn","H_Bandanna_surfer_blk","H_Bandanna_khk_hs","H_Bandanna_sand","H_Booniehat_oli","H_Booniehat_indp","H_Booniehat_mcamo","H_Booniehat_grn","H_Booniehat_tan","H_Booniehat_dirty","H_Booniehat_dgtl","H_Booniehat_khk","H_Booniehat_khk_hs","H_Booniehat_tna_F","H_Helmet_Skate",
							// Rucksäcke Level 2
							"B_ViperLightHarness_khk_F","B_ViperLightHarness_blk_F","B_ViperLightHarness_hex_F","B_ViperLightHarness_oli_F","B_ViperLightHarness_ghex_F"
							};
	
	VIPItemList_LvL_3[] = 	{
							// Rebellen Kopfbedeckung Level 3
							"H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_HelmetB_paint","H_HelmetB_plain_blk","H_Helmet_Kerry","H_HelmetB_plain_mcamo","H_HelmetB_sand","H_HelmetB_snakeskin","H_Cap_headphones","H_Cap_brn_SPECOPS","H_Cap_tan_specops_US","H_Cap_khaki_specops_UK","H_Cap_blk_CMMG",
							// Zivilisten Kleidung Level 3
							"U_C_HunterBody_grn","U_BG_Guerilla1_1","U_BG_Guerilla2_3","U_BG_Guerilla3_1","U_BG_Guerilla3_2","U_C_Man_casual_5_F","U_C_Man_casual_6_F","U_C_man_sport_2_F","U_I_C_Soldier_Bandit_4_F","U_I_C_Soldier_Bandit_5_F",
							// Brillen Level 3
							"G_Spectacles","G_Spectacles_Tinted","G_Tactical_Black","G_Tactical_Clear","G_Bandanna_tan","G_Bandanna_oli",
							// Rucksäcke Level 3
							"B_ViperHarness_oli_F","B_ViperHarness_khk_F","B_ViperHarness_ghex_F","B_ViperHarness_blk_F","B_ViperHarness_hex_F"
							};
	
	VIPItemList_LvL_4[] =	{
							// Rebellen Kleidung Level 4
							"U_O_Wetsuit","U_I_Wetsuit","U_I_OfficerUniform","U_I_CombatUniform","U_I_CombatUniform_shortsleeve","U_O_CombatUniform_ocamo","U_B_T_Soldier_AR_F","U_B_T_Soldier_SL_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_3_F","U_O_V_Soldier_Viper_hex_F","U_I_C_Soldier_Para_1_F","U_I_C_Soldier_Para_4_F","U_I_C_Soldier_Para_5_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_GEN_Soldier_F",
							// Rucksäcke Level 4
							"B_AssaultPack_khk","B_AssaultPack_dgtl","B_AssaultPack_rgr","B_AssaultPack_sgg","B_AssaultPack_mcamo","B_AssaultPack_ocamo","B_AssaultPack_cbr","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_AssaultPack_tna_F"
							};
					 
	VIPItemList_LvL_5[] =	{
							// Zivilisten Kleidung Level 5
							"U_OrestesBody","U_C_WorkerCoveralls","U_Marshal","U_C_Journalist","U_NikosBody","U_C_man_sport_1_F","U_I_C_Soldier_Bandit_2_F","U_I_C_Soldier_Bandit_3_F",
							// Rebellen Kleidung Level 5
							"U_O_GhillieSuit","U_O_FullGhillie_ard","U_O_FullGhillie_lsh","U_O_FullGhillie_sard","U_B_T_Sniper_F","U_O_T_Sniper_F","U_O_T_Sniper_F",
							// Rebellen Kopfbedeckung Level 5
							"H_HelmetIA_net","H_HelmetIA_camo","H_Shemag_khk","H_Shemag_olive","H_Shemag_olive_hs","H_Shemag_tan","H_ShemagOpen_khk","H_Watchcap_blk","H_Watchcap_khk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_sgg","H_MilCap_mcamo","H_MilCap_oucamo","H_MilCap_rucamo","H_MilCap_gry","H_MilCap_ocamo","H_MilCap_dgtl","H_Beret_blk","H_Beret_red","H_Beret_grn","H_Beret_grn_SF","H_Beret_brn_SF","H_Beret_ocamo","H_HelmetO_oucamo","H_HelmetSpecB_blk","H_HelmetSpecB_paint1","H_HelmetSpecB_paint2","H_HelmetSpecO_ocamo","H_HelmetB_TI_tna_F","H_HelmetCrew_O_ghex_F",
							// Brillen Level 5
							"G_Bandanna_beast","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_aviator","G_Balaclava_oli","G_Balaclava_lowprofile",
							// Rucksäcke Level 5
							"B_Bergen_sgg","B_Bergen_mcamo","B_Bergen_rgr","B_Bergen_blk","B_Carryall_ocamo","B_Carryall_oucamo","B_Carryall_mcamo","B_Carryall_ghex_F"
							};

};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"