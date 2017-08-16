/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
*/
life_pickingUp = false;
jail_clothing_uniform = "";
jail_clothing_backpack = "";
jail_clothing_vest = "";
//
life_shopInfo_array = [];
life_shop_cart = [];
life_shop_cartTotal = 0;
//
AN_Licenses = [];
AN_Inventory = [];
AN_Skills = [];
//Exp Event
EXPEvent = 1; //1 DEFAULT
//
life_level = 0;
life_exp = 0;
life_nextExp = 0;
life_skillpoint = 0;
an_cash = 0;
an_bank = 0;
//
Message1Active = false;
Message2Active = false;
Message3Active = false;
Message4Active = false;
Message5Active = false;
Message6Active = false;
NotificationArray = [];
NotificationHUD = false;
//
UpdateThread = -1;
MedicThread = -1;
FullThread = -1;
PayCheckThread = -1;
AlcoholThread = -1;
//TeamspeakThread = -1;
//
LockerInventory = [];
playerInventoryArray = [];
RentTime = [];
//
life_paycheck = 100;
rb_dead_gear = [];
lockerOpen = false;
TruckStartTime = 0;
life_killed = false;
life_vehicles = [];
life_gangData = [];
life_thirst = 5000;
life_hunger = 5000;
life_isGov = false;
LawyerDutyOn = false;
OnLawyerJob = false;
hittime = 0;
life_voted = false;
life_popVot = false;
life_govCash = -1;
life_govPop = 0;
life_tax = 0;
life_isinjured = false;
life_ishungry = false;
life_isthirst = false;
life_isbleeding = false;
life_islegbroken = false;
life_BrokenLeg = false;
life_rambofactor = 1;
life_vehicleShopZoom = true;
life_diagWaiting = false;
life_lockingVeh = false;
life_protectiveDetail = false;
life_spawnedIn = false;
//TFR
tf_no_auto_long_range_radio = true;
tf_west_radio_code = "";
tf_east_radio_code = tf_west_radio_code;
tf_guer_radio_code = tf_west_radio_code;
tf_civ_radio_code = tf_west_radio_code;
TF_defaultWestPersonalRadio = "";
TF_defaultEastPersonalRadio = "";
TF_defaultGuerPersonalRadio = "";
TF_defaultWestRiflemanRadio = "";
TF_defaultEastRiflemanRadio = "";
TF_defaultGuerRiflemanRadio = "";
//
life_respawned = false;
Camrunning = false;
life_showingHUD = false;
life_ranstatthread = false;
life_skillLegal = true;
life_smartphoneTarget = objNull;
life_escortTarget = objNull;
alcohol_level = 0;
drug_level = 0;
//Actions
life_redgull_effect = 0;
life_truck_in_progress = false;
life_delivery_in_progress = false;
life_is_processing = false;
life_impound_inuse = false;
life_action_inUse = false;
life_isPlacing = false;
life_objectPlacing = objNull;
life_knockout = false;
life_mouseHolding = false;
life_interrupted = false;
life_respawned = false;
life_combat_lastTick = diag_tickTime;
life_playTime = diag_tickTime;
//Backup and SuicideVest
life_callBackup = true;
life_backup = false;
//Admin
life_firstSpawn = true;
life_god = false;
life_frozen = false;
life_markers = false;
life_fadeSound = false;
life_systemChat = false;
life_silentMode = false;
//Weight
life_maxWeight = getNumber(missionConfigFile >> "Life_Settings" >> "total_maxWeight");
life_maxWeightT = getNumber(missionConfigFile >> "Life_Settings" >> "total_maxWeightT");
life_carryWeight = call life_fnc_virtualInventoryWeight;
//Jail
life_is_arrested = false;
life_arrested_time = 0;
life_arrested_reason = "";
life_net_dropped = false;
life_use_atm = true;
life_istazed = false;
//Check
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = objNull;
player_stripped = false;
life_garage_store = false;
life_net_dropped = false;
life_siren_active = false;
life_horn = false;
life_phaser = false;
life_dixie = false;

//life_respawn_timer = 10;
life_settings_viewDistanceFoot = 1250;
life_settings_viewDistanceCar = 1250;
life_settings_viewDistanceAir = 1250;
tawvd_addon_disable = true;

EAL_sellSpamTries = 0;
EAL_canSell = true;
EAL_slowDownSon = 0;
EAL_autoClickAmount = 0;
life_actionRestrict = false;
//Medic
DebugHintBool = false; // Defines whether or not to show the debug hint.
InstantUnconcsCoeff = 1; // Coefficient for chance to be instantly knocked out upon being hit.
BleedUnconcsCoeff = 1; // Coefficient for chance to bleed out into unconsciousness.
UnconcsAutorecoverCoeff = 1; // Coefficient for chance to autorecover from standard unconsciousness (when bleeding is stopped).
BleedCoeff = 10; // Coefficient for bleeding added when hit.
InstantBleedCoeff = 600; // Coefficient for instant blood loss upon being hit.
BloodClotRate = 0.99; // Blood clot rate. Bleed rate is multiplied by this every second. Set to 1 to effectively disable. Setting it to a value greater than 1 (or smaller than 0) may result in interesting/awful consequences.
BaseRegenRate = 3; // The base regen rate.
MaxRegenRate = 19; // The upper limit for regen rate. If the regen rate goes higher than this, you will go into overdose-unconsciousness.
RegenRateRecover = 0.04; // Rate at which the regen rate returns to normal
RegenRateRecoverUnconcs = 0.16; // Additional recovery for regen rate when unconscious due to overdose.
OverdoseUnconcsRecoverChance = 0.5; // The chance each second for an overdose-unconscious player to recover (after returning to below the max regen rate).
UnconcsRecoverFatigue = 1; // setFatigue value for after recovering from unconsciousness. Set to any negative to disable.
UntrainedReviveCoeff = 3; // Multiplier for time spent to revive if the reviving player is not a medic.
RecoverControlsDelay = 3; // Delay between the world fading back in and control being handed back to the player.
InvoluntaryFireChance = 0.2; // Chance of involuntary weapon discharge upon being hit in the arm.
PainFlashCoeff = 50; // Multiplier for how long the screen effect upon being hit takes to fade out
BleedWarnCoeff = 0.1; // Multiplier for how long the bleeding indicator takes to fade out
VignetteAlphaExp = 1; // Exponent for the damage vignette. Higher values will make it take longer to start fading in, but fade in quicker as blood level decreases.
VignetteAlphaMin = 1500; // When the blood level falls below this value, the damage vignette will be completely opaque.
VignetteAlphaMax = 5000; // When the blood level rises above this value, the damage vignette will be completely invisible.
