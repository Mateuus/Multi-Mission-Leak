#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_compTarget = ObjNull;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_siren2_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1.0; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_god = false;
life_frozen = false;
life_markers = false;
life_smartphoneTarget = ObjNull;
life_fatigue = 0;
life_drink = 0;
life_legal_limit = 0.08;
life_channel_send = true;
life_sitting = false;
life_tent = [];
life_request_timer = false;
life_isSuiciding = false;
life_lock = true;
life_earPlugs = false;
life_is_alive = false;
life_nlrtimer_stop = false;
life_nlrtimer_running = false;
life_looting = false;

//Taxi Variables
life_calledTaxi = false;
life_isOnDutyTaxi = false;
life_inTaxi = false;

//Backend Variables for EMP
nn_last_vehicles = [];
nn_empInUse = false;

// inventory, class, name, height, distance, damageable
life_placeable =
[
	["roadCone","RoadCone_F","Road Cone",1,4,false],
	["roadBarrier","RoadBarrier_F","Road Barrier",1,4,false],
	["cncBarrier","Land_CncBarrierMedium_F","Concrete Barrier",1,4,false],
	["cncBarrierL","Land_CncBarrierMedium4_F","Concrete Barrier Long",1,4,false],
	["barGate","Land_BarGate_F","Bar Gate",4,4,false],
	["mobileOutpost","Land_Cargo_House_V1_F","Mobile Outpost",4,4,false],
	["floodLightSingle","Land_PortableLight_single_F","Single Flood Light",1,4,false],
	["floodLightDouble","Land_PortableLight_double_F","Double Flood Light",1,4,false],
	["outpostHMG","B_HMG_01_F","Outpost HMG",1,4,false],
	["blueBarrier","PlasticBarrier_03_blue_F","Blue Barrier",1,4,false],
	["placeHolder","Land_Cargo_House_V1_ruins_F","Placeholder",1,4,false],
	["placeHolder2","Rope","Placeholder2",1,4,false]
];

//Restrict Sling Load
Amarok_RestrictSling = ["I_Truck_02_transport_F","I_Truck_02_covered_F","B_Truck_01_transport_F","B_Truck_01_covered_F","B_Truck_01_box_F","O_Truck_03_device_F"];
__CONST__(Amarok_RestrictSling,Amarok_RestrictSling);

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,1000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,500000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,50000); //MASDASDASD
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
life_is_arrestedCell = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,15); //Fifteen minutes
life_cash = 0;
__CONST__(life_impound_car,1000);
__CONST__(life_impound_boat,500);
__CONST__(life_impound_air,2000);
__CONST__(life_impound_tank,5000);
life_istazed = false;
life_isdowned = false;
life_my_gang = ObjNull;
life_placing = objNull;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 1000000; //Starting Bank Money
		life_paycheck = 10000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 1000000; //Starting Bank Money
		life_paycheck = 10000; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 1000000;
		life_paycheck = 15000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_Heli_Light_01_armed_F","I_Heli_light_03_F","B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_peach",
	"life_inv_orange",
	"life_inv_strawberry",
	"life_inv_blueberry",
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
	"life_inv_chainsaw",
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
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_handCuffs",
	"life_inv_handCuffKey",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_bombdetect",
	"life_inv_demolitioncharge",
	"life_inv_civdefusekit",
	"life_inv_cornmeal",
	"life_inv_beerp",
	"life_inv_whiskey",
	"life_inv_rye",
	"life_inv_hops",
	"life_inv_yeast",
	"life_inv_bottles",
	"life_inv_bottledshine",
	"life_inv_bottledbeer",
	"life_inv_bottledwhiskey",
	"life_inv_moonshine",
	"life_inv_mash",
	"life_inv_kidney",
	"life_inv_goldbarp",
	"life_inv_underwatercharge",
	"life_inv_speedbomb",
	"life_inv_scalpel",
	"life_inv_zip",
	"life_inv_tentciv",
	"life_inv_wood",
	"life_inv_joint",
	"life_inv_dogwhistle",
	"life_inv_gpstracker",
	"life_inv_vehAmmo",
	"life_inv_nitro",
	"life_inv_roadCone",
	"life_inv_roadBarrier",
	"life_inv_cncBarrier",
	"life_inv_cncBarrierL",
	"life_inv_barGate",
	"life_inv_mobileOutpost",
	"life_inv_floodLightSingle",
	"life_inv_floodLightDouble",
	"life_inv_outpostHMG",
	"life_inv_blueBarrier",
	"life_inv_blindfold",
	"life_inv_ammoBox",
	"life_inv_ammoBoxS",

	"life_inv_copperRing",
	"life_inv_silverRing",
	"life_inv_goldRing",
	"life_inv_pearlNecklace",
	"life_inv_emerald",
	"life_inv_sapphire",
	"life_inv_ruby",
	
	"life_inv_chicken_meat",
	"life_inv_sheep_meat",
	"life_inv_goat_meat",
	"life_inv_rabbit_meat",
	
// New Crafting Items
	"life_inv_handgrip",
	"life_inv_trigger",
	"life_inv_9mmCase",
	"life_inv_9mmBullet",
	"life_inv_primer",
	"life_inv_gunpowder",
	"life_inv_glasslens",
	"life_inv_electric",
	"life_inv_steeltube",
	"life_inv_chamber",
	"life_inv_metalcase",
	"life_inv_556Case",
	"life_inv_556Bullet",
	"life_inv_65Case",
	"life_inv_65Bullet",
	"life_inv_762Case",
	"life_inv_762Bullet",
	"life_inv_408Case",
	"life_inv_408Bullet",
	"life_inv_leather",
	"life_inv_thread",
	"life_inv_heavythread",
	"life_inv_metalplate",
	"life_inv_needle",
	"life_inv_zipper",
	"life_inv_45Case",
	"life_inv_45Bullet",
	"life_inv_explosive"
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
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_taxi","civ"],
	["license_civ_bh","civ"],
	["license_civ_c3","civ"],
	["license_civ_hacker","civ"],
	["license_civ_passportEast","civ"],
	["license_civ_passportWest","civ"],
	["license_civ_lawyer","civ"],
	["license_civ_uc","civ"]
];
//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_prof =
[
	["Oil_Prof","civ"],
	["Iron_Prof","civ"],
	["Copper_Prof","civ"],
	["Heroin_Prof","civ"],
	["Canabis_Prof","civ"],
	["Cocain_Prof","civ"],
	["Salt_Prof","civ"],
	["Fruit_Prof","civ"],
	["Diamond_Prof","civ"],
	["Rock_Prof","civ"],
	["Sand_Prof","civ"]
];
//Setup License Variables
{missionNamespace setVariable[(_x select 0),[1,0]];} foreach life_prof;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",5000],["heroinp",10000],["cocaine",5000],["cocainep",10000],["cannabis",2500],["marijuana",5000],["turtle",3000],["blastingcharge",10000],["demolitioncharge",15000],["boltcutter",1500],["moonshine",5000],["bottledshine",10000],["mash",5000],["kidney",10000],["speedbomb",15000],["scalpel",5000],["zipties",1000],["lockpick",500],["spikeStrip",7500],["joint",5000]];
life_drug_items = [["heroinu",5000],["heroinp",10000],["cocaine",5000],["cocainep",10000],["cannabis",2500],["marijuana",5000],["joint",5000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["408Bullet",1000],
	["408Case",750],
	["45Bullet",60],
	["45Case",50],
	["556Bullet",200],
	["556Case",150],
	["65Bullet",450],
	["65Case",350],
	["762Bullet",750],
	["762Case",500],
	["9mmBullet",25],
	["9mmCase",10],
	["ammoBox",5000],
	["ammoBoxS",2500],
	["apple",50],
	["barGate",250],
	["beerp",200],
	["blastingcharge",20000],
	["blindfold",1250],
	["blueberry",30],
	["boltcutter",2500],
	["bombdetect",750],
	["bottledbeer",500],
	["bottledshine",2500],
	["bottledwhiskey",2000],
	["bottles",500],
	["cannabis",1000],
	["catshark",800],
	["cement",3800],
	["chainsaw",1500],
	["chamber",500],
	["civdefusekit",2500],
	["cncBarrier",500],
	["cncBarrierL",1000],
	["bluebarrier",250],
	["cocaine",1250],
	["cocainep",12500],
	["coffee",5],
	["copperore",800],
	["copper_r",1000],
	["cornmeal",50],
	["defusekit",1000],
	["demolitioncharge",50000],
	["diamond",2000],
	["diamondc",5000],
	["dogwhistle",7500],
	["donuts",60],
	["electric",750],
	["explosive",5000],
	["floodLightDouble",350],
	["floodLightSingle",250],
	["fuelF",500],
	["glass",3500],
	["glasslens",400],
	["goldbar",250000],
	["goldbarp",125000],
	["gpstracker",2000],
	["nitro",2500],
	["gunpowder",25],
	["handCuffs",50],
	["handCuffKey",10],
	["handgrip",25],
	["heavythead",150],
	["heroinp",15000],
	["heroinu",1500],
	["hops",75],
	["ironore",500],
	["iron_r",1500],
	["joint",5000],
	["kidney",20000],
	["leather",500],
	["lockpick",150],
	["mackerel",400],
	["marijuana",8000],
	["mash",500],
	["metalcase",400],
	["metalplate",800],
	["mobileOutpost",5000],
	["moonshine",1500],
	["mullet",350],
	["needle",50],
	["oilp",2000],
	["orange",100],
	["ornate",50],
	["outpostHMG",15000],
	["peach",125],
	["pickaxe",200],
	["primer",30],
	["roadBarrier",250],
	["roadCone",75],
	["roadCone",100],
	["rye",75],
	["salema",100],
	["salt_r",1400],
	["scalpel",1000],
	["speedbomb",50000],
	["spikeStrip",1250],
	["steeltube",250],
	["storagebig",0],
	["storagesmall",0],
	["strawberry",75],
	["tbacon",25],
	["tentciv",2500],
	["thread",50],
	["trigger",15],
	["tuna",1000],
	["turtle",8000],
	["tutlesoup",1000],
	["underwatercharge",15000],
	["vehAmmo",50000],
	["water",5],
	["whiskey",1000],
	["wood",250],
	["yeast",150],
	["zipper",100],
	["zipties",1000],
	
	["silverRing",1000],
	["goldRing",2500],
	["diamondRing",5000],
	["pearlNecklace",10000],
	["emerald",15000],
	["sapphire",25000],
	["ruby",50000],
	
	["chicken_meat", 1000],
	["sheep_meat", 1500],
	["goat_meat", 2000],
	["rabbit_meat", 500]
];

buy_array = 
[
	["408Bullet",2000],
	["408Case",1500],
	["45Bullet",120],
	["45Case",100],
	["556Bullet",400],
	["556Case",300],
	["65Bullet",900],
	["65Case",700],
	["762Bullet",1500],
	["762Case",1000],
	["9mmBullet",50],
	["9mmCase",20],
	["ammoBox",10000],
	["ammoBoxS",5000],
	["apple",100],
	["barGate",500],
	["blastingcharge",35000],
	["blindfold",2500],
	["blueberry",50],
	["boltcutter",7500],
	["bombdetect",1500],
	["bottledbeer",750],
	["bottledshine",3000],
	["bottledwhiskey",2500],
	["bottles",600],
	["catshark",1000],
	["chainsaw",4000],
	["chamber",1000],
	["civdefusekit",5000],
	["cncBarrier",1000],
	["cncBarrierL",2000],
	["blueBarrier",500],
	["coffee",10],
	["cornmeal",75],
	["defusekit",2500],
	["demolitioncharge",500000],
	["dogwhistle",10000],
	["donuts",120],
	["electric",1500],
	["explosive",10000],
	["floodLightDouble",700],
	["floodLightSingle",500],
	["fuelF",1000],
	["glasslens",800],
	["gpstracker",4000],
	["nitro",5000],
	["gunpowder",50],
	["handCuffs",100],
	["handCuffKey",25],
	["handgrip",50],
	["heavythread",300],
	["joint",7500],
	["kidney",30000],
	["leather",1000],
	["lockpick",1500],
	["mackerel",600],
	["metalcase",800],
	["metalplate",1600],
	["mobileOutpost",10000],
	["mullet",700],
	["needle",100],
	["orange",175],
	["ornate",100],
	["outpostHMG",35000],
	["peach",250],
	["pickaxe",750],
	["primer",60],
	["roadCone",150],
	["roadConeL",200],
	["roadBarrier",500],
	["salema",150],
	["scalpel",5000],
	["speedbomb",300000],
	["spikeStrip",2500],
	["steeltube",500],
	["storagebig",150000],
	["storagesmall",75000],
	["strawberry",125],
	["tbacon",75],
	["tentciv",5000],
	["thread",100],
	["trigger",30],
	["tuna",1500],
	["turtlesoup",2500],
	["underwatercharge",20000],
	["vehAmmo",100000],
	["water",5],
	["zipper",200],
	["zipties",2500]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
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
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",250],
	["C_Hatchback_01_F",1500],
	["C_Hatchback_01_sport_F",4350],
	["C_Offroad_01_F",1750],
	["C_SUV_01_F",3500],
	["C_Van_01_transport_F",4000],
	["C_Van_01_box_F",6000],
	["B_MRAP_01_F",7000],
	["I_Truck_02_transport_F",7500],
	["I_Truck_02_covered_F",10000],
	["B_Truck_01_transport_F",27500],
	["O_Truck_03_transport_F",20000],
	["O_Truck_03_covered_F",25000],
	["B_Truck_01_box_F",35000],
	["O_Truck_03_device_F",45000],
	["B_Heli_Light_01_F",25000],
	["O_Heli_Light_02_unarmed_F",75000],
	["C_Heli_Light_01_civil_F",27500],
	["O_Heli_Transport_04_F",140000],
	["B_Heli_Transport_03_F",175000],
	["B_Heli_Transport_01_F",20000],
	["C_Kart_01_Blu_F",300],
	["C_Kart_01_Fuel_F",300],
	["C_Kart_01_Red_F",300],
	["C_Kart_01_Vrana_F",300],
	["I_Truck_02_medical_F",2500],
	["O_Truck_03_medical_F",4500],
	["B_Truck_01_medical_F",6000],
	["O_MRAP_02_F",15000],
	["B_G_Offroad_01_armed_F",25000],
	["I_MRAP_03_hmg_F",20000],
	["B_MRAP_01_hmg_F",16000],
	["B_APC_Wheeled_01_cannon_F",30000],
	["B_APC_Tracked_01_CRV_F",75000],
	["I_Heli_light_03_unarmed_F",45000],
	["O_Heli_Light_02_F",42000],
	["B_Heli_Attack_01_F",50000],
	["C_Rubberboat",500],
	["C_Boat_Civil_01_F",2200],
	["B_Boat_Transport_01_F",300],
	["C_Boat_Civil_01_police_F",2000],
	["B_SDV_01_F",20000],
	["B_Boat_Armed_01_minigun_F",17500],
	["O_Heli_Transport_04_box_F",250000],
	["I_Heli_Transport_02_F",40000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",1250],
	["C_Hatchback_01_F",5750],
	["C_Hatchback_01_sport_F",21750],
	["C_Offroad_01_F",8750],
	["C_SUV_01_F",17500],
	["C_Van_01_transport_F",20000],
	["C_Van_01_box_F",30000],
	["B_MRAP_01_F",35000],
	["I_Truck_02_transport_F",37500],
	["I_Truck_02_covered_F",50000],
	["B_Truck_01_transport_F",137500],
	["O_Truck_03_transport_F",100000],
	["O_Truck_03_covered_F",125000],
	["B_Truck_01_box_F",175000],
	["O_Truck_03_device_F",225000],
	["B_Heli_Light_01_F",125000],
	["O_Heli_Light_02_unarmed_F",375000],
	["C_Heli_Light_01_civil_F",137500],
	["O_Heli_Transport_04_F",700000],
	["B_Heli_Transport_03_F",875000],
	["B_Heli_Transport_01_F",100000],
	["C_Kart_01_Blu_F",1500],
	["C_Kart_01_Fuel_F",1500],
	["C_Kart_01_Red_F",1500],
	["C_Kart_01_Vrana_F",1500],
	["I_Truck_02_medical_F",12500],
	["O_Truck_03_medical_F",22500],
	["B_Truck_01_medical_F",30000],
	["O_MRAP_02_F",75000],
	["B_G_Offroad_01_armed_F",125000],
	["I_MRAP_03_hmg_F",100000],
	["B_MRAP_01_hmg_F",80000],
	["B_APC_Wheeled_01_cannon_F",150000],
	["B_APC_Tracked_01_CRV_F",375000],
	["I_Heli_light_03_unarmed_F",225000],
	["O_Heli_Light_02_F",210000],
	["B_Heli_Attack_01_F",250000],
	["C_Rubberboat",2500],
	["C_Boat_Civil_01_F",11000],
	["B_Boat_Transport_01_F",1500],
	["C_Boat_Civil_01_police_F",10000],
	["B_SDV_01_F",100000],
	["B_Boat_Armed_01_minigun_F",87500],
	["O_Heli_Transport_04_box_F",1250000],
	["I_Heli_Transport_02_F",400000]
];
__CONST__(life_garage_sell,life_garage_sell);