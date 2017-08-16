#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
    /* Persistent Player Settings */
    save_civ_weapons = true; //Allow civilians to save weapons on them?
    save_virtualItems = true; //Save Virtual items (all sides)?
	saved_virtualItems[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","defibrillator","toolkit","zipties","pliers","tracker" };
    save_playerStats = true; //Save food, water and damage (all sides)?
    save_civ_position = false; //Save civilian location?
    save_civ_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.
	
	/* Auction House listing limit unless donator, then + 1 per level */
	ah_listing_limit = 10;

    /* Persistent Vehicle Settings */
    save_veh_virtualItems = true; //Save Virtual items for vehicles (all sides)?
    save_veh_gear = false; //Save Gear for vehicles (all sides)?
    save_veh_fuel = true; //Save Vehicle fuel state
    save_veh_damage = true; //Save Vehicle Damage
    save_veh_items[] = { "redgull","coffee","waterBottle","apple","peach","tbacon","donuts","trauben","bananen" };

    /* Clothing related settings */
    clothing_noTP = false;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" };

    /* Cop related settings */
    cops_online_min = 4; //minimum cops online for robbing a bank

    /* Medic related settings*/
    allow_medic_weapons = true; // true allows medics to hold/use weapons - false disallows

    /* Revive system settings */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 12000; //Revive fee that players have to pay and medics / EMS are rewarded

    /* House related settings */
    house_limit = 5; //Maximum amount of houses a player can own.

    /* Donor related settings */
    donor_level = true; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules

    /* Gang related settings */
    gang_price = 450000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 150000; //The base cost for upgrading slots in a gang
    gang_upgradeMultiplier = 2.5; //Not sure if in use?

    /* Player-related systems */
    enable_fatigue = true; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    paycheck_period = 5; //Scaled in minutes

    /* Impound Variables */
    impound_car = 20000; //Price for impounding cars
    impound_boat = 7250; //Price for impounding boats
    impound_air = 20000; //Price for impounding helicopters / planes

    /* Initial Bank Amount */
    bank_cop = 20000; //Amount of cash on bank for new cops
    bank_civ = 50000; //Amount of cash on bank for new civillians
    bank_med = 20000; //Amount of cash on bank for new medics

    /* Paycheck Amount */
    paycheck_cop = 1650; //Payment for cops
    paycheck_civ = 875; //Payment for civillians
    paycheck_med = 1650; //Payment for medics

    /* Federal Reserve settings */
    noatm_timer = 30; //Time in minutes that players won't be able to deposit his money after selling stolen gold

    /* Spyglass settings */
    spyglass_init = false; //Enable or disable spyglass

    /* ATM settings */
    global_ATM = true; //Allow users to access any ATM on the map.

    /* Fuel Station & Heli Service settings */
    Pump_service = true; //Allow users to use pump service on the map. Default = false
    fuel_cost = 80; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 1100; //Cost to service chopper at chopper service station.

    /* Skins settings */
    civ_skins = true;	//Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)
	cop_skins = true;
	mtd_skins = true;

    /* Vehicle Settings */
	vehicle_infiniteRepair = false;
    vehicleShop_rentalOnly[] = { "B_Boat_Armed_01_minigun_F" };
    vehicleShop_BuyMultiplicator = 1.5;
    vehicleGarage_SellMultiplicator = 0.75;
    vehicleGarage_StorFeeMultiplicator = 0.05;
    vehicleChopShop_Multiplicator = 0.5;

    /* Job-related stuff */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

    /* FuelTank Mission */
    FuelTank_WinMultiplier = 1; //Win Multiplier in FuelTank Missions. Increase for more Money! Default = 1

    /* Animal settings */
    animaltypes_fish[] = { "Salema_F", "Ornate_random_F", "Mackerel_F", "Tuna_F", "Mullet_F", "CatShark_F", "Turtle_F" };
    animaltypes_hunting[] = { "Sheep_random_F", "Goat_random_F", "Hen_random_F", "Cock_random_F", "Rabbit_F" };

    /* Wanted System related settings */
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","650","187V"},
        {"STR_Crime_187","2000","187"},
        {"STR_Crime_901","450","901"},
        {"STR_Crime_215","200","215"},
        {"STR_Crime_213","1000","213"},
        {"STR_Crime_211","100","211"},
        {"STR_Crime_207","350","207"},
        {"STR_Crime_207A","200","207A"},
        {"STR_Crime_390","1500","390"},
        {"STR_Crime_487","150","487"},
        {"STR_Crime_488","70","488"},
        {"STR_Crime_480","100","480"},
        {"STR_Crime_481","100","481"},
        {"STR_Crime_482","500","482"},
        {"STR_Crime_483","950","483"},
        {"STR_Crime_459","650","459"},
        {"STR_Crime_666","200","666"},
        {"STR_Crime_667","4500","667"},
        {"STR_Crime_668","1500","668"},
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
		{"STR_Crime_55","100000","55"}, //fliegen unter drogen
		{"STR_Crime_56","500000","56"}, //Handeln mit illegalen Güter
		{"STR_Crime_57","500000","57"}, //Besitz von illegalen Güter
		{"STR_Crime_58","500000","58"}, //verkauf von illegalen güter
		{"STR_Crime_59","75000","59"}, //Einbruch
		{"STR_Crime_60","50000","60"} //Foltern
    };
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"
