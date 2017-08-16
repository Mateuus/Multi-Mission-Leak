#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system
*****************************
****** Backend Variables *****
*****************************
*/
eM_ausweis = [];
eM_tot = false;
eM_serverSpawn = false;
eM_action_delay = time;
eM_trunk_vehicle = Objnull;
eM_session_completed = false;
eM_session_tries = 0;
eM_net_dropped = false;
eM_siren_active = false;
eM_siren2_active = false;
eM_siren3_active = false;
eM_recharge = false;
eM_redgull_effect = time;
eM_bail_paid = false;
eM_impound_inuse = false;
eM_spikestrip = ObjNull;
eM_knockout = false;
eM_dead = false;
eM_interrupted = false;
eM_removeWanted = false;
eM_action_gather = false;
eM_speedblock = false;
eM_tagson = true;
eM_lastMessage = [];
eM_drogen_active = false;
eM_grasonof = true;
eM_on_kill = false;
eM_speak = false;
eM_PlayerTags_active = false;
eM_leveladd = [];
eM_levelsystemarray = [];
eM_use_atm = true;
eM_is_arrested = false;
eM_istazed = false;
eM_TankLaster = 1;
eM_Jet = 1;
eM_channel_send = true;
eM_fadeSound = 0;
eM_garage_store = false;
eM_is_processing = false;
eM_action_inUse = false;
eM_paintball = false;
eM_revealObjects = true;
eM_delivery_in_progress = false;
eM_my_gang = ObjNull;
eM_market_event = [];
eM_craft = false;
eM_joinmode = 0;
eM_robbed_station = false;
EMonkeys_atmUsed = 0;

//Tutorial
eM_StartTutorial = false;
EMonkeys_PlayerInTutorial = false;
EMonkeys_TutorialLeave = false;
eM_TutorialVehicle = false;
eM_TutorialAusweis = false;

//Damagesystem
eM_face_hub = 0;
eM_neck = 0;
eM_head = 0;
eM_pelvis = 0;
eM_spine1 = 0;
eM_spine2 = 0;
eM_spine3 = 0;
eM_body = 0; 
eM_arms = 0;
eM_hands = 0;
eM_legs = 0;
eM_damage_null = 0;
eM_dead = false;

EMonkeys_clothing_filter = 0;
EMonkeys_clothing_uniform = -1;
EMonkeys_clothing_purchase = [-1,-1,-1,-1,-1];

EMonkeys_housecount = 0;
EMonkeys_VIP = 0;
EMonkeys_packetlistp = [];

EMonkeys_house_current_inv = [];
EMonkeys_house_current_weight = 0;
EMonkeys_house_current_maxweight = 0;
EMonkeys_house_current_inv_running = false;

EMonkeys_thi164 = 100;
EMonkeys_hu164 = 100;
EMonkeys_bat164 = 100;
EMonkeys_dr164 = 0;
EMonkeys_c164 = 0;

EMonkeys_drugged_cocaine = -1;
EMonkeys_drugged_cocaine_duration = 10; // In Minutes
EMonkeys_drugged_weed = -1;
EMonkeys_drugged_weed_duration = 3;
EMonkeys_vehic164 = [];

__CONST__(EMonkeys_enableFatigue,true); //Enable / Disable the ARMA 3 Fatigue System

/*
*****************************
****** Weight Variables *****
*****************************
*/
EMonkeys_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
EMonkeys_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
EMonkeys_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).
EMonkeys_mauer = ObjNull;
EMonkeys_kegel = ObjNull;

/*
*****************************
****** Life Variables *******
*****************************
*/
switch (playerSide) do
{
	case west: 
	{
		EMonkeys_a164 = 50000; //Starting Bank Money
		EMonkeys_c164 = 20000; //Starting Monkey
		EMonkeys_paycheck = 9000; //Paycheck Amount
	};
	case civilian: 
	{
		EMonkeys_a164 = 50000; //Starting Bank Money
		EMonkeys_c164 = 20000; //Starting Monkey
		EMonkeys_paycheck = 500; //Paycheck Amount
	};
	case east: 
	{
		EMonkeys_a164 = 50000; //Starting Bank Money
		EMonkeys_c164 = 20000; //Starting Monkey
		EMonkeys_paycheck = 500; //Paycheck Amount
	};
	
	case independent: 
	{
		EMonkeys_a164 = 50000;
		EMonkeys_c164 = 20000;
		EMonkeys_paycheck = 8000;
	};
};

/*
	Master Array of items?
*/
EMonkeys_inv_items = 
[
	//"EMonkeys_c164",
	"EMonkeys_inv_oilu",
	"EMonkeys_inv_oilp",
	"EMonkeys_inv_heroinu",
	"EMonkeys_inv_heroinp",
	"EMonkeys_inv_cannabis",
	"EMonkeys_inv_marijuana",
	"EMonkeys_inv_apple",
	"EMonkeys_inv_rabbit",
	"EMonkeys_inv_salema",
	"EMonkeys_inv_ornate",
	"EMonkeys_inv_mackerel",
	"EMonkeys_inv_tuna",
	"EMonkeys_inv_mullet",
	"EMonkeys_inv_catshark",
	"EMonkeys_inv_turtle",
	"EMonkeys_inv_fishingpoles",
	"EMonkeys_inv_water",
	"EMonkeys_inv_donuts",
	"EMonkeys_inv_turtlesoup",
	"EMonkeys_inv_coffee",
	"EMonkeys_inv_fuelF",
	"EMonkeys_inv_fuelE",
	"EMonkeys_inv_fuelcan_super",
	"EMonkeys_inv_fuelcan_superplus",
	"EMonkeys_inv_fuelcan_diesel",
	"EMonkeys_inv_fuelcan_biodiesel",
	"EMonkeys_inv_fuelcan_kerosin",
	"EMonkeys_inv_pickaxe",
	"EMonkeys_inv_pumpe",
	"EMonkeys_inv_axt",
	"EMonkeys_inv_hasenfalle",
	"EMonkeys_inv_copperore",
	"EMonkeys_inv_ironore",
	"EMonkeys_inv_ironr",
	"EMonkeys_inv_copperr",
	"EMonkeys_inv_sand",
	"EMonkeys_inv_salt",
	"EMonkeys_inv_saltr",
	"EMonkeys_inv_glass",
	"EMonkeys_inv_tbacon",
	"EMonkeys_inv_lockpick",
	"EMonkeys_inv_redgull",
	"EMonkeys_inv_peach",
	"EMonkeys_inv_diamond",
	"EMonkeys_inv_coke",
	"EMonkeys_inv_cokep",
	"EMonkeys_inv_diamondr",
	"EMonkeys_inv_spikeStrip",
	"EMonkeys_inv_rock",
	"EMonkeys_inv_cement",
	"EMonkeys_inv_goldbar",
	"EMonkeys_inv_silver", //##10 ##11 ##12
	"EMonkeys_inv_silverr",
	"EMonkeys_inv_blastingcharge",
	"EMonkeys_inv_boltcutter",
	"EMonkeys_inv_defusekit",
	"EMonkeys_inv_handcuffs",
	"EMonkeys_inv_jutesack",
	"EMonkeys_inv_battery",
	"EMonkeys_inv_furniture_01", //80 Platz Korb
	"EMonkeys_inv_furniture_02", //100 Platz Schublade
	"EMonkeys_inv_furniture_03", //120 Platz Schrank
	"EMonkeys_inv_furniture_04", //140 Platz Holzregal
	"EMonkeys_inv_furniture_05", //160 Platz Metallregal
	"EMonkeys_inv_mauer",
	"EMonkeys_inv_kegel",
	"EMonkeys_inv_cornmeal",
	"EMonkeys_inv_beerp",
	"EMonkeys_inv_whiskey",
	"EMonkeys_inv_rye",
	"EMonkeys_inv_hops",
	"EMonkeys_inv_yeast",
	"EMonkeys_inv_bottles",
	"EMonkeys_inv_bottledshine",
	"EMonkeys_inv_bottledbeer",
	"EMonkeys_inv_bottledwhiskey",
	"EMonkeys_inv_moonshine",
	"EMonkeys_inv_mash",
	"EMonkeys_inv_lemon",
	"EMonkeys_inv_banana",
	"EMonkeys_inv_pear",
	"EMonkeys_inv_cherry",
	"EMonkeys_inv_obstsalat",
	"EMonkeys_inv_morphine",
	"EMonkeys_inv_defibrillator",
	"EMonkeys_inv_bandage",
	//Jetmining
	"EMonkeys_inv_cellulosepulver",
	"EMonkeys_inv_maisstaerke",
	"EMonkeys_inv_mischmittel",
	"EMonkeys_inv_natriumchlorid",
	"EMonkeys_inv_tablettenrohling",
	"EMonkeys_inv_acetylsalicylsaeure",
	"EMonkeys_inv_aspirin",
	"EMonkeys_inv_sildenafil",
	"EMonkeys_inv_viagra",
	"EMonkeys_inv_hypromellose",
	"EMonkeys_inv_casanovil",
	//Crafting
	"EMonkeys_inv_craftingtool_01",
	"EMonkeys_inv_bp_sting",
	"EMonkeys_inv_bp_vermin",
	"EMonkeys_inv_bp_mk20",
	"EMonkeys_inv_bp_trg21",
	"EMonkeys_inv_bp_mx",
	"EMonkeys_inv_bp_mxc",
	"EMonkeys_inv_bp_mx_ps",
	"EMonkeys_inv_bp_mx_gl_sog",
	"EMonkeys_inv_bp_mxm",
	"EMonkeys_inv_bp_mxm_lz",
	"EMonkeys_inv_bp_mxm_sog",
	"EMonkeys_inv_bp_mxm_soa",
	"EMonkeys_inv_bp_mxm_grp",
	"EMonkeys_inv_bp_mk200mg",
	"EMonkeys_inv_bp_katiba",
	"EMonkeys_inv_bp_lynx",
	"EMonkeys_inv_bp_rahim",
	"EMonkeys_inv_bp_mar10",
	"EMonkeys_inv_bp_mk1",
	"EMonkeys_inv_bp_mk14",
	"EMonkeys_inv_bp_mk18",
	"EMonkeys_inv_bp_zafir",
	"EMonkeys_inv_bp_launch_RPG32",
	"EMonkeys_inv_bp_RPG32",
	"EMonkeys_inv_bp_titan_aa",
	"EMonkeys_inv_bp_titanr_aa",
	"EMonkeys_inv_bp_sln9mm",
	"EMonkeys_inv_bp_sln556",
	"EMonkeys_inv_bp_sln65",
	"EMonkeys_inv_bp_sln762",
	"EMonkeys_inv_bp_sln338",
	"EMonkeys_inv_bp_bipod",
	"EMonkeys_inv_bp_fatvest",
	"EMonkeys_inv_bp_lz_vest",
	"EMonkeys_inv_bp_sniperoptic",
	"EMonkeys_inv_bp_vestclblack_grp",
	"EMonkeys_inv_bp_vestcrgreen_grp",
	"EMonkeys_inv_bp_vestpcl_ctrg",
	"EMonkeys_inv_bp_vestpch_ctrg",
	"EMonkeys_inv_bp_tacvestblack_grp",
	"EMonkeys_inv_bp_vestclblack2_grp",
	"EMonkeys_inv_bp_furniture_05",
	"EMonkeys_inv_bp_rolex",
	"EMonkeys_inv_rolex",
	"EMonkeys_inv_bp_ghillie",
	"EMonkeys_inv_bp_almanach",
	"EMonkeys_inv_almanach",
	"EMonkeys_inv_bp_aktex",
	"EMonkeys_inv_bp_tazer",
	"EMonkeys_inv_aktex",
	"EMonkeys_inv_aktex1",
	"EMonkeys_inv_aktex2",
	"EMonkeys_inv_aktex3",
	"EMonkeys_inv_aktex4",
	"EMonkeys_inv_aktex5",
	"EMonkeys_inv_aktex6",
	"EMonkeys_inv_aktex7",
	"EMonkeys_inv_aktex8",
	"EMonkeys_inv_aktex9",
	"EMonkeys_inv_maut_pkw",
	"EMonkeys_inv_maut_lkw",
	"EMonkeys_inv_carbonfaser",
	"EMonkeys_inv_kohlenstoff",
	"EMonkeys_inv_plastik",
	"EMonkeys_inv_goldarmierung",
	"EMonkeys_inv_uhrwerk",
	"EMonkeys_inv_ziffernblatt",
	"EMonkeys_inv_kupferteile",
	"EMonkeys_inv_zahnrad",
	"EMonkeys_inv_alup",
	"EMonkeys_inv_alufaser",
	"EMonkeys_inv_aluunrein",
	"EMonkeys_inv_papier",
	"EMonkeys_inv_elektroschrott",
	"EMonkeys_inv_edelmetall",
	"EMonkeys_inv_flush",
	"EMonkeys_inv_phosphor",
	"EMonkeys_inv_edelholz",
	"EMonkeys_inv_bretter",
	"EMonkeys_inv_holz",
	"EMonkeys_inv_leder",
	"EMonkeys_inv_unv_leder",
	"EMonkeys_inv_felle",
	"EMonkeys_inv_baumwolle",
	"EMonkeys_inv_faser",
	"EMonkeys_inv_stoff",
	"EMonkeys_inv_dreck",
	"EMonkeys_inv_dreckhaufen",
	"EMonkeys_inv_schutt",
	"EMonkeys_inv_schutthaufen",
	"EMonkeys_inv_titanore",
	"EMonkeys_inv_titaneisen",
	"EMonkeys_inv_titanmantel",
	
	"EMonkeys_inv_fahrzeugteile",
	"EMonkeys_inv_bp_humm_civ",
	"EMonkeys_inv_bs_humm_civ",
	"EMonkeys_inv_bs_zamak_i",
	"EMonkeys_inv_bs_zamak_ii",
	"EMonkeys_inv_bs_zamak_f_i",
	"EMonkeys_inv_bs_zamak_f_ii",	
	"EMonkeys_inv_bs_zamak_r_i",
	"EMonkeys_inv_bs_zamak_r_ii",
	"EMonkeys_inv_bs_offroad",
	"EMonkeys_inv_bs_suv",
	
	"EMonkeys_inv_urkunde_q315",
	"EMonkeys_inv_urkunde_q415",
	"EMonkeys_inv_urkunde_q116",
	"EMonkeys_inv_urkunde_q216",
	"EMonkeys_inv_gpstracker",
	"EMonkeys_inv_gpsscanner",
	"EMonkeys_inv_gpsremover",
	
	"EMonkeys_inv_eventitem_1",
	"EMonkeys_inv_eventitem_2",
	"EMonkeys_inv_eventitem_3",
	
	"EMonkeys_inv_goldener_pokal",
	"EMonkeys_inv_silberner_pokal",
	"EMonkeys_inv_bronzener_pokal",
	
	"EMonkeys_inv_insurance_a",
	"EMonkeys_inv_insurance_b",
	
	"EMonkeys_inv_tabak",
	"EMonkeys_inv_feinschnitt",
	"EMonkeys_inv_seawater",
	"EMonkeys_inv_diesel",
	"EMonkeys_inv_diesel_gestreckt",
	"EMonkeys_inv_biodiesel",
	"EMonkeys_inv_super",
	"EMonkeys_inv_superplus",
	"EMonkeys_inv_zigarette",
	"EMonkeys_inv_raps",
	"EMonkeys_inv_tabakblatt",
	"EMonkeys_inv_zigarre",
	"EMonkeys_inv_edelzigarre",
	"EMonkeys_inv_joints",
	"EMonkeys_inv_pornoheft",
	
	//Special Items
	"EMonkeys_inv_beryll",
	"EMonkeys_inv_aquamarin",
	"EMonkeys_inv_bernstein",
	"EMonkeys_inv_koenigsbernstein",
	"EMonkeys_inv_royal_bracelet",
	
	"EMonkeys_inv_nephrit",
	"EMonkeys_inv_jade",
	"EMonkeys_inv_opal",
	"EMonkeys_inv_zwielichtopal",
	"EMonkeys_inv_royal_necklace",
	
	"EMonkeys_inv_peridot",
	"EMonkeys_inv_tiefenperidot",
	"EMonkeys_inv_zirkon",
	"EMonkeys_inv_fuerstenzirkon",
	"EMonkeys_inv_royal_scepter",
	
	"EMonkeys_inv_saphir",
	"EMonkeys_inv_himmelssaphir",
	"EMonkeys_inv_smaragd",
	"EMonkeys_inv_traumsmaragd",
	"EMonkeys_inv_royal_ring",
	
	"EMonkeys_inv_fossilgestein",
	"EMonkeys_inv_rfossilgestein",
	"EMonkeys_inv_achat",
	"EMonkeys_inv_amethyst",
	"EMonkeys_inv_malachit",
	"EMonkeys_inv_quarz",
	"EMonkeys_inv_rquarz",
	"EMonkeys_inv_obsidian",
	"EMonkeys_inv_rubin",
	"EMonkeys_inv_tigerauge",
	"EMonkeys_inv_royal_crown",
	
	"EMonkeys_inv_blutstein",
	"EMonkeys_inv_blutdiamant"
];
//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach EMonkeys_inv_items;
//Licenses [license var, civ/cop]
EMonkeys_licenses =
[
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
	["license_civ_silver", "civ"],
	["license_med_air","med"],
	//Custom
	["license_civ_log", "civ"],
	["license_civ_home", "civ"],
	//reb
	["license_civ_escort", "civ"],
	["license_civ_torture", "civ"],
	["license_civ_restrain", "civ"],
	["license_civ_PullOut", "civ"],
	
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_invisible","civ"],
	["license_civ_jet","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach EMonkeys_licenses;

/*
	Sell / buy arrays
*/
sell_array = 
[
	["obstsalat",999],
	["apple",50],
	["lemon",110],
	["pear",75],
	["cherry",150],
	["peach",90],
	["banana",85],
	["salema",156],
	["ornate",156],
	["mackerel",156],
	["tuna",1138],
	["mullet",156],
	["catshark",1112],
	["rabbit",30],
	["oilp",3500],
	["turtle",9000],
	["water",6],
	["coffee",6],
	["turtlesoup",205],
	["donuts",40],
	["salad",40],
	["cannabis",3500],
	["marijuana",5000],
	["heroinu",3500],
	["heroinp",5200],
	["cocaine",3500],
	["cocainep",5200],
	["tbacon",150],
	["lockpick",1500],
	["pickaxe",1900],
	["pumpe",1900],
	["axt",1900],
	["hasenfalle",1900],
	["redgull",200],
	["diamond",2000],
	["diamondc",2700],
	["iron_r",1800],
	["copper_r",1800],
	["salt_r",1500],
	["glass",1800],
	["fuelF",2750],
	["fuelcan_super",2750],
	["fuelcan_superplus",2750],
	["fuelcan_diesel",2750],
	["fuelcan_biodiesel",2750],
	["fuelcan_kerosin",2750],
	["spikeStrip",1125],
	["cement",2000],
	["goldbar",85000],
	["silver",2100],
	["silverr",2900],
	["woodblock",1500],
	["woodplank",2000],
	["handcuffs",5000],
	["battery",750],
	["rolex",2500000],
	["acetylsalicylsaeure",2000],
	["aspirin",75000],
	//house
	["furniture_01",10000],
	["furniture_02",10000],
	["furniture_03",10000],
	["furniture_04",10000],
	["furniture_05",10000],
	["mauer",500],
	["kegel",500],
	["defusekit",1500],
	//Alkohol
	["bottledshine",6400],
	["bottledwhiskey",4250], 
	["bottledbeer",4250],
	["moonshine",5000], 
	["whiskey",4000],
	["beerp",3500],
	["mash",2500],
	["rye",2000],
	["hops",1800],
	["yeast",2000],
	["cornmeal",200],
	["bottles",75],
	["defibrillator",100],
	["bandage",100],
	["morphine",100],
	["boltcutter",2500],
	//Crafting
	["carbonfaser",100],
	["kohlenstoff",100],
	["plastik",100],
	["goldarmierung",100],
	["uhrwerk",100],
	["ziffernblatt",100],
	["kupferteile",100],
	["zahnrad",100],
	["alup",100],
	["alufaser",100],
	["aluunrein",100],
	["papier",100],
	["elektroschrott",100],
	["edelmetall",10000],
	["flush",42000],
	["aktex",2000000],
	["almanach",1200000],
	["bretter",2800],
	["edelholz",13500],
	["stoff",13500],
	["faser",2200],
	
	["tabak",1000],
	["feinschnitt",2000],
	["wasser",1000],
	["diesel",4000],
	["diesel_gestreckt",4000],
	["biodiesel",1800],
	["super",4100],
	["superplus",2000],
	["zigarette",16000],
	["raps",1000],
	["tabakblatt",1000],
	["zigarre",17500],
	["edelzigarre",20000],
	["joints",25500],
	
	["maut_pkw",500],
	["maut_lkw",900],
	["gpstracker",2000],
	["bp_lz_vest",4000],
	["bp_launch_RPG32",6000],
	["bp_RPG32",2500],
	["bp_mxm_lz",5000],
    ["bp_mx_gl_sog",4000],
	["bp_mxm_sog",5000],
	["bp_mxm_soa",5000],
	["bp_mxm_grp",5000],
    ["bp_mx_ps",3000],
	["bp_trg21",2000],
	["bp_sting",1000],
	["bp_vermin",1500],
	["urkunde_q315",1500],
	["urkunde_q415",1500],
	["urkunde_q116",1500],
	["urkunde_q216",1500],
	["craftingtool_01",600],
	["fahrzeugteile",100],
	["bs_offroad",10000],
	["bs_zamak_i",15000],
	["bs_zamak_ii",15000],
	["bs_zamak_f_i",15000],
	["bs_zamak_f_ii",15000],
	["bs_zamak_r_i",15000],
	["bs_zamak_r_ii",15000],
	["bp_furniture_05",100000],
	["bp_vestclblack_grp",1500],
	["bp_vestclblack2_grp",1500],	
	["bp_vestcrgreen_grp",1500],
	["bp_tacvestblack_grp",1500],
	["bp_vestpcl_ctrg",1500],
	["bp_vestpch_ctrg",1500],
	["bp_tazer",25000],
	["blastingcharge",10000],
	["viagra",42000],
	["hypromellose",4500],
	["casanovil",20000],
	["sildenafil",2000],
	["gpsscanner",500],
	["gpsremover",500],
	["goldener_pokal",50000],
	["silberner_pokal",50000],
	["bronzener_pokal",50000],
	["jutesack",50000],
	
	["beryll",20000],
	["aquamarin",100000],
	["bernstein",20000],
	["koenigsbernstein",100000],
	["nephrit",20000],
	["jade",120000],
	["opal",20000],
	["zwielichtopal",120000],
	["peridot",20000],
	["tiefenperidot",140000],
	["zirkon",20000],
	["fuerstenzirkon",140000],
	["saphir",20000],
	["himmelssaphir",160000],
	["smaragd",20000],
	["traumsmaragd",160000],
	["achat",20000],
	["amethyst",40000],
	["malachit",20000],
	["obsidian",20000],
	["rubin",60000],
	["tigerauge",20000],
	["blutstein",100000],
	["blutdiamant",180000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",60],
	["lemon",210],
	["pear",150],
	["cherry",200],
	["banana",90],
	["storage1",90000],
    ["storage2",400000],
	["rabbit",60],
	["salema",200],
	["ornate",200],
	["mackerel",200],
	["tuna",2220],
	["mullet",200],
	["catshark",2200],
	["water",20],
	["turtle",16000],
	["turtlesoup",250],
	["donuts",60],
	["salad",60],
	["coffee",20],
	["tbacon",200],
	["lockpick",4500],
	["pickaxe",1900],
	["pumpe",1900],
	["axt",1900],
	["hasenfalle",1900],
	["redgull",500],
	["fuelcan_super",4700],
	["fuelcan_superplus",4700],
	["fuelcan_diesel",4700],
	["fuelcan_biodiesel",4700],
	["fuelcan_kerosin",4700],
	["peach",95],
	["spikeStrip",1500],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["woodblock",2000],
	["woodplank",2900],
	["handcuffs",20000],
	["furniture_01",300000],
	["furniture_02",400000],
	["furniture_03",500000],
	["furniture_04",600000],
	["furniture_05",700000],
	["mauer",1500],
	["kegel",1500],
	["bottledshine",8500], 
	["mash",5000], 
	["bottledwhiskey",8000], 
	["bottledbeer",8000],
	["cornmeal",250],
	["moonshine",9500], 	
	["bottles",100],
	["defibrillator",500],
	["bandage",200],
	["morphine",200],
	["battery",2000],
	//Crafting
	["maut_pkw",1000],
	["maut_lkw",2500],
	["craftingtool_01",1000],
	["gpstracker",15000],
    ["bp_sting",10000],
	["bp_vermin",15000],
	["elektroschrott",1000],
	["papier",1000],
	["edelmetall",100000],
	["bp_lz_vest",40000],
	["bp_launch_RPG32",550000],
	["bp_RPG32",220000],
	["bp_mxm_lz",50000],
	["bp_mxm_sog",50000],
	["bp_mxm_soa",50000],
    ["bp_mx_gl_sog",40000],
	["bp_mxm_grp",50000],
    ["bp_mx_ps",30000],
	["bp_trg21",20000],
	["bp_furniture_05",200000],
	["urkunde_q315",15000],
	["urkunde_q415",15000],
	["urkunde_q116",15000],
	["urkunde_q216",15000],
	["fahrzeugteile",1000],
	["bs_offroad",20000],
	["acetylsalicylsaeure",4000],
	["aspirin",33000],
	["viagra",150000],
	["hypromellose",4500],
	["gpsscanner",3000],
	["gpsremover",3000],
	["tabak",1000],
	["feinschnitt",4400],
	["wasser",3000],
	["diesel",4000],
	["diesel_gestreckt",2500],
	["biodiesel",1800],
	["super",4100],
	["superplus",2000],
	["zigarette",6000],
	["raps",4000],
	["tabakblatt",4000],
	["zigarre",27500],
	["edelzigarre",40000],
	["joints",60000],
	["jutesack",100000],
	["goldener_pokal",50000],
	["silberner_pokal",50000],
	["bronzener_pokal",50000],
	["bp_vestclblack_grp",40000],
	["bp_vestclblack2_grp",40000],
	["bp_vestcrgreen_grp",40000],
	["bp_tacvestblack_grp",40000],
	["bp_vestpcl_ctrg",40000],
	["bp_vestpch_ctrg",40000],
	["bp_tazer",50000]
	
];
__CONST__(buy_array,buy_array);

EMonkeys_weapon_shop_array =
[
	["srifle_DMR_01_F",20000],
	["arifle_SDAR_F",7500],
	["hgun_P07_snds_F",500],
	["hgun_ACPC2_F",500],
	["hgun_P07_F",500],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",75],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",15],
	["20Rnd_556x45_UW_mag",35],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",50],
	["Chemlight_yellow",50],
	["Chemlight_green",50],
	["Chemlight_red",50],
	["hgun_Rook40_F",0],
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
	["optic_MRCO",1000],
	["optic_Aco",850],
	["arifle_MX_F",7500],
	["arifle_MXC_F",5000],
	["arifle_MXM_F",8500],
	["MineDetector",0],
	["optic_Holosight",275],
	["acc_pointer_IR",175],
	["arifle_TRG20_F",2500],
	["SMG_01_F",1500],
	["arifle_Mk20C_F",4500],
	["30Rnd_45ACP_Mag_SMG_01",60],
	["30Rnd_9x21_Mag",30],
	["srifle_EBR_F",20000],
	["launch_NLAW_F",500000],
	["NLAW_F",250000],
	["arifle_MXC_F",1000],
	["acc_pointer_IR",5000]
];
__CONST__(EMonkeys_weapon_shop_array,EMonkeys_weapon_shop_array);

//Permsys init
[] call EMonkeys_fnc_permconfiguration; 