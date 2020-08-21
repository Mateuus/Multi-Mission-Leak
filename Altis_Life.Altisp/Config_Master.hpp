#define true 1
#define false 0

/*
    Master settings for various features and functionality Plik Acid
*/
class Life_Settings {
/* Logging and Security Settings*/
    /* Security Settings */
    sypGlass_toggle = false; //Spyglass On/Off Toggle --> True = On & False = Off

    /* Data Logging Settings */
    battlEye_friendlyLogging = false; //Set to true if you plan to read the data in your BattlEye log files. Otherwise use the SERVER RPT.
    player_advancedLog = true; //Logs the following: Houses(purchase/sale), Vehicle(Purchase/Sale/Chopping), Cop Arrests and Gang Creations. SEARCH USING: advanced_log
    player_moneyLog = true; //Logs player and gang bank(deposits/withdrawals/transfers). Logs money picked up off the ground. Logs player robbery. SEARCH USING: money_log

/* Database Related Settings */
    /* Player Data Saving */
    save_virtualItems = true; //Save Virtual items (all sides)?
    saved_virtualItems[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","defibrillator","toolkit","scalpel","lizak","morphine","cprKit" }; //Array of virtual items that can be saved on your player.
    save_playerStats = true; //Save food, water and damage (all sides)?
    save_civilian_weapons = true; //Allow civilians to save weapons on them?
    save_civilian_position = false; //Save civilian location?
    save_civilian_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.
    save_civilian_position_restart = false; //Save civilian location only between restarts. After a server restart you'll have to spawn again. /* !!!TO SAVE POSITION BETWEEN RESTARTS save_civilian_position MUST BE TRUE!!! */

    /* Vehicle Data Saving */
    save_vehicle_virtualItems = false; //Save virtual items inside the vehicle (all sides)(-- See defined items on next line --)
    save_vehicle_items[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip","lockpick","defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","cprKit" };
    save_vehicle_inventory = false; //Save Arma inventory of vehicle to the database
    save_vehicle_fuel = true; //Save vehicle fuel level to the database (Impounded/Garaged).
    save_vehicle_damage = true; //Save vehicle damage to the database.
    save_vehicle_illegal = false; //This will allow cops to be advised when a vehicle, with illegal items in it, is impounded. This will also save illegal items as proof of crime, and needs "save_vehicle_virtualItems" set as true. Illegal items don't need to be set in save_vehicle_items[] for being saved, if it's enabled.


/* System Settings */
    /* ATM & Federal Reserve System Configurations */
    global_ATM = true; //Allow users to access any ATM on the map (Marked & Unmarked).
    noatm_timer = 15; //Time in minutes that players cannot deposit money after selling stolen gold.
    minimum_cops = 5; //Minimum cops required online to rob the Federal Reserve

    /* Basic System Configurations */
    donor_level = false; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules & https://www.bistudio.com/monetization
    enable_fatigue = true; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    respawn_timer = 60; //How many seconds a player should wait, before being able to respawn.
	respawn_timer_med = 300; //How many seconds a player should wait, before being able to respawn.

    /* Clothing System Configurations */
    civ_skins = true; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
    cop_extendedSkins = true; //Enable or disable cop skins by level. Before enabling, you must add all the EIGHT files to textures folder. (It must be named as: cop_uniform.jpg + cop_uniform_1.jpg, cop_uniform_2.jpg...cop_uniform_6.jpg, cop_uniform_7.jpg; meaning cop_uniform = life_coplevel=0, cop_uniform_1 = life_coplevel=1, cop_uniform_2 = life_coplevel=2, etc...)
    clothing_noTP = false;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_TI_blk_F", "G_Balaclava_TI_G_blk_F" };

    /* Fuel System Configurations */
    pump_service = false; //Allow users to use pump service on the map. Default = false
    fuel_cost = 80; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 1000; //Cost to service chopper at chopper service station(Repair/Refuel).

    /* Gang System Configurations */
    gang_price = 400000; //Gang creation price. --Remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 1000000; //The base cost for purchasing additional slots in a gang
    gang_upgradeMultiplier = 2.5; //CURRENTLY NOT IN USE

    /* Housing System Configurations */
    house_limit = 4; //Maximum number of houses a player can own.

    /* Hunting & Fishing System Configurations */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" }; //Classnames of fish you can catch
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" }; //Classnames of aniamls you can hunt/gut

    /* Item-related Restrictions */
    restrict_medic_weapons = true; //Set to false to allow medics to use any weapon --true will remove ANY weapon they attempt to use (primary,secondary,launcher)
    restrict_clothingPickup = false; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
    restrict_weaponPickup = false; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
    restricted_uniforms[] = { "U_Rangemaster", "U_B_CombatUniform_mcam_tshirt", "U_B_CombatUniform_mcam_worn", "U_B_survival_uniform" };
    restricted_weapons[] = { "hgun_P07_snds_F", "arifle_MX_F", "arifle_MXC_F" };

    /* Jail System Configurations */
    jail_seize_vItems[] = { "spikeStrip","lockpick","ziptie","goldbar","blastingcharge","boltcutter","defusekit","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","turtle_raw","moonshine" }; //Define VIRTUAL items you want to be removed from players upon jailing here. Use "jail_seize_inventory" for Arma inventory items.
    jail_seize_inventory = false; //Set to true to run the cop seize script on inmates. False will remove only weapons and magazines otherwise. (Basically used in case cops forget to seize items). [See Lines 106-111 below]

    /* Medical System Configurations */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 20000; //Revive fee that players have to pay and medics only EMS(independent) are rewarded with this amount.

   /* Paycheck & Bank System Configurations */
    bank_cop = 60000; //Amount of cash in bank for new cops
    bank_civ = 60000; //Amount of cash in bank for new civillians
    bank_med = 50000; //Amount of cash in bank for new medics

    paycheck_period = 5; //Scaled in minutes
    paycheck_cop = 4000; //Payment for cops
    paycheck_civ = 2000; //Payment for civillians
    paycheck_med = 6500; //Payment for medics

    /* Player Job System Configurations */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };
    fuelTank_winMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for greater payout. Default = 1

    /* Search & Seizure System Configurations */
    seize_exempt[] = { "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit", "Chemlight_red", "Chemlight_yellow", "Chemlight_green", "Chemlight_blue", "optic_ACO_grn_smg" }; //Arma items that will not get seized from player inventories
    seize_uniform[] = { "U_Rangemaster" }; //Any specific uniforms you want to be seized from players
    seize_vest[] = { "V_TacVest_blk_POLICE" }; //Any specific vests you want to be seized from players
    seize_headgear[] = { "H_Cap_police" }; //Any hats or helmets you want seized from players
    seize_minimum_rank = 1; //Required minimum CopLevel to be able to seize items from players

    /* Vehicle System Configurations */
    chopShop_vehicles[] = { "Car", "Air" }; //Vehicles that can be chopped. (Can add: "Ship" and possibly more -> look at the BI wiki...)
    vehicle_infiniteRepair = true; //Set to true for unlimited repairs with 1 toolkit. False will remove toolkit upon use.
    parking_ticket = 10000; //Amount of Parking Ticket.
    vehicleShop_rentalOnly[] = {}; //Vehicles that can only be rented and not purchased. (Last only for the session)

        /* Vehicle Purchase Prices */
        vehicle_purchase_multiplier_CIVILIAN = 1; //Civilian Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_COP = .10; //Cop Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_MEDIC = .10; //Medic Vehicle Buy Price = Config_Vehicle price * multiplier
        vehicle_purchase_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.
        vehicle_purchase_multiplier_donor = .6; // -- NOT IN USE -- Simply left in for east support.
        vehicle_purchase_multiplier_donor4 = .4; // -- NOT IN USE -- Simply left in for east support.

        /* Vehicle Rental Prices */
        vehicle_rental_multiplier_CIVILIAN = .75; //Civilian Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_COP = .4; //Cop Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_MEDIC = .4; //Medic Vehicle Rental Price = Config_Vehicle price * multiplier
        vehicle_rental_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.
        vehicle_rental_multiplier_donor = .4; // -- NOT IN USE -- Simply left in for east support.
        vehicle_rental_multiplier_donor4 = .3; // -- NOT IN USE -- Simply left in for east support.

        /* Vehicle Sell Prices */
        vehicle_sell_multiplier_CIVILIAN = .5; //Civilian Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
        vehicle_sell_multiplier_COP = .2; //Cop Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
        vehicle_sell_multiplier_MEDIC = .2; //Medic Vehicle Garage Sell Price = Vehicle Buy Price * multiplier
        vehicle_sell_multiplier_OPFOR = -1; // -- NOT IN USE -- Simply left in for east support.
        vehicle_sell_multiplier_donor = .3; // -- NOT IN USE -- Simply left in for east support.
        vehicle_sell_multiplier_donor4 = .2; // -- NOT IN USE -- Simply left in for east support.

        /* "Other" Vehicle Prices */
        vehicle_chopShop_multiplier = .15; //Chop Shop price for vehicles. TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
        vehicle_storage_fee_multiplier = .02; //Pull from garage cost --> Cost takes the playersides Buy Price * multiplier
        vehicle_cop_impound_multiplier = .01; //TO AVOID EXPLOITS NEVER SET HIGHER THAN A PURCHASE/RENTAL multipler!   Payout = Config_vehicle Price * multiplier
		vehicle_cop_seize_multiplier = .05;
		
		/* Channel 7 News Station Configurations */
		news_broadcast_cost = 150000; //Preis für eine Nachricht im Fernsehen
		news_broadcast_cooldown = 20; //Abklingzeit zwischen zwei Nachrichten. (Default = 20 minutes)
		news_broadcast_header_length = 60; //Maximallänge der Überschrift. Alles darüber wird abgeschnitten. Hängt von der Schriftart, -größe und anderen Faktoren ab. Vorsicht beim Abändern!
		cop_news_broadcast_cooldown = 5; //Abklingzeit zwischen zwei Nachrichten der Polizei
		cop_news_broadcast_minimum_Rank = 5; //Benötigter Rang für Polizisten, um Nachricht zu senden
 
/* Wanted System Settings *
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","150000","187V"}, //Zabójstwo przy użyciu pojazdów
        {"STR_Crime_187","300000","187"}, //Zabójstwo
        {"STR_Crime_901","50000","901"},
        {"STR_Crime_215","55000","215"},
        {"STR_Crime_213","70000","213"},
        {"STR_Crime_211","100000","211"},
        {"STR_Crime_207","260000","207"},
        {"STR_Crime_207A","150000","207A"},
        {"STR_Crime_390","100000","390"},
        {"STR_Crime_487","150000","487"},
        {"STR_Crime_488","75000","488"},
        {"STR_Crime_480","20000","480"},
        {"STR_Crime_481","130000","481"},
        {"STR_Crime_482","50000","482"},
        {"STR_Crime_483","200000","483"},
        {"STR_Crime_459","100000","459"},
        {"STR_Crime_666","120000","666"},
        {"STR_Crime_667","200000","667"},
        {"STR_Crime_668","50000","668"},
        {"STR_Crime_919","80000","919"},
        {"STR_Crime_919A","80000","919A"},
        {"STR_Crime_1","5000","1"},
        {"STR_Crime_2","3000","2"},
        {"STR_Crime_3","4000","3"},
        {"STR_Crime_4","5000","4"},
        {"STR_Crime_5","2500","5"},
        {"STR_Crime_6","5000","6"},
        {"STR_Crime_7","2000","7"},
        {"STR_Crime_8","20000","8"},
        {"STR_Crime_9","30000","9"},
        {"STR_Crime_10","45000","10"},
        {"STR_Crime_11","100000","11"},
        {"STR_Crime_12","185000","12"},
        {"STR_Crime_13","5000","13"},
        {"STR_Crime_14","25000","14"},
        {"STR_Crime_15","60000","15"},
        {"STR_Crime_16","10000","16"},
        {"STR_Crime_17","15000","17"},
        {"STR_Crime_18","10000","18"},
        {"STR_Crime_19","15000","19"},
        {"STR_Crime_20","5000","20"},
        {"STR_Crime_21","10000","21"},
        {"STR_Crime_22","800000","22"},
        {"STR_Crime_23","350000","23"},
        {"STR_Crime_24","150000","24"},
        {"STR_Crime_25","180000","25"}
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