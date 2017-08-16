/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Assigns all of a players global starting variables
*/
DS_houseWarning = true;
//Connection
	DS_dataReceived = false;
	DS_player_setup = false;
	DS_dbFailSafe = 0;
//Saved Variables
	DS_donorLevel = 0;
	DS_adminLevel = 0;
	DS_jailed = false;
	DS_WLLevel = 0;
	DS_coin = 0;
	DS_atmcoin = 100000;
	DS_wanted_stats = [0];
	DS_moral = 900;
	DS_infoArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	DS_houses = [];
	DS_locker = [[],0];
	DS_realEstateArray = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0];
	civ_gear = [];
	wl_gear = [];
//Game related
	//Some of these need to be moved to civilian only
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
	DS_cursorTarget = ObjNull;
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
	DS_earPlugs = false;
	DS_dataSynced = false;
	DS_tags = false;
	DS_mechanic = false;
	DS_medic = false;
//Temp globals
	DS_spawnPoint = nil;
	DS_className = nil;
	DS_price = nil;
	DS_shopIndex = nil;
	DS_usedSiren = false;
	DS_donorUsed1 = false;
	DS_donorUsed2 = false;
	DS_donorUsed3 = false;
//Variables on players unit
	player setVariable["cuffed",FALSE,TRUE];
	player setVariable["escorted",FALSE,TRUE];
	player setVariable["cuffedVeh",FALSE,TRUE]; 	
	player setVariable["realname",profileName,true]; 	
	player setVariable["medic",FALSE,TRUE];
	player setVariable["mechanic",FALSE,TRUE];
	player setVariable["security",FALSE,TRUE];
	player setVariable["DSadmin",FALSE,TRUE];
	player setVariable["surrender",FALSE,TRUE];
	