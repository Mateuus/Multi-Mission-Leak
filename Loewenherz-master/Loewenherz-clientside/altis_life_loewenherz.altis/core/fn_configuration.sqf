#include <macro.h>
/*
	Master lhm Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
lhm_request_timer = false;
lhm_drink = 0;
lhm_canOpenPMenu = true; // allow player to open the Z-Menu
lhm_query_time = time;
lhm_action_delay = time;
lhm_trunk_vehicle = Objnull;
lhm_session_completed = false;
lhm_garage_store = false;
lhm_session_tries = 0;
lhm_net_dropped = false;
lhm_hit_explosive = false;
lhm_siren_active = false;
lhm_clothing_filter = 0;
lhm_clothing_uniform = -1;
lhm_redgull_effect = time;
lhm_is_processing = false;
lhm_bail_paid = false;
lhm_impound_inuse = false;
lhm_action_inUse = false;
lhm_spikestrip = ObjNull;
lhm_respawn_timer = 2; //Scaled in minutes
lhm_knockout = false;
lhm_interrupted = false;
lhm_respawned = false;
lhm_removeWanted = false;
lhm_action_gathering = false;
lhm_save_gear = [];
lhm_container_activeObj = ObjNull;
lhm_sitting = false;
lhm_disable_getIn = false;
lhm_disable_getOut = false;
radiospam = false;
radiospampoli = false;
radiospamhorn = false;
antispam = false;
antispampoli = false;
antispamhorn = false;
lhm_lastPosition = [];
lhm_fadeSound = false;
lhm_exp_level_prozent = 0;
lhm_exp_level_prozentMax = 0;
lhm_exp_level_text = "";
lhm_serverUptime = [0,0];
LHM_LOCAL_WANTED_LIST = [];
lhm_frozen = false;
LHM_VAR_MEDIC_BUFF_TEST = false;
LHM_admin_sec_event_allowed = false;
LHM_jailcombatlog = false;
lhm_lastPositionLoaded = false;
LHM_info_menu = ["RDM/VDM","Grafische Anzeigen","Erstattung","Safezones","NEW lhm"];
LHM_repair = false;
lhm_placeable_object = ObjNull;
lhm_gangarea_buildmode = false;
BUILD_isCreating = false;
lhm_fuelstation_price = 0;
lhm_fuelstation_lockVeh = objNull;
lhm_fuelstation_fueltruck = objNull;
lhm_fuelstation_amount = 0;
lhm_fuelstation_fitamount = 0;
lhm_fuelstation_cfgTrucks = ["C_Van_01_fuel_F","B_Truck_01_fuel_F"];
nn_empInUse = false;
LHM_settings_colorC_inuse = false;
spawningCam = false;
lhm_all_tasks = [];
LHM_haseventbox=false;
lhm_safezoneList =
[

]; // Add Safezone Markers here

/*
	********************** Variablen Costum ****************************
	******** Hier stehen nicht alle custom Variablen, Ba ^^ ************
*/


// ---------------------AWS-System--------------------------------------
AWS_Body = objNull;
AWS_Working = false;
AWS_Running = false;
AWS_HD_Running = false;
AWS_Leg_Wound = false;
AWS_Blood = 12000;
AWS_CONFIG =
[
	false, //"broken_left_leg"
	false, //"broken_right_leg"
	false, // "broken_left_arm"
	false, //"broken_right_arm"
	false, //"bullet_wound_left_arm"
	false, //"Bullet_wound_right_arm"
	false, //"bullet_wound_left_leg"
	false, //"bullet_wound_right_leg"
	false, //"bullet_wound_torso"
	false, //"big_wound_torso"
	false, //"big_wound_left_arm"
	false, //"big_wound_right_arm"
	false, // "big_wound_left_leg"
	false, //"big_wound_right_leg"
	false, //"traumatic_brain_injury"
	false // "fever"
];





// *********************************************************************

LHM_CRAFTING = false;
LHM_gastations_captured = [];
LHM_money_circle_legal = false;
LHM_money_circle_illegal = false;
LHM_injection = false;
LHM_initDone = false;
LHM_gastations_owned = [];

LHM_Small_Radar_on = false;

LHM_Own_playertags_on = false;
//      --------------------- Gericht  -------------------------------------
LHM_Geschworene_LIMIT = 13; // Gericht, Maximale Anzahl an Geschworenen (nicht höher als 13 stellen) - sind weniger als 13 infrage kommende da wird das Gericht nicht starten
LHM_Geschworene_MIND = 3;  // minimale Anzahl an nötigen Geschworenen damit das Gericht zusammenkommmt
LHM_Geschworene_ASKED = 101; //Anzahl an Bürgern die gefragt werden (Kann man eig so hoch stellen wie man will)
LHM_Gericht = false;

//    ---------------------- Krankheiten -----------------------------------
LHM_disease = 1;  //krankheiten, 1 = gesund //  2 = infiziert
LHM_Disease_healed = false;  //Krakheiten BA
LHM_disease_running = false;

//    -----------------------  Custom Vehicle Shop // Showcase -------------

LHM_VehShop_Showcase = false;
LHM_shop_show_vehicle = ObjNull;
LHM_VehShop_Dir = 0;
LHM_shop_Rotate_speed = 0.2;
LHM_shop_cam = ObjNull;
LHM_shop_light = ObjNull;
LHM_COP_BUILD_OBJ = objNull;
//    -----------------------  Anti Side Channel Skript  -----------------
LHM_Side_Warnings = 0;  //Anti Side channel skript
//    -----------------------  Dialog Variablen  -----------------
LHM_Click = false; // Dialog System (Barney)
LHM_transfer_cooldown = false;  // Cooldown für Überweisungen
LHM_quick_change_virtitem = 10;  // T Inventar Quickchange ändern
LHM_Trunk_Anti_Dupe = "";

LHM_Abzeichen = 0;

// ------------------------ Marker Menü // Z-Menü ------------------------
LHM_Marker_all_Farm = true;
LHM_Marker_illegal_Farm = true;
LHM_Marker_legal_Farm = true;
LHM_Marker_Police = true;
LHM_Marker_Medic = true;
LHM_Marker_Basen = true;
LHM_Marker_Gang = true;
LHM_Marker_Tankstellen = true;
LHM_Marker_all_Shops = true;
LHM_Marker_legal_Shops = true;
LHM_Marker_illegal_Shops = true;
LHM_Marker_LSA = true;
LHM_Marker_Sonstige = true;
LHM_Marker_Garagen = true;
LHM_Marker_DP = true;
LHM_Marker_Lizenzen_shops = true;
LHM_Marker_atm = true;
LHM_Marker_ChopChop = true;

/*
	********************************************************************
	********************** Bank Heist Variables ************************
	********************************************************************
*/
LHM_Bank_invite_costs = 7500;  // Kosten für den Invite einer Person in die Bank Gruppe
LHM_Group_Bank_max_Members = 20; // Maximale Gruppengröße für die Bank
LHM_group_Bank = [];
blastingChargePlacements = [bankWall1,bankWall2,bankWall3,bankWall4]; // add new object vars here, this object can used for the democharge
//The input text is what the display shows
LHM_InputTextKeyPad = "";
//clear text is to reset the display
LHM_ClearTextKeyPad = "Enter Keycode";
//this is the keypads output.
LHM_OutputTextKeyPad = "";
LHM_currentKeyCodeKeyPad = "";
BOMBARMED = false;
CODEINPUT = [];
CODE = [];
WIRE = [];
LHM_BANK_Way = "";
DiagTemp = [];
BankHeistState = -1;

/*
	********************************************************************
	********************** Profile Saved Settings **********************
	********************************************************************
*/
LHM_settings_sidechat = profileNamespace getVariable["LHM_settings_sidechat",true];
LHM_settings_tagson = profileNamespace getVariable["LHM_settings_tagson",true];
LHM_settings_revealObjects = profileNamespace getVariable["LHM_settings_revealObjects",true];
LHM_settings_AutoViewDistance = profileNamespace getVariable["LHM_settings_AutoViewDistance",true];
LHM_settings_viewDistanceFoot = profileNamespace getVariable["LHM_settings_viewDistanceFoot",1500];
LHM_settings_viewDistanceCar = profileNamespace getVariable["LHM_settings_viewDistanceCar",1500];
LHM_settings_viewDistanceAir = profileNamespace getVariable["LHM_settings_viewDistanceAir",1500];
LHM_Color_Correction = profileNamespace getVariable["LHM_Color_Correction",100];

/*
Casino Config
*/
king_gamble_roll_time                               = 5; //the duration of one gamble (how long the dice rolls) only animation stuff but don´t try 0... ;o)
king_gamble_max_bet                                 = 10000; //Dollar
king_gamble_send_watched_illegal_gambling_to_chat   = 1;  //wenn der Spieler erwischt wurde kann eine Nachricht an alle gesendet werden. Toll? Keine Ahnung ;o)    0=nicht senden, 1=senden
king_gamble_watched_illegal_gambling_percent        = 5;  //Die Wahrscheinlichkeit ob ein Spieler beim illegalen Casino beobachtet wird oder nicht [0...100%] 0%=never, 100%=everytime  --> Er kommt dann natürlich auf die Wantedliste ;o)
king_gamble_add_lost_money_to_the_jackpot_percent   = 20; //Soviel Prozent vom verlorenen Geld kommt in den Jackpot
king_gamble_send_jackpot_win_to_chat                = 1;  //0=nicht senden, 1=senden
king_gamble_player_is_blocked_after_gambling        = 10; //seconds
king_gamble_reroll_if_won_factor_bandit             = 3;  //0...10 (0=never; 10=everytime)
king_gamble_reroll_if_won_factor_dice               = 1;  //0...10 (0=never; 10=everytime)

////////////////////////////////////////////////////////////////////////////////////////////////
//ACHTUNG DIE FOLGENDEN ARRAYS DÜRFEN ZWAR VERLÄNGERT WERDEN UM WEITERE CASINOS EINZUFÜHREN,
//MÜSSEN ABER AUF JEDEN FALL ALLE GLEICH LANG SEIN!!!!!!!!!!!!!!!!!!!!!
////////////////////////////////////////////////////////////////////////////////////////////////

//Slotmaschine
king_gamble_bandit_win_factor_two_of_a_kind     = [2,  5,    201];   //zwei Gleich bei der Slotmachine
king_gamble_bandit_win_factor_three_of_a_kind   = [5, 10,   2002];  //zwei Gleich bei der Slotmachine

//Dice
king_gamble_dice_win_factor_two_of_a_kind       = [5,  10,    203];   //Pasch beim Würfeln
king_gamble_dice_win_factor_sum_seven           = [2, 5,   2004];  //Summe 7 beim Würfeln
king_gamble_casino_is_illegal                   = [0,   1,      1];     //0=nicht illegal, 1=illegal
////////////////////////////////////////////////////////////////////////////////////////////////

//Text
king_gamble_title_text                                      = "Loewenherz - Casino";
king_gamble_won_text                                        = localize "STR_CASINO_WON";
king_gamble_lost_text                                       = localize"STR_CASINO_LOSE";
king_gamble_you_cant_gamble_more_then                       = localize"STR_CASINO_NOBET";
king_gamble_please_enter_a_value_above_zero                 = localize"STR_CASINO_ABOVENULL";
king_gamble_this_isnt_an_actual_number_format               = localize"STR_CASINO_NOTVALID";
king_gamble_not_that_much_money                             = localize"STR_CASINO_NOT_ENOUGH_MONEY";
king_gamble_blocked_please_wait                             = localize"STR_CASINO_WAIT";
king_gamble_you_have_been_watched_gambling_illegal          = localize"STR_CASINO_ILLEGAL_WATCHED";
king_gamble_send_watched_illegal_gambling_to_chat_message   = localize"STR_CASINO_ILLEGAL_GAMBLING"; //vor dem Text steht immer der Name des Spielers
king_gamble_send_jackpot_won_to_chat_message                = localize"STR_CASINO_JACKPOT_HIT"; //vor dem Text steht immer der Name des Spielers
king_gamble_jackpot_won_text                                = localize"STR_CASINO_JACKPOT_HIT";
king_gamble_jackpot_rules_text                              = "(Jackpot of Slotmaschine 3x <img size='1.0' image='core\casino\icons\fruit_001.paa'/>)"; //vor dem Text steht immer der Name des Spielers
king_gamble_too_far_away_from_npc                           = localize"STR_CASINO_FARWAY";

//////////////////////////////////
//Variables please don´t change
//////////////////////////////////
king_gamble_roll_time_to_wait = 0;     //the time the gamble rolls
king_gamble_roll_timer_is_running = 0; //to prevent multiple timer threads
king_gamble_last_type = "Dice";
king_gamble_casino_idx = 0; //parameter kommt vom aufrufenden NPC //0...n damit wählt man im Gewinnarray die Position aus
king_gamble_player_is_blocked = 0; //0=not blocked, 1=blocked
king_gamble_unblock_time = 0;
king_gamble_get_data_thread_is_running = 0;
king_gamble_jackpot = [-1, -1]; //[legal, illegal]
king_gamble_npc_name = ""; //der Name des Casino NPC


// Player Buff Settings
LHM_NanoBotsDuration = 5400;
LHM_NanoBotsBuffTimer = 0;
LHM_AdrenalinDuration = 3600;
LHM_AdrenalinBuffTimer = 0;
LHM_SoylentGreenBuffDuration = 10800;
LHM_SoylentGreenBuffTimer = 0;

LHM_Donator_Cop_Items =
[
	[
	"LHM_NanoBots",
	"LHM_Adrenalin",
	"LHM_SoylentGreen",
	"LHM_Satellite",
	"LHM_TazerMine",
	"LHM_TazerBoundingMine",
	"LHM_TripwireTazerMine",
	"LHM_TazerGranade",
	"LHM_Speedtrap"
	],
	[3,2,1,3,3,3,3,3,8]
];

LHM_Donator_Sec_Items =
[
	[
	"LHM_NanoBots",
	"LHM_Adrenalin",
	"LHM_SoylentGreen"
	]
];
LHM_lhm_Inv_Items =
[
	"lhm_inv_NanoBots",
	"lhm_inv_Adrenalin",
	"lhm_inv_SoylentGreen",
	"lhm_inv_Satellite",
	"lhm_inv_TazerMine",
	"lhm_inv_TazerBoundingMine",
	"lhm_inv_TripwireTazerMine",
	"lhm_inv_TazerGranade",
	"lhm_inv_roadbarrier",
	"lhm_inv_roadcone",
	"lhm_inv_speedtrap"
];
LHM_Sell_Array =
[
	["LHM_NanoBots",0],
	["LHM_Adrenalin",0],
	["LHM_SoylentGreen",0],
	["LHM_Satellite",0],
	["LHM_TazerMine",0],
	["LHM_TazerBoundingMine",0],
	["LHM_TripwireTazerMine",0],
	["LHM_TazerGranade",0],
	["LHM_RoadBarrier",0],
	["LHM_Roadcone",0],
	["LHM_Speedtrap",0]
];
LHM_Buy_Array =
[
	["LHM_NanoBots",3000],
	["LHM_Adrenalin",2000],
	["LHM_SoylentGreen",1000],
	["LHM_Satellite",15000],
	["LHM_TazerMine",2000],
	["LHM_TazerBoundingMine",2000],
	["LHM_TripwireTazerMine",2000],
	["LHM_TazerGranade",2000],
	["LHM_RoadBarrier",1000],
	["LHM_Roadcone",500],
	["LHM_Speedtrap",5000]
];


/*
Radio Config
["class",time in Seconds"]
*/
music =
[
	["radio1",30.000],
	["radio2",30.000],
	["radio3",30.000],
	["radio4",30.000],
	["radio5",30.000],
	["radio6",30.000],
	["radio7",30.000],
	["radio8",30.000],
	["radio9",30.000],
	["radio10",30.000],
	["radio11",30.000],
	["radio12",30.000],
	["radio13",30.000],
	["radio14",30.000],
	["radio15",30.000],
	["radio16",30.000],
	["radio17",30.000],
	["radio18",30.000],
	["radio19",30.000],
	["radio20",30.000],
	["radio21",30.000],
	["radio22",30.000],
	["radio23",30.000],
	["radio24",30.000],
	["radio25",30.000],
	["radio26",30.000],
	["radio27",30.000],
	["radio28",30.000],
	["radio29",30.000],
	["radio30",30.000],
	["radio31",30.000],
	["radio32",30.000],
	["radio33",30.000],
	["radio34",30.000],
	["radio35",30.000],
	["radio36",30.000],
	["radio37",30.000],
	["radio38",30.000],
	["radio39",30.000]
];

// Cop Radio
music2 =
[
	["radio1", 38.700],
	["radio2", 51.327],
	["radio3", 50.700],
	["radio4", 60.000]
];

// Cop Siren
music3 =
[
	["siren1", 9],
	["siren2", 7]
];


// ["Markername",Area Range]
blacklistedSpawnAreas =
[
	["Respawn_west",1200],
	["paintballarena",500],
	["fed_reserve",500],
	["courtMarker",50],
	["antiCombatlogMarker",30],
	["Event_BR",250]
];

//Persistent Saving
__CONST__(lhm_save_civ,true); //Save weapons for civs?
__CONST__(lhm_save_yinv,true); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(lhm_revive_cops,false); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(lhm_revive_fee,2000); //Fee for players to pay when revived.

//House Limit
__CONST__(lhm_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(lhm_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(lhm_gangUpgradeBase,10000); //MASDASDASD
__CONST__(lhm_gangUpgradeMultipler,2.5); //BLAH

__CONST__(lhm_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
lhm_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
lhm_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
lhm_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
lhm_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** lhm Variables *******
*****************************
*/
lhm_net_dropped = false;
lhm_hit_explosive = false;
lhm_siren_active = false;
lhm_sirenLight_active = false;
lhm_bank_fail = false;
lhm_use_atm = true;
lhm_is_arrested = 0;
lhm_delivery_in_progress = false;
lhm_action_in_use = false;
lhm_thirst = 100;
lhm_hunger = 100;
lhm_health = 100;
lhm_stamina = 100;
__CONST__(lhm_paycheck_period,5); //Five minutes
lhm_cash = 0;
__CONST__(lhm_impound_car,350);
__CONST__(lhm_impound_boat,250);
__CONST__(lhm_impound_air,850);
lhm_istazed = false;
lhm_my_gang = ObjNull;
lhm_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		lhm_atmcash = 10000; //Starting Bank Money
		lhm_paycheck = 750; //Paycheck Amount
	};
	case civilian:
	{
		lhm_atmcash = 25000; //Starting Bank Money
		lhm_paycheck = 350; //Paycheck Amount
	};
	case independent:
	{
		lhm_atmcash = 10000; //Starting Bank Money
		lhm_paycheck = 450; //Paycheck Amount
	};
	case east:
	{
		lhm_atmcash = 6000; //Starting Bank Money
		lhm_paycheck = 450; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
lhm_vShop_rentalOnly = [
	"O_MRAP_02_hmg_F",
	"Land_Pod_Heli_Transport_04_bench_F",
	"Land_Pod_Heli_Transport_04_medevac_F",
	"B_supplyCrate_F",
	"Box_IND_AmmoVeh_F",
	"Land_Pod_Heli_Transport_04_covered_F",
	"B_Slingload_01_cargo_F"
	];
__CONST__(lhm_vShop_rentalOnly,lhm_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

lhm_inv_items =
[

// AWS START
	"lhm_inv_tourniquet",
	"lhm_inv_Israeli_bandage",
	"lhm_inv_combat_gauze",
	"lhm_inv_druckverband",
	"lhm_inv_morphin",
	"lhm_inv_tabletten",
	"lhm_inv_schiene",
// AWS END
	// LHM Alcohol START
	"lhm_inv_cornmeal",
	"lhm_inv_beerp",
	"lhm_inv_whiskey",
	"lhm_inv_rye",
	"lhm_inv_hops",
	"lhm_inv_yeast",
	"lhm_inv_bottles",
	"lhm_inv_bottledshine",
	"lhm_inv_bottledbeer",
	"lhm_inv_bottledwhiskey",
	"lhm_inv_moonshine",
	"lhm_inv_mash",
	// LHM Alcohol END
	"lhm_inv_tracker", //GPS TRACKER
	"lhm_inv_tracker2", //GPS TRACKER
	//kippen start
	"lhm_inv_lzigarette",
	"lhm_inv_krauser",
	"lhm_inv_rooth",
	"lhm_inv_malle",
	"lhm_inv_stoivesant",
	//kippen end
	"lhm_inv_sensor",//Bewegungsmelder
	"lhm_inv_sensor1",//Bewegungsmelder
	"lhm_inv_graffiti", //LH Graffiti
	"lhm_inv_geocatch",
	"lhm_inv_gas",
	"lhm_inv_hacken",
	"lhm_inv_woodu",
	"lhm_inv_woodp",
	"lhm_inv_axe",
	"lhm_inv_egg",
	"lhm_inv_oilu",
	"lhm_inv_oilp",
	"lhm_inv_heroinu",
	"lhm_inv_heroinp",
	"lhm_inv_cannabis",
	"lhm_inv_marijuana",
	"lhm_inv_apple",
	"lhm_inv_rabbit",
	"lhm_inv_salema",
	"lhm_inv_ornate",
	"lhm_inv_mackerel",
	"lhm_inv_tuna",
	"lhm_inv_mullet",
	"lhm_inv_catshark",
	"lhm_inv_turtle",
	"lhm_inv_fishingpoles",
	"lhm_inv_water",
	"lhm_inv_donuts",
	"lhm_inv_turtlesoup",
	"lhm_inv_coffee",
	"lhm_inv_fuelF",
	"lhm_inv_fuelE",
	"lhm_inv_pickaxe",
	"lhm_inv_copperore",
	"lhm_inv_ironore",
	"lhm_inv_ironr",
	"lhm_inv_copperr",
	"lhm_inv_sand",
	"lhm_inv_salt",
	"lhm_inv_saltr",
	"lhm_inv_glass",
	"lhm_inv_tbacon",
	"lhm_inv_lockpick",
	"lhm_inv_redgull",
	"lhm_inv_peach",
	"lhm_inv_diamond",
	"lhm_inv_coke",
	"lhm_inv_cokep",
	"lhm_inv_diamondr",
	"lhm_inv_spikeStrip",
	"lhm_inv_rock",
	"lhm_inv_cement",
	"lhm_inv_goldbar",
	"lhm_inv_blastingcharge",
	"lhm_inv_boltcutter",
	"lhm_inv_defusekit",
	"lhm_inv_storagesmall",
	"lhm_inv_storagebig",
	"lhm_inv_roadbarrier1",  //roadbarrier
	"lhm_inv_roadcone1", //roadcone
	"lhm_inv_card", //Glückskarte
	"lhm_inv_uran", // neu
	"lhm_inv_uranwaste", // neu
	"lhm_inv_tabak", // neu
	"lhm_inv_zigarette", // neu
	"lhm_inv_kidney", // LH_Organ
	"lhm_inv_container", // LH_Container
	"lhm_inv_protest", //protestschild
	"lhm_inv_unpMeth", //Unprocessed Meth
	"lhm_inv_procMeth" //Processed Meth
];
lhm_inv_items = lhm_inv_items + LHM_lhm_Inv_Items; //Leo's Donator Stuff (Addon: lhm_itemshop)

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach lhm_inv_items;
//Licenses [license var, civ/cop]
lhm_licenses =
[
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_uran","civ"], // neu
	["license_civ_zigarette","civ"], // neu
	["license_civ_hunter","civ"], //bounty hunter license
	["license_civ_wood","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach lhm_licenses;

// papabears-persistent-proficiency-system //
lhm_prof =
[
	["Oil_Prof","civ"],
	["Iron_Prof","civ"],
	["Copper_Prof","civ"],
	["Heroin_Prof","civ"],
	["Cannabis_Prof","civ"],
	["Cocaine_Prof","civ"],
	["Salt_Prof","civ"],
	["Fruit_Prof","civ"],
	["Diamond_Prof","civ"],
	["Rock_Prof","civ"],
	["Sand_Prof","civ"],
	//["Meth_Prof","civ"],
	//["Krok_Prof","civ"],
	["Shining_Prof","civ"],
	["Brewing_Prof","civ"],
	["Distilling_Prof","civ"],
	["Bottling_Prof","civ"],
	//["Citizen_Prof","civ"],
	//["Criminal_Prof","civ"],
	//["Hunting_Prof","civ"],
	["Fishing_Prof","civ"],
	["Thief_Prof","civ"],
	//["Tobacco_Prof","civ"],
	["Cigarette_Prof","civ"],
	["Smoke_Prof","civ"], //20150905
	["Repair_Prof","civ"], //20150905
	["RedGull_Prof","civ"], //20150905
	//["shooting_Prof","civ"],
	//["ADAC_Prof","civ"],

	["Smoke_Prof","med"], //20150905
	["Repair_Prof","med"], //20150905
	["RedGull_Prof","med"], //20150905

	["Smoke_Prof","sec"], //20150905
	["Repair_Prof","sec"], //20150905
	["RedGull_Prof","sec"], //20150905
	//["shooting_Prof","sec"],
	//police jobs
	["Smoke_Prof","cop"], //20150905
	["Repair_Prof","cop"], //20150905
	["RedGull_Prof","cop"], //20150905
	["Ticket_Prof","cop"],
	["Arrest_Prof","cop"],
	["Impound_Prof","cop"],
	//["shooting_Prof","cop"],
	//["Repair_Prof","cop"],
	//["Hero_Prof","cop"],
	//["Rogue_Prof","cop"],
	//med jobs
	//["Repair_Prof","med"],
	["Revive_Prof","med"]
];

{missionNamespace setVariable[(_x select 0),[1,0]];} foreach lhm_prof;
// papabears-persistent-proficiency-system //

lhm_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
lhm_illegal_items =
[
	["moonshine",9000],["bottledshine",11000],["mash",5000], // LHM Alcohol
	["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],
	["marijuana",2000],["turtle",3000],["blastingcharge",20000],["boltcutter",1000],
	["uran",4500],["uranwaste",2000],["goldbar",5000],["unpMeth",1000],
	["procMeth",5000]
]; // neu


/*
	Sell / buy arrays
*/
sell_array =
[
// AWS START
	["tourniquet",0],
	["Israeli_bandage",0],
	["combat_gauze",0],
	["druckverband",0],
	["morphin",0],
	["tabletten",0],
	["schiene",0],
// AWS END
// LHM Alcohol START
	["bottledshine",15000],
	["bottledwhiskey",7500],
	["bottledbeer",6500],
	["moonshine",7000],
	["whiskey",4000],
	["beerp",4500],
	["mash",1500],
	["rye",2000],
	["hops",1800],
	["yeast",2000],
	["cornmeal",250],
	["bottles",50],
// LHM Alcohol END
	["tracker",0], //GPS TRACKER
	["tracker2",0],//GPS TRACKER 2 fuer cops
	//kippen start
	["lzigarette",0],
	["krauser",0],
	["rooth",0],
	["malle",0],
	["stoivesant",0],
	//kippen end
	["sensor",0],//Bewegungsmelder
	["sensor1",0],//Bewegungsmelder
	["graffiti",0], //LH Graffiti
	["geocatch",0],
	["gas",5500],
	["hacken",0],
	["woodu",0],
	["woodp",3000],
	["axe",0],
	["egg",0],
	["apple",50],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",750],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",500],
	["spikeStrip",1200],
	["cement",1950],
	["goldbar",95000],
	["uran",4500], // neu
	["zigarette",2600], // neu
	["kidney",3800], // LH_Organ
	["container",3000], // LH_Container
	["unpMeth",1000], //Unprocessed Meth
	["procMeth",5000] //Processed Meth

];
__CONST__(sell_array,sell_array);

buy_array =
[
	// AWS START
	["tourniquet",750],
	["Israeli_bandage",150],
	["combat_gauze",200],
	["druckverband",175],
	["morphin",500],
	["tabletten",50],
	["schiene",25],
// AWS END
// LHM Alcohol START
	["bottledshine",16000],
	["bottledwhiskey",8500],
	["bottledbeer",7500],
	["moonshine",8000],
	["whiskey",5000],
	["beerp",5000],
	["cornmeal",500],
	["mash",2500],
	["bottles",100],
// LHM Alcohol END
	["tracker",30000], //GPS TRACKER
	["tracker2",10000],//GPS TRACKER 2 fuer cops
	//kippen start
	["lzigarette",500],
	["krauser",1000],
	["rooth",1500],
	["malle",2000],
	["stoivesant",2500],
	//kippen end
	["sensor",20000],//Bewegungsmelder
	["sensor1",5000],//Bewegungsmelder
	["graffiti",2000], //LH Graffiti
	["geocatch",1000],
	["gas",15000],
	["hacken",100],
	["woodu",10000],
	["woodp",10000],
	["axe",500],
	["egg",5000],
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",1500], // LHM new price
	["roadbarrier1",500], // LHM new item
	["roadcone1",200], // LHM new item
	["speedtrap",5000], // LHM new item
	["card",2000],  //scratchcard
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",2500],
	["zigarette",3000],
	["blastingcharge",55000],
	["boltcutter",8500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["container",5000], // LH_Container
	["protest",500],  //Protestschild
	["unpMeth",1000] //Unprocessed Meth
];
__CONST__(buy_array,buy_array);
/*
lhm_weapon_shop_array =
[
	["arifle_sdar_F",7500],
	["hgun_P07_snds_F",650],
	["hgun_P07_F",1500],
	["ItemGPS",45],
	["ToolKit",75],
	["FirstAidKit",65],
	["Medikit",450],
	["NVGoggles",980],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",35],
	["ItemCompass",25],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",500],
	["arifle_Katiba_F",5000],
	["30Rnd_556x45_Stanag",65],
	["20Rnd_762x51_Mag",85],
	["30Rnd_65x39_caseless_green",50],
	["DemoCharge_Remote_Mag",7500],
	["SLAMDirectionalMine_Wire_Mag",2575],
	["optic_ACO_grn",250],
	["acc_flashlight",100],
	["srifle_EBR_F",15000],
	["arifle_TRG21_F",3500],
	["optic_MRCO",5000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",500],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30]
];
*/
lhm_weapon_shop_array = []; // LHM Removed all Items to prevent Duping  !!!
__CONST__(lhm_weapon_shop_array,lhm_weapon_shop_array);

lhm_garage_prices =
[
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",70000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_box_F", 35000],
	["O_MRAP_02_F",45000],
	["B_Heli_Light_01_F",20000],
	["O_Heli_Light_02_unarmed_F",60000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_MRAP_01_F",12500],
	["B_Heli_Transport_01_F",40000],
	["B_G_Offroad_01_armed_F",35000],
	["B_Heli_Transport_01_camo_F",50000],	// LHM GH Rebellen
	["I_Heli_light_03_unarmed_F",20000], //BL Hellcat
	["O_Heli_Transport_04_F",20000], //BL Taru COP
	["O_Heli_Transport_04_bench_F",40000], //BL Taru COP
	["B_Heli_Transport_03_unarmed_F",80000] //BL Huron
];
__CONST__(lhm_garage_prices,lhm_garage_prices);

lhm_garage_sell =
[
	["B_Quadbike_01_F",950],
	["C_Hatchback_01_F",4500],
	["C_Offroad_01_F", 6500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",15000],
	["C_Van_01_transport_F",25000],
	["C_Hatchback_01_sport_F",7500],
	["C_Van_01_fuel_F",3850],
	["I_Heli_Transport_02_F",125000],
	["C_Van_01_box_F",35000],
	["I_Truck_02_transport_F",49800],
	["I_Truck_02_covered_F",62000],
	["B_Truck_01_transport_F",135000],
	["B_Truck_01_box_F", 150000],
	["O_MRAP_02_F",65000],
	["B_Heli_Light_01_F",57000],
	["O_Heli_Light_02_unarmed_F",72500],
	["C_Rubberboat",950],
	["C_Boat_Civil_01_F",6800],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_Boat_Armed_01_minigun_F",21000],
	["B_SDV_01_F",45000],
	["B_G_Offroad_01_armed_F",250000],
	["O_Truck_03_device_F",200000],
	["O_Truck_03_covered_F",100000],
	["B_MRAP_01_F",10000]
];
__CONST__(lhm_garage_sell,lhm_garage_sell);

lhm_containers=
[
	"Land_Pod_Heli_Transport_04_bench_F",
	"Land_Pod_Heli_Transport_04_medevac_F",
	"B_supplyCrate_F",
	"Box_IND_AmmoVeh_F",
	"Land_Pod_Heli_Transport_04_covered_F",
	"B_Slingload_01_cargo_F"
];

lhm_masks= ["H_Shemag_khk","H_Shemag_tan","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_khk","H_ShemagOpen_tan"]; //headgear wich hides the players identity

__CONST__(lhm_containers,lhm_containers);


//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------LHM-Base-LEVEL------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
LHM_BASE_LVL = 0;

_flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"sec"};};
{

    _data = missionNamespace getVariable (_x select 0);
    _profLevel = _data select 0;

    if(_x select 1 == _flag) then {
        LHM_BASE_LVL = LHM_BASE_LVL + _profLevel;

    };
} foreach lhm_prof;
//////////////////////////////////////////////////////////////////////////////////////////////////////////////
//---------------------------------LHM-Base-LEVEL------------------------------------------------------------
//////////////////////////////////////////////////////////////////////////////////////////////////////////////