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
life_lockingCar = time;
life_jumpActionTime = time;
life_gangActionTime = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_intro_playing = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_isknockedout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_smartphoneTarget = ObjNull;
life_action_gather = false;
life_drink = 0;
life_fatigue = 0.5; //Set the max fatigue limit (50%)
life_kw_athira = false; 
life_kw_kavala = false; 
life_kw_sofia = false; 
life_kw_kavala = false;
life_request_timer = false;
life_markers = false;
life_sitting = false;
life_firstSpawn = false;
life_requestedMedicFoundsPayed = false;
life_insafezone = false; 
life_container = ["C_supplyCrate_F","Box_IND_AmmoVeh_F","C_Boat_Civil_04_F"];
life_inInventory = false;
life_inEsc = false;
life_Einsatzschild = false;
life_EinsatzschildInUse = false;
life_flyback = false;
life_flybacks = ["I_C_Plane_Civil_01_F","I_Plane_Fighter_03_CAS_F","I_Plane_Fighter_03_AA_F","C_Plane_Civil_01_F","C_Plane_Civil_01_racing_F","O_Plane_CAS_02_F","B_Plane_CAS_01_F"];
//life_TankLaster = 1;	//Öl nur in Tanker

//EMP GRAD AM MACHEN ?
life_empInUse = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for civs and cops?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,750); //Fee for players to pay when revived.
__CONST__(life_revive_moneyMedic,75000); //Money Medics earn for reviving poeple


//House Limit
__CONST__(life_houseLimit,3); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,200000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

__CONST__(life_enableFatigue,false); //Enable / Disable the ARMA 3 Fatigue System

//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];
/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 50; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 100; //Static variable representing the players max carrying weight on start.
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
life_hunger = 100;
life_battery = 50;
__CONST__(life_paycheck_period,10); //Five minutes
life_cash = 0;
__CONST__(life_impound_car,2500);
__CONST__(life_impound_boat,1000);
__CONST__(life_impound_air,7500);
life_istazed = false;
life_my_gang = ObjNull;
life_drugged_cocaine = -1;
life_drugged_cocaine_duration = 10; 
life_drugged_weed = -1;
life_drugged_weed_duration = 3;

life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west:
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 20000; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 650000; //Starting Bank Money
		life_paycheck = 3200; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 50000;
		life_paycheck = 35000;
	};
	case east:
    {
        life_atmcash = 50000; //Starting Bank Money
        life_paycheck = 50000; //Paycheck Amount
    };
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["C_supplyCrate_F","Box_IND_AmmoVeh_F","B_Slingload_01_Cargo_F","B_Slingload_01_Fuel_F","B_G_Offroad_01_armed_F"];
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
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_painkillers",
	"life_inv_morphium",
	"life_inv_zipties",
	"life_inv_wine",
	"life_inv_grapes",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_battery",
	"life_inv_mauer",
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
	"life_inv_sprengstoff",
	"life_inv_brennstab",
	"life_inv_uran",
	"life_inv_kidney",
	"life_inv_scalpel",
	"life_inv_inelement",
	"life_inv_stelement",
	"life_inv_fuelK",
	"life_inv_einsatzschild",
	"life_inv_defibrilator",
	//Crafting
	"life_inv_edelmetall",
	"life_inv_edelholz",
	"life_inv_carbon",
	"life_inv_plastik",
	"life_inv_spezialglas",
	"life_inv_stoff",
	"life_inv_farbe",
	"life_inv_messing",
	"life_inv_strohpuppe",
	"life_inv_schwarzpulver",
	"life_inv_spezialfett",
	"life_inv_lynx",
	
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	"life_inv_woodlog",
	"life_inv_woodplank",
	"life_inv_woodfurniture",
	"life_inv_sugarraw",
	"life_inv_sugarprocessed",
	"life_inv_waterspring",
	"life_inv_waterclean",
	"life_inv_waterbottle",
	"life_inv_goldore",
	"life_inv_goldcoins",
	"life_inv_oilraw",
	"life_inv_oilrefined",
	"life_inv_oilheat",
	"life_inv_oildiesel",
	"life_inv_oilkerosin",
	"life_inv_hmherbs",
	"life_inv_hmfiltrated",
	"life_inv_hmbottled",
	"life_inv_hmillegal",
	"life_inv_coffeebeans",
	"life_inv_coffee1",
	"life_inv_energydrink",
	"life_inv_angelstrumpu",
	"life_inv_angelstrumpp",
	"life_inv_crack",
	
	//Shipwreck
	"life_inv_uwsl"
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
	["license_civ_schwarzmarkt","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_grapes","civ"],
	["license_civ_moonshine","civ"],
	["license_civ_meth","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_med_adac","med"],
	["license_civ_stiller","civ"],
	["license_civ_liquor","civ"],
	["license_civ_bottler","civ"],
	["license_civ_uran","civ"],
	["license_civ_ielem","civ"],
	["license_adac_car","adac"],
	["license_adac_air","adac"],
	
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	["license_civ_wood","civ"],
	["license_civ_sugar","civ"],
	["license_civ_water","civ"],
	["license_civ_gold","civ"],
	["license_civ_oilrefined","civ"],
	["license_civ_oilheat","civ"],
	["license_civ_oildiesel","civ"],
	["license_civ_oilkerosin","civ"],
	["license_civ_huntermasterlegal","civ"],
	["license_civ_huntermasterillegal","civ"],
	["license_civ_coffee","civ"],
	["license_civ_energydrink","civ"],
	["license_civ_angelstrump","civ"],
	["license_civ_crack","civ"]
	
	
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5"];
//[shortVar,reward]
life_illegal_items = [["heroinu",2500],["heroinp",5000],["cocaine",3000],["cocainep",6000],["methu",4000],["methp",8000],["cannabis",1000],["marijuana",3500],["turtle",5000],["blastingcharge",10000],
["moonshine",6500],["boltcutter",1000],["goldbar",50000],["bottledshine",6500],["kidney",12500],["scalpel",5000],["mash",6500],["spikeStrip",1500],["sprengstoff",15000],["hmillegal",6500],["energydrink",6000],["angelstrumpetu",2500],["angelstrumpetp",5000],["crack",5000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",2000],
	["heroinp",8000],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",2500],
	["turtle",11000],
	["water",0],
	["coffee",0],
	["turtlesoup",9000],
	["donuts",0],
	["cannabis",2000],
	["marijuana",6000],
	["tbacon",25],
	["lockpick",750],
	["pickaxe",700],
	["redgull",750],
	["peach",65],
	["cocaine",3000],
	["cocainep",8500],
	["diamond",1500],
	["diamondc",7500],
	["iron_r",2000],
	["copper_r",1200],
	["salt_r",2500],
	["glass",3000],
	["fuelF",10],
	["spikeStrip",0],
	["cement",4000],
	["wine",2000],
	["grapes",70],
	["methu",5000],
	["methp",13000],
	["battery",50],
	["defusekit",0],
	["boltcutter",5000],
	["blastingcharge",10000],
	["goldbar",150000],
	["painkillers",100],
	["morphium",100],
	["zipties",5],
	["mauer",5],
	["bottledshine",3000], 
	["bottledwhiskey",12000], 
	["bottledbeer",7500], 
	["moonshine",2350], 
	["whiskey",7000], 
	["beerp",550], 
	["mash",500], 
	["rye",2000], 
	["hops",1800], 
	["yeast",850], 
	["cornmeal",200], 
	["bottles",50],
	["kidney",9000],
	["scalpel",1000],
	["zipties",5],
	["brennstab",5000],
	["sprengstoff",7000],
	["stelement",23000],
	["fuelK",10000],
	["einsatzschild",10],
	["defibrilator",10],
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	["woodlog",10],
	["woodplank",10],
	["woodfurniture",10],
	["sugarraw",10],
	["sugarprocessed",10],
	["waterspring",10],
	["waterclean",10],
	["waterbottle",10],
	["goldore",10],
	["goldcoins",10],
	["oilraw",10],
	["oilrefined",10],
	["oilheat",10],
	["oildiesel",10],
	["oilkerosin",10],
	["hmherbs",10],
	["hmfiltrated",10],
	["hmbottled",10],
	["hmillegal",10],
	["coffeebeans",10],
	["coffee1",10],
	["energydrink",10],
	["angelstrumpetu",10],
	["angelstrumpetp",10],
	["crack",10],
	
	//Shipwreck
	["uwsl",5000]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",100],
	["ornate",100],
	["mackerel",1000],
	["tuna",900],
	["mullet",1000],
	["catshark",1000],
	["water",10],
	["turtle",15000],
	["turtlesoup",15000],
	["donuts",10],
	["coffee",10],
	["tbacon",175],
	["lockpick",9100],
	["pickaxe",1200],
	["redgull",6000],
	["fuelF",500],
	["peach",70],
	["spikeStrip",10],
	["moonshine",2000],
	["wine",4000],
	["grapes",95],
	["battery",1000],
	["defusekit",10],
	["boltcutter",100000],
	["blastingcharge",100000],
	["painkillers",750],
	["morphium",1500],
	["zipties",500],
	["storagesmall",450000],
	["storagebig",900000],
	["mauer",10],
	["bottledshine",12000], 
	["bottledwhiskey",17000], 
	["bottledbeer",12000], 
	["moonshine",13500], 
	["whiskey",13000], 
	["beerp",3750], 
	["cornmeal",500], 
	["mash",2500], 
	["bottles",100],
	["brennstab",27000],
	["sprengstoff",23000],
	["kidney",15000],
	["scalpel",7500],
	["stelement",45000],
	["einsatzschild",4000],
	["defibrilator",60000],
	
	
	
	/*
	Tanoa Farming 2.0
	Made for TanoaRPG.de
	Author: Tim "cat24max" Vogler
	
	Copyright statement:
	You may not reproduce, adapt, modify, communicate to the public, reproduce or otherwise use any part of this script (in particular for commercial purposes) except as set out below, or otherwise with the express written permission from the author.
	*/
	["woodlog",10],
	["woodplank",10],
	["woodfurniture",10],
	["sugarraw",10],
	["sugarprocessed",10],
	["waterspring",10],
	["waterclean",10],
	["waterbottle",10],
	["goldore",10],
	["goldcoins",10],
	["oilraw",10],
	["oilrefined",10],
	["oilheat",10],
	["oildiesel",10],
	["oilkerosin",10],
	["hmherbs",10],
	["hmfiltrated",10],
	["hmbottled",10],
	["hmillegal",10],
	["coffeebeans",10],
	["coffee1",10],
	["energydrink",10],
	["angelstrumpetu",10],
	["angelstrumpetp",10],
	["crack",10],
	
	
	//Shipwreck
	["uwsl",10000]
	
	
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["hgun_Rook40_F",0],
	["hgun_Pistol_heavy_01_F",0],
	["SMG_01_F",0],
	["arifle_sdar_F",0],
	["arifle_Mk20C_F",0],
	["arifle_TRG21_F",0],
	["arifle_TRG20_F",0],
	["arifle_Katiba_F",0],
	["arifle_Katiba_C_F",0],
	["arifle_MXC_Black_F",0],
	["arifle_MX_Black_F",0],
	["arifle_MXM_Black_F",0],
	["arifle_MXC_F",0],
	["arifle_MX_F",0],	
	["arifle_MXM_F",0],
	["SMG_02_F",0],
	["srifle_LRR_LRPS_F",0],
	["srifle_EBR_F",0],
	["arifle_MX_SW_Black_F",0],
	["arifle_MX_SW_F",0],	
	["LMG_Zafir_F",0],
	["srifle_GM6_F",0],
	["muzzle_snds_M",0],
	["muzzle_snds_L",0],
	["muzzle_snds_H",0],
	["optic_Aco_smg",0],
	["optic_ACO_grn",0],
	["optic_Aco",0],
	["optic_Arco",0],
	["optic_Hamr",0],
	["optic_Holosight",0],
	["optic_Holosight_smg",0],
	["optic_SOS",0],
	["optic_LRPS",0],
	["optic_MRCO",0],
	["optic_DMS",0],
	["optic_NVS",0],
	["acc_pointer_IR",0],
	["acc_flashlight",0],
	["optic_Yorris",0],	
	["HandGrenade_Stone",0],	
	["Rangefinder",0],
	["Binocular",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["NVGoggles_OPFOR",0],
	["ItemMap",0],
	["ItemCompass",0],
	["ItemWatch",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["MineDetector",0],	
	["5Rnd_127x108_Mag",0],
	["5Rnd_127x108_APDS_Mag",0],	
	["150Rnd_762x51_Box",0],	
	["100Rnd_65x39_caseless_mag",0],	
	["7Rnd_408_Mag",0],		
	["20Rnd_762x51_Mag",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0],	
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["16Rnd_9x21_Mag",0],
	["6Rnd_45ACP_Cylinder",0],
	["20Rnd_556x45_UW_mag",0],
	["9Rnd_45ACP_Mag",0],
	["11Rnd_45ACP_Mag",0],
	["30Rnd_556x45_Stanag_Tracer_Red",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",500],
	["C_Hatchback_01_F",1000],
	["C_Offroad_01_F",3000],
	["B_G_Offroad_01_F",4000],
	["C_SUV_01_F",5500],
	["C_Van_01_transport_F",8000],
	["C_Hatchback_01_sport_F",10000],
	["C_Van_01_fuel_F",5000],
	["I_Heli_Transport_02_F",15750],
	["C_Kart_01_Blu_F",2500],
	["C_Kart_01_Fuel_F",2500],
	["C_Kart_01_Vrana_F",2500],
	["C_Kart_01_Red_F",2500],
	["C_Van_01_box_F",6000],
	["I_Truck_02_transport_F",15000],
	["I_Truck_02_covered_F",12500],
	["B_Truck_01_transport_F",17500],
	["B_Truck_01_box_F",35750],
	["O_MRAP_02_F",50000],
	["B_Heli_Light_01_F",15000],
	["O_Heli_Light_02_unarmed_F",25000],
	["C_Rubberboat",1000],
	["O_Truck_02_covered_F",1000],
	["C_Boat_Civil_01_F",5000],
	["B_Boat_Transport_01_F",7500],
	["C_Boat_Civil_01_police_F",8500],
	["B_Boat_Armed_01_minigun_F",15000],
	["B_SDV_01_F",30000],
	["B_MRAP_01_F",15000],
	["I_MRAP_03_F",60000],
	["O_Heli_Light_02_F",15000],
	["I_Heli_light_03_unarmed_F",15000],
	["O_Truck_03_covered_F",15000],
	["O_Truck_03_transport_F",20000],
	["I_Truck_02_box_F",25000],
	["O_Truck_03_device_F",60000],
	["O_Heli_Transport_04_F",25000],
	["B_Heli_Transport_03_F",10000],
	["B_APC_Tracked_01_CRV_F",50000],
	["O_Heli_Transport_04_box_F",12000],
	["I_APC_Wheeled_03_cannon_F",100000],
	["O_Heli_Transport_04_F",10000],
	["I_Plane_Fighter_03_CAS_F",20000],
	["O_Plane_CAS_02_F",25000],
	["C_supplyCrate_F",25000],
	["Box_IND_AmmoVeh_F",50000],
    ["B_Slingload_01_Cargo_F",75000],
	["B_Slingload_01_Fuel_F",75000]
];
__CONST__(life_garage_prices,life_garage_prices);

//Autoschieber Verkaufspreise
life_garage_sell =
[
	["B_Quadbike_01_F",750], //Quad
	["C_Hatchback_01_F",3750], // Lomousine
	["C_Offroad_01_F",7500], //Offroad
	["C_Kart_01_Blu_F",3750], //Kart
	["C_Kart_01_Fuel_F",3750],
	["C_Kart_01_Vrana_F",3750],
	["C_Kart_01_Red_F",3750],
	["B_G_Offroad_01_F",11375], //Offroad Rebell
	["C_SUV_01_F",9375], //SUV
	//["C_Van_01_transport_F",10000], //Truck Boxer
	["C_Hatchback_01_sport_F",20000], //Limo Sport
	//["C_Van_01_fuel_F",18750], //Truck Fuel
	["I_Heli_Transport_02_F",1750000], //Mowhawk
	//["C_Van_01_box_F",12500], //Truck Boxer
	//["I_Truck_02_transport_F",35000], //Zamak Transport
	//["B_Truck_01_transport_F",800000], //Hemmt Transport
	//["B_Truck_01_box_F",3250000], //Hemmt Box
	//["B_Truck_01_fuel_F",1700000], //Hemmt Fuel
	["O_MRAP_02_F",625000], //Ifrit
	["B_Heli_Light_01_F",250000], //Hummingbird
	["O_Heli_Light_02_unarmed_F",562500], //Orca
	["C_Rubberboat",1250],
	["C_Boat_Civil_01_F",55000],
	["B_Boat_Transport_01_F",850],
	["C_Boat_Civil_01_police_F",4950],
	["B_SDV_01_F",250000], //U-Boot
	["B_MRAP_01_F",950000], //Hunter. Preis entspricht nicht einem Viertel, weil sonst zu wenig.
	["I_MRAP_03_F",1300000], //Strider. Preis entspricht nicht einem Viertel, weil sonst zu wenig.
	["I_Heli_light_03_unarmed_F",2750000], //Hellcat
	//["O_Truck_03_transport_F",105000], //Tempest Transport
	//["O_Truck_03_covered_F",150000], //Tempest abgedeckt
	//["O_Truck_02_covered_F",45000], //Zamak Abgedeckt
	//["O_Truck_03_device_F",4000000], //Tempest Gerät
	["O_Heli_Transport_04_fuel_F", 3250000], //Taru Treibstoff
	["O_Heli_Transport_04_black_F",2312500], //Taru
	["O_Heli_Light_02_unarmed_F",950000], //Orca
	["B_Heli_Transport_03_unarmed_F",6750000], //Huron
	["I_Plane_Fighter_03_CAS_F",10000000], //Flugzeug buzzard
	["O_Plane_CAS_02_F",12000000],  //Flugzeug Neophron
	["B_Plane_CAS_01_F",18000000],  //Flugzeug Wipeout
	["C_supplyCrate_F",37500],
	["Box_IND_AmmoVeh_F",75000],
    ["B_Slingload_01_Cargo_F",225000],
	["B_Slingload_01_Fuel_F",225000],
	
	["C_Plane_Civil_01_F",140000], //Cessna Teuer
	["O_T_VTOL_02_vehicle_F",3500000],//Y32
	["B_T_VTOL_01_vehicle_F",6500000],//YTOL
	["C_Offroad_02_unarmed_F",3000],
	["I_C_Offroad_02_unarmed_F",3500],
	
	["C_Scooter_Transport_01_F",3750],
	["C_Rubberboat",3750],  					//Schlauchboot CIV
	["B_Lifeboat",15000],					//Rettungsboot WEST
	["O_Lifeboat",30000],					//Rettungsboot EAST
	["C_Boat_Civil_01_F",60000],			//Motorbboot CIV
	["C_Boat_Civil_01_rescue_F",75000],		//Motor-Rettungsboot CIV
	["B_Boat_Transport_01_F",150000],		//Assault Boat WEST
	["O_Boat_Transport_01_F",225000],		//Assault Boat EAST
	["I_Boat_Transport_01_F",300000],		//Assault Boat GUER
	["I_G_Boat_Transport_01_F",600000],		//Assault Boat Tanoa GUER
	["C_Boat_Transport_02_F",1200000],		//RHIB CIV
	["I_C_Boat_Transport_02_F",1200000],	//RHIB GUER
	["B_Boat_Armed_01_minigun_F",1200000],	//Speedboat Minigun WEST
	["O_Boat_Armed_01_hmg_F",2550000],		//Speedboat HMG EAST
	["I_Boat_Armed_01_minigun_F",3750000]	//Speedboat Minigun GUER
	
];
__CONST__(life_garage_sell,life_garage_sell);

//Statusbar Farben
if(playerSide == independent) then
{
profilenamespace setVariable ["GUI_BCG_RGB_R",0];
profilenamespace setVariable ["GUI_BCG_RGB_G",0.2];
profilenamespace setVariable ["GUI_BCG_RGB_B",0];
};

if(playerSide == east) then
{
profilenamespace setVariable ["GUI_BCG_RGB_R",0.5];
profilenamespace setVariable ["GUI_BCG_RGB_G",0];
profilenamespace setVariable ["GUI_BCG_RGB_B",0];
};

if(playerSide == west) then
{
profilenamespace setVariable ["GUI_BCG_RGB_R",0.2];
profilenamespace setVariable ["GUI_BCG_RGB_G",0.5];
profilenamespace setVariable ["GUI_BCG_RGB_B",1];
};

if(playerSide == civilian) then
{
profilenamespace setVariable ["GUI_BCG_RGB_R",0.5];
profilenamespace setVariable ["GUI_BCG_RGB_G",0];
profilenamespace setVariable ["GUI_BCG_RGB_B",0];
};