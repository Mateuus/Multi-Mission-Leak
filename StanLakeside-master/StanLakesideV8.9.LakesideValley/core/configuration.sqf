#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
myHealth = 0;
player setvariable["playerInjuries",[0,0,0,0,0,0,0,0,0,0,0],true];
player setvariable["playerInjuriesToUpdate",[0,0,0,0,0,0,0,0,0,0,0],false];
checkFinish = true;
imHealing = false;
Fishing_Active = false;
shooting_death = false;
myUpdate = true;
bite = false;
jailHacking = false;
totalfencing = 0;
spikeAntispam = false;
tryingCall = false;
phonesRinging = false;
life_quitRecently = false;
phoneDisabled = false;
myCallOwner = player;
myPhoneCall = 0;
damageChance = false;
dispatch = false;
trucking = false;
dispatch2 = false;
callInProgress = false;
noleftclick = false;
allowanims = true;
harvesting = false;
isdragging = false;
im_hunting = false;
progress_bj = false;
buy_off = false;
buying_virt_item = false;
buying_phys_item = false;
allow_sat = true;
maintenance_on = false;
phone_s_1 = false;
phone_s_2 = false;
phone_s_3 = false;
previewing_on = false;
has_job = false;
driver_test = false;
start_up = true;
checked_taxi = false;
message1_active = false;
message2_active = false;
message3_active = false;
message4_active = false;
message5_active = false;
message6_active = false;
raceDone = false;
life_rebelbadguyman = false;
life_query_time = time;
life_lastKnownPos = [0,0,0];
life_show_actions = false;
life_actions = [];
skip_all = false;
im_dead = false;
life_isdowned = false;
life_action_time = 0;
life_racing = false;
cheap_buffs = false;
life_crazy = 0;
life_cokeaddict = false;
message_active = 0;
target_licenses = "None";
usingvehicle = false;
target_houses = [];
life_cruise = false;
life_charged = false;
life_gopro = false;
life_racers = [];
koil_antispam = 0;
life_newsJobs = false;
life_bankteller = false;
life_action_delay = time;
life_damagereturn = false;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_taxi = false;
life_seatbelt = false;
life_seatwarn = false;
life_smoking = false;
life_bonging = false;
paid_recently = false;
life_siren_active = false;
life_clothing_filter = 0;
life_hungerpain = false;
life_antispamactive = false;
life_koil_race = 0;
life_koil_race2 = 0;
life_rip = 0;
life_ApplyAir = false;
prevent_loot = false;
life_nos_active = 2;
life_dontsell = 0;
life_clothing_uniform = -1;
life_koil_rally = 0;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_nos_count = 0;
life_impound_inuse = false;
life_action_inUse = false;
life_sickness = false; 
life_paintball = false;
life_spikestrip = ObjNull;
life_deathpos = 1;
//life_respawn_timer = 9; //Scaled in minutes
life_knockout = false;
life_rope = 1;
koil_life = 1;
life_stretcher = 1;
hacking = false;
life_poop = 15;
life_std = 0;
life_maxweightdone = 0;
life_eattotal = 0;
life_dirt = 0;
life_bro = 0;
life_num = 0;
life_pizza = 0;
life_koil_parachute = 0;
life_applypressure = 0;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_fadeSound = false;
life_spam_my_dick2 = 0;
life_spam_my_dick = 0;
life_married = "";
life_siren_on = 0;
koil_altcheck = false;
koildeb = 1;
koildebi = 1;
koildebii = 1;
koildebiii = 1;
koildebiiii = 1;
life_breakouton = 1;
life_nospampls = 0;
life_firing_range = false;
life_signedIn = false;
life_pickup_open = false;
life_carSalesman = false;
life_onTestDrive = false;
life_requestingTestDrive = false;
life_testDriveRequests = [];
//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for civs and cops? (Medics excluded for now)

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,75000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 24; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).

/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_battery = 75;
life_gift_recent = false;
life_charging = 2;
life_koil_hh = 2;
life_hunger = 100;
life_revivemoney = false;
life_intox = 0.00;
__CONST__(life_paycheck_period,10); //Five minutes
cash_in_hand = 0;
__CONST__(life_impound_car,835);
__CONST__(life_impound_boat,825);
__CONST__(life_impound_air,885);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		cash_in_bank = 12000; //Starting Bank Money
		life_paycheck = 1000; //Paycheck Amount
	};
	case civilian: 
	{
		cash_in_bank = 12000; //Starting Bank Money
		life_paycheck = 400; //Paycheck Amount
	};
	case independent: {
		cash_in_bank = 12000;
		life_paycheck = 1000;
	};
	case east:
	{
		cash_in_bank = 12000; //Starting Bank Money
		life_paycheck = 400; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_nos",
	"life_inv_condom",
	"life_inv_medkit",
	"life_inv_cleankit",
	"life_inv_weddingring",
	"life_inv_bandage",
	"life_inv_airkit",
	"life_inv_tierope",
	"life_inv_stitches",
	"life_inv_splint",
	"life_inv_mobilephone",
	"life_inv_panicbutton",
	"life_inv_epipen",
	"life_inv_bec",
	"life_inv_MDMAu",
	"life_inv_MDMAp",
	"life_inv_methu",
	"life_inv_emerald",
	"life_inv_sapphire",
	"life_inv_ruby",
	"life_inv_methp",
	"life_inv_cokeu",
	"life_inv_cokep",
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
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
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_hackingtool",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_wheat",
	"life_inv_sunflower",
	"life_inv_corn",
	"life_inv_bean",
	"life_inv_cotton",
	"life_inv_olive",
	"life_inv_opium",
	"life_inv_cannabis",
	"life_inv_pumpkin",
	"life_inv_wheatseeds",
	"life_inv_sunflowerseeds",
	"life_inv_cornseeds",
	"life_inv_beanseeds",
	"life_inv_cottonseeds",
	"life_inv_oliveseeds",
	"life_inv_opiumseeds",
	"life_inv_cannabisseeds",
	"life_inv_pumpkinseeds",
	"life_inv_rawgoatmeat",
	"life_inv_rawchicken",
	"life_inv_rawsheepmeat",
	"life_inv_rawrabbit",
	//Additions
	"life_inv_zoobeer", // Duff Beer
	"life_inv_RoadCone",
	"life_inv_RoadConeStrip",
	"life_inv_RoadConeB",
	"life_inv_RoadConeStripB",
	"life_inv_RoadBlockWood",
	"life_inv_RoadBlockConc",
	"life_inv_RoadBlockRebel",
	"life_inv_BarGate",
	"life_inv_ziptie",
	"life_inv_tobacco",
	"life_inv_cigarette",
	"life_inv_kidney",
	"life_inv_zoobeer2",
	"life_inv_jackdaniels",
	"life_inv_vodka",
	"life_inv_jagerbomb",
	"life_inv_absinthe",
	"life_inv_redwine",
	"life_inv_whitewine",
	"life_inv_whiterussian",
	"life_inv_sexonthebeach",
	"life_inv_tequila",
	"life_inv_jackdanielsandcoke",
	"life_inv_raxsrum"	
];













//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
["license_civ_MDMA","civ"],
["license_civ_meth","civ"],
["license_civ_coke","civ"],
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
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_donator1","civ"],
	["license_civ_donator2","civ"],
	["license_civ_donator3","civ"],
	["license_civ_rifle","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

//life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",120],["heroinp",250],["cokeu",150],["cokep",350],["cannabis",250],["opium",250],["marijuana",300],["turtle",500],["hackingtool",1000],["blastingcharge",1000],["boltcutter",350],["methu",40],["methp",400],["cokeu",40],["cokep",500],["MDMAu",30],["emerald",1220],["sapphire",1520],["ruby",720],["MDMAp",360]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["weddingring",80],
	["bec",1],
	["medkit",5],
	["cleankit",1],
	["mobilephone",1],
	["panicbutton",1],
	["MDMAu",110],
	["MDMAp",650],
	["emerald",800],
	["sapphire",800],
	["ruby",800],
	["methu",120],
	["methp",800],
	["cokeu",210],
	["cokep",860],
	["apple",1],
	["heroinu",185],
	["heroinp",295],
	["salema",90],
	["ornate",90],
	["mackerel",65],
	["tuna",131],
	["mullet",65],
	["catshark",100],
	["marijuana",370],
	["turtle",410],
	["rabbit",1],
	["oilp",270],
	["water",1],
	["coffee",1],
	["bandage",1],
	["airkit",1],
	["tierope",50],
	["stitches",1],
	["splint",1],
	["epipen",1],
	["turtlesoup",90],
	["donuts",1],
	["tbacon",1],
	["lockpick",1],
	["pickaxe",5],
	["redgull",1],
	["peach",1],
	["diamond",35],
	["diamondc",135],
	["iron_r",250],
	["copper_r",141],
	["salt_r",165],
	["glass",145],
	["fuelF",50],
	["wheat",20],
	["sunflower",50],
	["corn",90],
	["bean",80],
	["cotton",20],
	["olive",277],
	["opium",100],
	["cannabis",100],
	["pumpkin",110],
	["wheat seed",1],
	["sunflower seed",1],
	["corn seed",1],
	["bean seed",1],
	["cotton seed",1],
	["olive seed",1],
	["opium seed",15],
	["cannabis seed",15],
	["pumpkin seed",5],
	["Raw Meat",550],
	["raw chicken",70],
	["raw sheep meat",50],
	["raw rabbit",70],
	["spikeStrip",12],
	["cement",255],
	["goldbar",9500], 
	//Deo Additions
	["zoobeer",1], 
	["zoobeer2",1],
	["vodka",1],
	["jackdaniels",1],
	["jagerbomb",2],
	["absinthe",2],
	["redwine",2],
	["whitewine",2],
	["whiterussian",2],
	["sexonthebeach",2],
	["tequila",2],
	["jackdanielsandcoke",2],
	["condom",10],
	["nos",10],
	["BarGate",5],
	["RoadBlockConc",2],
	["RoadBlockWood",7],
	["RoadCone",1],
	["RoadConeStrip",2],
	["RoadConeB",1],
	["RoadConeStripB",5],
	["cigarette",1],
	["Rax's Rum",1]
];
__CONST__(sell_array,sell_array);

buy_array =
[
       ["cleankit",100],
        ["medkit",1200],
        ["condom",100],
        ["weddingring",10000],
        ["bandage",25],
        ["airkit",5],
        ["nos",4500],
        ["tierope",1125],
        ["stitches",1],
        ["splint",1],
        ["epipen",1],
        ["marijuana",1500],
        ["methp",1800],
        ["MDMAp",1800],
        ["cokep",1800],
        ["apple",6],
        ["rabbit",7],
        ["bec",50],
        ["mobilephone",1],
        ["panicbutton",1],
        ["salema",129],
        ["ornate",119],
        ["mackerel",125],
        ["tuna",295],
        ["mullet",125],
        ["catshark",220],
        ["marijuana",155],
        ["turtle",700],
        ["water",1],
        ["turtlesoup",250],
        ["donuts",12],
        ["coffee",1],
        ["tbacon",7],
        ["lockpick",1500],
        ["pickaxe",120],
        ["redgull",12],
        ["fuelF",85],
        ["wheat",150],
        ["sunflower",160],
        ["corn",180],
        ["bean",80],
        ["cotton",50],
        ["olive",277],
        ["opium",400],
        ["cannabis",400],
        ["pumpkin",120],
        ["wheat seed",2],
        ["sunflower seed",2],
        ["corn seed",2],
        ["bean seed",2],
        ["cotton seed",2],
        ["olive seed",2],
        ["opium seed",25],
        ["cannabis seed",25],
        ["pumpkin seed",10],
        ["Raw Meat",580],
        ["raw chicken",80],
        ["raw sheep meat",60],
        ["raw rabbit",80],
        ["peach",6],
        ["spikeStrip",250],
        ["blastingcharge",15000],
        ["hackingtool",15000],
        ["boltcutter",2500],
        ["defusekit",250],
        ["storagesmall",7500],
        ["storagebig",15000],
        // Deo's Adds
        ["zoobeer",2],
        ["zoobeer2",2],
        ["vodka",12],
        ["jackdaniels",12],
        ["jagerbomb",22],
        ["absinthe",25],
        ["redwine",22],
        ["whitewine",35],
        ["whiterussian",32],
        ["sexonthebeach",32],
        ["tequila",32],
        ["jackdanielsandcoke",32],
        ["BarGate",50],
        ["RoadBlockConc",3000],
        ["RoadBlockWood",70],
        ["RoadCone",5],
        ["RoadConeStrip",25],
        ["RoadConeB",10],
        ["RoadConeStripB",50],
        ["cigarette",925],
        ["Rax's Rum",5]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["Fish_1_i",70],
	["Fish_2_i",120],
	["Fish_3_i",160],
	["Fish_4_i",100],
	["Fish_5_i",45],
	["ItemGPS",1],
	["ToolKit",1]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[







			["tcg_hrly",0],
			["tcg_hrly_white",0],	
			["tcg_hrly_red",0],
			["tcg_hrly_metal",0],
			["tcg_hrly_blue",0],
			["tcg_hrly_limited",0],
			["tcg_hrly_demon",0],
			["tcg_hrly_coco",0],
			["tcg_hrly_orig1",0],
			["tcg_hrly_orig2",0],
			["tcg_hrly_skeleton",0],
			["tcg_hrly_gay",0],

			["wirk_h3_limo",0],






			["C_Van_01_fuel_F",0],
			["I_G_Van_01_fuel_F",0],

			["A3L_BMW135Sport1",0],
			["A3L_BMW135Sport2",0],
			["A3L_BMW135Sport3",0],
			["A3L_BMW135Sport4",0],
			["A3L_BMW135Sport5",0],
			["A3L_BMW135White",0],
			["A3L_BMW135Black",0],
			["A3L_BMW135Blue",0],
			["A3L_BMW135Purple",0],
			["A3L_BMW135Red",0],

			["AM_Holden_RBlue",0],			
			["AM_Holden_RRed",0],
			["AM_Holden_RWhite",0],
			["AM_Holden_RBlack",0],

	["AM_Holden_EMS",0],
		["AM_Holden_Police",0],
		["GNT_C185",0],
		["M1030",0],
		["A3L_EvoXrally_green",0],
		["A3L_EvoXrally_white",0],
		["A3L_EvoXrally_red",0],
		["A3L_EvoXrally_blue",0],
		["A3L_EvoXDarkGreen",0],
		["A3L_OffGreen",0],
		["A3L_EvoXOffYellow",0],
		["A3L_EvoXYellow",0],
		["A3L_EvoXPink",0],
		["A3L_EvoXPurple",0],
		["A3L_EvoXWhite",0],
		["A3L_EvoXBlack",0],
		["A3L_EvoXRed",0],
		["EvoXSo1",0],
		["EvoXSo2",0],
		["EvoXSo3",0],
		["EvoXSo4",0],
		["A3L_TaurusPD1",0],
		["A3L_TaurusPD2",0],
		["A3L_SuburbanCSO",0],
		["A3L_Suburban",0],
		["A3L_SuburbanUM",0],
	["B_QuadBike_01_F",0],
	["C_Hatchback_01_F",0],
	["C_Offroad_01_F", 0],
	["B_G_Offroad_01_F",0],
	["C_SUV_01_F",0],
	["C_Van_01_transport_F",0],
	["C_Hatchback_01_sport_F",0],
	["C_Van_01_fuel_F",0],
	["I_Heli_Transport_02_F",0],
	["C_Van_01_box_F",0],
	["I_Truck_02_transport_F",0],
	["I_Truck_02_covered_F",0],
	["B_Truck_01_transport_F",0],
	["B_Truck_01_box_F", 0],
	["O_MRAP_02_F",0],
	["B_Heli_Light_01_F",0],
	["O_Heli_Light_02_unarmed_F",0],
	["C_Rubberboat",0],
	["C_Boat_Civil_01_F",0],
	["B_Boat_Transport_01_F",0],
	["C_Boat_Civil_01_police_F",0],
	["B_Boat_Armed_01_minigun_F",0],
	["B_SDV_01_F",0],
	["A3L_Bus",0],
	["A3L_Karts",0],
	["A3L_AmberLamps",0],
	["A3L_Laddertruck",0],
	["A3L_Cooper_concept_blue",0],
	["A3L_Cooper_concept_black",0],
	["A3L_Cooper_concept_red",0],
	["A3L_Cooper_concept_white",0],
	["A3L_AMC",0],
	["A3L_AMXRed",0],
	["A3L_AMXWhite",0],
	["A3L_AMXBlue",0],
	["A3L_AMXGL",0],
	["A3L_VolvoS60RBlack",0],
	["A3L_VolvoS60Rred",0],
	["S_Skyline_Red",0],
	["S_Skyline_Blue",0],
	["S_Skyline_Black",0],
	["S_Skyline_Yellow",0],
	["S_Skyline_Purple",0],
	["S_Skyline_White",0],
	["A3L_Ferrari458black",0],
	["A3L_Ferrari458white",0],
	["A3L_Ferrari458blue",0],
	["A3L_SuburbanWhite",0],
	["A3L_SuburbanBlue",0],
	["A3L_SuburbanRed",0],
	["A3L_SuburbanBlack",0],
	["A3L_SuburbanGrey",0],
	["A3L_SuburbanOrange",0],
	["A3L_TahoeWhite",0],
	["A3L_TahoeRed",0],
	["A3L_TahoeBlue",0],
	["A3L_Camaro",0],
	["A3L_FordKaBlue",0],
	["A3L_FordKaRed",0],
	["A3L_FordKaBlack",0],
	["A3L_FordKaWhite",0],
	["A3L_FordKaGrey",0],
	["A3L_Taurus",0],
	["A3L_TaurusBlack",0],
	["A3L_TaurusBlue",0],
	["A3L_TaurusRed",0],
	["A3L_TaurusWhite",0],
	["A3L_GrandCaravan",0],
	["A3L_GrandCaravanBlk",0],
	["A3L_GrandCaravanBlue",0],
	["A3L_GrandCaravanGreen",0],
	["A3L_GrandCaravanRed",0],
	["A3L_GrandCaravanPurple",0],
	["A3L_Challenger",0],
	["A3L_ChallengerGreen",0],
	["A3L_ChallengerRed",0],
	["A3L_ChallengerWhite",0],
	["A3L_ChallengerBlack",0],
	["A3L_ChallengerBlue",0],

	["A3L_ChargerRed",0],
	["A3L_ChargerBlue",0],
	["A3L_ChargerBlack",0],
	["A3L_ChargerWhite",0],
	["A3L_Charger",0],

	["Jonzie_Viper",0],
	["A3L_Escort",0],
	["CG_Taxi",0],
	["A3L_EscortBlack",0],
	["A3L_EscortBlue",0],
	["A3L_EscortWhite",0],
	["A3L_EscortPink",0],
	["A3L_PuntoRed",0],
	["A3L_PuntoBlack",0],
	["A3L_PuntoWhite",0],
	["A3L_PuntoGrey",0],
	["A3L_RegalBlack",0],
	["A3L_RegalBlue",0],
	["A3L_RegalOrange",0],
	["A3L_RegalRed",0],
	["A3L_RegalWhite",0],
	["A3L_JeepWhiteBlack",0],
	["A3L_JeepGreenBlack",0],
	["A3L_JeepRedTan",0],
	["A3L_JeepRedBlack",0],
	["A3L_JeepGrayBlack",0],
	["A3L_VolksWagenGolfGTired",0],
	["A3L_VolksWagenGolfGTiblack",0],
	["A3L_VolksWagenGolfGTiblue",0],
	["A3L_VolksWagenGolfGTiwhite",0],
	["A3L_F350Black",0],
	["A3L_F350Blue",0],
	["A3L_F350Red",0],
	["A3L_F350White",0],
	["A3L_Dumptruck",0],
	["C_Van_01_box_F",0],
	["C_Van_01_transport_F",0],
	["A3L_GrandCaravanUC",0],
	["A3L_GrandCaravanUCBlack",0],
	["A3L_TaurusFPBLBPD",0],
	["A3L_TaurusFPBLBCSO",0],
	["A3L_TaurusFPBPD",0],
	["A3L_TaurusFPBPDGM",0],
	["A3L_TaurusFPBCSO",0],
	["A3L_TaurusUCBlack",0],
	["A3L_TaurusUCGrey",0],
	["A3L_TaurusUCWhite",0],
	["A3L_TaurusUCBlue",0],
	["A3L_TaurusUCRed",0],
	["A3L_CVPIFPBPD",0],
	["A3L_CVPIFPBCSO",0],
	["A3L_CVPIFPBFG",0],
	["A3L_CVPIFPBLBPD",0],
	["A3L_CVPIFPBLBCSO",0],
	["A3L_CVPIFPBLBFG",0],
	["A3L_TahoeUCPB",0],
	["A3L_TahoeUC",0],
	["A3L_TahoeUCGMPB",0],
	["A3L_TahoeCSOLBPB",0 ],
	["A3L_jailBus",0],
	["A3L_Suburban",0],
	["A3L_SuburbanCSO",0],
	["A3L_SuburbanFG",0],
	["B_MRAP_01_F",7500]
	
	
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[



			["critgamin_smart_civ",800],
			["critgamin_smart_bleu",800],
			["critgamin_smart_noir",800],
			["critgamin_smart_bleufonce",800],
			["critgamin_smart_rouge",800],
			["critgamin_smart_jaune",800],
			["critgamin_smart_rose",800],
			["critgamin_smart_grise",800],
			["critgamin_smart_violet",800],
			["critgamin_smart_orange",800],
			["critgamin_smart_vert",800],
 

  			["charger_umb",3500],
  			["charger_umw",3500],

  			["cg_h2_sert",3500],
			["cg_cvpitrooper",1000],
			["cg_taurustrooper",1000],
			["cg_trooperevo",2000],
			["B_Quadbike_01_F",300],
  			["A3L_ChargerUC",2000],
			["A3L_ChargerUCWhite",2000],
			["A3L_TaurusCO1",2000],
			["A3L_CVPIFPBCSO",2000],
			["A3L_CVPIFPBLBCSO",2000],
			["A3L_TaurusFPBCSO",2000],
			["A3L_TaurusFPBLBCSO",2000],
			["A3L_SuburbanCSO",2000],
			["A3L_SuburbanUM",2000],
			["EvoXSo1",4000],
			["EvoXSo2",4000],
			["EvoXSo3",4000],
			["EvoXSo4",4000],
			["AM_Holden_Police",4000],
			["A3L_CVPIUC",2000],
			["A3L_CVPIUCBlack",2000],
			["A3L_CVPIUCBlue",2000],
			["A3L_CVPIUCWhite",2000],
			["A3L_CVPIUCPink",2000],
			["A3L_CVPIUCRed",2000],
			["A3L_GrandCaravanUC",3000],
			["A3L_GrandCaravanUCBlack",3000],
			["A3L_jailBus",5000],		
			["A3L_TaurusUC",3000],
			["A3L_TaurusUCBlue",3000],
			["A3L_TaurusUCGrey",3000],
			["A3L_TaurusUCRed",3000],
			["A3L_TaurusUCWhite",3000],
			["DAR_TahoePoliceDet",3000],
			["DAR_ExplorerPoliceStealth",3000],
			["B_Quadbike_01_F",300],
			["I_G_Van_01_fuel_F",3500],
	
			["B_G_Offroad_01_F",6500],

			["A3L_F350Black",3500],
			["A3L_F350Blue",3500],
			["A3L_F350Red",3500],
			["A3L_F350White",3500],
			["C_Van_01_fuel_F",3500],
			["C_Van_01_box_F",4000],
			["C_Van_01_transport_F",3500],
			["A3L_Bus",6000],
			["wirk_h3_limo",1300],
			["Nhz_audia8limo",1300],
			["A3L_Towtruck",400],			
			["tcg_hrly",2500],
			["tcg_hrly_white",2500],	
			["tcg_hrly_red",2500],
			["tcg_hrly_metal",2500],
			["tcg_hrly_blue",2500],
			["tcg_hrly_limited",2500],
			["tcg_hrly_demon",2500],
			["tcg_hrly_coco",2500],
			["tcg_hrly_orig1",2500],
			["tcg_hrly_orig2",2500],
			["tcg_hrly_skeleton",2500],
			["tcg_hrly_gay",2500],

			["Jonzie_Mini_Cooper",800],
			["Jonzie_Mini_Cooper_R_spec",2000],
			["B_Quadbike_01_F",300],

			["critgamin_contown_civ",800],
			["critgamin_contown_bleu",800],
			["critgamin_contown_noir",800],
			["critgamin_contown_bleufonce",800],
			["critgamin_contown_rouge",800],
			["critgamin_contown_jaune",800],
			["critgamin_contown_rose",800],
			["critgamin_contown_grise",800],
			["critgamin_contown_violet",800],
			["critgamin_contown_jaune",800],
			["critgamin_contown_orange",800],			
			["critgamin_contown_vert",800],


			["critgamin_vangmcc_civ",800],
			["critgamin_vangmcc_civ_noir",800],
			["critgamin_vangmcc_civ_bleufonce",800],
			["critgamin_vangmcc_civ_bleu",800],
			["critgamin_vangmcc_civ_vert",800],
			["critgamin_vangmcc_civ_rouge",800],
			["critgamin_vangmcc_civ_jaune",800],
			["critgamin_vangmcc_civ_rose",800],
			["critgamin_vangmcc_civ_grise",800],
			["critgamin_vangmcc_civ_violet",800],
			["critgamin_vangmcc_civ_orange",800],



			["A3L_RegalBlack",1200],
			["A3L_RegalBlue",1200],
			["A3L_RegalOrange",1200],
			["A3L_RegalRed",1200],
			["A3L_RegalWhite",1200],
			["A3L_JeepWhiteBlack",1500],
			["A3L_JeepGreenBlack",1500],
			["A3L_JeepRedTan",1500],
			["A3L_JeepRedBlack",1500],
			["A3L_JeepGrayBlack",1500],
			["A3L_VolksWagenGolfGTired",2600],
			["A3L_VolksWagenGolfGTiblack",2600],
			["A3L_VolksWagenGolfGTiblue",2600],
			["A3L_VolksWagenGolfGTiwhite",2600],
			["S_Rangerover_Black",3500],
			["S_Rangerover_Red",3500],
			["S_Rangerover_Blue",3500],
			["S_Rangerover_Green",3500],
			["S_Rangerover_Purple",3500],
			["S_Rangerover_Grey",3500],
			["S_Rangerover_Orange",3500],
			["S_Rangerover_White",3500],
			["A3L_GrandCaravan",3000],
			["A3L_GrandCaravanBlk",3000],
			["A3L_GrandCaravanBlue",3000],
			["A3L_GrandCaravanGreen",3000],
			["A3L_GrandCaravanRed",3000],
			["A3L_GrandCaravanPurple",3000],
			["A3L_Challenger",4500],
			["A3L_ChallengerGreen",4500],
			["A3L_ChallengerRed",4500],
			["A3L_ChallengerWhite",4500],
			["A3L_ChallengerBlack",4500],
			["A3L_ChallengerBlue",4500],
			["A3L_Charger",5000],
			["A3L_ChargerBlack",5000],
			["A3L_ChargerBlue",5000],
			["A3L_ChargerWhite",5000],
			["A3L_ChargerRed",5000],
			["AM_2015C_Black",7000],
			["AM_2015C_blue",7000],
			["AM_2015C_white",7000],

			["Jonzie_Viper",4500],
			["A3L_FordKaBlue",2000],
			["A3L_FordKaRed",2000],
			["A3L_FordKaBlack",2000],
			["A3L_FordKaWhite",2000],
			["A3L_FordKaGrey",2000],
			["A3L_CVWhite",3000],
			["A3L_CVBlack",3000],
			["A3L_CVGrey",3000],
			["A3L_CVRed",3000],
			["A3L_CVPink",3000],
			["A3L_CVBlue",3000],
			["A3L_Taurus",4000],
			["A3L_TaurusBlack",4000],
			["A3L_TaurusBlue",4000],
			["A3L_TaurusRed",4000],
			["A3L_TaurusWhite",4000],
			["DAR_TahoeCivSilver",4000],
			["DAR_TahoeCivBlue",4000],
			["DAR_TahoeCivRed",4000],
			["DAR_TahoeCivBlack",4000],
			["A3L_SuburbanWhite",9000],
			["A3L_SuburbanBlue",9000],
			["A3L_SuburbanRed",9000],
			["A3L_SuburbanBlack",9000],
			["A3L_SuburbanGrey",9000],
			["A3L_SuburbanOrange",9000],
			["A3L_Camaro",3000],
			["A3L_Cooper_concept_blue",2500],
			["A3L_Cooper_concept_black",2500],
			["A3L_Cooper_concept_red",2500],
			["A3L_Cooper_concept_white",2500],
			
			["A3L_RX7_Blue",5000],
			["A3L_RX7_Red",5000],
			["A3L_RX7_White",5000],
			["A3L_RX7_Black",5000],
			

			
			["A3L_AMC",3000],
			["A3L_AMXRed",3000],
			["A3L_AMXWhite",3000],
			["A3L_AMXBlue",3000],
			["A3L_AMXGL",3500],
			["S_Skyline_Red",4500],
			["S_Skyline_Blue",4500],
			["S_Skyline_Black",4500],
			["S_Skyline_Yellow",4500],
			["S_Skyline_Purple",4500],
			["S_Skyline_White",4500],




			["A3L_BMW135Sport1",6500],
			["A3L_BMW135Sport2",6500],
			["A3L_BMW135Sport3",6500],
			["A3L_BMW135Sport4",6500],
			["A3L_BMW135Sport5",6500],
			["A3L_BMW135White",6500],
			["A3L_BMW135Black",6500],
			["A3L_BMW135Blue",6500],
			["A3L_BMW135Purple",6500],
			["A3L_BMW135Red",6500],




			["A3L_EvoXDarkGreen",7500],
			["A3L_OffGreen",7500],
			["A3L_EvoXOffYellow",7500],
			["A3L_EvoXYellow",7500],
			["A3L_EvoXPink",7500],
			["A3L_EvoXPurple",7500],
			["A3L_EvoXWhite",7500],
			["A3L_EvoXBlack",7500],
			["A3L_EvoXRed",7500],
			["S_Vantage_Red",5000],
			["S_Vantage_Blue",5000],
			["S_Vantage_Black",5000],
			["S_Vantage_Yellow",5000],
			["S_Vantage_LightBlue",5000],
			["S_Vantage_Purple",5000],
			["S_Vantage_White",5000],
			["A3L_EvoXrally_green",8500],
			["A3L_EvoXrally_white",8500],
			["A3L_EvoXrally_red",8500],
			["A3L_EvoXrally_blue",8500],
			["A3L_Ferrari458black",9000],
			["A3L_Ferrari458white",9000],
			["A3L_Ferrari458blue",9000],
			["S_PorscheRS_Black",4500],
			["S_PorscheRS_Yellow",4500],
			["S_PorscheRS_White",4500],





			["cg_jeep_cherokee_noir",1390],
			["cg_jeep_cherokee_violet",1390],
			["cg_jeep_cherokee_rose",1390],
			["cg_jeep_cherokee_orange",1390],
			["cg_jeep_cherokee_grise",1390],
			["cg_jeep_cherokee_vert",1390],
			["cg_jeep_cherokee_bleufonce",1390],
			["cg_jeep_cherokee_bleu",1300],
			["cg_jeep_cherokee_white",1390],
			["cg_jeep_cherokee_jaune",1390],





			["cg_porsche_911_82_noir",4900],
			["cg_porsche_911_82_violet",4900],
			["cg_porsche_911_82_rose",4900],
			["cg_porsche_911_82_orange",4900],
			["cg_porsche_911_82_grise",4900],
			["cg_porsche_911_82_vert",4900],
			["cg_porsche_911_82_bleufonce",4900],
			["cg_porsche_911_82_bleu",4900],
			["cg_porsche_911_82_white",4900],
			["cg_porsche_911_82_jaune",4900],

			["cg_porsche_cayenne_noir",4900],
			["cg_porsche_cayenne_violet",4900],
			["cg_porsche_cayenne_rose",4900],
			["cg_porsche_cayenne_orange",4900],
			["cg_porsche_cayenne_grise",4900],
			["cg_porsche_cayenne_vert",4900],
			["cg_porsche_cayenne_bleufonce",4900],
			["cg_porsche_cayenne_bleu",4900],
			["cg_porsche_cayenne_white",4900],
			["cg_porsche_cayenne_jaune",4900],


			["cg_lamborghini_huracan_noir",5900],
			["cg_lamborghini_huracan_violet",5900],
			["cg_lamborghini_huracan_rose",5900],
			["cg_lamborghini_huracan_orange",5900],
			["cg_lamborghini_huracan_grise",5900],
			["cg_lamborghini_huracan_vert",5900],
			["cg_lamborghini_huracan_bleufonce",5900],
			["cg_lamborghini_huracan_bleu",5900],
			["cg_lamborghini_huracan_white",5900],
			["cg_lamborghini_huracan_jaune",5900],



			["cg_nissan_gtr_2012_noir",5900],
			["cg_nissan_gtr_2012_violet",5900],
			["cg_nissan_gtr_2012_rose",5900],
			["cg_nissan_gtr_2012_orange",5900],
			["cg_nissan_gtr_2012_grise",5900],
			["cg_nissan_gtr_2012_vert",5900],
			["cg_nissan_gtr_2012_bleufonce",5900],
			["cg_nissan_gtr_2012_bleu",5900],
			["cg_nissan_gtr_2012_white",5900],
			["cg_nissan_gtr_2012_jaune",5900],


			
			["cg_jeep_blinde_noir",9000],
			["cg_jeep_blinde_violet",9000],
			["cg_jeep_blinde_rose",9000],
			["cg_jeep_blinde_orange",9000],
			["cg_jeep_blinde_grise",9000],
			["cg_jeep_blinde_vert",9000],
			["cg_jeep_blinde_bleufonce",9000],
			["cg_jeep_blinde_bleu",9000],
			["cg_jeep_blinde_white",9000],
			["cg_jeep_blinde_jaune",9000],





			["cg_lancer_evo_x_noir",5900],
			["cg_lancer_evo_x_violet",5900],
			["cg_lancer_evo_x_rose",5900],
			["cg_lancer_evo_x_orange",5900],
			["cg_lancer_evo_x_grise",5900],
			["cg_lancer_evo_x_vert",5900],
			["cg_lancer_evo_x_bleufonce",5900],
			["cg_lancer_evo_x_bleu",5900],
			["cg_lancer_evo_x_white",5900],
			["cg_lancer_evo_x_jaune",5900],

			["cg_lambo_veneno_noir",5900],
			["cg_lambo_veneno_violet",5900],
			["cg_lambo_veneno_rose",5900],
			["cg_lambo_veneno_orange",5900],
			["cg_lambo_veneno_grise",5900],
			["cg_lambo_veneno_vert",5900],
			["cg_lambo_veneno_bleufonce",5900],
			["cg_lambo_veneno_bleu",5900],
			["cg_lambo_veneno_white",5900],
			["cg_lambo_veneno_jaune",5900],


			["cg_ford_mustang_noir",5590],
			["cg_ford_mustang_violet",5590],
			["cg_ford_mustang_rose",5590],
			["cg_ford_mustang_orange",5590],
			["cg_ford_mustang_grise",5590],
			["cg_ford_mustang_vert",5590],
			["cg_ford_mustang_bleufonce",5590],
			["cg_ford_mustang_bleu",5590],
			["cg_ford_mustang_white",5590],
			["cg_ford_mustang_jaune",5590],
			["cg_ford_mustang_rouge",5590],


			["cg_dodge_charger_2015_noir",5900],
			["cg_dodge_charger_2015_violet",5900],
			["cg_dodge_charger_2015_rose",5900],
			["cg_dodge_charger_2015_orange",5900],
			["cg_dodge_charger_2015_grise",5900],
			["cg_dodge_charger_2015_vert",5900],
			["cg_dodge_charger_2015_bleufonce",5900],
			["cg_dodge_charger_2015_bleu",5900],
			["cg_dodge_charger_2015_white",5900],
			["cg_dodge_charger_2015_jaune",5900],
			["cg_dodge_charger_2015_rouge",5900],


			["cg_mercedes_sprint_van_noir",1500],
			["cg_mercedes_sprint_van_violet",1500],
			["cg_mercedes_sprint_van_rose",1500],
			["cg_mercedes_sprint_van_orange",1500],
			["cg_mercedes_sprint_van_grise",1500],
			["cg_mercedes_sprint_van_vert",1500],
			["cg_mercedes_sprint_van_bleufonce",1500],
			["cg_mercedes_sprint_van_bleu",1500],
			["cg_mercedes_sprint_van_white",1500],
			["cg_mercedes_sprint_van_jaune",1500],
			["cg_mercedes_sprint_van_rouge",1500],



			["cg_citroen_c4_noir",1900],
			["cg_citroen_c4_violet",1900],
			["cg_citroen_c4_rose",1900],
			["cg_citroen_c4_orange",1900],
			["cg_citroen_c4_grise",1900],
			["cg_citroen_c4_vert",1900],
			["cg_citroen_c4_bleufonce",1900],
			["cg_citroen_c4_bleu",1900],
			["cg_citroen_c4_white",1900],
			["cg_citroen_c4_jaune",1900],
			["cg_citroen_c4_rouge",1900],



			["cg_renault_twingo_noir",1900],
			["cg_renault_twingo_violet",1900],
			["cg_renault_twingo_rose",1900],
			["cg_renault_twingo_orange",1900],
			["cg_renault_twingo_grise",1900],
			["cg_renault_twingo_vert",1900],
			["cg_renault_twingo_bleufonce",1900],
			["cg_renault_twingo_bleu",1900],
			["cg_renault_twingo_white",1900],
			["cg_renault_twingo_jaune",1900],
			["cg_renault_twingo_rouge",1900],


			["cg_citroen_ds3_noir",1400],
			["cg_citroen_ds3_violet",1400],
			["cg_citroen_ds3_rose",1400],
			["cg_citroen_ds3_orange",1400],
			["cg_citroen_ds3_grise",1400],
			["cg_citroen_ds3_vert",1400],
			["cg_citroen_ds3_bleufonce",1400],
			["cg_citroen_ds3_bleu",1400],
			["cg_citroen_ds3_white",1400],
			["cg_citroen_ds3_jaune",1400],
			["cg_citroen_ds3_rouge",1400],

			["cg_citroen_ds4_noir",1590],
			["cg_citroen_ds4_violet",1590],
			["cg_citroen_ds4_rose",1590],
			["cg_citroen_ds4_orange",1590],
			["cg_citroen_ds4_grise",1590],
			["cg_citroen_ds4_vert",1590],
			["cg_citroen_ds4_bleufonce",1590],
			["cg_citroen_ds4_bleu",1590],
			["cg_citroen_ds4_white",1590],
			["cg_citroen_ds4_jaune",1590],
			["cg_citroen_ds4_rouge",1590],

			["cg_peugeot_308_gti_civ_noir",1590],
			["cg_peugeot_308_gti_civ_violet",1590],
			["cg_peugeot_308_gti_civ_rose",1590],
			["cg_peugeot_308_gti_civ_orange",1590],
			["cg_peugeot_308_gti_civ_grise",1590],
			["cg_peugeot_308_gti_civ_vert",1590],
			["cg_peugeot_308_gti_civ_bleufonce",1590],
			["cg_peugeot_308_gti_civ_bleu",1590],
			["cg_peugeot_308_gti_civ_white",1590],
			["cg_peugeot_308_gti_civ_jaune",1590],
			["cg_peugeot_308_gti_civ_rouge",1590],

			["cg_peugeot_308_rcz_noir",590],
			["cg_peugeot_308_rcz_violet",590],
			["cg_peugeot_308_rcz_rose",590],
			["cg_peugeot_308_rcz_orange",590],
			["cg_peugeot_308_rcz_grise",590],
			["cg_peugeot_308_rcz_vert",590],
			["cg_peugeot_308_rcz_bleufonce",590],
			["cg_peugeot_308_rcz_bleu",590],
			["cg_peugeot_308_rcz_white",590],
			["cg_peugeot_308_rcz_jaune",590],
			["cg_peugeot_308_rcz_rouge",590],



			["cg_peugeot_508_civ_noir",5900],
			["cg_peugeot_508_civ_violet",5900],
			["cg_peugeot_508_civ_rose",5900],
			["cg_peugeot_508_civ_orange",5900],
			["cg_peugeot_508_civ_grise",5900],
			["cg_peugeot_508_civ_vert",5900],
			["cg_peugeot_508_civ_bleufonce",5900],
			["cg_peugeot_508_civ_bleu",5900],
			["cg_peugeot_508_civ_white",5900],
			["cg_peugeot_508_civ_jaune",5900],
			["cg_peugeot_508_civ_rouge",5900],


			["cg_ducati_civ_noir",5900],
			["cg_ducati_civ_violet",5900],
			["cg_ducati_civ_rose",5900],
			["cg_ducati_civ_orange",5900],
			["cg_ducati_civ_grise",5900],
			["cg_ducati_civ_vert",5900],
			["cg_ducati_civ_bleufonce",5900],
			["cg_ducati_civ_bleu",5900],
			["cg_ducati_civ_white",5900],
			["cg_ducati_civ_jaune",5900],
			["cg_ducati_civ_rouge",5900],



			["cg_daf_xf_euro6_noir",2590],
			["cg_daf_xf_euro6_violet",2590],
			["cg_daf_xf_euro6_rose",2590],
			["cg_daf_xf_euro6_orange",2590],
			["cg_daf_xf_euro6_grise",2590],
			["cg_daf_xf_euro6_vert",2590],
			["cg_daf_xf_euro6_bleufonce",2590],
			["cg_daf_xf_euro6_white",2590],
			["cg_daf_xf_euro6_jaune",2590],
			["cg_daf_xf_euro6_rouge",2590],

			["cg_renault_magnum_truck_f_noir",4590],
			["cg_renault_magnum_truck_f_violet",4590],
			["cg_renault_magnum_truck_f_rose",4590],
			["cg_renault_magnum_truck_f_orange",4590],
			["cg_renault_magnum_truck_f_grise",4590],
			["cg_renault_magnum_truck_f_vert",4590],
			["cg_renault_magnum_truck_f_white",4590],
			["cg_renault_magnum_truck_f_jaune",4590],








			["cg_peugeot_207_rc_noir",2000],
			["cg_peugeot_207_rc_violet",2000],
			["cg_peugeot_207_rc_rose",2000],
			["cg_peugeot_207_rc_orange",2000],
			["cg_peugeot_207_rc_grise",2000],
			["cg_peugeot_207_rc_vert",2000],
			["cg_peugeot_207_rc_bleufonce",2000],
			["cg_peugeot_207_rc_bleu",2000],
			["cg_peugeot_207_rc_white",2000],
			["cg_peugeot_207_rc_jaune",2000],


			["cg_volkswagen_touareg_noir",2000],
			["cg_volkswagen_touareg_violet",2000],
			["cg_volkswagen_touareg_rose",2000],
			["cg_volkswagen_touareg_orange",2000],
			["cg_volkswagen_touareg_grise",2000],
			["cg_volkswagen_touareg_vert",2000],
			["cg_volkswagen_touareg_bleufonce",2000],
			["cg_volkswagen_touareg_bleu",2000],
			["cg_volkswagen_touareg_white",2000],
			["cg_volkswagen_touareg_jaune",2000],


			["cg_vw_golfvi_noir",2000],
			["cg_vw_golfvi_violet",2000],
			["cg_vw_golfvi_rose",2000],
			["cg_vw_golfvi_orange",2000],
			["cg_vw_golfvi_grise",2000],
			["cg_vw_golfvi_vert",2000],
			["cg_vw_golfvi_bleufonce",2000],
			["cg_vw_golfvi_bleu",2000],
			["cg_vw_golfvi_white",2000],
			["cg_vw_golfvi_jaune",2000],

			["cg_audi_rs4_noir",4000],
			["cg_audi_rs4_violet",4000],
			["cg_audi_rs4_rose",4000],
			["cg_audi_rs4_orange",4000],
			["cg_audi_rs4_grise",4000],
			["cg_audi_rs4_vert",4000],
			["cg_audi_rs4_bleufonce",4000],
			["cg_audi_rs4_bleu",4000],
			["cg_audi_rs4_white",4000],
			["cg_audi_rs4_jaune",4000],


			["cg_audi_rs5_noir",2400],
			["cg_audi_rs5_violet",2400],
			["cg_audi_rs5_rose",2400],
			["cg_audi_rs5_orange",2400],
			["cg_audi_rs5_grise",2400],
			["cg_audi_rs5_vert",2400],
			["cg_audi_rs5_bleufonce",2400],
			["cg_audi_rs5_bleu",2400],
			["cg_audi_rs5_white",2400],
			["cg_audi_rs5_jaune",2400],



			["cg_bmw_1series_m_noir",2900],
			["cg_bmw_1series_m_violet",2900],
			["cg_bmw_1series_m_rose",2900],
			["cg_bmw_1series_m_orange",2900],
			["cg_bmw_1series_m_grise",2900],
			["cg_bmw_1series_m_vert",2900],
			["cg_bmw_1series_m_bleufonce",2900],
			["cg_bmw_1series_m_bleu",2900],
			["cg_bmw_1series_m_white",2900],
			["cg_bmw_1series_m_jaune",2900],



			["cg_renault_megane_rs_2015_noir",3000],
			["cg_renault_megane_rs_2015_violet",3000],
			["cg_renault_megane_rs_2015_rose",3000],
			["cg_renault_megane_rs_2015_orange",3000],
			["cg_renault_megane_rs_2015_grise",3000],
			["cg_renault_megane_rs_2015_vert",3000],
			["cg_renault_megane_rs_2015_bleufonce",3000],
			["cg_renault_megane_rs_2015_bleu",3000],
			["cg_renault_megane_rs_2015_white",3000],
			["cg_renault_megane_rs_2015_jaune",3000],



			["cg_bmw_m6_noir",3000],
			["cg_bmw_m6_violet",3000],
			["cg_bmw_m6_rose",3000],
			["cg_bmw_m6_orange",3000],
			["cg_bmw_m6_grise",3000],
			["cg_bmw_m6_vert",3000],
			["cg_bmw_m6_bleufonce",3000],
			["cg_bmw_m6_bleu",3000],
			["cg_bmw_m6_white",3000],
			["cg_bmw_m6_jaune",3000],



			["cg_raptor_truck_noir",3000],
			["cg_raptor_truck_violet",3000],
			["cg_raptor_truck_rose",3000],
			["cg_raptor_truck_orange",3000],
			["cg_raptor_truck_grise",3000],
			["cg_raptor_truck_vert",3000],
			["cg_raptor_truck_bleufonce",3000],
			["cg_raptor_truck_bleu",3000],
			["cg_raptor_truck_white",3000],
			["cg_raptor_truck_jaune",3000],

			["cg_raptor_truck_va_noir",3900],
			["cg_raptor_truck_va_violet",3900],
			["cg_raptor_truck_va_rose",3900],
			["cg_raptor_truck_va_orange",3900],
			["cg_raptor_truck_va_grise",3900],
			["cg_raptor_truck_va_vert",3900],
			["cg_raptor_truck_va_bleufonce",3900],
			["cg_raptor_truck_va_bleu",3900],
			["cg_raptor_truck_va_white",3900],
			["cg_raptor_truck_va_jaune",3900],

			["cg_bowler_offroad_noir",5000],
			["cg_bowler_offroad_violet",6000],
			["cg_bowler_offroad_rose",5000],
			["cg_bowler_offroad_orange",5000],
			["cg_bowler_offroad_grise",5000],
			["cg_bowler_offroad_vert",5000],
			["cg_bowler_offroad_bleufonce",5000],
			["cg_bowler_offroad_bleu",5000],
			["cg_bowler_offroad_white",5000],
			["cg_bowler_offroad_jaune",5000],







			["cg_hummer_h1_noir",5000],
			["cg_hummer_h1_violet",5000],
			["cg_hummer_h1_rose",5000],
			["cg_hummer_h1_orange",5000],
			["cg_hummer_h1_grise",5000],
			["cg_hummer_h1_vert",5000],
			["cg_hummer_h1_bleufonce",5000],
			["cg_hummer_h1_bleu",5000],
			["cg_hummer_h1_white",5000],
			["cg_hummer_h1_jaune",5000],


			["cg_audi_a8_limo_noir",9000],
			["cg_audi_a8_limo_violet",9000],
			["cg_audi_a8_limo_rose",9000],
			["cg_audi_a8_limo_orange",9000],
			["cg_audi_a8_limo_grise",9000],
			["cg_audi_a8_limo_vert",9000],
			["cg_audi_a8_limo_bleufonce",9000],
			["cg_audi_a8_limo_bleu",9000],
			["cg_audi_a8_limo_white",9000],
			["cg_audi_a8_limo_jaune",9000],
















						//HOLDENS
			["AM_Holden_White",8500],
			["AM_Holden_Black",8500],
			["AM_Holden_Green",8500],
			["AM_Holden_DarkGreen",8500],
			["AM_Holden_OffGreen",8500],
			["AM_Holden_blue",8500],
			["AM_Holden_OffYellow",8500],
			["AM_Holden_Pink",8500],
			["AM_Holden_Purple",8500],
			["AM_Holden_Yellow",8500],
			
			["S_McLarenP1_Black",8000],
			["S_McLarenP1_Blue",8500],
			["S_McLarenP1_Orange",8500],
			["S_McLarenP1_White",8500],
			["S_McLarenP1_Yellow",8500],
			["S_McLarenP1_Silver",8500],
			["A3L_Veyron",5000],
			["A3L_Veyron_red",5000],
			["A3L_Veyron_black",5000],
			["A3L_Veyron_white",5000],
			["A3L_Veyron_orange",5000],


			//Holden racing
			["AM_Holden_RBlue",9850],			
			["AM_Holden_RRed",9850],
			["AM_Holden_RWhite",9850],
			["AM_Holden_RBlack",9850],

			["CG_Lamborghini_Aventador_Red", 10000],
			["CG_Lamborghini_Aventador_Black", 10000],
			["CG_Lamborghini_Aventador_Blue", 10000],
			["CG_Lamborghini_Aventador_Green", 10000],
			["CG_Lamborghini_Aventador_Orange", 10000],
			["CG_Lamborghini_Aventador_Purple", 10000],
			["CG_Lamborghini_Aventador_White", 10000],
			["IVORY_PRIUS",1250],
			["ivory_gt500",4000],
			["ivory_wrx",3000],
			["IVORY_R8",2300],
			["IVORY_R8SPYDER",2300],
			["IVORY_REV",2900],	
			["ivory_lfa",3900],
			["ivory_c",5600]


];
__CONST__(life_garage_sell,life_garage_sell);
