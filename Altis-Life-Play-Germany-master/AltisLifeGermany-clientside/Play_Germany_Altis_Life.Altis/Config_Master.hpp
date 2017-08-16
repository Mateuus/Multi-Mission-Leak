#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};

#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"
#include "Config_Shops.hpp"


/*
	Master settings for various features and functionality
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 10000; //Revive fee that players have to pay and medics / EMS are rewarded

	/* House related settings */
	house_limit = 5; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes

	/* Impound Variables */
	impound_car = 10000; //Price for impounding cars
	impound_boat = 5000; //Price for impounding boats
	impound_air = 15000; //Price for impounding helicopters / planes

	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"};
	vehicleShop_goalRentalOnly[] = { "B_MRAP_01_F","O_MRAP_02_F"};
	vehicleShop_donColorOnly[] = { ""};

	PG_cargoContainers[] = {"Box_IND_AmmoVeh_F", "B_Slingload_01_Cargo_F","B_Slingload_01_Repair_F","Land_Wreck_Traw_F","Land_Wreck_Traw2_F"};
	PG_rentCargoOnly = true;

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	crimes[] = {
		{"STR_Crime_1","2500","1"}, //fahren ohne licht
		{"STR_Crime_2","10000","2"}, //fahren ohne führerschein pkw
		{"STR_Crime_3","50000","3"}, //fahren ohne führerschein lkw
		{"STR_Crime_4","25000","4"},  //unfall verursacht
		{"STR_Crime_5","20000","5"}, //gestohlenes fahrzeug
		{"STR_Crime_6","50000","6"}, //fahrerflucht
		{"STR_Crime_7","500000","7"}, //Fahren unter Alkohol / Drogen
		{"STR_Crime_8","500000","8"},  //versuchter mord
		{"STR_Crime_9","1000000","9"}, // mord
		{"STR_Crime_10","200000","10"}, //anstiftung zum mord
		{"STR_Crime_11","250000","11"}, //beihilfe zum mord
		{"STR_Crime_12","100000","12"}, //fahrläßige tötung
		{"STR_Crime_13","500000","13"}, //Entführung
		{"STR_Crime_14","250000","14"}, //versuchte Entführung
		{"STR_Crime_15","200000","15"}, //diebstahl
		{"STR_Crime_16","200000","16"}, //versuchter diebstahl
		{"STR_Crime_17","500000","17"}, //bankraub
		{"STR_Crime_18","250000","18"}, //versuchter bankraub
		{"STR_Crime_19","150000","19"}, //illegales glücksspiel
		{"STR_Crime_20","750000","20"}, //rebellische übernahme
		{"STR_Crime_21","750000","21"}, //terrorismus
		{"STR_Crime_22","150000","22"}, //hausfriedensbruch
		{"STR_Crime_23","25000","23"}, //vandalismus
		{"STR_Crime_24","45000","24"}, //beschuss von personen und fahrzeugen
		{"STR_Crime_25","200000","25"}, //drohung
		{"STR_Crime_26","50000","26"}, //beamtenbeleidigung
		{"STR_Crime_27","100000","27"}, //behinderung der polizei
		{"STR_Crime_28","10000","28"}, //missachtung polizeilicher anweisung
		{"STR_Crime_29","50000","29"}, //fluchthilfe
		{"STR_Crime_30","100000","30"}, //flucht
		{"STR_Crime_31","250000","31"}, //gefängnisausbruch
		{"STR_Crime_32","125000","32"}, //beihilfe gefängnisausbruch
		{"STR_Crime_33","50000","33"}, //wiederstand gegen den staat
		{"STR_Crime_34","50000","34"}, //falschaussage
		{"STR_Crime_35","100000","35"}, //erpressung
		{"STR_Crime_36","100000","36"}, //bestechung
		{"STR_Crime_37","200000","37"}, //missbrauch des Notrufsystems
		{"STR_Crime_38","100000","38"}, //betreten der sperrzone
		{"STR_Crime_39","100000","39"}, //ausgabe als polizist
		{"STR_Crime_40","100000","40"}, //drogenbesitz
		{"STR_Crime_41","50000","41"}, //drogenkonsum
		{"STR_Crime_42","100000","42"}, //drogenhandel
		{"STR_Crime_43","50000","43"}, //leichenplündern
		{"STR_Crime_44","10000","44"}, //versuchter autodiebstal
		{"STR_Crime_45","20000","45"}, //autodiebstahl
		{"STR_Crime_46","250000","46"}, //führen eines illegalen fahrzeug
		{"STR_Crime_47","50000","47"}, //offenes waffentragen
		{"STR_Crime_48","10000","48"}, //besitz legaler waffe o. schein
		{"STR_Crime_49","100000","49"}, //besitz illegaler waffe
		{"STR_Crime_50","50000","50"}, //abfeuern einer waffe
		{"STR_Crime_51","50000","51"}, //fliegen ohne schein
		{"STR_Crime_52","10000","52"}, //fliegen ohne licht
		{"STR_Crime_53","100000","53"}, //mindestflughöhe
		{"STR_Crime_54","200000","54"}, //landen in stadt
		{"STR_Crime_55","100000","55"} //fliegen unter drogen
	};

	sellArray[] = {
		{"arifle_sdar_F", 7500},
		{"hgun_P07_snds_F", 650},
		{"hgun_P07_F", 1500},
		{"ItemGPS", 45},
		{"ToolKit", 75},
		{"FirstAidKit", 65},
		{"Medikit", 450},
		{"NVGoggles", 980},
		{"16Rnd_9x21_Mag", 15},
		{"20Rnd_556x45_UW_mag", 35},
		{"ItemMap", 35},
		{"ItemCompass", 25},
		{"Chemlight_blue", 50},
		{"Chemlight_yellow", 50},
		{"Chemlight_green", 50},
		{"Chemlight_red", 50},
		{"hgun_Rook40_F", 500},
		{"arifle_Katiba_F", 5000},
		{"30Rnd_556x45_Stanag", 65},
		{"20Rnd_762x51_Mag", 85},
		{"30Rnd_65x39_caseless_green", 50},
		{"DemoCharge_Remote_Mag", 7500},
		{"SLAMDirectionalMine_Wire_Mag", 2575},
		{"optic_ACO_grn", 250},
		{"acc_flashlight", 100},
		{"srifle_EBR_F", 15000},
		{"arifle_TRG21_F", 3500},
		{"optic_MRCO", 5000},
		{"optic_Aco", 850},
		{"arifle_MX_F", 7500},
		{"arifle_MXC_F", 5000},
		{"arifle_MXM_F", 8500},
		{"MineDetector", 500},
		{"optic_Holosight", 275},
		{"acc_pointer_IR", 175},
		{"arifle_TRG20_F", 2500},
		{"SMG_01_F", 1500},
		{"arifle_Mk20C_F", 4500},
		{"30Rnd_45ACP_Mag_SMG_01", 60},
		{"30Rnd_9x21_Mag", 30}
	};

	allowedSavedVirtualItems[] = {
	   "fuel_empty", "fuel_full", "spikeStrip", "lockpick", "defuseKit", "storageSmall", "storageBig", "tracker", "handcuffkey",
	   "pickaxe", "shovel",
	   "redgull", "coffee", "waterbottle",
	   "apple", "peach", "tbacon", "donut", "rabbit_raw", "rabbit_grilled", "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried",
	   "turtle_raw", "turtle_soup", "hen_raw", "hen_fried", "rooster_raw", "rooster_grilled", "sheep_raw", "sheep_grilled", "goat_raw", "goat_grilled",
	   "vehicleInsurance","empmodul","uwsl", "houseIDS"
	};
};

//Virtual Items
class VirtualItems {
	// do not forget to add items with sell price to life_server\Functions\DynMarket\config.sqf !

	//Misc
	VITEMMACRO(fuel_empty, "STR_Item_FuelE", "fuel_empty", 2, -1, -1, false, -1, "icons\items\fuelempty.paa")
	VITEMMACRO(fuel_full, "STR_Item_FuelF", "fuel_full", 5, 850, 500, false, -1, "icons\items\fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "icons\items\spikestrip.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 100000, 75, false, -1, "icons\items\lockpick.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldbar", 12, -1, 95000, true, -1, "icons\items\goldbar.paa")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "icons\items\blastingcharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 1500000, -1, true, -1, "icons\items\boltcutter.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\items\defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 300000, -1, false, -1, "icons\items\storagesmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 750000, -1, false, -1, "icons\items\storagebig.paa")
	VITEMMACRO(tracker, "STR_Item_Tracker", "tracker", 5, 5000, -1, true, -1, "icons\items\smartphone.paa")
	VITEMMACRO(handcuffkey, "STR_Item_Handcuffkey", "handcuffkey", 1, 10000, 8000, true, -1, "icons\items\lockpick.paa")
	VITEMMACRO(empmodul, "STR_Item_Empmodul", "empmodul", 30, 7500, 5000, false, -1, "icons\items\emp.paa")
	VITEMMACRO(vehicleInsurance, "STR_Item_VehicleInsurance", "vehicleInsurance", 5, 50000, 42000, false, -1, "icons\items\smartphone.paa")
	VITEMMACRO(uwsl, "STR_Item_Uwsl", "uwsl", 5, 10000, 5000, false, -1, "icons\items\bomb.paa")
	VITEMMACRO(houseIDS, "STR_Item_HouseIDS", "houseIDS", 20, 150000, -1, false, -1, "icons\items\smartphone.paa")

	// resource gathering system
    //NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON
    VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "icons\items\pickaxe.paa")
    VITEMMACRO(shovel, "STR_MS_Item_Shovel", "shovel", 2, 1000, 450, false, -1, "icons\items\shovel.paa")
    VITEMMACRO(ptools, "STR_MS_Item_ProspectiveTools", "ptools", 1, 900000, -1, true, -1, "icons\items\multitool.paa")
    VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oil_unprocessed", 7, -1, -1, false, -1, "icons\items\oil_unprocessed.paa")
    VITEMMACRO(oil_processed, "STR_Item_OilP", "oil_processed", 6, -1, 5692, false, -1, "icons\items\oil_processed.paa")
    VITEMMACRO(copper_ore, "STR_Item_CopperOre", "copper_ore", 4, -1, -1, false, -1, "icons\items\copper_ore.paa")
    VITEMMACRO(copper_ingot, "STR_Item_CopperIngots", "copper_ingot", 4, -1, 3500, false, -1, "icons\items\copper_ingot.paa")
    VITEMMACRO(iron_ore, "STR_Item_IronOre", "iron_ore", 5, -1, -1, false, -1, "icons\items\iron_ore.paa")
    VITEMMACRO(iron_ingot, "STR_Item_IronIngots", "iron_ingot", 2, -1, 4025, false, -1, "icons\items\iron_ingot.paa")
    VITEMMACRO(salt, "STR_Item_Salt", "salt", 3, -1, -1, false, -1, "icons\items\salt.paa")
    VITEMMACRO(salt_refined, "STR_Item_SaltR", "salt_refined", 3, -1, 3167, false, -1, "icons\items\salt_refined.paa")
    VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "icons\items\sand.paa")
    VITEMMACRO(glass, "STR_Item_Glass", "glass", 2, -1, 2910, false, -1, "icons\items\glass.paa")
    VITEMMACRO(rock, "STR_Item_Rock", "rock", 1, -1, -1, false, -1, "icons\items\rock.paa")
    VITEMMACRO(cement, "STR_Item_CementBag", "cement", 3, -1, 1950, false, -1, "icons\items\cement.paa")
	VITEMMACRO(dirt, "STR_MS_Item_Dirt", "dirt", 1, -1, -1, false, -1, "icons\items\dirt.paa")
	VITEMMACRO(platinum_ore, "STR_MS_Item_PlatinumOre", "platinum_ore", 9, -1, -1, false, -1, "icons\items\platinum_ore.paa")
    VITEMMACRO(platinum_ingot, "STR_MS_Item_PlatinumIngots", "platinum_ingot", 5, -1, 5671, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(goldnugget, "STR_MS_Item_Goldnugget", "goldnugget", 4, -1, 5671, false, -1, "icons\items\goldnugget.paa")
    VITEMMACRO(silver_ore, "STR_MS_Item_SilverOre", "silver_ore", 8, -1, -1, false, -1, "icons\items\silver_ore.paa")
    VITEMMACRO(silver_ingot, "STR_MS_Item_SilverIngots", "silver_ingot", 3, -1, 9965, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(uranium_ore, "STR_MS_Item_UraniumOre", "uranium_ore", 20, -1, -1, false, -1, "icons\items\uranium_ore.paa")
    VITEMMACRO(uranium_cleaned, "STR_MS_Item_UraniumCleaned", "uranium_cleaned", 16, -1, -1, false, -1, "icons\items\uranium_ore.paa")
    VITEMMACRO(uranium_processed, "STR_MS_Item_UraniumProcessed", "uranium_processed", 12, -1, -1, false, -1, "icons\items\uranium_ore.paa")
    VITEMMACRO(uranium_enriched, "STR_MS_Item_UraniumEnriched", "uranium_enriched", 8, -1, -1, false, -1, "icons\items\uranium_ore.paa")
    VITEMMACRO(uranium_fuelrod, "STR_MS_Item_UraniumFuelRod", "uranium_fuelrod", 8, -1, 48392, false, -1, "icons\items\uranium_fuelrod.paa")
    VITEMMACRO(uranium_dirty, "STR_MS_Item_UraniumDirty", "uranium_dirty", 4, -1, 45530, true, -1, "icons\items\uranium_ore.paa")
    VITEMMACRO(aluminium_ore, "STR_MS_Item_AluminiumOre", "aluminium_ore", 4, -1, -1, false, -1, "icons\items\aluminium_ore.paa")
    VITEMMACRO(aluminium_ingot, "STR_MS_Item_AluminiumIngots", "aluminium_ingot", 3, -1, 2304, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(coal, "STR_MS_Item_Coal", "coal", 2, -1, 1170, false, -1, "icons\items\coal.paa")
    VITEMMACRO(blackpowder, "STR_MS_Item_blackpowder", "blackpowder", 2, -1, 1760, false, -1, "icons\items\gunpowder.paa")
    VITEMMACRO(saltpetre, "STR_MS_Item_Saltpetre", "saltpetre", 4, -1, -1, false, -1, "icons\items\saltpetre.paa")
    VITEMMACRO(saltpetre_acid, "STR_MS_Item_Saltpetre_Acid", "saltpetre_acid", 4, -1, 2483, false, -1, "icons\items\acid.paa")
    VITEMMACRO(sulfur, "STR_MS_Item_Sulfur", "sulfur", 6, -1, -1, false, -1, "icons\items\sulfur.paa")
    VITEMMACRO(sulfur_acid, "STR_MS_Item_Sulfur_Acid", "sulfur_acid", 6, -1, 4592, false, -1, "icons\items\acid.paa")
    VITEMMACRO(zinc_ore, "STR_MS_Item_ZincOre", "zinc_ore", 4, -1, -1, false, -1, "icons\items\zinc_ore.paa")
    VITEMMACRO(zinc_ingot, "STR_MS_Item_ZincIngots", "zinc_ingot", 2, -1, 3150, false, -1, "icons\items\zinc_ingot.paa")
    VITEMMACRO(lead_ore, "STR_MS_Item_LeadOre", "lead_ore", 7, -1, -1, false, -1, "icons\items\lead_ore.paa")
    VITEMMACRO(lead_ingot, "STR_MS_Item_LeadIngots", "lead_ingot", 2, -1, 3894, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(tin_ore, "STR_MS_Item_TinOre", "tin_ore", 5, -1, -1, false, -1, "icons\items\tin_ore.paa")
    VITEMMACRO(tin_ingot, "STR_MS_Item_TinIngots", "tin_ingot", 2, -1, 2928, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(titanium_ore, "STR_MS_Item_TitaniumOre", "titanium_ore", 4, -1, -1, false, -1, "icons\items\tin_ore.paa")
    VITEMMACRO(titanium_ingot, "STR_MS_Item_TitaniumIngots", "titanium_ingot", 4, -1, 4200, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(molybdenum_ore, "STR_MS_Item_MolybdenumOre", "molybdenum_ore", 4, -1, -1, false, -1, "icons\items\tin_ore.paa")
    VITEMMACRO(molybdenum_ingot, "STR_MS_Item_MolybdenumIngots", "molybdenum_ingot", 4, -1, 6486, false, 1-, "icons\items\silver_ingot.paa")
    VITEMMACRO(didymium, "STR_MS_Item_Didymium", "didymium", 8, -1, 13235, false, -1, "icons\items\tin_ore.paa")
    VITEMMACRO(neodymium, "STR_MS_Item_Neodymium", "neodymium", 4, -1, 5650, false, 1-, "icons\items\neodymium.paa")
    VITEMMACRO(iridium_ore, "STR_MS_Item_IridiumOre", "iridium_ore", 20, -1, -1, false, -1, "icons\items\tin_ore.paa")
    VITEMMACRO(iridium, "STR_MS_Item_Iridium", "iridium", 8, -1, 34351, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(mercury_ore, "STR_MS_Item_MercuryOre", "mercury_ore", 7, -1, -1, false, -1, "icons\items\mercury_ore.paa")
    VITEMMACRO(mercury, "STR_MS_Item_Mercury", "mercury", 4, -1, 7918, false, -1, "icons\items\mercury.paa")
    VITEMMACRO(diamond_uncut, "STR_MS_Item_DiamondsUncut", "diamond_uncut", 15, -1, -1, false, -1, "icons\items\diamond_uncut.paa")
    VITEMMACRO(diamond_cut, "STR_MS_Item_DiamondsCut", "diamond_cut", 8, -1, 18449, false, -1, "icons\items\diamond_cut.paa")
    VITEMMACRO(ruby_uncut, "STR_MS_Item_RubiesUncut", "ruby_uncut", 8, -1, -1, false, -1, "icons\items\ruby_uncut.paa")
    VITEMMACRO(ruby_cut, "STR_MS_Item_RubiesCut", "ruby_cut", 6, -1, 10946, false, -1, "icons\items\ruby_cut.paa")
    VITEMMACRO(emerald_uncut, "STR_MS_Item_EmeraldsUncut", "emerald_uncut", 8, -1, -1, false, -1, "icons\items\emerald_uncut.paa")
    VITEMMACRO(emerald_cut, "STR_MS_Item_EmeraldsCut", "emerald_cut", 4, -1, 8296, false, -1, "icons\items\emerald_cut.paa")
    VITEMMACRO(sapphire_uncut, "STR_MS_Item_SapphiresUncut", "sapphire_uncut", 8, -1, -1, false, -1, "icons\items\sapphire_uncut.paa")
    VITEMMACRO(sapphire_cut, "STR_MS_Item_SapphiresCut", "sapphire_cut", 6, -1, 9742, false, -1, "icons\items\sapphire_cut.paa")
    VITEMMACRO(topaz_uncut, "STR_MS_Item_TopazesUncut", "topaz_uncut", 8, -1, -1, false, -1, "icons\items\topaz_uncut.paa")
    VITEMMACRO(topaz_cut, "STR_MS_Item_TopazesCut", "topaz_cut", 4, -1, 7726, false, -1, "icons\items\topaz_cut.paa")
    VITEMMACRO(garnet_uncut, "STR_MS_Item_GarnetUncut", "garnet_uncut", 8, -1, -1, false, -1, "icons\items\ruby_uncut.paa")
    VITEMMACRO(garnet_cut, "STR_MS_Item_GarnetCut", "garnet_cut", 3, -1, 5940, false, -1, "icons\items\ruby_cut.paa")
    VITEMMACRO(quartz_uncut, "STR_MS_Item_QuartzUncut", "quartz_uncut", 8, -1, -1, false, -1, "icons\items\quartz_uncut.paa")
    VITEMMACRO(quartz_cut, "STR_MS_Item_QuartzCut", "quartz_cut", 3, -1, 5970, false, -1, "icons\items\quartz_cut.paa")
    VITEMMACRO(dino, "STR_MS_Item_Dino", "dino", 18, -1, 68236, true, -1, "icons\items\dino.paa")
    VITEMMACRO(titaniumgold, "STR_MS_Item_TitaniumGold", "titaniumgold", 15, -1, 23556, false, -1, "icons\items\goldbar.paa")
    VITEMMACRO(bronze, "STR_MS_Item_Bronze", "bronze", 2, -1, 2169, false, -1, "icons\items\bronze.paa")
    VITEMMACRO(aluminiumbronze, "STR_MS_Item_AluminiumBronze", "aluminiumbronze", 4, -1, 5581, false, -1, "icons\items\bronze.paa")
    VITEMMACRO(brass, "STR_MS_Item_Brass", "brass", 3, -1, 3096, false, -1, "icons\items\goldbar.paa")
    VITEMMACRO(goldamalgam, "STR_MS_Item_Goldamalgam", "goldamalgam", 18, -1, 27864, false, -1, "icons\items\goldbar.paa")
    VITEMMACRO(ornament, "STR_MS_Item_Ornament", "ornament", 12, -1, 43311, false, -1, "icons\items\schmuck.paa")
    VITEMMACRO(magnet, "STR_MS_Item_Magnet", "magnet", 10, -1, 9231, false, -1, "icons\items\magnet.paa")
    VITEMMACRO(leadbronze, "STR_MS_Item_Leadbronze", "leadbronze", 10, -1, 14472, false, -1, "icons\items\bronze.paa")
    VITEMMACRO(whitegold, "STR_MS_Item_Whitegold", "whitegold", 20, -1, 193401, false, -1, "icons\items\silver_ingot.paa")
    VITEMMACRO(redbrass, "STR_MS_Item_Redbrass", "redbrass", 4, -1, 5871, false, -1, "icons\items\bronze.paa")

	//Drugs
	//NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroin_unprocessed", 6, -1, -1, true, -1, "icons\items\heroin_unprocessed.paa")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroin_processed", 4, -1, 15016, true, -1, "icons\items\heroin_processed.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "icons\items\cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, -1, 17075, true, -1, "icons\items\marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaine_unprocessed", 6, -1, -1, true, -1, "icons\items\cocaine_unprocessed.paa")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaine_processed", 4, -1, 11903, true, -1, "icons\items\cocaine_processed.paa")
	VITEMMACRO(frogs, "STR_Item_Frogs", "frogs", 5, -1, 803, true, -1, "icons\items\frogs.paa")
	VITEMMACRO(LSD, "STR_Item_LSD", "LSD", 3, -1, 21203, true, -1, "icons\items\LSD.paa")

	//Drink
	//NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 1200, 200, false, 100, "icons\items\redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\items\coffee.paa")
	VITEMMACRO(waterbottle, "STR_Item_WaterBottle", "waterbottle", 1, 10, 5, false, 100, "icons\items\waterbottle.paa")
	VITEMMACRO(hopfen, "STR_Item_hopfen", "hopfen", 10, 10, 5, false, 100, "icons\items\hopfen.paa")
	VITEMMACRO(bier, "STR_Item_bier", "bier", 5, -1, 5110, false, 100, "icons\items\beer.paa")
	VITEMMACRO(getreide, "STR_Item_getreide", "getreide", 5, -1, 5, false, 100, "icons\items\wheat.paa")
	VITEMMACRO(mehl, "STR_Item_mehl", "mehl", 4, -1, 2000, false, 100, "icons\items\mehl.paa")
	VITEMMACRO(rum, "STR_Item_rum", "rum", 4, -1, 4510, false, 100, "icons\items\rum.paa")
	VITEMMACRO(zucker, "STR_Item_zucker", "zucker", 4, -1, 2700, false, 100, "icons\items\sugar.paa")
	VITEMMACRO(zuckerrohr, "STR_Item_zuckerrohr", "zuckerrohr", 5, -1, 5, false, 100, "icons\items\sugarcane.paa")


	//Drink illegal
	VITEMMACRO(whiskey, "STR_Item_whiskey", "whiskey", 4, -1, 33105, true, 100, "icons\items\whiskey.paa")
	VITEMMACRO(starkbier, "STR_Item_starkbier", "starkbier", 1, -1, 31203, true, 100, "icons\items\sbeer.paa")


	//Food
   //NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 65, 50, false, 10, "icons\items\apple.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 68, 55, false, 10, "icons\items\peach.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\items\tbacon.paa")
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "icons\items\donut.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbit_raw", 2, -1, 65, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbit_grilled", 1, 150, 115, false, 20, "icons\items\cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_SalemaMeat", "salema_raw", 2, -1, 45, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salema_grilled", 1, 75, 55, false, 30, "icons\items\cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornate_raw", 2, -1, 40, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornate_grilled", 1, 175, 150, false, 25, "icons\items\cookedMeat.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerel_raw", 4, -1, 175, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerel_grilled", 2, 250, 200, false, 30, "icons\items\cookedMeat.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tuna_raw", 6, -1, 700, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tuna_grilled", 3, 1250, 1000, false, 100, "icons\items\cookedMeat.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mullet_raw", 4, -1, 250, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mullet_fried", 2, 600, 400, false, 80, "icons\items\cookedMeat.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catshark_raw", 6, -1, 300, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catshark_fried", 3, 750, 500, false, 100, "icons\items\cookedMeat.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtle_raw", 6, -1, 9620, true, -1, "icons\items\turtle.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtle_soup", 2, 2500, 5924, false, 100, "icons\items\turtle_soup.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "hen_raw", 1, -1, 35, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(hen_fried, "STR_Item_HenFried", "hen_fried", 1, 115, 85, false, 65, "icons\items\cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "rooster_raw", 1, -1, 35, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "rooster_grilled", 1, 115, 85, false, 45, "icons\items\cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheep_raw", 2, -1, 50, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheep_grilled", 2, 155, 115, false, 100, "icons\items\cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goat_raw", 2, -1, 75, false, -1, "icons\items\rawMeat.paa")
	VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goat_grilled", 2, 175, 135, false, 100, "icons\items\cookedMeat.paa")
};


/*
	Licenses

	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",2500,false,"civ")
	LICENSEMACRO(taxi,"STR_License_Taxi","taxi",2500,false,"civ")
	LICENSEMACRO(twitch,"STR_License_Twitch","twitch",2500,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",5000,false,"civ")
	LICENSEMACRO(cargo,"STR_License_Cargo","cargo",100000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",160000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",35000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(coastguard,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",1800000,true,"civ")
	LICENSEMACRO(bm,"STR_License_bm","bm",7000000,false,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",35000,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",3500000,false,"civ")
	LICENSEMACRO(donator,"STR_License_Donator","donator",-1,false,"civ")
	LICENSEMACRO(sek,"STR_License_SEK","sek",-1,false,"cop")
	LICENSEMACRO(kripo,"STR_License_Kripo","kripo",-1,false,"cop")
	LICENSEMACRO(press,"STR_License_press","press",-1,false,"civ")
	LICENSEMACRO(hunting,"STR_License_hunting","hunting",10000,false,"civ")

	//CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
	LICENSEMACRO(process_oil,"STR_License_Process_Oil","process_oil",35000,false,"civ")
	LICENSEMACRO(process_sand,"STR_License_Process_Sand","process_sand",14500,false,"civ")
	LICENSEMACRO(process_salt,"STR_License_Process_Salt","process_salt",12000,false,"civ")
	LICENSEMACRO(process_cement,"STR_License_Process_Cement","process_cement",6500,false,"civ")
	LICENSEMACRO(process_bier,"STR_License_Process_bier","process_bier",49000,false,"civ")
	LICENSEMACRO(process_starkbier,"STR_License_Process_starkbier","process_starkbier",12000,true,"civ")
	LICENSEMACRO(process_mehl,"STR_License_Process_mehl","process_mehl",12000,false,"civ")
	LICENSEMACRO(process_rum,"STR_License_Process_rum","process_rum",12000,false,"civ")
	LICENSEMACRO(process_whiskey,"STR_License_Process_whiskey","process_whiskey",12000,true,"civ")
	LICENSEMACRO(process_zucker,"STR_License_Process_zucker","process_zucker",12000,false,"civ")
	LICENSEMACRO(process_zuckerrohr,"STR_License_Process_zuckerrohr","process_zuckerrohr",12000,false,"civ")




	LICENSEMACRO(process_heroin,"STR_License_Process_Heroin","process_heroin",90000,true,"civ")
	LICENSEMACRO(process_marijuana,"STR_License_Process_Marijuana","process_marijuana",45000,true,"civ")
	LICENSEMACRO(process_medmarijuana,"STR_License_Process_Medmarijuana","process_medmarijuana",15000,false,"civ")
	LICENSEMACRO(process_cocaine,"STR_License_Process_Cocaine","process_cocaine",75000,true,"civ")
	LICENSEMACRO(process_LSD,"STR_License_Process_LSD","process_LSD",120000,true,"civ")



	LICENSEMACRO(process_copper,"STR_License_Process_Copper","process_copper",8000,false,"civ")
	LICENSEMACRO(process_iron,"STR_License_Process_Iron","process_iron",9500,false,"civ")
	LICENSEMACRO(process_tin,"STR_License_Process_Tin","process_tin",10000,false,"civ")
	LICENSEMACRO(process_aluminium,"STR_License_Process_Aluminium","process_aluminium",10000,false,"civ")
	LICENSEMACRO(process_lead,"STR_License_Process_Lead","process_lead",10000,false,"civ")
	LICENSEMACRO(process_silver,"STR_License_Process_Silver","process_silver",10000,false,"civ")
	LICENSEMACRO(process_platinum,"STR_License_Process_Platinum","process_platinum",10000,false,"civ")
	LICENSEMACRO(process_titanium,"STR_License_Process_Titanium","process_titanium",10000,false,"civ")
	LICENSEMACRO(process_molybdenum,"STR_License_Process_Molybdenum","process_molybdenum",10000,false,"civ")
	LICENSEMACRO(process_zinc,"STR_License_Process_Zinc","process_zinc",10000,false,"civ")
	LICENSEMACRO(process_mercury,"STR_License_Process_Mercury","process_mercury",10000,false,"civ")
	LICENSEMACRO(process_iridium,"STR_License_Process_Iridium","process_iridium",10000,false,"civ")

	LICENSEMACRO(process_topaz,"STR_License_Process_Topaz","process_topaz",10000,false,"civ")
	LICENSEMACRO(process_ruby,"STR_License_Process_Ruby","process_ruby",10000,false,"civ")
	LICENSEMACRO(process_sapphire,"STR_License_Process_Sapphire","process_sapphire",10000,false,"civ")
	LICENSEMACRO(process_diamond,"STR_License_Process_Diamond","process_diamond",35000,false,"civ")
	LICENSEMACRO(process_emerald,"STR_License_Process_Emerald","process_emerald",10000,false,"civ")
	LICENSEMACRO(process_quartz,"STR_License_Process_Quartz","process_quartz",10000,false,"civ")
	LICENSEMACRO(process_garnet,"STR_License_Process_Garnet","process_garnet",10000,false,"civ")

	LICENSEMACRO(process_salpetre,"STR_License_Process_Salpetre","process_salpetre",10000,false,"civ")
	LICENSEMACRO(process_sulfur,"STR_License_Process_Sulfur","process_sulfur",10000,false,"civ")
	LICENSEMACRO(process_blackpowder,"STR_License_Process_blackpowder","process_blackpowder",10000,false,"civ")

	LICENSEMACRO(process_neodymium,"STR_License_Process_Neodymium","process_neodymium",10000,false,"civ")

	LICENSEMACRO(process_uranium_cleaned,"STR_License_Process_Uranium_Cleaned","process_uranium_cleaned",5000,true,"civ")
	LICENSEMACRO(process_uranium_processed,"STR_License_Process_Uranium_Processed","process_uranium_processed",10000,true,"civ")
	LICENSEMACRO(process_uranium_enriched,"STR_License_Process_Uranium_Enriched","process_uranium_enriched",30000,true,"civ")
	LICENSEMACRO(process_uranium_fuelrod,"STR_License_Process_Uranium_Fuelrod","process_uranium_fuelrod",150000,true,"civ")
	LICENSEMACRO(process_uranium_dirty,"STR_License_Process_Uranium_Dirty","process_uranium_dirty",200000,true,"civ")

	LICENSEMACRO(process_titaniumgold,"STR_License_Process_Titaniumgold","process_titaniumgold",350000,false,"civ")
	LICENSEMACRO(process_bronze,"STR_License_Process_Bronze","process_bronze",15000,false,"civ")
	LICENSEMACRO(process_aluminiumbronze,"STR_License_Process_Aluminiumbronze","process_aluminiumbronze",30000,false,"civ")
	LICENSEMACRO(process_brass,"STR_License_Process_Brass","process_brass",20000,false,"civ")
	LICENSEMACRO(process_goldamalgam,"STR_License_Process_Goldamalgam","process_goldamalgam",400000,false,"civ")
	LICENSEMACRO(process_ornament,"STR_License_Process_Ornament","process_ornament",90000,false,"civ")
	LICENSEMACRO(process_magnet,"STR_License_Process_Magnet","process_magnet",65000,false,"civ")
	LICENSEMACRO(process_leadbronze,"STR_License_Process_Leadbronze","process_leadbronze",75000,false,"civ")
	LICENSEMACRO(process_whitegold,"STR_License_Process_Whitegold","process_whitegold",500000,false,"civ")
	LICENSEMACRO(process_redbrass,"STR_License_Process_Redbrass","process_redbrass",80000,false,"civ")
};

class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterbottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "handcuffkey", "fuel_full", "peach", "boltcutter", "pickaxe", "shovel", "ptools", "vehicleInsurance", "uwsl", "rabbit_grilled", "hen_fried", "rooster_grilled", "sheep_grilled", "goat_grilled" };
	};

	class house {
		name = "STR_Shops_House";
		items[] = { "storagesmall", "storagebig", "houseIDS" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterbottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick","handcuffkey", "pickaxe", "shovel", "fuel_full", "peach", "boltcutter", "blastingcharge" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterbottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "handcuffkey","pickaxe", "fuel_full", "peach", "boltcutter", "blastingcharge" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donut" };
	};

	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "marijuana","LSD" };
	};

	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuel_full", "saltpetre_acid", "sulfur_acid", "mercury", "neodymium", "coal", "blackpowder" };
	};

	class uranium {
		name = "STR_Shops_Uranium";
		items[] = { "uranium_fuelrod"};
	};

	class uraniumil {
		name = "STR_Shops_Uranium";
		items[] = { "uranium_dirty" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_ingot", "copper_ingot", "tin_ingot", "aluminium_ingot", "lead_ingot", "silver_ingot", "platinum_ingot", "titanium_ingot", "molybdenum_ingot", "zinc_ingot", "iridium", "didymium"};
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut", "topaz_uncut", "topaz_cut", "ruby_uncut", "ruby_cut", "sapphire_uncut", "sapphire_cut", "emerald_uncut", "emerald_cut", "quartz_uncut", "quartz_cut", "garnet_uncut", "garnet_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cop {
		name = "STR_Shops_Cop";
		items[] = { "donut", "coffee", "spikeStrip", "waterbottle", "rabbit_grilled", "apple", "redgull", "fuel_full", "defusekit", "tracker", "empmodul" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class herbertderhaendler {
		name = "STR_Shops_herbertderhaendler";
		items[] = { "starkbier","whiskey" };
	};

	class getraenkemarkt {
		name = "STR_Shops_getraenkemarkt";
		items[] = { "bier", "rum","waterbottle","redgull" };
	};

	class baecker {
		name = "STR_Shops_baecker";
		items[] = { "mehl","zucker" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar", "goldnugget", "dino" };
	};

	class gold_legal {
		name = "STR_Shops_Gold";
		items[] = { "goldnugget"};
	};

	class gold_illegal {
		name = "STR_Shops_Gold";
		items[] = { "goldbar","dino"};
	};

	class alloy {
		name = "STR_Shops_Asf";
		items[] = { "titaniumgold", "bronze", "aluminiumbronze", "brass", "goldamalgam", "ornament", "magnet", "leadbronze", "whitegold", "redbrass" };
	};

	class evidence {
		name = "STR_Shops_Evidence";
		items[] = { "cocaine_unprocessed","cocaine_processed","heroin_unprocessed","heroin_processed","cannabis","marijuana","turtle_raw","goldbar","blastingcharge","boltcutter","uranium_ore","uranium_cleaned","uranium_processed","uranium_enriched","uranium_fuelrod","uranium_dirty", "whiskey","starkbier","LSD","frogs" };
	};

	class medic {
		name = "STR_Shops_Medic";
		items[] = { "waterbottle", "rabbit_grilled", "donut", "coffee", "apple", "redgull", "tbacon", "fuel_full", "peach" };
	};

	class asf {
		name = "STR_Shops_Asf";
		items[] = { "donut", "coffee", "waterbottle", "rabbit_grilled", "apple", "redgull", "fuel_full", "tracker" };
	};
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"
