#define true 1
#define false 0

/*
    Master settings for various features and functionality
*/
class Life_Settings {
    /* Persistent Settings */
    save_civ_weapons = true; //Allow civilians to save weapons on them?
    save_virtualItems = true; //Save Virtual items (all sides)?
    save_playerStats = false; //Save food & water (all sides)?
    save_veh_virtualItems = false; //Save Virtual items for vehicles (all sides)?
    save_veh_gear = false; //Save Gear for vehicles (all sides)?

    /* Clothing related settings */
    clothing_box = false; //true = preview inside a black box.  false = preview on map.

    /* Cop related settings */
    cops_online_min = 6; //minimum cops online for robbing a bank

    /* Medic related settings*/
    allow_medic_weapons = true; // true allows medics to hold/use weapons - false disallows

    /* Revive system settings */
    revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
    revive_fee = 10000; //Revive fee that players have to pay and medics / EMS are rewarded

    /*Death settings*/
    drop_weapons_onDeath = false; //Set true to enable weapon dropping on death. False (default) will delete player weapons on death, allowing them to be revived with them instead

    /* House related settings */
    house_limit = 2; //Maximum amount of houses a player can own.

    /* Gang related settings */
    gang_price = 250000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
    gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
    gang_upgradeMultiplier = 2.5; //Not sure if in use?

    /* Player-related systems */
    enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
    total_maxWeight = 24; //Static variable for the maximum weight allowed without having a backpack
    paycheck_period = 10; //Scaled in minutes
    bank_transferTax = 0.2;

    /* Impound Variables */
    impound_car = 1000; //Price for impounding cars
    impound_boat = 2500; //Price for impounding boats
    impound_air = 5000; //Price for impounding helicopters / planes

    /* Initial Bank Amount */
    bank_cop = 25000; //Amount of cash on bank for new cops
    bank_civ = 25000; //Amount of cash on bank for new civillians
    bank_med = 25000; //Amount of cash on bank for new medics
    bank_armer = 25000; //Montant de l'armée

    /* Paycheck Amount */
    paycheck_cop = 30000; //Payment for cops A MODIFIER SELON LE RANG
    paycheck_civ = 2000; //Payment for civillians
    paycheck_med = 25000; //Payment for medics
    paycheck_armer = 30000; //Payement pour l'armer

    /* Federal Reserve settings */
    noatm_timer = 10; //Time in minutes that players won't be able to deposit his money after selling stolen gold

    /* Spyglass settings */
    spyglass_init = false; //Enable or disable spyglass

    /* ATM settings */
    global_ATM = true; //Allow users to access any ATM on the map.

    /* Pump settings */
    Pump_service = true; //Allow users to use pump service on the map. Default = false

    /* Skins settings */
    civ_skins = true; //Enable or disable civilian skins. Before enabling, you must add all the SEVEN files to textures folder. (It must be named as: civilian_uniform_1.jpg, civilian_uniform_2.jpg...civilian_uniform_6.jpg, civilian_uniform_7.jpg)

    /* Car-shop Settings */
    vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F", "B_Boat_Armed_01_minigun_F" };

    /* Job-related stuff */
    delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

    /* Wanted System related settings */
    /* crimes[] = {String, Bounty, Code} */
    crimes[] = {
        {"STR_Crime_187V","65000","187V"},
        {"STR_Crime_187","20000","187"},
        {"STR_Crime_901","4500","901"},
        {"STR_Crime_215","2000","215"},
        {"STR_Crime_213","10000","213"},
        {"STR_Crime_211","1000","211"},
        {"STR_Crime_207","3500","207"},
        {"STR_Crime_207A","2000","207A"},
        {"STR_Crime_390","15000","390"},
        {"STR_Crime_487","1500","487"},
        {"STR_Crime_488","700","488"},
        {"STR_Crime_480","1000","480"},
        {"STR_Crime_481","1000","481"},
        {"STR_Crime_482","5000","482"},
        {"STR_Crime_483","9500","483"},
        {"STR_Crime_459","6500","459"},
        {"STR_Crime_666","2000","666"},
        {"STR_Crime_667","45000","667"},
        {"STR_Crime_668","15000","668"},
        {"STR_Crime_1","25000","1"},
        {"STR_Crime_2","20000","2"},
        {"STR_Crime_3","15000","3"},
        {"STR_Crime_4","25000","4"},
        {"STR_Crime_5","10000","5"},
        {"STR_Crime_6","8000","6"},
        {"STR_Crime_7","1500","7"},
        {"STR_Crime_8","50000","8"},
        {"STR_Crime_9","50000","9"},
        {"STR_Crime_10","150000","10"},
        {"STR_Crime_11","100000","11"},
        {"STR_Crime_12","25000","12"},
        {"STR_Crime_13","15000","13"},
        {"STR_Crime_14","5000","14"},
        {"STR_Crime_15","25000","15"},
        {"STR_Crime_16","15000","16"},
        {"STR_Crime_17","1000","17"},
        {"STR_Crime_18","15000","18"},
        {"STR_Crime_19","25000","19"},
        {"STR_Crime_20","5000","20"},
        {"STR_Crime_21","5000","21"},
        {"STR_Crime_22","20000","22"},
        {"STR_Crime_23","50000","23"},
        {"STR_Crime_24","100000","24"},
        {"STR_Crime_25","200000","25"}
    };
};

#include "Config_Clothing.hpp"
#include "Config_Licenses.hpp"
#include "Config_vItems.hpp"
#include "Config_Weapons.hpp"
#include "Config_Vehicles.hpp"
