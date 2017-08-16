#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
/* Logging and Security Settings*/
    /* Security Settings */
    spyGlass_toggle = false; //Spyglass On/Off Toggle --> True = On & False = Off

    /* Data Logging Settings */
    battlEye_friendlyLogging = true; //False [default] - Read the logs from the server.rpt. True - Read the logs from the publicVariable.log. NOTE: Due to how diag_log works it will log to both files either way and the setting is merely for beautification purposes.
    player_advancedLog = true; //False [default] - No advanced logging. True - Logs house purchase and sale, vehicle purchase, sale, and chop shopping, police arrests, and gang creations. Search for: advanced_log
    player_moneyLog = true; //False [default] - No money logging. True - Logs player bank deposits, withdraws, and transfers, gang bank deposits and withdraws, money picked up off of the ground, and player robbery. Search for: money_log
    player_deathLog = true; //False [default] - No death logging. True - Logs victim and killer, and vehicle or weapon if used, when a player dies. Search for: death_log

/* Database Related Settings */ 
    /* Player Data Saving */
    save_virtualItems = true; //Save Virtual items (all sides)?
    saved_virtualItems[] = { 
        "pickaxe",
        "fuelEmpty",
        "fuelFull", 
        "spikeStrip", 
        "lockpick", 
        "defuseKit",
        "storageSmall",
        "storageBig",
        "redgull",
        "coffee",
        "waterBottle",
        "apple",
        "peach",
        "tbacon",
        "donuts",
        "rabbit",
        "salema",
        "ornate",
        "mackerel",
        "tuna",
        "mullet",
        "catshark",
        "turtle_soup",
        "hen",
        "rooster",
        "sheep",
        "goat",
        "defibrillator",
        "boltcutter",
        "toolkit",
        "ziptie",
		"shovel",
        "wood",
        "woodp",
        "panicbutton"
    }; 
    save_playerStats = false; //Save food, water and damage (all sides)?
    save_civilian_weapons = true; //Allow civilians to save weapons on them?
    save_civilian_position = false; //Save civilian location?
    save_civilian_position_restart = false; //Save civilian location only between restarts. After a server restart you'll have to spawn again.
    /* !!!TO SAVE POSITION BETWEEN RESTARTS save_civilian_position MUST BE TRUE!!! */
    save_civilian_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.

    /* Vehicle Data Saving */
    save_vehicle_virtualItems = true; //Save virtual items inside the vehicle (all sides)(-- See defined items on next line --)
    save_vehicle_items[] = { 
        "pickaxe",
		"shovel",
        "fuelEmpty",
        "fuelFull", 
        "spikeStrip", 
        "lockpick", 
        "defuseKit",
        "storageSmall",
        "storageBig",
        "redgull",
        "coffee",
        "waterBottle",
        "apple",
        "peach",
        "tbacon",
        "donuts",
        "rabbit",
        "salema",
        "ornate",
        "mackerel",
        "tuna",
        "mullet",
        "catshark",
        "turtle_soup",
        "hen",
        "rooster",
        "sheep",
        "goat",
        "defibrillator",
        "toolkit",
        "artifactold",
        "artifactoldp",
        "artifactnew",
        "artifactnewp",
        "gold",
        "goldp",
        "ziptie" 
    }; 
    save_vehicle_inventory = false; //Save Arma inventory of vehicle to the database
    save_vehicle_fuel = false; //Save vehicle fuel level to the database (Impounded/Garaged).
    save_vehicle_damage = false; //Save vehicle damage to the database.
    save_vehicle_illegal = false; //This will allow cops to be advised when a vehicle, with illegal items in it, is impounded. This will also save illegal items as proof of crime, and needs "save_vehicle_virtualItems" set as true. Illegal items don't need to be set in save_vehicle_items[] for being saved, if it's enabled.


/* System Settings */
    /* ATM & Federal Reserve System Configurations */
    global_ATM = true; //Allow users to access any ATM on the map (Marked & Unmarked).
    noatm_timer = 10; //Time in minutes that players cannot deposit money after selling stolen gold.
    minimum_cops = 5; //Minimum cops required online to rob the Federal Reserve
    minimum_cops_bank = 5; //Minimum cops required online to rob the Bank

     /* House Robberies */
    copsHouseRaid = 5; //Cops needed to be online for robbing houses

    /*Death settings*/
    drop_weapons_onDeath = false; //Set true to enable weapon dropping on death. False (default) will delete player weapons on death, allowing them to be revived with them instead

    /* Basic System Configurations */
    donor_level = false; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules & https://www.bistudio.com/monetization
    enable_fatigue = false; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    respawn_timer = 300; //How many seconds a player should wait, before being able to respawn. Minimum 5 seconds.

    /* Clothing System Configurations */
    civ_skins = true; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
    cop_extendedSkins = true; //Enable or disable cop skins by level. Before enabling, you must add all the EIGHT files to textures folder. (It must be named as: cop_uniform.jpg + cop_uniform_1.jpg, cop_uniform_2.jpg...cop_uniform_6.jpg, cop_uniform_7.jpg; meaning cop_uniform = life_coplevel=0, cop_uniform_1 = life_coplevel=1, cop_uniform_2 = life_coplevel=2, etc...)
    clothing_noTP = true;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = false; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] ={}; //-- Not used anymore. Can be found @ fn_playerTags.sqf
    /*
    clothing_masks[] = { 
        "H_Shemag_olive", 
        "H_Shemag_khk", 
        "H_Shemag_tan", 
        "H_Shemag_olive_hs", 
        "H_ShemagOpen_khk", 
        "H_ShemagOpen_tan", 
        "G_Balaclava_blk", 
        "G_Balaclava_combat", 
        "G_Balaclava_lowprofile", 
        "G_Balaclava_oli", 
        "G_Bandanna_aviator", 
        "G_Bandanna_beast", 
        "G_Bandanna_blk", 
        "G_Bandanna_khk", 
        "G_Bandanna_oli", 
        "G_Bandanna_shades", 
        "G_Bandanna_sport", 
        "G_Bandanna_tan",
        "U_O_GhillieSuit", 
        "U_I_GhillieSuit", 
        "U_B_GhillieSuit", 
        "H_RacingHelmet_1_black_F", 
        "H_RacingHelmet_1_red_F", 
        "H_RacingHelmet_1_white_F", 
        "H_RacingHelmet_1_blue_F", 
        "H_RacingHelmet_1_yellow_F", 
        "H_RacingHelmet_1_green_F", 
        "H_RacingHelmet_1_F", 
        "H_RacingHelmet_2_F", 
        "H_RacingHelmet_3_F", 
        "H_RacingHelmet_4_F" 
        };
*/
    /* Fuel System Configurations */
    pump_service = true; //Allow users to use pump service on the map. Default = false
    fuel_cost = 100; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 1000; //Cost to service chopper at chopper service station(Repair/Refuel).
    fuelCan_refuel = 250; //Cost to refuel an empty fuel canister at the fuel station pumps. (Be wary of your buy/sell prices on fuel cans to prevent exploits...)

    /* Gang System Configurations */
    gang_price = 150000; //Gang creation price. --Remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 80000; //The base cost for purchasing additional slots in a gang
    gang_upgradeMultiplier = 2.5; //CURRENTLY NOT IN USE

    /* Housing System Configurations */
    house_limit = 4; //Maximum number of houses a player can own.

    /* Hunting & Fishing System Configurations */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; //Classnames of fish you can catch
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" }; //Classnames of aniamls you can hunt/gut

    /* Item-related Restrictions */
    restrict_medic_weapons = true; //Set to false to allow medics to use any weapon --true will remove ANY weapon they attempt to use (primary,secondary,launcher)
    restrict_clothingPickup = true; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
    restrict_weaponPickup = false; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
    restricted_uniforms[] = { "U_Rangemaster", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_worn", "U_B_survival_uniform" };
    restricted_weapons[] = { "hgun_P07_snds_F", "arifle_MX_F", "arifle_MXC_F" };

    /* Jail System Configurations */
    jail_seize_vItems[] = { "spikeStrip","lockpick","goldbar","blastingcharge","boltcutter","defusekit","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw" }; //Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.
    jail_seize_inventory = true; //Set to true to run the cop seize script on inmates. False will remove only weapons and magazines otherwise. (Basically used in case cops forget to seize items). [See Lines 106-111 below]
    sendtoJail_locations[] = { "police_hq_1", "police_hq_2", "cop_spawn_1", "cop_spawn_2", "cop_spawn_3", "cop_spawn_5", "Correctional_Facility","bounty_arrest_point" }; //Enter the variableName from the mission.sqm here to allow cops to send a person to jail at these locations.
    jail_forceWalk = true;

    /* Medical System Configurations */
    revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
    //cops_allowed_to_revive_if_no_medics = true //true to enable cops to revive if their are no medics online
    revive_fee = 1500; //Revive fee that players have to pay and medics only EMS(independent) are rewarded with this amount.
    hospital_heal_fee = 100; //Fee to heal at a hospital NPC

    /* Paycheck & Bank System Configurations */
    bank_cop = 100000; //Amount of cash in bank for new cops
    bank_civ = 100000; //Amount of cash in bank for new civillians
    bank_med = 100000; //Amount of cash in bank for new medics

    paycheck_cop = 5000; //Payment for cops
    paycheck_civ = 2000; //Payment for civillians
    paycheck_med = 5000; //Payment for medics

    paycheck_period = 10; //Scaled in minutes
    bank_transferTax = .01; //Tax that player pays when transferring money from ATM. Tax = Amount * multiplier

    /* Player Job System Configurations */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
    fuelTank_winMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for greater payout. Default = 1

    /* Search & Seizure System Configurations */
    seize_exempt[] = { "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit", "Chemlight_red", "Chemlight_yellow", "Chemlight_green", "Chemlight_blue", "optic_ACO_grn_smg" }; //Arma items that will not get seized from player inventories
    seize_uniform[] = { "U_Rangemaster" }; //Any specific uniforms you want to be seized from players
    seize_vest[] = { "V_TacVest_blk_POLICE" }; //Any specific vests you want to be seized from players
    seize_headgear[] = { "H_Cap_police" }; //Any hats or helmets you want seized from players
    seize_minimum_rank = 2; //Required minimum CopLevel to be able to seize items from players
    crushing_minimum_rank = 3; //Required minimum CopLevel to be able to seize items from players

    /* Cop Undercover Configurations */
    uc_name_list[] = { "Omar","Marco","Foster","Gaston","Otto","Horacio","Karl","Pasquale","Royce","Harrison","Sheldon","Adolph","Glen","Neville","Lynn","Dwain","Osvaldo","Ollie","Ian","Isreal","Dante","Ellis","Giovanni","Trevor","Bryan" }; // Firstname
    uc_surname_list[] = { "Max","Uselton","Brasil","Nealon","Ostroff","Bjorklund","Tetreault","Lowe","Weisner","Shimizu","Lacross","Vaz","Ells","Fallis","Eoff","Eccles","Loper","Dunnam","Wilbourn","Tippie","Percival","Duane","Zajac","Shambo","Tappan" }; // Surname

    /* Vehicle System Configurations */
    chopShop_vehicles[] = { "Car", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
    vehicle_infiniteRepair[] = {1, 1, 1, 1}; //Set to true for unlimited repairs with 1 toolkit. False will remove toolkit upon use. civilian, west, independent, east
    vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F" }; //Vehicles that can only be rented and not purchased. (Last only for the session)
    vehicleShop_3D = false; //Add preview 3D inside Shop vehicle.       Default : False

    /* Vehicle Purchase Prices */
    vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_COP = .2; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_MEDIC = .2; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
    vehicle_purchase_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

    /* Vehicle Rental Prices */
    vehicle_rental_multiplier_CIVILIAN = .80; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_COP = .1; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_MEDIC = .1; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
    vehicle_rental_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

    /* Vehicle Sell Prices */
    vehicle_sell_multiplier_CIVILIAN = .2; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_COP = .1; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_MEDIC = .1; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
    vehicle_sell_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.

    /* "Other" Vehicle Prices */
    vehicle_chopShop_multiplier = .15; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
    vehicle_storage_fee_multiplier = .01; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
    vehicle_cop_impound_multiplier = .05; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
    vehicle_cop_crush_multiplier = .05;

    /* Wanted System Settings *
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","50000","187V"},
        {"STR_Crime_187","50000","187"},
        {"STR_Crime_901","100000","901"},
        {"STR_Crime_215","10000","215"},
        {"STR_Crime_213","80000","213"},
        {"STR_Crime_211","80000","211"},
        {"STR_Crime_207","80000","207"},
        {"STR_Crime_207A","80000","207A"},
        {"STR_Crime_390","35000","390"},
        {"STR_Crime_487","20000","487"},
        {"STR_Crime_488","5000","488"},
        {"STR_Crime_480","40000","480"},
        {"STR_Crime_481","80000","481"},
        {"STR_Crime_482","80000","482"},
        {"STR_Crime_483","20000","483"},
        {"STR_Crime_459","70000","459"},
        {"STR_Crime_666","150000","666"},
        {"STR_Crime_667","50000","667"},
        {"STR_Crime_668","60000","668"},
        {"STR_Crime_1","30000","1"},
        {"STR_Crime_2","5000","2"},
        {"STR_Crime_3","6000","3"},
        {"STR_Crime_4","7000","4"},
        {"STR_Crime_5","5000","5"},
        {"STR_Crime_6","7000","6"},
        {"STR_Crime_7","5000","7"},
        {"STR_Crime_8","1000","8"},
        {"STR_Crime_9","40000","9"},
        {"STR_Crime_10","20000","10"},
        {"STR_Crime_11","30000","11"},
        {"STR_Crime_12","70000","12"},
        {"STR_Crime_13","20000","13"},
        {"STR_Crime_14","5000","14"},
        {"STR_Crime_15","5000","15"},
        {"STR_Crime_16","80000","16"},
        {"STR_Crime_17","20000","17"},
        {"STR_Crime_18","5000","18"},
        {"STR_Crime_19","5000","19"},
        {"STR_Crime_20","20000","20"},
        {"STR_Crime_21","1000","21"},
        {"STR_Crime_22","3000","22"},
        {"STR_Crime_23","100000","23"},
        {"STR_Crime_24","100000","24"},
        {"STR_Crime_25","200000","25"}
    };
    /* Bounty System Settings *
    /* bountys[] = {string, amount, code} */
    bountys[] = {
		{"STR_Bounty_5000", "5000", "1B"},
		{"STR_Bounty_10000", "10000", "2B"},
		{"STR_Bounty_15000", "15000", "3B"},
		{"STR_Bounty_20000", "20000", "4B"},
		{"STR_Bounty_25000", "25000", "5B"},
		{"STR_Bounty_30000", "30000", "6B"},
		{"STR_Bounty_35000", "35000", "7B"},
		{"STR_Bounty_40000", "40000", "8B"},
		{"STR_Bounty_45000", "45000", "9B"},
		{"STR_Bounty_50000", "50000", "10B"},
		{"STR_Bounty_55000", "55000", "11B"},
		{"STR_Bounty_60000", "60000", "12B"},
		{"STR_Bounty_65000", "65000", "13B"},
		{"STR_Bounty_70000", "70000", "14B"},
		{"STR_Bounty_75000", "75000", "15B"},
		{"STR_Bounty_80000", "80000", "16B"},
		{"STR_Bounty_85000", "85000", "17B"},
		{"STR_Bounty_90000", "90000", "18B"},
		{"STR_Bounty_95000", "95000", "19B"},
		{"STR_Bounty_100000", "100000", "20B"},
		{"STR_Bounty_200000", "200000", "21B"},
		{"STR_Bounty_300000", "300000", "22B"},
		{"STR_Bounty_400000", "400000", "23B"},
		{"STR_Bounty_500000", "500000", "24B"},
		{"STR_Bounty_1000000", "1000000", "25B"}
	};
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
#include "Config_Process.hpp"
#include "Config_CellPhone.hpp"