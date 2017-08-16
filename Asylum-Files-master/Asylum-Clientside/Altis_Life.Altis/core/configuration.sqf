/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

************************************
****** Backend (lol) Variables *****
************************************
*/
life_bank_safe_pos = switch (worldName) do
{
	case "Altis": { [[16091.9,17070.5,0.00143814],[16091,17082,0.00144005],[16089.8,17092.7,0.00144005],[16022.9,17033.9,0.00143623],[16029.5,17042.1,0.00144672],[16015.2,17050.5,0.00144196],[16005.6,17043.6,0.00143623],[16017.4,16956.9,0.00144005],[16079.3,16916.9,0.00143719],[16147.6,16951.9,0.00143051],[16075.9,17089.9,0],[16017.3,16956.7,0],[16161.9,16966.5,0],[16151.7,17042,0],[16012,16863,0],[16013.1,16855.2,3.1]] };
	case "Stratis": { [[1613.46,5174.35,0.00143862],[1607.66,5153.66,0.00143909],[1652.66,5093.51,0.00143862],[1657.2,5110.56,0.00143862],[1570.62,5127.24,0.00143909],[1592.59,5071.92,0.00143957]] };
	case "Australia": { [[19784,24306,0],[19734,24345,0],[19904,24300,0],[19914,24288,0],[19961,24257,0],[19970,24245,0]] };
};
life_race = 0;
life_race_waypoints = [
	["race_1_start", "race_1_wp_1", "race_1_wp_2", "race_1_wp_3", "race_1_wp_4", "race_1_wp_5", "race_1_wp_6", "race_1_wp_7", "race_1_wp_8", "race_1_wp_9", "race_1_wp_10", "race_1_wp_11", "race_1_wp_12", "race_1_wp_13", "race_1_wp_14", "race_1_wp_15", "race_1_wp_16", "race_1_wp_17", "race_1_wp_18", "race_1_wp_19", "race_1_wp_20", "race_1_end"],
	["race_2_start", "race_2_wp_1", "race_2_wp_2", "race_2_wp_3", "race_2_wp_4", "race_2_wp_5", "race_2_wp_6", "race_2_wp_7", "race_2_wp_8", "race_2_wp_9", "race_2_wp_10", "race_2_wp_11", "race_2_wp_12", "race_2_wp_13", "race_2_wp_14", "race_2_wp_15", "race_2_wp_16", "race_2_wp_17", "race_2_wp_18", "race_2_wp_19", "race_2_end"],
	["race_3_start", "race_3_wp_1", "race_3_wp_2", "race_3_wp_3", "race_3_wp_4", "race_3_wp_5", "race_3_wp_6", "race_3_wp_7", "race_3_wp_8", "race_3_wp_9", "race_3_wp_10", "race_3_wp_11", "race_3_wp_12", "race_3_wp_13", "race_3_wp_14", "race_3_wp_15", "race_3_wp_16", "race_3_wp_17", "race_3_wp_18", "race_3_wp_19", "race_3_wp_20", "race_3_wp_21", "race_3_wp_22", "race_3_end"],
	["race_4_start", "race_4_wp_1", "race_4_wp_2", "race_4_wp_3", "race_4_wp_4", "race_4_wp_5", "race_4_wp_6", "race_4_wp_7", "race_4_wp_8", "race_4_wp_9", "race_4_wp_10", "race_4_wp_11", "race_4_wp_12", "race_4_wp_13", "race_4_wp_14", "race_4_wp_15", "race_4_wp_16", "race_4_wp_17", "race_4_wp_18", "race_4_wp_19", "race_4_wp_20", "race_4_wp_21", "race_4_wp_22", "race_4_wp_23", "race_4_wp_24", "race_4_wp_25", "race_4_wp_26", "race_4_wp_27", "race_4_wp_28", "race_4_wp_29", "race_4_wp_30", "race_4_wp_31", "race_4_wp_32", "race_4_wp_33", "race_4_wp_34", "race_4_wp_35", "race_4_wp_36", "race_4_wp_37", "race_4_wp_38", "race_4_wp_39", "race_4_wp_40", "race_4_wp_41", "race_4_wp_42", "race_4_wp_43", "race_4_wp_44", "race_4_wp_45", "race_4_wp_46", "race_4_wp_47", "race_4_wp_48", "race_4_wp_49", "race_4_wp_50", "race_4_wp_51", "race_4_wp_52", "race_4_wp_53", "race_4_wp_54", "race_4_wp_55", "race_4_wp_56", "race_4_wp_57", "race_4_end"]
];
if (worldName == "Australia") then
{
	life_race_waypoints pushBack ["race_5_start", "race_5_wp_1", "race_5_wp_2", "race_5_wp_3", "race_5_wp_4", "race_5_wp_5", "race_5_wp_6", "race_5_wp_7", "race_5_wp_8", "race_5_wp_9", "race_5_wp_10", "race_5_wp_11", "race_5_wp_12", "race_5_wp_13", "race_5_wp_14", "race_5_wp_15", "race_5_wp_16", "race_5_wp_17", "race_5_wp_18", "race_5_wp_19", "race_5_end"];
};
life_phone_buttons = [
	["Admin", "icons\phone_admin.paa", "createDialog ""life_admin_menu""", "life_adminlevel > 0", "Access restricted administration menu"],
	["Camera", "icons\phone_camera.paa", "[] call BIS_fnc_camera; closeDialog 0;", "life_adminlevel > 0", "Open the admin camera"],
	["Group", "icons\phone_group.paa", "[] call life_fnc_groupMenu", "playerSide == civilian", "Join or create a temporary group"],
	["My Gang", "icons\phone_gang.paa", "createDialog ""life_my_gang_menu""", "playerSide == civilian", "View and/or manage your current gang"],
	["Donation", "icons\phone_donate.paa", "createDialog ""life_donation_menu""", "life_adminlevel < 1", "View your donor level and donation rewards"],
	["Captures", "icons\phone_capture.paa", "createDialog ""life_capture_menu""", "playerSide == civilian", "Live contents of capture containers."],
	["Keychain", "icons\phone_keychain.paa", "createDialog ""Life_key_management""", "true", "View and trade your vehicle keys"],
	["Licenses", "icons\phone_licenses.paa", "createDialog ""life_license_menu""", "true", "View your existing licenses"],
	["Settings", "icons\phone_settings.paa", "[] call life_fnc_settingsMenu;", "true", "Modify game and system preferences"],
	["Wanted", "icons\phone_wanted.paa", "[] call life_fnc_wantedMenu", "playerSide == west || getPlayerUID player == (life_configuration select 0)", "Index of criminals and warrants"],
	["Bounty", "icons\phone_wanted.paa", "[] call life_fnc_getBounty", "playerSide == civilian && license_civ_bounty", "Request a new bounty"],
	["Prestige", "icons\phone_prestige.paa", "createDialog ""life_prestige_menu"";", "playerSide == west && life_coplevel > 2", "View your prestige specialities and assign points"],
	["Talents", "icons\phone_talents.paa", "life_gangperk = false; createDialog ""life_talent_menu"";", "true", "View your talents and assign points"],
	["Achieve", "icons\phone_achieve.paa", "createDialog ""life_achievement_menu"";", "true", "View your achievements"],
	["Market", "icons\phone_market.paa", "createDialog ""life_market_menu"";", "playerSide != west", "Current market supply and value"],
	["Weather", "icons\phone_weather.paa", "createDialog ""life_weather_menu""", "true", "Current weather and future forecast"],
	["Honor", "icons\phone_wanted.paa", "createDialog 'life_prestige_menu'", "playerSide == civilian && license_civ_bounty && 126 in life_talents", "View your bounty hunter specialties and assign points"],
	["Our Perks", "icons\phone_gang.paa", "life_gangperk = true; createDialog 'life_talent_menu'", "playerSide == civilian && life_gang != ""0""", "View and/or manage your gang perks"],
	["Inventory", "icons\phone_inventory.paa", "createDialog 'life_inventory_menu'", "true", "View your virtual inventory"]
];
life_achievementInfo = [
	// side, title, condition, description, reward description, title
	[[civilian,west,independent], "Prestigious", "life_wealthPrestige >= 0", "Earned first prestige points.", "None", ""],
	[[civilian,west,independent], "Upper Class", "life_wealthPrestige  >= 500000", "Obtained over 500,000 prestige.", "None"],
	[[civilian,west,independent], "Prominent", "life_wealthPrestige >= 1000000", "Obtained over 1,000,000 prestige.", "Title: Prominent, Jury Corruption", "The Prominent %1"],
	[[civilian,west,independent], "Tycoon", "life_wealthPrestige >= 5000000", "Obtained over 5,000,000 prestige.", "Title: Tycoon, Global Discounts", "Tycoon %1"],
	[[civilian,west,independent], "Eminent", "life_wealthPrestige >= 10000000", "Obtained over 10,000,000 prestige.", "Title: Eminent, Purchasable Jet", "The Eminent %1"],
	[[civilian], "Thug", "(life_statistics select 0) >= 25", "Killed 25 rival gang members.", "Title: Thug", "Thug %1"],
	[[civilian], "Enforcer", "(life_statistics select 0) >= 100", "Killed 100 rival gang members.", "Title: Enforcer", "Enforcer %1"],
	[[civilian], "Warlord", "(life_statistics select 0) >= 250", "Killed 250 rival gang members.", "Title: Warlord, Free Vehicle Reloads", "Warlord %1"],
	[[civilian], "Freedom", "false", "Freed from prison by a jury.", "None", ""],
	[[civilian], "Rocket Man", "false", "Purchased a luxury jet plane.", "None", ""],
	[[civilian], "Fisherman", "false", "Caught a 1 kg fish.", "None", ""],
	[[civilian], "Angler", "false", "Caught a 5 kg fish.", "None", ""],
	[[civilian], "King Fisher", "false", "Caught a 25 kg fish.", "None", ""],
	[[west], "Rookie Blue", "false", "Arrested criminal wanted for $5,000.", "None", ""],
	[[west], "Baconator", "false", "Arrested criminal wanted for $75,000.", "None", ""],
	[[west], "Hardened Cop", "false", "Arrested criminal wanted for $250,000.", "None", ""],
	[[civilian], "Speed Racer", "false", "Won a vehicle race.", "None", ""],
	[[civilian,west,independent], "Wolf Pack", "life_wealthPrestige > 8000000", "Obtained over 8,000,000 prestige.", "Access to Wolf Dew Sport Hatchback", ""],
	[[civilian], "Oppressor", "(life_statistics select 2) >= 200", "Achieved 200 gang war rating across all seasons.", "Title: Oppressor", "Oppressor %1"],
	[[civilian], "The Punisher", "(life_statistics select 2) >= 750", "Achieved 750 gang war rating across all seasons.", "Title: The Punisher", "%1 the Punisher"],
	[[west], "Blue Coat", "(life_statistics select 3) >= 50", "Arrested 50 criminals worth over $5,000.", "None", ""],
	[[west], "The Heat", "(life_statistics select 3) >= 200", "Arrested 200 criminals worth over $5,000.", "None", ""],
	[[west], "Hardened", "(life_statistics select 3) >= 400", "Arrested 400 criminals worth over $5,000.", "Title: The Hardened", "%1 the Hardened"],
	[[west], "Veteran", "(life_statistics select 3) >= 800", "Arrested 800 criminals worth over $5,000.", "Title: Veteran", "Veteran %1"],
	[[civilian], "Bounty Hunter", "(life_statistics select 4) >= 50", "Arrested 50 criminals worth over $5,000 as bounty hunter.", "None", ""],
	[[civilian], "Watchdog", "(life_statistics select 4) >= 200", "Arrested 200 criminals worth over $5,000 as bounty hunter.", "Title: Watchdog", "Watchdog %1"],
	[[civilian], "Evaded", "(life_statistics select 6) >= 1", "Successfully evaded an APB.", "None", ""],
	[[civilian], "Elusive", "(life_statistics select 6) >= 5", "Successfully evaded an 5 APBs.", "Title: Elusive", "Elusive %1"],
	[[civilian], "The Invisible", "(life_statistics select 6) >= 10", "Successfully evaded an 10 APBs.", "Title: The Invisible", "%1 the Invisible"]
];
life_masks = ["G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan"];
life_smallicons = ["B_G_Van_01_fuel_F","C_Van_01_fuel_F","C_Hatchback_01_F","C_Hatchback_01_sport_F","C_SUV_01_F","C_Van_01_transport_F","B_G_Van_01_transport_F","C_Van_01_box_F","C_Boat_Civil_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","I_SDV_01_F","O_SDV_01_F","B_SDV_01_F"];

life_adminxray = 0;
life_medic_enroute = objNull;
life_medic_startpos = objNull;
life_medic_target = objNull;
life_endorse_max = 4000000; // prestige where max endorse cut
life_messages = [];
life_createVehicle = true;
life_adminReq = (profileNamespace getVariable["AsylumSettings",[1200,1200,1600,true,false]]) select 4;
my_markers = [];
life_offers = 0;
//life_mailbox = [];
life_priced = false;
//life_prestige_per_donor = 100000; // Each donor level grants this much more prestige for achievement access
life_disallowedThreatWeapons = ["", "Binocular"]; // weapons that can't be used for threatning someone
life_executionThreshold = 100000; // Jailed players above this bounty level are subject to death penalty
life_phone_actions = [];
life_escort = objNull;
life_queue_place = -1;
bounty_line = 100;
life_last_session = [];
for "_i" from 0 to 21 do { life_last_session set [_i, objNull]; };
life_bounty_contract = [];
life_bounty_tracked = -500;
life_dispatch = [0,"",0];
life_statistics = [0,0,0,0,0,0,0]; // war kills, war deaths, war points, global war points, police arrests, bounty hunter arrests, apb evades
life_kill_cache = [];
life_gathering = false;
life_virt_open = false;
life_achievements = [];
life_last_bounty = 0;
life_istagged = false;
life_track_radius = 300;
life_laser_inprogress = false;
life_animals_spawned = false;
life_animals_spawned_time = -500;
life_animals_array = [];
life_disabled_spawns = [];
life_radar_active = false;
life_yitems = [];
cop_gear = [];
life_last_govmsg = -900;
life_coprole = "";
life_can_trial = false;
life_defendant = false;
life_requested_trial = false;
life_corruptData = false;
life_tag_units = [];
life_tag_cache = [];
life_tag_data = [];
life_dispatchTasks = [];
life_last_airhq = -600;
life_last_vdm = 0;
life_jail_time = 0;
life_lastUpdatePacket = [];
life_bounty_uid = [];
life_disable_actions = false;
life_revive_fee = 800; // Fee to pay for revive
life_last_shank = -200;
life_phone_channel = -1;
life_phone_status = 0; // 0: Idle, 1: ringing, 2: calling, 3: completed
life_last_gather = 0;
life_protesting = false;
life_object_inhand = objNull;
life_gather_spawned = false;
life_gather_spawned_time = -1000;
life_respec_fee = 1500;
life_deadSWAT = false;
life_return_value = "";
life_allpoints = [];
life_target_towRope = objNull;
life_query_time = time;
life_action_delay = time;
life_lootKeys = [0];
life_lootRewards = [];
life_revive_fatigue = 0;
life_action_index = [];
life_actions = [];
life_holstered = false;
life_last_death_gear = -1000;
life_charged = objNull;
life_trunk_vehicle = Objnull;
life_battleye_guid = "";
life_coplevel = 0;
life_swatSpawn = false;
life_battleye_ip = "";
life_session_completed = false;
life_placing = objNull;
life_cocaine_gather = false;
life_garage_store = false;
life_pickup_open = false;
life_pickup_item_array = [];
life_session_tries = 0;
life_radio_chan = -1;
life_respawned = false;
life_net_dropped = false;
life_seatbelt = false;
life_last_tracked = [0,0,0];
life_searching = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_corpse = objNull;
life_dead_gear = [];
life_bail_paid = false;
life_breakout = false;
life_last_taxi = 0;
life_impound_inuse = false;
life_action_in_use = false;
life_spikestrip = ObjNull;
life_respawn_timer = 0.6;
life_death_timer = 5;
life_has_insurance = false;
life_show_actions = false;
life_action_time = 0;
life_drug_level = 0;
life_alcohol_level = 0;
life_used_drug = [0,0,0,0];
life_smoking = false;
life_drug_withdrawl = false;
life_cocaine_effect = 0;
life_heroin_effect = 0;
life_meth_effect = 0;
life_addiction = [0,0,0,0];
life_swatlevel = 0;
if(isNil "life_activeSWAT") then {life_activeSWAT = false};
if(isNil "life_summonedSWAT") then {life_summonedSWAT = false};
if(isNil "life_deploySWAT") then {life_deploySWAT = []};
life_gang = "0";
life_gang_atm = false;
life_targetTag = false;
life_gang_wars = [];
life_gang_war_last = -1000;
life_gang_challenges = [];
life_gov_atm = false;
life_gang_atm_val = 0;
life_gang_rank = 3;
life_gang_name = "";
life_gang_group = objNull;
life_gang_invited = 0;
life_gang_invite = "";
life_gang_invite_name = "";
life_gang_bank_time = 0;
life_capture_zone = 0;
life_tracked = [];
life_wanted = 0; // Current wanted level
life_last_wanted = 0;
//life_gang_list = [];
//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
life_abort_enabled = true; // If false, can't abort
life_martial = []; // Array of active martial law IDs
life_martial_alarm = ObjNull;
life_martial_marker = "";
life_houses = []; // IDs of all owned houses
life_house_pos = [];  // Worldspace of owned houses
life_pumped_barrel = objNull;
life_holding_barrel = objNull;
life_menu_house = objNull;
life_triggered_houses = [];
life_spawn_markers = [];
life_last_transfer = 0; // Last time a virtual item was dropped, placed or traded
life_sitting = objNull;
for "_i" from 1 to 113 do {life_spawn_markers set [count life_spawn_markers, format["veh_sp_%1",_i]];};
life_hwSpeed = 90;
life_citySpeed = 60;
fireMode = "Single";

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 90; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 64; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Food Variables *******
*****************************
*/
life_eat_Salema = 40;
life_eat_Ornate = 20;
life_eat_Mackerel = 20;
life_eat_Tuna = 100;
life_eat_Mullet = 30;
life_eat_CatShark = 60;
life_eat_Rabbit = 20;
life_eat_Apple = 5;
life_eat_turtlesoup = 62;
life_eat_donuts = 30;

/*
*****************************
***** Housing Variables *****
*****************************
*/
if (isNil "life_public_houses") then
{
	life_public_houses =
	[
		"1466373", // Drug cartel #1
		"1247468", // Alcohol production area
		"1247469", // Alcohol production area
		"1332380"  // Wong Triad house Altis
	];
};

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_searching = false;
life_hit_explosive = false;
life_siren_active = false;
life_use_atm = true;
life_is_arrested = false;
life_restrain_monitor = false;
life_delivery_in_progress = false;
life_delivery_type = 0;
life_thirst = 100;
life_hunger = 100;
life_experience = 0;
life_prestige = 0;
life_wealthPrestige = 0;
life_paycheck_period = 5; //Five minutes
life_drug_runner = false;
life_drug_stage = 0;
life_money = 0;
life_moneyCache = 5;
life_pain = 0;
life_precinct = false;
life_brokenLeg = false;
life_atmmoney = 0;
life_atmmoneyCache = 3;
["cash","set",0] call life_fnc_uC;
life_donator = 0;
life_impound_car = 100;
life_impound_boat = 100;
life_impound_air = 200;
life_istazed = false;
life_my_group = ObjNull;
life_old_group = grpNull;
life_worldspace = [0,0,0];
life_talents = [];
life_coptalents = [];
life_gangtalents = [];
life_honortalents = [];
life_gangexp = 0;
life_honor = 0;
life_alive = false;
life_isdowned = false;
life_inv_oilb = 0; //Invisible Oil Barrel Amount
player setVariable["downed",false,true];

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		["atm","set",1000] call life_fnc_uC;
		life_paycheck = 150; //Paycheck Amount
		if (!isNil "life_configuration") then
		{
			life_paycheck = life_paycheck + (life_paycheck * ((life_configuration select 3) / 100));
		};
	};
	case civilian:
	{
		["atm","set",1000] call life_fnc_uC;
		life_paycheck = 105; //Paycheck Amount
	};
	case independent: {
		["atm","set",1000] call life_fnc_uC;
		life_paycheck = 125; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_inv_items =
[
	//"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_marijuanam",
	"life_inv_apple",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_moonshine",
	"life_inv_whiskeyc_0",
	"life_inv_whiskeyc_1",
	"life_inv_whiskeyc_2",
	"life_inv_whiskeyc_3",
	"life_inv_whiskeyr_0",
	"life_inv_whiskeyr_1",
	"life_inv_whiskeyr_2",
	"life_inv_whiskeyr_3",
	"life_inv_scotch_0",
	"life_inv_scotch_1",
	"life_inv_scotch_2",
	"life_inv_scotch_3",
	"life_inv_water",
	"life_inv_shovel",
	"life_inv_saltwater",
	"life_inv_corn",
	"life_inv_rye",
	"life_inv_barley",
	"life_inv_yeast",
	"life_inv_berry",
	"life_inv_donuts",
	"life_inv_sugar",
	"life_inv_sugarcane",
	"life_inv_plank",
	"life_inv_banana",
	"life_inv_ginger",
	"life_inv_cocaleaf",
	"life_inv_cocapaste",
	"life_inv_gingerale_0",
	"life_inv_gingerale_1",
	"life_inv_gingerale_2",
	"life_inv_gingerale_3",
	"life_inv_rum_0",
	"life_inv_rum_1",
	"life_inv_rum_2",
	"life_inv_rum_3",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_treasure",
	"life_inv_treasure_1",
	"life_inv_treasure_2",
	"life_inv_treasure_3",
	"life_inv_treasure_4",
	"life_inv_treasure_5",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_cokepure",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_ephedrau",
	"life_inv_ephedra",
	"life_inv_meth",
	"life_inv_phos",
	"life_inv_hydro",
	"life_inv_pcp",
	"life_inv_ziptie",
	"life_inv_storage1",
	"life_inv_storage2",
	"life_inv_agingbarrel",
	"life_inv_doubloon",
	"life_inv_silverpiece",
	"life_inv_ruby",
	"life_inv_nitro",
	"life_inv_diamondf",
	"life_inv_pearl",
	"life_inv_redBurger",
	"life_inv_tracker",
	"life_inv_caralarm",
	"life_inv_airalarm",
	"life_inv_soda",
	"life_inv_beer",
	"life_inv_rubber",
	"life_inv_protest",
	"life_inv_shank",
	"life_inv_ducttape",
	"life_inv_towRope",
	"life_inv_woodaxe",
	"life_inv_lootcrate1",
	"life_inv_timber",
	"life_inv_campfire",
	"life_inv_skinningknife",
	"life_inv_plate",
	"life_inv_plateMetal",
	"life_inv_dog",
	"life_inv_dogp",
	"life_inv_goat",
	"life_inv_snake",
	"life_inv_rabbit",
	"life_inv_goatp",
	"life_inv_sheep",
	"life_inv_sheepp",
	"life_inv_chicken",
	"life_inv_chickenp",
	"life_inv_snakep",
	"life_inv_rabbitp",
	"life_inv_debitcard",
	"life_inv_blindfold",
	"life_inv_drill",
	"life_inv_goldbar",
	"life_inv_dirty_money",
	"life_inv_boltCutter",
	"life_inv_demoCharge",
	"life_inv_tent1",
	"life_inv_tent2",
	"life_inv_speedbomb",
	"life_inv_bagwallshort",
	"life_inv_bagwalllong",
	"life_inv_bagwallround",
	"life_inv_razorwire",
	"life_inv_roadCone",
	"life_inv_roadBarrier",
	"life_inv_cncBarrier",
	"life_inv_cncBarrierL",
	"life_inv_ladder",
	"life_inv_barGate",
	"life_inv_defib",
	"life_inv_bloodbag",
	"life_inv_vammo",
	"life_inv_painkillers",
	"life_inv_splint",
	"life_inv_excavator",
	"life_inv_adrenalineShot",
	"life_inv_toasty",
	"life_inv_sandwich"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_medmarijuana","civ"],
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
	["license_civ_home","civ"],
	["license_civ_meth","civ"],
	["license_civ_bounty","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_delivery_expire = 0;
life_delivery_object = objNull;
life_dp_points = switch (worldName) do
{
	case "Stratis": { ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8"] };
	case "Tanoa": { ["dp_missions","dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15"] };
	default { ["dp_missions","dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"] };
};
//[shortVar,reward]

// inventory, class, name, rotation, distance, damageable
life_placeable =
[
	["roadCone","RoadCone_F","Road Cone",0,4, true],
	["roadBarrier","RoadBarrier_F","Road Barrier",0,4, true],
	["cncBarrier","Land_CncBarrierMedium_F","Concrete Barrier",0,4, false],
	["cncBarrierL","Land_CncBarrierMedium4_F","Concrete Barrier Long",0,4, false],
	["barGate","Land_BarGate_F","Bar Gate", 0, 4, false],
	["ladder","Land_Obstacle_Climb_F","Ladder Bridge", 90, 5, true],
	["razorwire","Land_Razorwire_F","Razorwire Fence", 0, 4, true],
	["bagwallshort","Land_BagFence_Short_F","Short Bag Wall", 0, 2, true],
	["bagwalllong","Land_BagFence_Long_F","Long Bag Wall", 0, 2, true],
	["bagwallround","Land_BagFence_Round_F","Curved Bag Wall", 180, 2, true]
];

life_illegal_items =
[
	["lockpick",15],
	["heroinu",120],
	["heroinp",250],
	["pcp",200],
	["cocaine",150],
	["cocainep",350],
	["turtle",500],
	["turtlesoup",200],
	["ephedrau",70],
	["ephedra",100],
	["dirty_money",1],
	["meth",500],
	["goldbar",2000],
	["speedbomb",2500],
	["dog",250],
	["dogp",250],
	["demoCharge",500],
	["drill",500],
	["boltCutter",500],
	["moonshine",100],
	["scotch_0",100],
	["scotch_1",100],
	["scotch_2",100],
	["scotch_3",100],
	["gingerale_0",100],
	["gingerale_1",100],
	["gingerale_2",100],
	["gingerale_3",100],
	["rum_0",100],
	["rum_1",100],
	["rum_2",100],
	["rum_3",100],
	["cocapaste",250],
	["cocaleaf",150],
	["cocainepure",500],
	["whiskeyr_0",100],
	["whiskeyr_1",100],
	["whiskeyr_2",100],
	["whiskeyr_3",100],
	["whiskeyc_0",100],
	["whiskeyc_1",100],
	["whiskeyc_2",100],
	["whiskeyc_3",100]
];

life_vehicleInfo = switch (worldName) do {
	case "Altis": {
		[
			//  StoreType, Vehicle, Price, Storage, Donatorlvl, Coplvl, Swatlvl, TalentId, Side, Prestige, Achievements, Mod Colors
			["civ_car","B_Quadbike_01_F",200,50,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Hatchback_01_F",1000,100,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Offroad_02_unarmed_F",3500,150,0,0,0,0,civilian,0,0,false],
			["civ_car","C_SUV_01_F",4000,125,0,0,0,17,civilian,0,0,false],
			["civ_car","C_Hatchback_01_sport_F",5000,100,0,0,0,17,civilian,0,0,false],
			["civ_car","C_Van_01_transport_F",6000,250,0,0,0,17,civilian,0,0,false],

			["civ_kart","C_Kart_01_blu_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_fuel_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_red_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_vrana_F",250,0,0,0,0,0,civilian,0,0,false],

			["med_car","C_Offroad_01_F",800,0,0,0,0,107,independent,0,0,false],
			["med_car","C_SUV_01_F",2000,0,0,0,0,108,independent,0,0,false],

			["med_air","B_Heli_Light_01_F",20000,0,0,0,0,110,independent,0,0,false],

			["reb_car","B_Quadbike_01_F",250,50,0,0,0,0,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0,false],
			["reb_car","O_T_LSV_02_unarmed_F",5000,150,0,0,0,0,civilian,0,0,false],
			["reb_car","B_T_LSV_01_unarmed_F",6000,140,0,0,0,0,civilian,0,0,false],
			["reb_car","O_MRAP_02_F",97500,120,0,0,0,106,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_armed_F",150000,0,0,0,0,106,civilian,0,0,false],
			["reb_car","B_Heli_Light_01_F",70000,80,0,0,0,20,civilian,0,0,false],
			["reb_car","I_Heli_light_03_unarmed_F",120000,100,0,0,0,21,civilian,0,0,false],
			["reb_car","O_Heli_Light_02_unarmed_F",130000,100,0,0,0,21,civilian,0,0,false],
			//["reb_car","O_Heli_Transport_04_F",150000,100,0,0,0,21,civilian,0,0,false],
			//["reb_car","O_Heli_Transport_04_bench_F",160000,100,0,0,0,21,civilian,0,0,false],

			["bh_car","B_MRAP_01_F",97500,120,0,0,0,0,civilian,0,0,false],

			["cop_car","I_Quadbike_01_F",150,50,0,1,0,0,west,0,0,false],
			["cop_car","C_Offroad_01_F",500,150,0,2,0,95,west,0,0,false],
			["cop_car","C_SUV_01_F",3500,125,0,2,0,96,west,0,0,false],
			["cop_car","C_Hatchback_01_sport_F",5000,100,3,2,0,96,west,0,0,false],
			["cop_car","B_MRAP_01_F",30000,120,0,4,0,100,west,0,0,false],
			["cop_car","I_MRAP_03_F",36000,150,0,5,0,100,west,0,0,false],
			["cop_car","C_Hatchback_01_F",5000,150,0,3,0,0,west,38,0,false],
			["cop_car","B_G_Offroad_01_F",3000,150,0,3,0,0,west,39,0,false],
			["cop_car","C_SUV_01_F",4000,125,0,3,0,0,west,40,0,false],
			["cop_car","C_Hatchback_01_sport_F",5000,100,0,3,0,0,west,40,0,false],
			["cop_car","C_Van_01_box_F",8000,350,0,3,0,0,west,41,0,false],
			["cop_car","I_Truck_02_transport_F",20000,600,0,3,0,0,west,41,0,false],
			["cop_car","I_Truck_02_covered_F",25000,700,0,3,0,0,west,41,0,false],
			["cop_car","B_Truck_01_transport_F",30000,850,0,3,0,0,west,41,0,false],
			["cop_car","B_Truck_01_box_F",45000,1000,0,3,0,0,west,41,0,false],

			["civ_truck","C_Van_01_box_F",8000,350,0,0,0,17,civilian,0,0,false],
			["civ_truck","I_Truck_02_transport_F",20000,600,0,0,0,19,civilian,0,0,false],
			["civ_truck","I_Truck_02_covered_F",25000,700,0,0,0,19,civilian,0,0,false],
			["civ_truck","B_Truck_01_transport_F",30000,850,0,0,0,19,civilian,0,0,false],
			["civ_truck","B_Truck_01_box_F",45000,1000,0,0,0,19,civilian,0,0,false],

			["civ_air","C_Plane_Civil_01_F",35000,150,0,0,0,20,civilian,0,0,false],
			["civ_air","B_Heli_Light_01_F",65000,80,0,0,0,20,civilian,0,0,false],
			["civ_air","C_Heli_Light_01_civil_F",60000,80,0,0,0,20,civilian,0,0,false],
			["civ_air","O_Heli_Light_02_unarmed_F",130000,100,0,0,0,21,civilian,0,0,false],
			["civ_air","I_Heli_Transport_02_F",100000,300,4,0,0,21,civilian,0,0,false],
			["civ_air","I_Plane_Fighter_03_CAS_F",60000,100,0,0,0,0,civilian,0,4,false],

			["reb_air","B_Heli_Light_01_F",65000,80,0,0,0,20,civilian,0,0,false],
			["reb_air","I_Heli_light_03_unarmed_F",100000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_F",120000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_bench_F",130000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_covered_F",150000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Light_02_unarmed_F",150000,80,0,0,0,21,civilian,0,0,false],

			["cop_air","B_Heli_Light_01_F",20000,80,0,2,0,97,west,0,0,false],
			["cop_air","I_Heli_light_03_unarmed_F",75000,100,0,3,0,98,west,0,0,false],
			["cop_air","B_Heli_Transport_03_unarmed_F",90000,80,0,5,0,98,west,0,0,false],
			["cop_air","O_Heli_Light_02_unarmed_F",100000,70,0,4,0,98,west,0,0,false],
			["cop_air","B_Heli_Transport_01_F",80000,80,0,6,0,98,west,0,0,false],
			["cop_air","B_Heli_Light_01_F",60000,80,0,3,0,0,west,42,0,false],
			["cop_air","C_Heli_Light_01_civil_F",70000,80,0,3,0,0,west,42,0,false],
//			["cop_air","I_Heli_light_03_unarmed_F",70000,80,0,3,0,0,west,43,0,false],
			["cop_air","O_Heli_Light_02_unarmed_F",70000,80,0,3,0,0,west,43,0,false],
			["cop_air","I_Heli_Transport_02_F",100000,300,4,3,0,0,west,44,0,false],

			["civ_ship","C_Rubberboat",350,60,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Scooter_Transport_01_F",1500,70,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_rescue_F",3000,200,1,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Transport_02_F",5000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","O_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","B_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","I_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],

			["cop_ship","B_Boat_Transport_01_F",300,200,0,2,0,0,west,0,0,false],
			["cop_ship","C_Boat_Civil_01_police_F",2000,200,0,2,0,0,west,0,0,false],

			["chop_shop","Land_CargoBox_V1_F",1400,200,0,0,0,0,civilian,0,0,false],
			["chop_shop","Land_Cargo20_red_F",1700,200,0,0,0,0,civilian,0,0,false]
		];
	};
	case "Tanoa": {
		[
			//  StoreType, Vehicle, Price, Storage, Donatorlvl, Coplvl, Swatlvl, TalentId, Side, Prestige, Achievements, Mod Colors
			["civ_car","B_Quadbike_01_F",200,50,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Hatchback_01_F",1000,100,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Offroad_02_unarmed_F",3500,150,0,0,0,0,civilian,0,0,false],
			["civ_car","C_SUV_01_F",4000,125,0,0,0,17,civilian,0,0,false],
			["civ_car","C_Hatchback_01_sport_F",10000,100,0,0,0,17,civilian,0,0,false],
			["civ_car","C_Van_01_transport_F",6000,250,0,0,0,17,civilian,0,0,false],

			["civ_kart","C_Kart_01_blu_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_fuel_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_red_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_vrana_F",250,0,0,0,0,0,civilian,0,0,false],

			["med_car","C_Offroad_01_F",800,0,0,0,0,107,independent,0,0,false],
			["med_car","C_SUV_01_F",2000,0,0,0,0,108,independent,0,0,false],

			["med_air","B_Heli_Light_01_F",20000,0,0,0,0,110,independent,0,0,false],

			["reb_car","B_Quadbike_01_F",250,50,0,0,0,0,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0,false],
			["reb_car","O_T_LSV_02_unarmed_F",5000,150,0,0,0,0,civilian,0,0,false],
			["reb_car","B_T_LSV_01_unarmed_F",6000,140,0,0,0,0,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_armed_F",150000,0,0,0,0,106,civilian,0,0,false],
			["reb_car","B_Heli_Light_01_F",70000,80,0,0,0,20,civilian,0,0,false],
			["reb_car","I_Heli_light_03_unarmed_F",120000,100,0,0,0,21,civilian,0,0,false],
			["reb_car","O_Heli_Light_02_unarmed_F",130000,100,0,0,0,21,civilian,0,0,false],
			//["reb_car","O_Heli_Transport_04_F",150000,100,0,0,0,21,civilian,0,0,false],
			//["reb_car","O_Heli_Transport_04_bench_F",160000,100,0,0,0,21,civilian,0,0,false],

			["cop_car","I_Quadbike_01_F",150,50,0,1,0,0,west,0,0,false],
			["cop_car","C_Offroad_01_F",500,150,0,2,0,95,west,0,0,false],
			["cop_car","C_SUV_01_F",3500,125,0,2,0,96,west,0,0,false],
			["cop_car","C_Hatchback_01_sport_F",10000,100,3,2,0,96,west,0,0,false],
			["cop_car","C_Hatchback_01_F",5000,150,0,3,0,0,west,38,0,false],
			["cop_car","B_G_Offroad_01_F",3000,150,0,3,0,0,west,39,0,false],
			["cop_car","C_SUV_01_F",4000,125,0,3,0,0,west,40,0,false],
			["cop_car","C_Hatchback_01_sport_F",10000,100,0,3,0,0,west,40,0,false],
			["cop_car","C_Van_01_box_F",8000,350,0,3,0,0,west,41,0,false],
			["cop_car","I_Truck_02_transport_F",20000,600,0,3,0,0,west,41,0,false],
			["cop_car","I_Truck_02_covered_F",25000,700,0,3,0,0,west,41,0,false],
			["cop_car","B_Truck_01_transport_F",30000,850,0,3,0,0,west,41,0,false],
			["cop_car","B_Truck_01_box_F",45000,1000,0,3,0,0,west,41,0,false],

			["civ_truck","C_Van_01_box_F",8000,350,0,0,0,17,civilian,0,0,false],
			["civ_truck","I_Truck_02_transport_F",20000,600,0,0,0,19,civilian,0,0,false],
			["civ_truck","I_Truck_02_covered_F",25000,700,0,0,0,19,civilian,0,0,false],
			["civ_truck","B_Truck_01_transport_F",30000,850,0,0,0,19,civilian,0,0,false],
			["civ_truck","B_Truck_01_box_F",45000,1000,0,0,0,19,civilian,0,0,false],

			["civ_air","C_Plane_Civil_01_F",35000,150,0,0,0,20,civilian,0,0,false],
			//["civ_air","C_Plane_Civil_01_racing_F",45000,150,0,0,0,20,civilian,0,0,false],
			["civ_air","B_Heli_Light_01_F",65000,80,0,0,0,20,civilian,0,0,false],
			["civ_air","C_Heli_Light_01_civil_F",60000,80,0,0,0,20,civilian,0,0,false],
			["civ_air","O_Heli_Light_02_unarmed_F",130000,100,0,0,0,21,civilian,0,0,false],
			["civ_air","I_Heli_Transport_02_F",100000,300,4,0,0,21,civilian,0,0,false],
			["civ_air","I_Plane_Fighter_03_CAS_F",60000,100,0,0,0,0,civilian,0,4,false],

			["reb_air","B_Heli_Light_01_F",65000,80,0,0,0,20,civilian,0,0,false],
			["reb_air","I_Heli_light_03_unarmed_F",100000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_F",120000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_bench_F",130000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Transport_04_covered_F",150000,100,0,0,0,21,civilian,0,0,false],
			["reb_air","O_Heli_Light_02_unarmed_F",150000,80,0,0,0,21,civilian,0,0,false],

			["cop_air","B_Heli_Light_01_F",20000,80,0,2,0,97,west,0,0,false],
			["cop_air","I_Heli_light_03_unarmed_F",75000,100,0,3,0,98,west,0,0,false],
			["cop_air","B_Heli_Transport_03_unarmed_F",90000,80,0,5,0,98,west,0,0,false],
			["cop_air","O_Heli_Light_02_unarmed_F",100000,70,0,4,0,98,west,0,0,false],
			["cop_air","B_Heli_Transport_01_F",80000,80,0,6,0,98,west,0,0,false],
			["cop_air","B_Heli_Light_01_F",60000,80,0,3,0,0,west,42,0,false],
			["cop_air","C_Heli_Light_01_civil_F",70000,80,0,3,0,0,west,42,0,false],
//			["cop_air","I_Heli_light_03_unarmed_F",70000,80,0,3,0,0,west,43,0,false],
			["cop_air","O_Heli_Light_02_unarmed_F",70000,80,0,3,0,0,west,43,0,false],
			["cop_air","I_Heli_Transport_02_F",100000,300,4,3,0,0,west,44,0,false],

			["civ_ship","C_Rubberboat",350,60,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Scooter_Transport_01_F",1500,70,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_rescue_F",3000,200,1,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Transport_02_F",5000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","O_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","B_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","I_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],

			["cop_ship","B_Boat_Transport_01_F",300,200,0,2,0,0,west,0,0,false],
			["cop_ship","C_Boat_Civil_01_police_F",2000,200,0,2,0,0,west,0,0,false],

			["chop_shop","Land_CargoBox_V1_F",1400,200,0,0,0,0,civilian,0,0,false],
			["chop_shop","Land_Cargo20_red_F",1700,200,0,0,0,0,civilian,0,0,false]
		];
	};
	case "Australia": {
		[
			["civ_car","dbo_CIV_ol_bike",50,10,0,0,0,0,civilian,0,0,false],
			["civ_car","dbo_CIV_new_bike",50,10,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_M1030",400,60,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Quadbike_01_F",500,75,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_Skoda_White_CIV",1000,100,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_Datsun",1200,100,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Datsun_510",2500,100,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Hatchback_01_F",2500,120,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Corolla",4000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_Golf4_red_Civ",4000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","C_Offroad_01_F",4000,150,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_Octavia_CIV",4000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Mini_Cooper",4000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Ceed",5500,150,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_30CSL",5500,130,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_LR_Transport_CTK",5500,250,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_B_UAZ_Unarmed_CDF",5500,200,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_B_UAZ_Open_CDF",5500,170,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Raptor",7000,170,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Galant",7000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","CUP_C_SUV_TK",7000,200,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Escalade",8500,200,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Datsun_Z432",9000,100,0,0,0,0,civilian,0,0,false],
			["civ_car","Mrshounka_yamaha_p_base",9000,75,0,0,0,0,civilian,0,0,true],
			["civ_car","Jonzie_Transit",9000,250,0,0,0,0,civilian,0,0,false],
//			["civ_car","Orel_Agora",10000,130,0,0,0,18,civilian,0,0,false],
			["civ_car","Jonzie_XB",10000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_VE",11000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","Jonzie_Ute",11000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","beetle",14000,130,0,0,0,0,civilian,0,0,true],
			["civ_car","Jonzie_Mini_Cooper_R_spec",18000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","bv_monster",19000,130,0,0,0,0,civilian,0,0,true],
			["civ_car","Jonzie_STI",25000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","bv_e60_m5",30000,130,0,0,0,0,civilian,0,0,true],
			["civ_car","bv_gtr_spec_v",35000,130,0,0,0,0,civilian,0,0,true],
			["civ_car","Jonzie_Quattroporte",40000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","bv_caressa_gt",80000,130,0,0,0,0,civilian,0,0,true],
			["civ_car","Jonzie_Viper",90000,130,0,0,0,0,civilian,0,0,false],
			["civ_car","bv_458",100000,130,0,0,0,0,civilian,0,0,true],

			["civ_kart","C_Kart_01_blu_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_fuel_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_red_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_vrana_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_green_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_orange_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_white_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_yellow_F",250,0,0,0,0,0,civilian,0,0,false],
			["civ_kart","C_Kart_01_black_F",250,0,0,0,0,0,civilian,0,0,false],

			["civ_truck","Jonzie_Tow_Truck",8000,150,0,0,0,17,civilian,0,0,false],
			["civ_truck","C_Van_01_box_F",9500,300,0,0,0,0,civilian,0,0,false],
			["civ_truck","Orel_Agora",20000,350,0,0,0,18,civilian,0,0,false],
			["civ_truck","Jonzie_Flat_Bed",25000,500,0,0,0,19,civilian,0,0,false],
			["civ_truck","Jonzie_Box_Truck",30000,600,0,0,0,19,civilian,0,0,false],
			["civ_truck","Jonzie_Western",40000,800,0,0,0,19,civilian,0,0,false],
			["civ_truck","Jonzie_Superliner",45000,900,0,0,0,19,civilian,0,0,false],

			["civ_air","sab_FAAllegro",18000,80,0,0,0,20,civilian,0,0,false],
			["civ_air","Sab_ana_An2",32000,150,0,0,0,21,civilian,0,0,false],
			["civ_air","GNT_C185",40000,150,0,0,0,20,civilian,0,0,false],
			["civ_air","sab_RobinDR400",50000,200,0,0,0,20,civilian,0,0,false],
			["civ_air","C_Heli_Light_01_civil_F",50000,200,0,0,0,20,civilian,0,0,false],
			["civ_air","CUP_C_DC3_CIV",200000,500,0,0,0,21,civilian,0,0,false],
			["civ_air","CUP_B_C130J_USMC",300000,1200,0,0,0,21,civilian,0,0,false],
			["civ_air","I_Plane_Fighter_03_CAS_F",300000,100,0,0,0,0,civilian,0,4,false],

			["med_car","Jonzie_Ambulance",800,0,0,0,0,107,independent,0,0,false],
			["med_air","B_Heli_Light_01_F",20000,0,0,0,0,110,independent,0,0,false],
			["med_air","CUP_I_UH60L_Unarmed_FFV_MEV_RACS",15000,0,0,0,0,110,independent,0,0,false],

			["reb_car","B_Quadbike_01_F",500,50,0,0,0,0,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_F",4000,150,0,0,0,0,civilian,0,0,false],
			["reb_car","B_G_Offroad_01_armed_F",150000,0,0,0,0,106,civilian,0,0,false],
			["reb_car","CUP_B_UAZ_MG_CDF",160000,0,0,0,0,106,civilian,0,0,false],
			["reb_car","CUP_B_LR_MG_CZ_W",170000,0,0,0,0,106,civilian,0,0,false],
			["reb_car","B_Heli_Light_01_F",125000,80,0,0,0,20,civilian,0,0,false],

			["cop_car","I_Quadbike_01_F",150,50,0,1,0,0,west,0,0,false],
			["cop_car","C_Offroad_01_F",500,150,0,2,0,95,west,0,0,false],
			["cop_car","bv_the_crowner_cop_patrol",1000,125,0,2,0,96,west,0,0,false], // was Jonzie_Highway
			["cop_car","bv_458_cop_patrol",50000,125,0,2,0,96,west,0,0,false],
			["cop_car","bv_the_crowner_uc",2000,150,0,3,0,0,west,39,0,false],
			["cop_car","B_G_Offroad_01_F",3000,150,0,3,0,0,west,39,0,false],
			["cop_car","beetle",7000,130,0,0,0,0,west,39,0,true],
			["cop_car","Jonzie_Mini_Cooper_R_spec",9000,130,38,0,0,0,west,0,0,false],
			["cop_car","bv_monster",9500,130,0,0,0,0,west,38,0,true],
			["cop_car","Jonzie_STI",12500,130,0,0,0,0,west,38,0,false],
			["cop_car","bv_e60_m5",15000,130,0,0,0,0,west,39,0,true],
			["cop_car","bv_gtr_spec_v",17500,130,0,0,0,0,west,39,0,true],
			["cop_car","Jonzie_Quattroporte",20000,130,0,0,0,0,west,40,0,false],
			["cop_car","bv_caressa_gt",40000,130,0,0,0,0,west,40,0,true],
			["cop_car","Jonzie_Viper",45000,130,0,0,0,0,west,40,0,false],
			["cop_car","bv_458",50000,130,0,0,0,0,west,40,0,true],
			["cop_car","Jonzie_Tow_Truck",8000,150,0,0,0,17,west,41,0,false],
			["cop_car","C_Van_01_box_F",9500,300,0,0,0,0,west,41,0,false],
			["cop_car","Jonzie_Flat_Bed",25000,500,0,0,0,19,west,41,0,false],
			["cop_car","Jonzie_Box_Truck",30000,600,0,0,0,19,west,41,0,false],
			["cop_car","Jonzie_Western",40000,800,0,0,0,19,west,41,0,false],
			["cop_car","Jonzie_Superliner",45000,900,0,0,0,19,west,41,0,false],

			["reb_air","B_Heli_Light_01_F",65000,80,0,0,0,20,civilian,0,0,false],
			["reb_air","CUP_I_UH60L_Unarmed_FFV_RACS",120000,200,0,0,0,20,civilian,0,0,false],

			["cop_air","B_Heli_Light_01_F",60000,80,0,2,0,97,west,0,0,false],
			["cop_air","CUP_B_UH60M_Unarmed_FFV_US",60000,80,0,2,0,97,west,0,0,false],

			["civ_ship","C_Rubberboat",350,60,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","C_Boat_Civil_01_rescue_F",3000,200,1,0,0,0,civilian,0,0,false],
			["civ_ship","CUP_C_Fishing_Boat_Chernarus",6000,400,0,0,0,0,civilian,0,0,false],
			["civ_ship","O_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","B_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],
			["civ_ship","I_SDV_01_F",3000,200,0,0,0,0,civilian,0,0,false],

			["cop_ship","B_Boat_Transport_01_F",300,200,0,2,0,0,west,0,0,false],
			["cop_ship","C_Boat_Civil_01_police_F",2000,200,0,2,0,0,west,0,0,false],

			["chop_shop","Land_CargoBox_V1_F",1400,200,0,0,0,0,civilian,0,0,false],
			["chop_shop","Land_Cargo20_red_F",1700,200,0,0,0,0,civilian,0,0,false]
		];
	};
};

life_vehicleInfoStratis =
[
//  StoreType, Vehicle, Price, Storage, Donatorlvl, Coplvl, Swatlvl, TalentId, Side, Prestige, Achievements
	["civ_car","B_QuadBike_01_F",200,50,0,0,0,0,civilian,0,0],
	["civ_car","C_Hatchback_01_F",1000,100,0,0,0,0,civilian,0,0],
	["civ_car","C_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0],
	["civ_car","C_SUV_01_F",4000,125,0,0,0,17,civilian,0,0],
	["civ_car","C_Hatchback_01_sport_F",5000,100,3,0,0,17,civilian,0,0],
	["civ_car","C_Van_01_transport_F",6000,250,0,0,0,17,civilian,0,0],

	["civ_kart","C_Kart_01_blu_F",250,0,0,0,0,0,civilian,0,0],
	["civ_kart","C_Kart_01_fuel_F",250,0,0,0,0,0,civilian,0,0],
	["civ_kart","C_Kart_01_red_F",250,0,0,0,0,0,civilian,0,0],
	["civ_kart","C_Kart_01_vrana_F",250,0,0,0,0,0,civilian,0,0],

	["med_car","C_Offroad_01_F",800,0,0,0,0,107,independent,0,0],
	["med_car","C_SUV_01_F",2000,0,0,0,0,108,independent,0,0],

	["reb_car","B_Quadbike_01_F",250,50,0,0,0,0,civilian,0,0],
	["reb_car","B_G_Offroad_01_F",3000,150,0,0,0,0,civilian,0,0],
	["reb_car","B_G_Offroad_01_armed_F",150000,0,0,0,0,106,civilian,0,0],

	["cop_car","I_Quadbike_01_F",150,50,0,1,0,0,west,0,0],
	["cop_car","C_Offroad_01_F",500,150,0,2,0,95,west,0,0],
	["cop_car","C_SUV_01_F",3500,125,0,2,0,96,west,0,0],
	["cop_car","C_Hatchback_01_sport_F",5000,100,3,2,0,96,west,0,0],
	["cop_car","C_Hatchback_01_F",5000,150,0,3,0,0,west,38,0],
	["cop_car","B_G_Offroad_01_F",3000,150,0,3,0,0,west,39,0],
	["cop_car","C_SUV_01_F",4000,125,0,3,0,0,west,40,0],
	["cop_car","C_Hatchback_01_sport_F",5000,100,0,3,0,0,west,40,0],
	["cop_car","C_Van_01_box_F",8000,350,0,3,0,0,west,41,0],
	["cop_car","I_Truck_02_transport_F",20000,600,0,3,0,0,west,41,0],
	["cop_car","I_Truck_02_covered_F",25000,700,0,3,0,0,west,41,0],
	["cop_car","B_Truck_01_transport_F",30000,850,0,3,0,0,west,41,0],
	["cop_car","B_Truck_01_box_F",45000,1000,0,3,0,0,west,41,0],

	["civ_truck","C_Van_01_box_F",8000,350,0,0,0,17,civilian,0,0],
	["civ_truck","I_Truck_02_transport_F",20000,600,0,0,0,19,civilian,0,0],
	["civ_truck","I_Truck_02_covered_F",25000,700,0,0,0,19,civilian,0,0],
	["civ_truck","B_Truck_01_transport_F",30000,850,0,0,0,19,civilian,0,0],
	["civ_truck","B_Truck_01_box_F",45000,1000,0,0,0,19,civilian,0,0],

	["civ_ship","C_Rubberboat",350,60,0,0,0,0,civilian,0,0],
	["civ_ship","C_Boat_Civil_01_F",3000,200,0,0,0,0,civilian,0,0],
	["civ_ship","C_Boat_Civil_01_rescue_F",3000,200,1,0,0,0,civilian,0,0],
	["civ_ship","O_SDV_01_F",3000,200,0,0,0,0,civilian,0,0],
	["civ_ship","B_SDV_01_F",3000,200,0,0,0,0,civilian,0,0],
	["civ_ship","I_SDV_01_F",3000,200,0,0,0,0,civilian,0,0],

	["cop_ship","B_Boat_Transport_01_F",300,200,0,2,0,0,west,0,0],
	["cop_ship","C_Boat_Civil_01_police_F",2000,200,0,2,0,0,west,0,0],

	["chop_shop","Land_CargoBox_V1_F",1400,200,0,0,0,0,civilian,0,0],
	["chop_shop","Land_Cargo20_red_F",1700,200,0,0,0,0,civilian,0,0]
];

buy_array = [
	["apple",6],
	["berry",12],
	["salema",40],
	["ornate",42],
	["mackerel",70],
	["tuna",250],
	["mullet",110],
	["catshark",130],
	["water",7],
	["turtle",1700],
	["turtlesoup",250],
	["donuts",12],
	["timber",60],
	["campfire",500],
	["woodaxe",50],
	["coffee",3],
	["tbacon",8],
	["lootcrate1",400],
	["lockpick",15],
	["pickaxe",50],
	["roadCone",120],
	["roadBarrier",120],
	["cncBarrier",120],
	["cncBarrierL",120],
	["barGate",120],
	["bagwallshort",1000],
	["bagwalllong",1500],
	["bagwallround",1000],
	["razorwire",2000],
	["redgull",150],
	["towRope",100],
	["fuelF",55],
	["peach",6],
	["spikeStrip",250],
	["yeast",15],
	["phos",165],
	["hydro",165],
	["pcp",650],
	["protest",15],
	["ziptie",20],
	["storage1",15000],
	["storage2",20000],
	["agingbarrel",10000],
	["speedbomb",80000],
	["doubloon",175],
	["silverpiece",150],
	["goldbar",50000],
	["dirty_money",1],
	["ruby",450],
	["pearl",400],
	["treasure",20000],
	["diamondf",2000],
	["nitro",1500],
	["drill",1500],
	["skinningknife",100],
	["blindfold",1000],
	["redburger",5],
	["soda",5],
	["beer",10],
	["debitcard",250],
	["excavator",300],
	["adrenalineShot",1000],
	["tracker",1000],
	["caralarm",500],
	["airalarm",2000],
	["defib",900],
	["bloodbag",150],
	["painkillers",15],
	["splint",100],
	["vammo",3500],
	["tent1",1000],
	["tent2",1500],
	["boltCutter",1000],
	["demoCharge",1500],
	["marijuana",300],
	["marijuanam",200],
	["meth", 1450],
	["toasty",5],
	["sandwich",5],
	["cocaine",250],
	["cocainep",650],
	["cocaleaf",100],
	["cocapaste",400],
	["cocainepure",1250],
	["diamond",200],
	["diamondc",300],
	["sugar",150],
	["sugarcane",40],
	["plank",300],
	["banana",10],
	["ginger",12],
	["iron_r",200],
	["copper_r",37],
	["salt_r",180],
	["glass",180],
	["heroinu",200],
	["heroinp",575],
	["moonshine",380],
	["scotch_0",50],
	["scotch_1",250],
	["scotch_2",900],
	["scotch_3",1429],
	["shovel",50],
	["rum_0",50],
	["rum_1",250],
	["rum_2",900],
	["rum_3",1429],
	["gingerale_0",380],
	["gingerale_1",450],
	["gingerale_2",650],
	["gingerale_3",950],
	["whiskeyr_0",200],
	["whiskeyr_1",450],
	["whiskeyr_2",650],
	["whiskeyr_3",950],
	["whiskeyc_0",170],
	["whiskeyc_1",400],
	["whiskeyc_2",600],
	["whiskeyc_3",925],
	["oilp",600],
	["dog",1200],
	["goat",400],
	["chicken",300],
	["sheep",300],
	["snake",185],
	["rabbit",180],
	["dogp",2100],
	["goatp",1300],
	["chickenp",700],
	["sheepp",1200],
	["snakep",200],
	["rabbitp",200],
	["rubber",750]
];

life_donor_items =
[
	["CUP_arifle_AKS_Gold", 5],
	["hlc_rifle_M1903A1OMR", 3],
	["RH_Deagleg", 4],
	["RH_Deagles", 3],
	["RH_ttracker_g", 3],
	["RH_m9c", 3],
	["RH_kimber", 3],
	["RH_g19t", 1],
	["RH_fn57_g", 1],
	["RH_fn57_t", 2],
	["RH_fnp45t", 2]
];

life_weapon_shop_array = // craft prices (if purchased)
[
	["arifle_Katiba_F",9500],
	["arifle_Katiba_C_F",9000],
	["LMG_Mk200_F",50000],
	["srifle_DMR_01_F",10000],
	["srifle_EBR_F",11000],
	["srifle_DMR_03_khaki_F",15000],
	["srifle_DMR_03_multicam_F",15000],
	["srifle_DMR_03_tan_F",15000],
	["srifle_DMR_03_woodland_F",15000],
	["srifle_DMR_06_olive_F",15000],
	["srifle_DMR_06_camo_F",15000],
	["hgun_ACPC2_F",3000],
	["hgun_PDW2000_F",5000],
	["SMG_02_F",4500],
	["SMG_01_F",6000],
	["RH_tec9",2500],
	["RH_muzi",6000],
	["RH_vz61",3500],
	["LMG_Mk200_F",50000],
	["200Rnd_65x39_cased_Box",10000],
	["hlc_rifle_ak47",10000],
	["hlc_rifle_ak12",9500],
	["hlc_rifle_aku12",9500],
	["hlc_rifle_ak74",11000],
	["hlc_rifle_ak74_dirty",10700],
	["hlc_rifle_aks74",10000],
	["hlc_rifle_aks74u",9000],
	["hlc_rifle_aek971",11000],
	["CUP_optic_Kobra",800],
	["hlc_optic_kobra",800],
	["hlc_rifle_honeybadger",20000],
	["CUP_arifle_FNFAL",15000],
	["CUP_arifle_FNFAL_railed",17000],
	["CUP_arifle_FNFAL_OSW",15000],
//	["CUP_srifle_LeeEnfield",10000],
//	["CUP_srifle_LeeEnfield_rail",12000],
	["RH_M6X",1000],
	["RH_X300",1000],
	["RH_X2",1000],
	["hgun_Pistol_heavy_02_F",800],
	["arifle_sdar_F",3000],
	["optic_Yorris",200],
	["hgun_Pistol_Signal_F",500],
	["6Rnd_GreenSignal_F",50],
	["6Rnd_RedSignal_F",50],
	["RH_python",1000],
	["optic_ACO_grn_smg",600],
	["hgun_ACPC2_F",950],
	["CUP_hgun_Duty",1100],
	["CUP_hgun_Compact",1100],
	["CUP_hgun_Phantom",1100],
	["RH_deagle",2000],
	["RH_Deaglem",2200],
	["RH_fnp45",1200],
	["RH_docter",1000],
	["optic_MRD",300],
	["RH_g17",1000],
	["RH_g18",2500],
	["RH_g19",1100],
	["RH_gsh18",1150],
	["RH_kimber_nw",1300],
	["RH_m1911",1300],
	["RH_mateba",2500],
	["RH_mp412",4000],
	["CUP_hgun_PB6P9",1200],
	["RH_mk2",1300],
	["RH_p226",1250],
	["RH_sw659",1350],
	["RH_bull",3000],
	["RH_bullb",3000],
	["RH_ttracker",1500],
	["RH_tt33",1500],
	["RH_uspm",2500],
	["RH_usp",2300],
	["RH_vp70",1300]
];

life_garage_prices =
[
	["B_QuadBike_01_F",55],
	["C_Hatchback_01_F",150],
	["C_Offroad_01_F", 250],
	["B_G_Offroad_01_F",350],
	["C_SUV_01_F",525],
	["C_Van_01_transport_F",789],
	["C_Hatchback_01_sport_F",235],
	["C_Van_01_fuel_F",450],
	["I_Heli_Transport_02_F",3500],
	["C_Van_01_box_F",900],
	["I_Truck_02_transport_F",1200],
	["I_Truck_02_covered_F",1450],
	["B_Truck_01_transport_F",2565],
	["B_Truck_01_box_F", 3500],
	["O_MRAP_02_F",4500],
	["B_Heli_Light_01_F",2500],
	["O_Heli_Light_02_unarmed_F",3500],
	["C_Rubberboat",40],
	["C_Boat_Civil_01_F",450],
	["C_Boat_Civil_01_rescue_F",450],
	["B_Boat_Transport_01_F",45],
	["C_Boat_Civil_01_police_F",350],
	["B_MRAP_01_F",2500],
	["I_MRAP_03_F",3000]
];
life_skiptracerInfo =
[
	[1, 500, "Crusader", 0, "The crusader will use his skills to track down bounties for the good of the people of Asylum. Access to the MX series rifle and carbine with stun rounds."],
	[2, 2000, "Novice Bail Agent", 1, "250 metre radius on fugitive location areas."],
	[3, 10000, "Improved Bail Agent", 2, "210 metre radius on fugitive location areas."],
	[4, 25000, "Master Bail Agent", 3, "175 metre radius on fugitive location areas."],
	[5, 2000, "Basic Snitches", 1, "2.5 minute fugitive updates."],
	[6, 10000, "Improved Snitches", 5, "2 minute fugitive updates."],
	[7, 25000, "Master of Information", 6, "Ability to track 2 individual targets in a 2 minute period."],
	[8, 2000, "Fair Share", 1, "5% of the bounty amount of your group mate’s arrest is paid to you."],
	[9, 10000, "Taste of the Action", 8, "10% of the bounty amount of your group mate’s arrest is paid to you."],
	[10, 25000, "Claim Your Prize", 9, "15% of the bounty amount of your group mate’s arrest is paid to you."],
	[11, 50000, "Master Crusader", 1, "Automatically set in game waypoint to the center of the circle for the most recently tracked target.  Access to Skiptracer jail facility."],
	[12, 500, "Predator", 0, "The predator seeks to benefit himself, and follows no laws of governments. Access to the MX series rifle and carbine with stun rounds."],
	[13, 2000, "Slim Jim", 12, "Lockpicking vehicles is 20% faster."],
	[14, 10000, "Hotwire apprentice", 13, "Lockpicking vehicles is 40% faster."],
	[15, 25000, "Lockpick and a Dream", 14, "Increased chance of succeeding with vehicle lockpicking."],
	[16, 2000, "Pickpocket", 12, "Able to rob money off of your restrained bounty target."],
	[17, 10000, "Improved Pickpocket", 16, "Robbing your bounty gives you a chance to take high value items from restrained bounty target’s inventory."],
	[18, 25000, "Disarming", 17, "Removes the holstered secondary weapon and any grenades from your restrained bounty target."],
	[19, 2000, "Novice Eluder", 12, "10% chance that crimes committed against your bounty target will not register."],
	[20, 10000, "Improved Eluder", 19, "20% chance that crimes committed against your bounty target will not register."],
	[21, 25000, "Master of Elusion", 20, "30% chance that crimes committed against your bounty target will not register."],
	[22, 50000, "Apex Predator", 12, "Will allow all gear to be stripped from the captured player at the enhanced interrogation facility. Allows pickpocketing and disarming to be used against anyone."]
];
life_gangTalentInfo =
[
	[1, "CIV", "Gang Groupon", 0, "All members of the gang receive a 10% reduction at rebel markets."],
	[2, "CIV", "Hagglers", 1, "All members of the gang receive a 5% reduction on rebel clothing and equipment."],
	[3, "CIV", "Offer He Can't Refuse", 2, "All members of the gang receive a 5% reduction on rebel weapons."],
	[4, "CIV", "Fence", 0, "All members of the gang receive a 5% increase in sales prices at Wong's and drug dealers."],
	[5, "CIV", "Kingpin", 4, "All members of the gang receive an additional 5% increase in sales prices at drug dealers."],
	[6, "CIV", "Bootlegger", 5, "All members of the gang receive an additional 5% increase in sales prices at Wong's."],
	[7, "CIV", "Flyboys", 0, "All members of the gang can now spawn air vehicles at owned turf regions."],
	[8, "CIV", "Drug Pushers", 7, "All members of the gang can now gather cocaine, heroin and cannabis more quickly."],
	[9, "CIV", "Distributors", 8, "All members of the gang can now gather ephedra and coca leaves more quickly."]
];
life_prestigeInfo = if (worldName == "Australia") then {
	[
		[1, 0, "Warrant Squad", 0, "The warrant squad is tasked with tracking down fugitives on the Asylum servers.  Each warrant squad member will be able to take a single warrant at a time and track down that fugitive to bring them to justice.  Progression in the warrant squad skill line is broken into two (2) parts: accuracy and time."],
		[2, 1000, "Novice Man Tracker", 1, "One kilometre radius on fugitive location areas."],
		[3, 5000, "Improved Man Tracker", 2, "900 metre radius on fugitive location areas."],
		[4, 15000, "Corporal Master Tracker", 3, "800 metre radius on fugitive location areas."],
		[5, 25000, "Sergeant Man Tracker", 4, "500 metre radius on fugitive location areas."],
		[6, 40000, "Sergeant Master Tracker", 5, "400 metre radius on fugitive location areas."],
		[7, 40000, "Lieutenant Manhunter", 6, "300 metre radius on fugitive location areas."],
		[8, 50000, "Master Manhunter", 7, "200 metre radius on fugitive location areas."],
		[9, 5000, "Basic Sources", 1, "Eight minute fugitive updates."],
		[10, 20000, "Improved Sources", 9, "Six minute fugitive updates."],
		[11, 35000, "Cultivated Sources", 10, "Three minute fugitive updates."],
		[12, 70000, "Master of Information", 11, "Two minute fugitive updates."],
		//[13, 0, "Drug Enforcement", 0, "The Drug Enforcement squad is tasked with keeping narcotics out of the hands of would be drug traffickers on our fine islands.  Each drug enforcement squad member will be able to choose one (1) narcotic to track at a given time.  Progression in the drug enforcement skill line is broken into two (3) parts:  accuracy, time, and seizure potential."],
		//[14, 1000, "Rookie Narcotics", 13, "Two kilometre radius on vehicle tracking."],
		//[15, 20000, "Corporal Narcotics", 14, "One kilometre radius on vehicle tracking."],
		//[16, 40000, "Sergeant Narcotics", 15, "700 metre radius on vehicle tracking."],
		//[17, 60000, "Lieutenant Narcotics", 16, "500 metre radius on vehicle tracking."],
		//[18, 1000, "Street-Level Informants", 13, "10 minute updates."],
		//[19, 20000, "Trusted CIs", 18, "8 minute updates."],
		//[20, 40000, "Man on the Inside", 19, "6 minute updates."],
		//[21, 60000, "Dealing Like a DA", 20, "4 minute updates."],
		//[22, 5000, "Small-Time Dealers", 13, "Able to track vehicles up to $100k."],
		//[23, 15000, "Distributor Tracker", 22, "Able to track vehicles up to $250k."],
		//[24, 44000, "Kingpin Hunter", 23, "Able to track vehicles in excess of $250k."],
		[25, 0, "Combat Medicine", 0, "The combat medicine specialization will be the APD’s in the field triage unit.  Having a combat medic with you when on patrol can be the difference between life and death, as well as the difference between capturing dangerous criminals and allowing them to continue roaming the countryside."],
		[26, 1000, "Pill Pusher", 25, "Pain killers are always available."],
		[27, 10000, "I/V Technician", 26, "Using a blood bag on others is 25% faster."],
		[28, 25000, "I/V Expert", 27, "Using a blood bag on others is 50% faster."],
		[29, 45000, "I/V Master", 28, "Using a blood bag on others is 75% faster and does not consume the blood bag."],
		[30, 10000, "Splint Technician", 25, "Using a splint on others is 25% faster."],
		[31, 25000, "Splint Expert", 30, "Using a splint on others is 50% faster."],
		[32, 45000, "Splint Master", 31, "Using a splint on others is 75% faster and does not consume the splint."],
		[33, 10000, "Triage Technician", 25, "Using a defibrillator is 25% faster."],
		[34, 25000, "Triage Expert", 33, "Using a defibrillator is 50% faster."],
		[35, 45000, "Triage Master", 34, "Using a defibrillator is 75% faster."],
		[36, 65000, "Master Combat Medic", 25, "Overrides the 5 minute cooldown on reviving a player.  ATTENTION: This will only function for Sergeants and higher rank, and also requires I/V Master, Splint Master and Triage Master."],
		[37, 0, "Undercover", 0, "Undercover officers of the APD will be those that investigate various crimes on our islands.  They will be special due to their plain clothes and unmarked vehicles, as well as their hybrid skill tree nature.  The undercover slots will have gear pre-assigned to them.."],
		[38, 1000, "Unmarked Vehicles", 37, "Access to unmarked basic vehicles."],
		[39, 15000, "Improved Vehicles", 38, "Access to unmarked advanced vehicles."],
		[40, 30000, "Advanced Vehicles", 39, "Access to unmarked sports cars."],
		[41, 65000, "Vehicle Master", 40, "Access to civilian trucks for advanced sting operations."],
		[42, 10000, "Basic Air", 37, "Access to unmarked MH9."],
	//	[43, 35000, "Improved Air", 42, "Access to unmarked small airplanes."], //Coming soon
	//	[44, 65000, "Advanced Air", 43, "Access to unmarked large airplanes."], //Coming soon
		[45, 5000, "Novice Pill Pusher", 37, "Chance that pain killers will not be consumed on use."],
		[46, 10000, "Novice I/V Technician", 45, "Using a blood bag on others is 25% faster."],
		[47, 25000, "Novice Splint Technician", 46, "Using a splint on others is 25% faster."],
		[48, 45000, "Novice Triage Technician", 47, "Using a defibrillator is 25% faster."]
	];
} else {
	[
		[1, 0, "Warrant Squad", 0, "The warrant squad is tasked with tracking down fugitives on the Asylum servers.  Each warrant squad member will be able to take a single warrant at a time and track down that fugitive to bring them to justice.  Progression in the warrant squad skill line is broken into two (2) parts: accuracy and time."],
		[2, 1000, "Novice Man Tracker", 1, "One kilometre radius on fugitive location areas."],
		[3, 5000, "Improved Man Tracker", 2, "900 metre radius on fugitive location areas."],
		[4, 15000, "Corporal Master Tracker", 3, "800 metre radius on fugitive location areas."],
		[5, 25000, "Sergeant Man Tracker", 4, "500 metre radius on fugitive location areas."],
		[6, 40000, "Sergeant Master Tracker", 5, "400 metre radius on fugitive location areas."],
		[7, 40000, "Lieutenant Manhunter", 6, "300 metre radius on fugitive location areas."],
		[8, 50000, "Master Manhunter", 7, "200 metre radius on fugitive location areas."],
		[9, 5000, "Basic Sources", 1, "Eight minute fugitive updates."],
		[10, 20000, "Improved Sources", 9, "Six minute fugitive updates."],
		[11, 35000, "Cultivated Sources", 10, "Three minute fugitive updates."],
		[12, 70000, "Master of Information", 11, "Two minute fugitive updates."],
		//[13, 0, "Drug Enforcement", 0, "The Drug Enforcement squad is tasked with keeping narcotics out of the hands of would be drug traffickers on our fine islands.  Each drug enforcement squad member will be able to choose one (1) narcotic to track at a given time.  Progression in the drug enforcement skill line is broken into two (3) parts:  accuracy, time, and seizure potential."],
		//[14, 1000, "Rookie Narcotics", 13, "Two kilometre radius on vehicle tracking."],
		//[15, 20000, "Corporal Narcotics", 14, "One kilometre radius on vehicle tracking."],
		//[16, 40000, "Sergeant Narcotics", 15, "700 metre radius on vehicle tracking."],
		//[17, 60000, "Lieutenant Narcotics", 16, "500 metre radius on vehicle tracking."],
		//[18, 1000, "Street-Level Informants", 13, "10 minute updates."],
		//[19, 20000, "Trusted CIs", 18, "8 minute updates."],
		//[20, 40000, "Man on the Inside", 19, "6 minute updates."],
		//[21, 60000, "Dealing Like a DA", 20, "4 minute updates."],
		//[22, 5000, "Small-Time Dealers", 13, "Able to track vehicles up to $100k."],
		//[23, 15000, "Distributor Tracker", 22, "Able to track vehicles up to $250k."],
		//[24, 44000, "Kingpin Hunter", 23, "Able to track vehicles in excess of $250k."],
		[25, 0, "Combat Medicine", 0, "The combat medicine specialization will be the APD’s in the field triage unit.  Having a combat medic with you when on patrol can be the difference between life and death, as well as the difference between capturing dangerous criminals and allowing them to continue roaming the countryside."],
		[26, 1000, "Pill Pusher", 25, "Pain killers are always available."],
		[27, 10000, "I/V Technician", 26, "Using a blood bag on others is 25% faster."],
		[28, 25000, "I/V Expert", 27, "Using a blood bag on others is 50% faster."],
		[29, 45000, "I/V Master", 28, "Using a blood bag on others is 75% faster and does not consume the blood bag."],
		[30, 10000, "Splint Technician", 25, "Using a splint on others is 25% faster."],
		[31, 25000, "Splint Expert", 30, "Using a splint on others is 50% faster."],
		[32, 45000, "Splint Master", 31, "Using a splint on others is 75% faster and does not consume the splint."],
		[33, 10000, "Triage Technician", 25, "Using a defibrillator is 25% faster."],
		[34, 25000, "Triage Expert", 33, "Using a defibrillator is 50% faster."],
		[35, 45000, "Triage Master", 34, "Using a defibrillator is 75% faster."],
		[36, 65000, "Master Combat Medic", 25, "Overrides the 5 minute cooldown on reviving a player.  ATTENTION: This will only function for Sergeants and higher rank, and also requires I/V Master, Splint Master and Triage Master."],
		[37, 0, "Undercover", 0, "Undercover officers of the APD will be those that investigate various crimes on our islands.  They will be special due to their plain clothes and unmarked vehicles, as well as their hybrid skill tree nature.  The undercover slots will have gear pre-assigned to them.."],
		[38, 1000, "Unmarked Vehicles", 37, "Access to unmarked hatchback."],
		[39, 15000, "Improved Vehicles", 38, "Access to unmarked offroads."],
		[40, 30000, "Advanced Vehicles", 39, "Access to unmarked SUVs and sports hatchback [donors only]."],
		[41, 65000, "Vehicle Master", 40, "Access to civilian trucks for advanced sting operations."],
		[42, 10000, "Basic Air", 37, "Access to unmarked MH9/M900."],
		[43, 35000, "Improved Air", 42, "Access to unmarked Hellcat and Orca."],
		[44, 65000, "Advanced Air", 43, "Access to unmarked Mohawk [donors only]."],
		[45, 5000, "Novice Pill Pusher", 37, "Chance that pain killers will not be consumed on use."],
		[46, 10000, "Novice I/V Technician", 45, "Using a blood bag on others is 25% faster."],
		[47, 25000, "Novice Splint Technician", 46, "Using a splint on others is 25% faster."],
		[48, 45000, "Novice Triage Technician", 47, "Using a defibrillator is 25% faster."]
  ];
};
life_talentInfo = if (worldName == "Australia") then
{
	[
		// Civilian
		[1, "CIV", "Vigilante", 0, "Able to buy bounty hunter license. Max bounty $25,000."],
		[2, "CIV", "Bounty Hunter", 1, "Maximum bounty increased to $50,000."],
		[3, "CIV", "Bounty Hunter 2", 2, "Maximum bounty increased to $100,000. Able to see group members' tracked targets on your map."],
//		[4, "CIV", "Bounty Hunter 3", 3, "Maximum bounty increased to $100,000."],
		[5, "CIV", "Feud", 3, "Access to MP5N SMG and Colt Carbine with rubber bullets."],
//		[6, "CIV", "Bounty Hunter 4", 4, "Unlimited maximum bounty. Can see tracking locations from group members."],
		[7, "CIV", "Watch Dog", 1, "Receive reports when your bounty accesses an ATM."],
		[8, "CIV", "Informants", 7, "Rare chance that informants may spot bounties in populated areas."],
		[9, "CIV", "Motivated", 8, "Able to have up to 4 active bounties at a time."],
		[126, "CIV", "Master Bounty Hunter", 1, "Access to BH skinned Hunter.  Also no charge applied when restraining group member's bounty. Unlimited maximum bounty"],
		//[124, "CIV", "Determined", 6, "Improved accuracy of bounty tracking."],
		//[125, "CIV", "Blood Hound", 124, "Greatly improved accuracy of bounty tracking."],
		[10, "CIV", "First Aid", 0, "Can use blood bag to heal up to 80 health."],
		[11, "CIV", "First Aid Level B", 10, "Can use blood bag to heal up to 90 health."],
		[12, "CIV", "First Aid Level C", 11, "Can use blood bag to heal up to 100 health."],
		[13, "CIV", "Get on up", 10, "Ability to fix broken legs with a splint."],
		[14, "CIV", "Shocking", 13, "Can revive an unconscious player with defibrillator."],
		[15, "CIV", "Jaws of Life", 14, "Able to pull unconscious players from a vehicle."],

		[16, "CIV", "Silver Tongue", 0, "Reduce cost of all new vehicles by 2%."],
		[17, "CIV", "Unrestricted License", 0, "Ability to buy luxury class vehicles."],
		[18, "CIV", "Chauffeur License", 17, "Receive taxi pick-up requests."],
		[19, "CIV", "Commercial License", 17, "Ability to buy large cargo trucks."],
		[106, "CIV", "Ranking Rebel", 19, "Ability to buy heavy para-military vehicles."],
		[20, "CIV", "Private Pilot", 17, "Ability to buy and take out small helicopters and airplanes."],
		[21, "CIV", "Commercial Pilot", 20, "Ability to buy and take out large airplanes."],
		[22, "CIV", "Airborne", 21, "All air vehicles are stocked with parachutes."],
		[23, "CIV", "Advanced Tracking", 21, "All air vehicles come with a tracking unit."],
		[24, "CIV", "Weed Processor", 0, "Maximum return when processing marijuana."],
		[25, "CIV", "Heroin Junky", 24, "Maximum return when processing heroin."],
		[26, "CIV", "Cocaine Processor", 25, "Maximum return when processing cocaine."],
		[27, "CIV", "Meth Cook", 26, "Maximum return when cooking methamphetamine."],

		[29, "CIV", "Rebel", 0, "Able to buy Rebel license."],
		[30, "CIV", "Guerilla", 29, "Able to buy and use ghillie suits."],
		[31, "CIV", "Marksman", 29, "Able to buy and use 7.62mm rifles and ammunition."],
		[32, "CIV", "Weapon Technician", 29, "Ability to use vehicle ammunition reloads."],
		[33, "CIV", "Terrorist", 29, "Able to buy and use suicide vest."],

		[34, "CIV", "Delivery Man", 0, "Increases payout from delivery missions by 10%."],
		[35, "CIV", "Precious Cargo", 34, "Increases payout from parcel missions by further 20% (requires vehicle which can hold container)."],
		[36, "CIV", "Delivery Pilot", 35, "Increases payout from container missions by further 25% (requires heavy helicopter)."],

		[38, "CIV", "Citizenship", 0, "Able to buy home owners license."],
		[39, "CIV", "Handyman", 38, "Reduce home upkeep cost by 25%. (Not Yet Implemented)"],
		[40, "CIV", "Leadership", 38, "Able to convert a home into a new gang headquarters."],
		[41, "CIV", "Inspirational", 39, "Reduces upkeep of formed gangs by 5%."],
		[42, "CIV", "Intimidating", 0, "Get up to 20% more money when robbing stores."],
		[43, "CIV", "Heister", 42, "Faster with bolt-cutters on gates, and adept at avoiding gate alarm triggers."],
		[115, "CIV", "Systems Engineer", 42, "Significantly faster at opening bank vaults."],
		[119, "CIV", "Subterfuge", 115, "Reduced chance of setting off an alarm while hacking vaults."],
		[116, "CIV", "Safe-Cracker", 42, "Able to use demo charges on bank safes."],
		[117, "CIV", "Explosives Expert", 116, "Reduced chance of setting off an alarm while using explosives on vaults."],
		[118, "CIV", "Clandestine", 42, "Reduced chance of being spotted by bank cameras."],
		[44, "CIV", "Hacker", 42, "Delays store security alarms for up to 2 minutes."],
		[45, "CIV", "Mugger", 42, "20% chance personal robberies will not be reported."],
		[46, "CIV", "Professional", 45, "Increased bank payout by 10% when you start the robbery."],
		[47, "CIV", "Hardy", 0, "Reduced chance of leg breaking on impact."],
		[48, "CIV", "Resilient", 47, "Slim chance that you will wake up in a hospital upon death."],
		[49, "CIV", "Major Miner", 0, "Improved chance of getting something valuable while mining."],
		[50, "CIV", "Brawny", 49, "Increases speed at which you mine."],
		[51, "CIV", "Ore Specialist", 50, "Increased chance of finding metal ores while mining."],
		[52, "CIV", "Gem Specialist", 50, "Increased chance of finding precious gems while mining."],
		[53, "CIV", "Awareness", 0, "See the location of group members on your map."],
		[54, "CIV", "Vigilant", 53, "See the location of gang members on your map."],
		[55, "CIV", "Grand Theft Auto", 0, "Able to pick locks of standard ground vehicles."],
		[56, "CIV", "Twocker", 55, "Increased chance of succeeding with vehicle lockpicking."],
		[57, "CIV", "Grand Auto Theft", 55, "Able to pick locks of large ground vehicles."],
		[58, "CIV", "Airbork", 57, "Able to pick locks of helicopters."],
		[59, "CIV", "Nourished", 0, "Food and drink consumption reduced by 25%."],
		[60, "CIV", "Hunger Games", 59, "Food and drink consumption reduced by 50%."],
		[61, "CIV", "Red Burger Regular", 60, "Start life with red burgers and soda to go."],
		[62, "CIV", "Something Fishy", 0, "Longer reach when catching fish by hand."],
		[63, "CIV", "Piscator", 62, "Fishing net is increased in size to medium."],
		[64, "CIV", "Trawler", 63, "Fishing net is increased in size to large."],
		[65, "CIV", "Excavator", 62, "Faster gathering when excavating shipwrecks."],
		[66, "CIV", "Mechanic", 0, "Slightly increased speed of repairing vehicles."],
		[67, "CIV", "Grease Monkey", 66, "One in four chance that repair kit will not be consumed on use."],
		[104, "CIV", "Speed Racer", 0, "Able to purchase Go-Kart racer clothing."],
		[105, "CIV", "Oil Runner", 50, "Faster gathering of oil and increased rubber yield."],
		[121, "CIV", "Tracker", 0, "Improved skill when tracking animals within hunting areas."],
		[122, "CIV", "Expert Tracker", 121, "Expert skill when tracking animals within hunting areas."],
		// Police
		[68, "WEST", "Watch Dog", 0, "Track fugitives when they use an ATM."],
		[69, "WEST", "Informants", 68, "Rare chance that informants may spot fugitives in populated areas."],
		[70, "WEST", "Snitches", 69, "Chance to be notified when fugitives enter a criminal area."],
		[71, "WEST", "Surveillance", 70, "Able to purchase the AR-2 Darter drone. (Sergeant)"],
		[72, "WEST", "On the Beat", 70, "Chance to be alerted of drug dealer transaction."],
		[73, "WEST", "Traffic Cop", 0, "Radar gun always usable from within a police vehicle."],
		[74, "WEST", "Highway Patrol", 73, "Any weapon can act as a radar gun."],
		[75, "WEST", "Traffic Control", 74, "Ability to place traffic objects."],
		//[76, "WEST", "Last Resort",73, "Able to purchase spike strips."],
		[77, "WEST", "Show of Force", 0, "Able to purchase the MP5N SMG."],
		[78, "WEST", "Show of Force 2", 77, "Able to purchase the MP5K-PDW and SDAR assault rifles. (Constable)"],
		[79, "WEST", "Prudent", 78, "Able to purchase protective tactical vest."],
		[80, "WEST", "Show of Force 3", 78, "Able to purchase the AR15 Dissipator Carbine. (Constable)"],
		[81, "WEST", "Show of Force 4", 80, "Able to purchase the MP5A4 SMG (Constable), Colt Carbine (Sergeant), or BCM Jack Carbine (LT)."],
		[82, "WEST", "Stunning", 80, "Able to purchase flashbangs. (Constable)"],
		[83, "WEST", "Mechanic", 0, "You can now repair vehicles without the use of tools."],
		[84, "WEST", "Grease Monkey", 83, "Slightly increased speed of repairing vehicles."],
		[85, "WEST", "Nourished", 0, "Food and drink consumption reduced by 25%."],
		[86, "WEST", "Hunger Games", 85, "Food and drink consumption reduced by 50%."],
		[87, "WEST", "High Alert", 0, "New police vehicles have pre-installed alarm."],
		[88, "WEST", "Sentry", 87, "Notified when a vehicle alarm is activated."],
		[89, "WEST", "Heedful", 88, "All police vehicles have pre-installed trackers."],
		[90, "WEST", "First Aid", 0, "Can use blood bag to heal up to 80 health."],
		[91, "WEST", "First Aid Level B", 90, "Can use blood bag to heal up to 90 health."],
		[92, "WEST", "First Aid Level C", 91, "Can use blood bag to heal up to 100 health."],
		[93, "WEST", "First Aid Level D", 92, "Ability to fix broken legs with a splint."],
		[94, "WEST", "Combat Medic", 93, "Can revive an unconscious player with defibrillator."],
		[95, "WEST", "Country Cop", 0, "Able to purchase the police offroad truck. (Constable)"],
		[96, "WEST", "Patrol Officer", 95, "Able to purchase the police Crown Vic and Perrari 458. (Constable)"],
		[97, "WEST", "Flight Training", 95, "Able to purchase the MH-9 Hummingbird. (Constable)"],
//		[98, "WEST", "Flight Transport", 97, "Able to purchase the PO-30 Orca. (Sergeant)"],
//		[99, "WEST", "Advanced Pilot", 98, "Able to purchase the WY-55 Hellcat. (Lieutenant)"],
//		[100, "WEST", "Advanced Driver", 96, "Able to purchase the Hunter. (Lieutenant)"],
		[101, "WEST", "Profiteer", 0, "Receive 75% of arrested criminal's warrant value."],
		[102, "WEST", "Profiteer 2", 101, "Receive 85% of arrested criminal's warrant value."], //
		[103, "WEST", "Profiteer 3", 102, "Receive 100% of arrested criminal's warrant value."],
		[120, "WEST", "Reserve Guard", 0, "Able to unlock federal reserve front gates instantly."],
		// Paramedic
		[107, "GUER", "Mobile Paramedic", 0, "Ability to buy paramedic Offroad truck."],
		[108, "GUER", "First Responder", 107, "Ability to buy paramedic SUV."],
		[109, "GUER", "Public Service", 0, "Receive taxi pick-up requests."],
		[114, "GUER", "Trained Mechanic", 0, "Repair vehicles without the use of a repair kit."],
		[110, "GUER", "Medivac", 108, "Able to buy paramedic helicopter on the roofs of hospitals in major cities."],
		[111, "GUER", "Life Saver", 0, "Saving another's life has fully satisfied your hunger and thirst."],
		[112, "GUER", "Cardiac Specialist", 111, "Your advanced training allows you to revive injured people faster."],
		[113, "GUER", "Orthopaedic Specialist", 111, "Chance to not consume a splint while treating broken limbs."],
		[123, "GUER", "Awareness", 0, "See the location of other paramedics on your map."]
	];
}
else
{
	[
		// Civilian
		[1, "CIV", "Vigilante", 0, "Able to buy bounty hunter license. Max bounty $25,000."],
		[2, "CIV", "Bounty Hunter", 1, "Maximum bounty increased to $50,000."],
		[3, "CIV", "Bounty Hunter 2", 2, "Maximum bounty increased to $100,000. Able to see group members' tracked targets on your map."],
//		[4, "CIV", "Bounty Hunter 3", 3, "Maximum bounty increased to $100,000."],
		[5, "CIV", "Feud", 3, "Access to higher caliber stunning weapons."],
//		[6, "CIV", "Bounty Hunter 4", 4, "Unlimited maximum bounty. Can see tracking locations from group members."],
		[7, "CIV", "Watch Dog", 1, "Receive reports when your bounty accesses an ATM."],
		[8, "CIV", "Informants", 7, "Rare chance that informants may spot bounties in populated areas."],
		[9, "CIV", "Motivated", 8, "Able to have up to 4 active bounties at a time."],
		[126, "CIV", "Master Bounty Hunter", 1, "Access to BH skinned Hunter.  Also no charge applied when restraining group member's bounty. Unlimited maximum bounty. (can not have Marksman)"],
		//[124, "CIV", "Determined", 6, "Improved accuracy of bounty tracking (250 meter radius on tracking circle)."],
		//[125, "CIV", "Blood Hound", 124, "Greatly improved accuracy of bounty tracking (175 meter radius on tracking circle)."],
		[10, "CIV", "First Aid", 0, "Can use blood bag to heal up to 80 health."],
		[11, "CIV", "First Aid Level B", 10, "Can use blood bag to heal up to 90 health."],
		[12, "CIV", "First Aid Level C", 11, "Can use blood bag to heal up to 100 health."],
		[13, "CIV", "Get on up", 10, "Ability to fix broken legs with a splint."],
		[14, "CIV", "Shocking", 13, "Can revive an unconscious player with defibrillator."],
		[15, "CIV", "Jaws of Life", 14, "Able to pull unconscious players from a vehicle."],

		[16, "CIV", "Silver Tongue", 0, "Reduce cost of all new vehicles by 2%."],
		[17, "CIV", "Unrestricted License", 0, "Ability to buy luxury class vehicles."],
		[18, "CIV", "Chauffeur License", 17, "Receive taxi pick-up requests."],
		[19, "CIV", "Commercial License", 17, "Ability to buy large cargo trucks."],
		[106, "CIV", "Ranking Rebel", 19, "Ability to buy heavy para-military vehicles."],
		[20, "CIV", "Private Pilot", 17, "Ability to buy and take out small helicopters."],
		[21, "CIV", "Commercial Pilot", 20, "Ability to buy and take out large helicopters."],
		[22, "CIV", "Airborne", 21, "All air vehicles are stocked with parachutes."],
		[23, "CIV", "Advanced Tracking", 21, "All air vehicles come with a tracking unit."],
		[24, "CIV", "Weed Processor", 0, "Maximum return when processing marijuana."],
		[25, "CIV", "Heroin Junky", 24, "Maximum return when processing heroin."],
		[26, "CIV", "Cocaine Processor", 25, "Maximum return when processing cocaine."],
		[27, "CIV", "Meth Cook", 26, "Maximum return when cooking methamphetamine."],

		[29, "CIV", "Rebel", 0, "Able to buy Rebel license."],
		[30, "CIV", "Guerilla", 29, "Able to buy and use ghillie suits."],
		[31, "CIV", "Marksman", 29, "Able to buy and use 7.62mm rifles and ammunition. (can not have Master Bounty Hunter)"],
		[32, "CIV", "Weapon Technician", 29, "Ability to use vehicle ammunition reloads."],
		[33, "CIV", "Terrorist", 29, "Able to buy and use suicide vest."],

		[34, "CIV", "Delivery Man", 0, "Increases payout from delivery missions by 10%."],
		[35, "CIV", "Precious Cargo", 34, "Increases payout from parcel missions by further 20% (requires vehicle which can hold container)."],
		[36, "CIV", "Delivery Pilot", 35, "Increases payout from container missions by further 25% (requires heavy helicopter)."],

		[38, "CIV", "Citizenship", 0, "Able to buy home owners license."],
		[39, "CIV", "Handyman", 38, "Reduce home upkeep cost by 25%. (Not Yet Implemented)"],
		[40, "CIV", "Leadership", 38, "Able to convert a home into a new gang headquarters."],
		[41, "CIV", "Inspirational", 39, "Reduces upkeep of formed gangs by 5%."],
		[42, "CIV", "Intimidating", 0, "Get up to 20% more money when robbing stores."],
		[43, "CIV", "Heister", 42, "Faster with bolt-cutters on gates, and adept at avoiding gate alarm triggers."],
		[115, "CIV", "Systems Engineer", 42, "Significantly faster at opening bank vaults."],
		[119, "CIV", "Subterfuge", 115, "Reduced chance of setting off an alarm while hacking vaults."],
		[116, "CIV", "Safe-Cracker", 42, "Able to use demo charges on bank safes."],
		[117, "CIV", "Explosives Expert", 116, "Reduced chance of setting off an alarm while using explosives on vaults."],
		[118, "CIV", "Clandestine", 42, "Reduced chance of being spotted by bank cameras."],
		[44, "CIV", "Hacker", 42, "Delays store security alarms for up to 2 minutes."],
		[45, "CIV", "Mugger", 42, "20% chance personal robberies will not be reported."],
		[46, "CIV", "Professional", 45, "Increased bank payout by 10% when you start the robbery."],
		[47, "CIV", "Hardy", 0, "Reduced chance of leg breaking on impact."],
		[48, "CIV", "Resilient", 47, "Slim chance that you will wake up in a hospital upon death."],
		[49, "CIV", "Major Miner", 0, "Improved chance of getting something valuable while mining."],
		[50, "CIV", "Brawny", 49, "Increases speed at which you mine."],
		[51, "CIV", "Ore Specialist", 50, "Increased chance of finding metal ores while mining."],
		[52, "CIV", "Gem Specialist", 50, "Increased chance of finding precious gems while mining."],
		[53, "CIV", "Awareness", 0, "See the location of group members on your map."],
		[54, "CIV", "Vigilant", 53, "See the location of gang members on your map."],
		[55, "CIV", "Grand Theft Auto", 0, "Able to pick locks of standard ground vehicles."],
		[56, "CIV", "Twocker", 55, "Increased chance of succeeding with vehicle lockpicking."],
		[57, "CIV", "Grand Auto Theft", 55, "Able to pick locks of large ground vehicles."],
		[58, "CIV", "Airbork", 57, "Able to pick locks of helicopters."],
		[59, "CIV", "Nourished", 0, "Food and drink consumption reduced by 25%."],
		[60, "CIV", "Hunger Games", 59, "Food and drink consumption reduced by 50%."],
		[61, "CIV", "Red Burger Regular", 60, "Start life with red burgers and soda to go."],
		[62, "CIV", "Something Fishy", 0, "Longer reach when catching fish by hand."],
		[63, "CIV", "Piscator", 62, "Fishing net is increased in size to medium."],
		[64, "CIV", "Trawler", 63, "Fishing net is increased in size to large."],
		[65, "CIV", "Excavator", 62, "Faster gathering when excavating shipwrecks."],
		[66, "CIV", "Mechanic", 0, "Slightly increased speed of repairing vehicles."],
		[67, "CIV", "Grease Monkey", 66, "One in four chance that repair kit will not be consumed on use. Also, your vehicles will spawn with toolkits."],
		[104, "CIV", "Speed Racer", 0, "Able to purchase Go-Kart racer clothing."],
		[105, "CIV", "Oil Runner", 50, "Faster gathering of oil and increased rubber yield."],
		[121, "CIV", "Tracker", 0, "Improved skill when tracking animals within hunting areas."],
		[122, "CIV", "Expert Tracker", 121, "Expert skill when tracking animals within hunting areas."],
		// Police
		[68, "WEST", "Watch Dog", 0, "Track fugitives when they use an ATM."],
		[69, "WEST", "Informants", 68, "Rare chance that informants may spot fugitives in populated areas."],
		[70, "WEST", "Snitches", 69, "Chance to be notified when fugitives enter a criminal area."],
		[71, "WEST", "Surveillance", 70, "Able to purchase the AR-2 Darter drone. (Sergeant)"],
		[72, "WEST", "On the Beat", 70, "Chance to be alerted of drug dealer transaction."],
		[73, "WEST", "Traffic Cop", 0, "Radar gun always usable from within a police vehicle."],
		[74, "WEST", "Highway Patrol", 73, "Any weapon can act as a radar gun."],
		[75, "WEST", "Traffic Control", 74, "Ability to place traffic objects."],
		//[76, "WEST", "Last Resort",73, "Able to purchase spike strips."],
		[77, "WEST", "Show of Force", 0, "Able to purchase the MK20 SMG and ammunition."],
		[78, "WEST", "Show of Force 2", 77, "Able to purchase the MXC and SDAR assault rifles. (Constable)"],
		[79, "WEST", "Prudent", 78, "Able to purchase protective tactical vest."],
		[80, "WEST", "Show of Force 3", 78, "Able to purchase the MX assault rifle. (Constable)"],
		[81, "WEST", "Show of Force 4", 80, "Able to purchase the MXM assault rifle (Corporal) and MK.1 (LT)."],
		[82, "WEST", "Stunning", 80, "Able to purchase flashbangs. (Constable)"],
		[83, "WEST", "Mechanic", 0, "You can now repair vehicles without the use of tools."],
		[84, "WEST", "Grease Monkey", 83, "Slightly increased speed of repairing vehicles."],
		[85, "WEST", "Nourished", 0, "Food and drink consumption reduced by 25%."],
		[86, "WEST", "Hunger Games", 85, "Food and drink consumption reduced by 50%."],
		[87, "WEST", "High Alert", 0, "New police vehicles have pre-installed alarm."],
		[88, "WEST", "Sentry", 87, "Notified when a vehicle alarm is activated."],
		[89, "WEST", "Heedful", 88, "All police vehicles have pre-installed trackers."],
		[90, "WEST", "First Aid", 0, "Can use blood bag to heal up to 80 health."],
		[91, "WEST", "First Aid Level B", 90, "Can use blood bag to heal up to 90 health."],
		[92, "WEST", "First Aid Level C", 91, "Can use blood bag to heal up to 100 health."],
		[93, "WEST", "First Aid Level D", 92, "Ability to fix broken legs with a splint."],
		[94, "WEST", "Combat Medic", 93, "Can revive an unconscious player with defibrillator."],
		[95, "WEST", "Country Cop", 0, "Able to purchase the police offroad truck. (Constable)"],
		[96, "WEST", "Patrol Officer", 95, "Able to purchase the police SUV and hatchback sport. (Constable)"],
		[97, "WEST", "Flight Training", 96, "Able to purchase the MH-9 Hummingbird. (Constable)"],
		[98, "WEST", "Flight Transport", 97, "Able to purchase and take out large helicopters (Corporal)"],
		[99, "WEST", "Advanced Pilot", 98, "Able to purchase the WY-55 Hellcat. (Lieutenant)"],
		[100, "WEST", "Advanced Driver", 96, "Able to purchase the Hunter. (Lieutenant)"],
		[101, "WEST", "Profiteer", 0, "Receive 75% of arrested criminal's warrant value."],
		[102, "WEST", "Profiteer 2", 101, "Receive 85% of arrested criminal's warrant value."], //
		[103, "WEST", "Profiteer 3", 102, "Receive 100% of arrested criminal's warrant value."],
		[120, "WEST", "Reserve Guard", 0, "Able to unlock federal reserve front gates instantly."],
		// Paramedic
		[107, "GUER", "Mobile Paramedic", 0, "Ability to buy paramedic Offroad truck."],
		[108, "GUER", "First Responder", 107, "Ability to buy paramedic SUV."],
		[109, "GUER", "Public Service", 0, "Receive taxi pick-up requests."],
		[114, "GUER", "Trained Mechanic", 0, "Repair vehicles without the use of a repair kit."],
		[110, "GUER", "Medivac", 108, "Able to buy paramedic helicopter on the roof of Kavala Hospital."],
		[111, "GUER", "Life Saver", 0, "Saving another's life has fully satisfied your hunger and thirst."],
		[112, "GUER", "Cardiac Specialist", 111, "Your advanced training allows you to revive injured people faster."],
		[113, "GUER", "Orthopaedic Specialist", 111, "Chance to not consume a splint while treating broken limbs."],
		[123, "GUER", "Awareness", 0, "See the location of other paramedics on your map."]
	];
};
