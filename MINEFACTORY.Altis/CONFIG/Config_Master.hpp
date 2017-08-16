#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
    /* Persistent Player Settings */
    save_civ_weapons = true; //Allow civilians to save weapons on them?
    save_virtualItems = true; //Save Virtual items (all sides)?
    save_playerStats = false; //Save food, water and damage (all sides)?
    save_civ_position = false; //Save civilian location?
    save_civ_positionStrict = false; //Strip the player if possible combat-log?  WARNING: Server crashes and lack of reliable syncing can trigger this.

    /* Persistent Vehicle Settings */
    save_veh_virtualItems = true; //Save Virtual items for vehicles (all sides)?
    save_veh_gear = true; //Save Gear for vehicles (all sides)?
    save_veh_fuel = true; //Save Vehicle fuel state
    save_veh_damage = true; //Save Vehicle Damage
    save_veh_items[] = { "pickaxe","fuelEmpty","fuelFull", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle_soup","hen","rooster","sheep","goat","nitro","protest","news","heal","money10","money50" };

    /* Clothing related settings */
    clothing_noTP = false;  //Disable clothing preview teleport? (true = no teleport. false = teleport)
    clothing_box = true; //true = teleport to a black box. false = teleport to somewhere on map. (It only affects the game if clothing_noTP is set as false)
    clothing_masks[] = { "H_Shemag_olive", "H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan", "G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan", "U_O_GhillieSuit", "U_I_GhillieSuit", "U_B_GhillieSuit", "H_RacingHelmet_1_black_F", "H_RacingHelmet_1_red_F", "H_RacingHelmet_1_white_F", "H_RacingHelmet_1_blue_F", "H_RacingHelmet_1_yellow_F", "H_RacingHelmet_1_green_F", "H_RacingHelmet_1_F", "H_RacingHelmet_2_F", "H_RacingHelmet_3_F", "H_RacingHelmet_4_F" };

    /* Cop related settings */
    cops_online_min = 5; //minimum cops online for robbing a bank
    seize_exempt[] = { "Binocular", "ItemWatch", "ItemCompass", "ItemGPS", "ItemMap", "NVGoggles", "FirstAidKit", "ToolKit", "Chemlight_red", "Chemlight_yellow", "Chemlight_green", "Chemlight_blue", "optic_ACO_grn_smg" };
    seize_uniform[] = { "U_Rangemaster" }; //Any specific uniforms you want to be seized from players
    seize_vest[] = { "V_TacVest_blk_POLICE" }; //Any specific vests you want to be seized from players
    seize_headgear[] = { "H_Cap_police" }; //Any hats or helmets you want seized from players
    seize_minimum_rank = 2; //Required minimum CopLevel to be able to seize items from players

    /* Revive system settings */
    revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 8500; //Revive fee that players have to pay and medics / EMS are rewarded

    /* House related settings */
    house_limit = 3; //Maximum amount of houses a player can own.

    /* Donor related settings */
    donor_level = true; //Enable the donor level set in database (var = life_donorlevel; levels = 0,1,2,3,4,5). ATTENTION! Before enabling, read: https://www.bistudio.com/community/game-content-usage-rules & https://www.bistudio.com/monetization

    /* Gang related settings */
    gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
    gang_upgradeMultiplier = 2.5; //Not sure if in use?

    /* Player-related systems */
    enable_fatigue = false; //Set to false to disable the ARMA 3 fatigue system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack

    /* Item-related restrictions */
    restrict_medic_weapons = false; //Set to false to allow medics to use any weapon -true will remove ANY weapon they attempt to use (primary,secondary,launcher)
    restrict_clothingPickup = false; //Set to false to allow civilians to pickup/take any uniform (ground/crates/vehicles)
    restrict_weaponPickup = false; //Set to false to allow civilians to pickup/take any weapon (ground/crates/vehicles)
    restricted_uniforms[] = { "U_Rangemaster" };
    restricted_weapons[] = { "hgun_P07_snds_F" };

    /* Impound Variables */
    impound_car = 10000; //Price for impounding cars
    impound_boat = 8000; //Price for impounding boats
    impound_air = 20000; //Price for impounding helicopters / planes

    /* Initial Bank Amount */
    bank_cop = 50000; //Amount of cash on bank for new cops
    bank_civ = 50000; //Amount of cash on bank for new civillians
    bank_med = 50000; //Amount of cash on bank for new medics

    /* Paycheck Settings */
    paycheck_period = 5; //Scaled in minutes
    paycheck_cop = 8000; //Payment for cops
    paycheck_civ = 850; //Payment for civillians
    paycheck_med = 4000; //Payment for medics

    /* Federal Reserve settings */
    noatm_timer = 10; //Time in minutes that players won't be able to deposit his money after selling stolen gold

    /* ATM settings */
    global_ATM = true; //Allow users to access any ATM on the map.

    /* Fuel Station & Heli Service settings */
    Pump_service = true; //Allow users to use pump service on the map. Default = false
    fuel_cost = 80; //Cost of fuel per liter at fuel stations (if not defined for the vehicle already).
    service_chopper = 1000; //Cost to service chopper at chopper service station.

    /* Skins settings */
    civ_skins = false; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.paa, civilian_uniform_2.paa...civilian_uniform_6.paa, civilian_uniform_7.paa)

    /* Vehicle Settings */
    vehicleShop_rentalOnly[] = { "" };

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
        {"Fahrlässige Tötung","650","187V"},
        {"Totschlag","2000","187"},
        {"Gefängnis´Ausbruch","450","901"},
        {"Versuchter Auto diebstahl","200","215"},
        {"Verwendung von illegalen Sprengstoff","1000","213"},
        {"Raub","100","211"},
        {"Entführung","350","207"},
        {"Versuchte Entführung","200","207A"},
        {"Öffentlich Betrunken","1500","390"},
        {"schwerer Diebstahl","150","487"},
        {"Kleiner Diebstahl","70","488"},
        {"Fahrerflüchtig","100","480"},
        {"Drogenbesitz","100","481"},
        {"Versucht zu Verteilen","500","482"},
        {"Drogenhandel","950","483"},
        {"Einbruch","650","459"},
        {"Steuerhinterziehung","200","666"},
        {"Terrorismus","4500","667"},
        {"Keine Lizenz zu Jagen","1500","668"},
        {"Fahren ohne Führerschein","250","1"},
        {"Fahren in die falsche Richtung der Straße","200","2"},
        {"Nicht unter Beachtung der Signalisierungen","150","3"},
        {"Geschwindigkeitsüberschreitung","250","4"},
        {"Kein Scheinwerfer in der Nacht","100","5"},
        {"Kart fahren ohne Helm","80","6"},
        {"Falsch Parker","150","7"},
        {"Rebelen Fahrzeug (nicht bewaffnet)","5000","8"},
        {"Schwerer Diebstahl Eines Autos","5000","9"},
        {"Fahren Ohne license","15000","10"},
        {"Fahren in die falsche Richtung der Straße","20000","25"}
    };
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_Vehicles.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Gather.hpp"
#include "Config_SpawnPoints.hpp"