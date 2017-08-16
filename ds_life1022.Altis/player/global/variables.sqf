/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Assigns all of a players global starting variables
*/

DS_houseWarning = true;

//Connection
DS_debug = false;
DS_dataReceived = false;
DS_player_setup = false;
DS_dbFailSafe = 0;

//Saved Variables
DS_amUnit = player;
DS_licenseIndex = 0;
DS_tokenMission = -1;
DS_donorLevel = 0;
DS_adminLevel = 0;
DS_jailed = false;
DS_WLLevel = 0;
DS_coin = 0;
DS_atmCoin = 100000;
DS_wanted_stats = [0];
DS_moral = 900;
DS_infoArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
DS_houses = [];
DS_locker = [[],0];
DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
DS_realMode = false;

//Game related
//Some of these need to be moved to civilian only
DS_soundPlayed = false;
DS_faceArray = ["AfricanHead_01","AfricanHead_02","AfricanHead_03","AsianHead_A3_01","AsianHead_A3_02","AsianHead_A3_03","GreekHead_A3_01","GreekHead_A3_02","GreekHead_A3_03","GreekHead_A3_04","GreekHead_A3_05","GreekHead_A3_06","GreekHead_A3_07","GreekHead_A3_08","GreekHead_A3_09","PersianHead_A3_01","PersianHead_A3_02","PersianHead_A3_03","NATOHead_01","WhiteHead_02","WhiteHead_03","WhiteHead_04","WhiteHead_05","WhiteHead_06","WhiteHead_07","WhiteHead_08","WhiteHead_09","WhiteHead_10","WhiteHead_11","WhiteHead_12","WhiteHead_13","WhiteHead_14","WhiteHead_15"];
DS_spam = 0;
DS_currentTask1 = "";
DS_currentTask2 = "";
DS_medicRevived = false;
DS_vehUpgrades = [0,0,0,0,0,0,0,0,0,0];
DS_skyDiving = false;
DS_rebelAdv_removed = false;
life_cash = 0;
life_atmCash = 0;
DS_vehicleLoading = false;
DS_viewDistance = 1500;
DS_knockout = false;
DS_safezone_shooting = 0;
DS_spotted = false;
DS_requestedMedic = false;
DS_waitToSync = false;
DS_houseMarkers = [];
DS_dusting = false;
DS_fuelMission = false;
DS_insurance_vehicles = 0;
DS_nlr_time = 0;
DS_warned = false;
DS_revived = false;
DS_NLR = false;
DS_markers = false;
DS_frozen = false;
DS_god = false;
DS_jail_info = [false,false,false,false,false,false];
DS_perkLevel = 0;
DS_questLog = [0,0,0,0,0,0,0,0];
DS_bailValue = 0;
DS_drunk = 0;
DS_maxWeight = 24;
DS_currentWeight = 0;
DS_illegalMoney = 0;
DS_jailRelease = false;
DS_civRecords = [];
DS_bankInsurance = false;
DS_keyRing = [];
DS_headShot = false;
DS_messageLog = [];
DS_newsLog = [];
DS_recentCallers = [];
DS_blockedCallers = [];
DS_hunger = 100;
DS_thirst = 100;
DS_killer = "";
DS_armour = 0;
DS_repawned = false;
DS_doingStuff = false;
DS_moved = false;
DS_cursorTarget = objNull;
DS_bodyArmour = 0;
DS_impounding = false;
DS_superRestrained = false;
DS_canWork = true;
DS_mining = false;
DS_playTime = 0;
DS_storingVehicle = false;
DS_canSync = true;
DS_convoy = false;
DS_inZone = false;
DS_tazed = false;
DS_sirenActive = false;
DS_questFocus = 0;
DS_iedActive = false;
DS_ied = false;
DS_lotto = [];
DS_menuOpened = false;
DS_setTask = false;
DS_earPlugs = 0;
DS_dataSynced = false;
DS_tags = false;
DS_mechanic = false;
DS_medic = false;
DS_amSearchText = "";
DS_amFncsLoaded = false;
DS_amShowIcons = false;
DS_cmGearFncsLoaded = false;
DS_cmItemFncsLoaded = false;
DS_cmMoneyFncsLoaded = false;
DS_cmVehiclesFncsLoaded = false;
DS_vehicleGarage = [];
DS_primaryWepItems = [];
DS_secondaryWepItems = [];
//DS_headShotChecked = false;
DS_convoyTask = taskNull;
DS_carBombTask = taskNull;
DS_carBombEndTask = taskNull;
DS_civJobTask = taskNull;
DS_patrolTask = taskNull;

//Temp globals
DS_spawnPoint = nil;
DS_className = nil;
DS_price = nil;
DS_shopIndex = nil;
DS_usedSiren = false;
DS_donorUsed1 = false;
DS_donorUsed2 = false;
DS_donorUsed3 = false;
DS_doingAnimation = false;

//Variables on players unit
player setVariable ["restrained",false,true];
player setVariable ["escorted",false,true];
player setVariable ["escortCooldown",false,true];
player setVariable ["realName",profileName,true];
player setVariable ["medic",false,true];
player setVariable ["mechanic",false,true];
player setVariable ["security",false,true];
player setVariable ["DSadmin",false,true];
player setVariable ["surrender",false,true];
player setVariable ["headShot",false,true];
player setVariable ["breakingNLR",false,true];
player setVariable ["selections",[],true];
player setVariable ["getHit",[],true];