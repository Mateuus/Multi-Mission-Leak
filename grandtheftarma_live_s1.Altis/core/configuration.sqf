GTA_masks = [
  ["G_Balaclava_blk", "G_Balaclava_combat", "G_Balaclava_lowprofile", "G_Balaclava_oli", "G_Bandanna_aviator", "G_Bandanna_beast", "G_Bandanna_blk", "G_Bandanna_khk", "G_Bandanna_oli", "G_Bandanna_shades", "G_Bandanna_sport", "G_Bandanna_tan"],
  ["H_Shemag_khk", "H_Shemag_tan", "H_Shemag_olive", "H_Shemag_olive_hs", "H_ShemagOpen_khk", "H_ShemagOpen_tan"],
  ["U_B_GhillieSuit", "U_O_GhillieSuit", "U_I_GhillieSuit"]
];


#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_action_delay = time;
life_trunk_vehicle = objNull;
life_garage_store = false;
life_net_dropped = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_bail_paid = false;
life_impound_inuse = false;
GTA_actionLock = false;
life_spikestrip = objNull;
life_knockout = false;
GTA_actionInterrupt = false;
life_removeWanted = false;
life_drink = 0;  //Added -CODON -Keyword:EDIT
life_casino_slotmachine = [];

life_loadedTalents = false;

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

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
life_maxWeight = 4; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 4; //Static variable representing the players max carrying weight on start.
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
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_gta_arrested = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_action_gather = false;
__CONST__(life_paycheck_period,10); //Five minutes
GTA_money_cash = 0;
__CONST__(life_impound_car,350);
__CONST__(life_impound_boat,250);
__CONST__(life_impound_air,850);
life_action_robshops = false;
life_my_gang = ObjNull;

life_vehicles = [];
bank_robber = [];
switch playerSide do {
  case west: {
    GTA_money_bank = 125000;
    life_paycheck = 10000;
  };
  case civilian: {
    GTA_money_bank = 125000;
    life_paycheck = 1500;
  };
  case independent: {
    GTA_money_bank = 125000;
    life_paycheck = 5000;
  };
};

life_vShop_rentalOnly = ["B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F"];

__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = [
  "life_inv_present",
  "life_inv_team_red",
  "life_inv_team_blue",
  "life_inv_cream",

  "life_inv_pickaxe",

  "life_inv_ration_small",
  "life_inv_ration_big",
  "life_inv_redgull",
  "life_inv_water",
  "life_inv_coffee",
  "life_inv_donuts",
  "life_inv_rabbit",
  "life_inv_tobacco",
  "life_inv_salad",
  "life_inv_bubblegum",
  "life_inv_kitkat",
  "life_inv_tbacon",
  "life_inv_turtlesoup",

  "life_inv_kfc_popcorn",
  "life_inv_kfc_wings",
  "life_inv_kfc_bucket",
  "life_inv_kfc_pepsi",

  "life_inv_kebab",
  "life_inv_tea",

  "life_inv_greggs_sausageroll",
  "life_inv_greggs_pasty",
  "life_inv_greggs_steakbake",
  "life_inv_greggs_sausagebean",
  "life_inv_greggs_cheesebacon",

  "life_inv_apple",
  "life_inv_peach",
  "life_inv_watermelon",

  "life_inv_underwatercharge",
  "life_inv_blastingcharge",
  "life_inv_boltcutter",
  "life_inv_defusekit",
  "life_inv_lockpick",
  "life_inv_snapgun",
  "life_inv_spikeStrip",
  "life_inv_zipties",
  "life_inv_fuelE",
  "life_inv_fuelF",
  "life_inv_storagesmall",
  "life_inv_storagebig",
  "life_inv_drill",

  "life_inv_heroin_p",
  "life_inv_heroin_u",
  "life_inv_cannabis",
  "life_inv_marijuana",
  "life_inv_cocaine_u",
  "life_inv_cocaine_p",
  "life_inv_oil_u",
  "life_inv_oil_p",
  "life_inv_goldbar",
  "life_inv_moneybag",

  "life_inv_cmeth_u_1",
  "life_inv_cmeth_u_2",
  "life_inv_cmeth_u_3",
  "life_inv_cmeth_p",

  "life_inv_copper_u",
  "life_inv_copper_p",
  "life_inv_iron_u",
  "life_inv_iron_p",
  "life_inv_silver_u",
  "life_inv_silver_p",
  "life_inv_sand",
  "life_inv_glass",
  "life_inv_rock",
  "life_inv_cement",
  "life_inv_salt_u",
  "life_inv_salt_p",
  "life_inv_diamond_u",
  "life_inv_diamond_p",
  "life_inv_goldbarp",
  "life_inv_sugar_u",
  "life_inv_sugar_p",
  "life_inv_rice_u",
  "life_inv_rice_p",

  "life_inv_axe",
  "life_inv_wood_u",
  "life_inv_wood_p",

  "life_inv_naturalgas",
  "life_inv_propane",

  "life_inv_mackerel",
  "life_inv_mullet",
  "life_inv_ornate",
  "life_inv_catshark",
  "life_inv_salema",
  "life_inv_tuna",
  "life_inv_turtle",

  "life_inv_mash",
  "life_inv_yeast",
  "life_inv_rye",
  "life_inv_hops",

  "life_inv_bottles",
  "life_inv_cornmeal",

  "life_inv_beerp",
  "life_inv_bottledbeer",
  "life_inv_moonshine",
  "life_inv_bottledshine",
  "life_inv_whiskey",
  "life_inv_bottledwhiskey",

  "life_inv_roadcone",
  "life_inv_roadcone_l",
  "life_inv_bargate",
  "life_inv_safetybarrier",
  "life_inv_plasticbarrier_l",
  "life_inv_plasticbarrier_m",
  "life_inv_cargohouse_g",
  "life_inv_cargohouse_b",
  "life_inv_cargopost_g",
  "life_inv_cargopost_b",
  "life_inv_cargohq_g",
  "life_inv_cargohq_b",
  "life_inv_cargotower_g",
  "life_inv_cargotower_b",
  "life_inv_portablelight_s",
  "life_inv_portablelight_d",
  "life_inv_roadsign",
  "life_inv_tapebarrier",

  "life_inv_streetlamp",
  "life_inv_concretebarrier_s",
  "life_inv_concretebarrier_l",

  "life_inv_target1",
  "life_inv_target1_pop",
  "life_inv_target2",
  "life_inv_target2_pop",
  "life_inv_target3",
  "life_inv_target3_pop",
  "life_inv_target4",
  "life_inv_target4_pop",
  "life_inv_shoot_house_stand",
  "life_inv_shoot_house_crouch",
  "life_inv_shoot_house_prone"
];

{missionNamespace setVariable [_x, 0]} forEach life_inv_items;

life_licenses = [
  ["license_civ_home", "civ"],
  ["license_civ_driver", "civ"],
  ["license_civ_truck", "civ"],
  ["license_civ_boat", "civ"],
  ["license_civ_dive", "civ"],
  ["license_civ_air", "civ"],
  ["license_civ_jet", "civ"],
  ["license_civ_event", "civ"],
  ["license_civ_press", "civ"],
  ["license_civ_taxi", "civ"],

  ["license_civ_gun", "civ"],
  ["license_civ_rebel", "civ"],
  ["license_civ_advrebel", "civ"],
  ["license_civ_bomb", "civ"],

  ["license_civ_heroin", "civ"],
  ["license_civ_marijuana", "civ"],
  ["license_civ_coke", "civ"],
  ["license_civ_oil", "civ"],
  ["license_civ_cmeth", "civ"],

  ["license_civ_copper", "civ"],
  ["license_civ_iron", "civ"],
  ["license_civ_silver", "civ"],
  ["license_civ_sugar", "civ"],
  ["license_civ_rice", "civ"],
  ["license_civ_sand", "civ"],
  ["license_civ_cement", "civ"],
  ["license_civ_salt", "civ"],
  ["license_civ_diamond", "civ"],
  ["license_civ_wood", "civ"],
  ["license_civ_gas", "civ"],

  ["license_civ_beer", "civ"],
  ["license_civ_whiskey", "civ"],
  ["license_civ_bootleg", "civ"],

  ["license_cop_sru", "cop"],
  ["license_cop_npas", "cop"],
  ["license_cop_dmt", "cop"],
  ["license_cop_mpu", "cop"],

  ["license_cop_kav", "cop"],
  ["license_cop_pyr", "cop"],
  ["license_cop_ath", "cop"],
  ["license_cop_rpu", "cop"]
];

//Setup License Variables
{missionNamespace setVariable [_x select 0, false]} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];

life_illegal_items = [
  ["goldbar", 150000],
  ["heroin_u", 1875],
  ["heroin_p", 3750],
  ["cocaine_u", 2500],
  ["cocaine_p", 5000],
  ["cannabis", 1750],
  ["marijuana", 3500],
  ["turtle", 7000],
  ["blastingcharge", 125000],
  ["boltcutter", 50000],
  ["drill", 50000],
  ["moonshine", 3000],
  ["bottledshine", 12500],
  ["mash", 5000],
  ["oil_u", 5500],
  ["oil_p", 9500],
  ["cmeth_u_1", 5500],
  ["cmeth_u_2", 5500],
  ["cmeth_u_3", 5500],
  ["cmeth_p", 9500],
  ["zipties", 10000],
  ["moneybag", 50000]
];

sell_array = [
  ["apple", 50],
  //["bargate", 0],
  //["beerp", 0],
  //["blastingcharge", 100000],
  ["boltcutter", 0],
  ["bottledbeer", 4250],
  ["bottledshine", 14000],
  ["bottledwhiskey", 5500],
  //["bottles", 50],
  //["bubblegum", 5],
  //["cannabis", 0],
  //["cargohouse_b", 0],
  //["cargohouse_g", 0],
  //["cargohq_b", 0],
  //["cargohq_g", 0],
  //["cargopost_b", 0],
  //["cargopost_g", 0],
  //["cargotower_b", 0],
  //["cargotower_g", 0],
  ["catshark", 3000],
  ["cement", 2600],
  ["cmeth_p", 14000],
  ["cocaine_p", 13000],
  //["coffee", 50],
  ["copper_p", 2200],
  ["cornmeal", 50],
  //["defusekit", 0],
  ["diamond_p", 4700],
  //["donuts", 75],
  ["drill", 0],
  ["fuelE", 0],
  ["fuelF", 0],
  ["glass", 4000],
  //["goldbar", 260000],
  ["goldbarp", 50000],
  ["greggs_cheesebacon", 0],
  ["greggs_pasty", 0],
  ["greggs_sausagebean", 0],
  ["greggs_sausageroll", 0],
  ["greggs_steakbake", 0],
  ["heroin_p", 9000],
  ["iron_p", 2700],
  ["lockpick", 0],
  ["snapgun", 0],
  ["mackerel", 1700],
  ["marijuana", 7800],
  ["mash", 0],
  ["moneybag", 250000],
  //["moonshine", 3000],
  ["mullet", 2500],
  ["oil_p", 15000],
  ["ornate", 500],
  ["peach", 50],
  ["pickaxe", 0],
  ["axe", 0],
  //["plasticbarrier_l", 0],
  //["plasticbarrier_m", 0],
  //["portablelight_d", 0],
  //["portablelight_s", 0],
  //["present", 0],
  ["rabbit", 0],
  ["ration_big", 0],
  ["ration_small", 0],
  ["redgull", 0],
  ["rice_p", 2200],
  //["roadcone", 0],
  //["roadcone_l", 0],
  //["roadsign", 0],
  //["safetybarrier", 0],
  //["salad", 25],
  ["salema", 500],
  ["salt_p", 4000],
  ["silver_p", 4200],
  ["spikeStrip", 0],
  ["storagebig", 0],
  ["storagesmall", 0],
  ["sugar_p", 2100],
  ["tbacon", 0],
  //["team_blue", 0],
  //["team_red", 0],
  //["tobacco", 20],
  ["tuna", 7000],
  ["turtle", 15000],
  //["turtlesoup", 1000],
  //["underwatercharge", 100000],
  ["water", 0],
  ["watermelon", 150],
  ["zipties", 0],
  ["wood_p", 3800],
  ["propane", 5500]
];
__CONST__(sell_array,sell_array);

buy_array = [
  ["apple", 70],
  ["cream", 0],
  //["beerp", 0],
  ["blastingcharge", 500000],
  ["boltcutter", 250000],
  ["drill", 250000],
  ["bottledbeer", 8000],
  ["bottledshine", 15000],
  ["bottledwhiskey", 10000],
  ["bottles", 75],
  //["cannabis", 0],
  ["catshark", 3000],
  //["cement", 0],
  ["coffee", 40],
  //["cocaine_u", 0],
  //["cocaine_p", 0],
  //["copper_u", 0],
  //["copper_p", 0],
  ["cornmeal", 200],
  //["defusekit", 0],
  //["diamond_u", 0],
  //["diamond_p", 0],
  ["donuts", 60],
  //["fishingpoles", 0],
  //["fuelE", 0],
  ["fuelF", 850],
  //["glass", 0],
  //["goldbar", 0],
  //["goldbarp", 0],
  //["heroin_p", 0],
  //["heroin_u", 0],
  //["hops", 0],
  //["ironore", 0],
  //["iron_r", 0],
  ["lockpick", 1500],
  ["snapgun", 30000],
  ["snapgun", 0],
  ["mackerel", 2000],
  //["marijuana", 0],
  //["mash", 0],
  //["moonshine", 5000],
  ["mullet", 2500],
  //["oi_p", 0],
  //["oil_u", 0],
  ["ornate", 750],
  ["peach", 70],
  ["pickaxe", 1500],
  ["axe", 1500],
  ["rabbit", 100],
  ["redgull", 1500],
  //["rock", 0],
  //["rye", 0],
  ["salema", 1000],
  //["salt_u", 0],
  //["salt_p", 100],
  //["sand", 100],
  //["silver_u", 100],
  //["silver_p", 100],
  ["spikeStrip", 20000],
  ["storagebig", 1000000],
  ["storagesmall", 500000],
  ["tbacon", 90],
  ["cmeth_u_1", 500],
  ["cmeth_u_2", 500],
  ["tuna", 7000],
  //["turtle", 0],
  //["turtlesoup", 2500],
  ["underwatercharge", 500000],
  ["water", 30],
  //["whiskey", 0],
  //["yeast", 0],
  ["watermelon", 200],
  ["salad", 50],
  ["tobacco", 100],
  ["bubblegum", 0],
  ["kitkat", 0],
  ["ration_small", 0],
  ["ration_big", 0],
  ["kfc_popcorn", 15],
  ["kfc_wings", 20],
  ["kfc_bucket", 50],
  ["kfc_pepsi", 10],
  ["kebab", 50],
  ["tea", 10],
  ["greggs_sausageroll", 50],
  ["greggs_pasty", 60],
  ["greggs_steakbake", 60],
  ["greggs_sausagebean", 70],
  ["greggs_cheesebacon", 70],
  ["zipties", 10000],
  ["roadcone", 0],
  ["roadcone_l", 0],
  ["bargate", 0],
  ["safetybarrier", 0],
  ["plasticbarrier_l", 0],
  ["plasticbarrier_m", 0],
  ["cargohouse_g", 0],
  ["cargohouse_b", 0],
  ["cargopost_g", 0],
  ["cargopost_b", 0],
  ["cargohq_g", 0],
  ["cargohq_b", 0],
  ["cargotower_g", 0],
  ["cargotower_b", 0],
  ["portablelight_s", 0],
  ["portablelight_d", 0],
  ["present", 0],
  ["team_red", 0],
  ["team_blue", 0],
  ["roadsign", 0],
  ["streetlamp", 0],
  ["concretebarrier_s", 0],
  ["concretebarrier_l", 0],
  ["tapebarrier", 0],
  ["target1", 0],
  ["target1_pop", 0],
  ["target2", 0],
  ["target2_pop", 0],
  ["target3", 0],
  ["target3_pop", 0],
  ["target4", 0],
  ["target4_pop", 0],
  ["shoot_house_stand", 0],
  ["shoot_house_crouch", 0],
  ["shoot_house_prone", 0]
];

__CONST__(buy_array,buy_array);

life_weapon_shop_array = [
  ["arifle_sdar_F", 7500],
  ["hgun_P07_snds_F", 650],
  ["hgun_P07_F", 1500],
  ["ItemGPS", 45],
  ["ToolKit", 75],
  ["FirstAidKit", 65],
  ["Medikit", 450],
  ["NVGoggles", 980],
  ["16Rnd_9x21_Mag", 15],
  ["20Rnd_556x45_UW_mag", 35],
  ["ItemMap", 35],
  ["ItemCompass", 25],
  ["Chemlight_blue", 50],
  ["Chemlight_yellow", 50],
  ["Chemlight_green", 50],
  ["Chemlight_red", 50],
  ["hgun_Rook40_F", 500],
  ["arifle_Katiba_F", 5000],
  ["30Rnd_556x45_Stanag", 65],
  ["20Rnd_762x51_Mag", 85],
  ["30Rnd_65x39_caseless_green", 50],
  ["DemoCharge_Remote_Mag", 7500],
  ["SLAMDirectionalMine_Wire_Mag", 2575],
  ["optic_ACO_grn", 250],
  ["acc_flashlight", 100],
  ["srifle_EBR_F", 15000],
  ["arifle_TRG21_F", 3500],
  ["optic_MRCO", 5000],
  ["optic_Aco", 850],
  ["arifle_MX_F", 7500],
  ["arifle_MXC_F", 5000],
  ["arifle_MXM_F", 8500],
  ["MineDetector", 500],
  ["optic_Holosight", 275],
  ["acc_pointer_IR", 175],
  ["arifle_TRG20_F", 2500],
  ["SMG_01_F", 1500],
  ["arifle_Mk20C_F", 4500],
  ["30Rnd_45ACP_Mag_SMG_01", 60],
  ["30Rnd_9x21_Mag", 30]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices = [
  //--- Gokarts
  ["C_Kart_01_Blu_F", 30000],
  ["C_Kart_01_Fuel_F", 30000],
  ["C_Kart_01_Red_F", 30000],
  ["C_Kart_01_Vrana_F", 30000],

  //--- Cars
  ["B_QuadBike_01_F", 250],
  ["C_Hatchback_01_F", 1000],
  ["C_Offroad_01_F", 2000],
  ["B_G_Offroad_01_F", 2000],
  ["C_SUV_01_F", 3000],
  ["C_Hatchback_01_sport_F", 10000],

  //--- Trucks
  ["I_Truck_02_transport_F", 12000],         //--- Zamak
  ["I_Truck_02_covered_F", 15000],           //--- Zamak Covered
  ["O_Truck_03_transport_F", 15000],         //--- Tempest
  ["O_Truck_03_covered_F", 30000],           //--- Tempest Covered
  ["O_Truck_03_repair_F", 75000],            //--- Tempest Repair
  ["O_Truck_03_ammo_F", 75000],              //--- Tempest Ammo
  ["O_Truck_03_device_F", 50000],            //--- Tempest Device
  ["B_Truck_01_ammo_F", 45000],             //--- HEMTT Ammo
  ["B_Truck_01_box_F", 75000],              //--- HEMTT Box

  //--- Fuel trucks
  ["I_Truck_02_fuel_F", 40000],              //--- Zamak Fuel
  ["O_Truck_03_fuel_F", 75000],              //--- HEMTT Fuel

  //--- Boats
  //["C_Rubberboat", 2000],
  //["C_Boat_Civil_01_F", 5000],
  ["B_SDV_01_F", 100000],

  //--- Helicopters
  ["C_Heli_Light_01_civil_F", 0],            //--- M900
  ["B_Heli_Light_01_F", 0],                  //--- Hummingbird
  ["O_Heli_Light_02_unarmed_F", 0],          //--- Orca
  ["I_Heli_Transport_02_F", 0],              //--- Mohawk
  ["B_Heli_Transport_03_unarmed_F", 0],      //--- Huron
  ["I_Heli_light_03_unarmed_F", 0],          //--- Hellcat
  ["O_Heli_Attack_02_black_F", 0],           //--- Kajman
  ["B_Heli_Attack_01_F", 0],                 //--- Blackfoot
  ["I_Heli_light_03_F", 0],                  //--- Armed Hellcat
  ["O_Heli_Transport_04_F", 0],              //--- Taru Variants
  ["O_Heli_Transport_04_bench_F", 0],
  ["O_Heli_Transport_04_covered_F", 0],
  ["O_Heli_Transport_04_box_F", 0],
  ["B_Heli_Transport_01_F", 0],              //--- Ghosthawk
  ["O_Heli_Attack_02_F", 0],                  //--- Kajman
  ["B_Heli_Attack_01_F", 0],                  //--- Blackfoot

  //--- Jets
  ["O_Plane_CAS_02_F", 0],                    //--- Neophron
  ["B_Plane_CAS_01_F", 0],                    //--- Wipeout
  ["I_Plane_Fighter_03_AA_F", 0],             //--- Buzzard (AA)
  ["I_Plane_Fighter_03_CAS_F", 0],            //--- Buzzard (CAS)

  //--- MRAPs and special shiiiizle
  ["B_MRAP_01_F", 50000],                    //--- Hunter
  ["O_MRAP_02_F", 50000],                    //--- Ifrit
  ["I_MRAP_03_F", 50000],                    //--- Strider
  ["B_G_Offroad_01_armed_F", 200000]         //--- Armed Offroad
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell = [
  //--- Karts
  ["C_Kart_01_Blu_F", 40000],
  ["C_Kart_01_Fuel_F", 40000],
  ["C_Kart_01_Red_F", 40000],
  ["C_Kart_01_Vrana_F", 40000],

  //--- Cars
  ["C_Offroad_01_F", 4000],
  ["B_G_Offroad_01_F", 4000],

  //--- Trucks
  ["I_Truck_02_transport_F", 35000],            //--- Zamak
  ["I_Truck_02_covered_F", 45000],              //--- Zamak Covered
  ["O_Truck_03_transport_F", 110000],           //--- Tempest
  ["O_Truck_03_covered_F", 140000],	            //--- Tempest Covered
  ["O_Truck_03_repair_F", 200000],              //--- Tempest Repair
  ["O_Truck_03_ammo_F", 200000],                //--- Tempest Ammo
  ["O_Truck_03_device_F", 750000],              //--- Tempest Device
  ["B_Truck_01_ammo_F", 210000],                //--- HEMTT Ammo
  ["B_Truck_01_box_F", 325000],                 //--- HEMTT Box

  //--- Fuel trucks
  ["I_Truck_02_fuel_F", 250000],                //--- Zamak Fuel
  ["O_Truck_03_fuel_F", 500000],                //--- HEMTT Fuel

  //--- Boats
  ["C_Rubberboat", 1700],
  ["C_Boat_Civil_01_F", 8000],
  ["B_SDV_01_F", 500000],

  //--- Helicopters
  ["O_Heli_Light_02_unarmed_F", 250000],        //--- Orca
  ["I_Heli_Transport_02_F", 750000],            //--- Mohawk
  ["B_Heli_Transport_03_unarmed_F", 1350000],   //--- Huron
  ["I_Heli_light_03_unarmed_F", 930000],        //--- Hellcat
  ["O_Heli_Attack_02_black_F", 15000000],       //--- Kajman
  ["B_Heli_Attack_01_F", 5000000],              //--- Blackfoot
  ["I_Heli_light_03_F", 10000000],              //--- Armed Hellcat
  ["O_Heli_Transport_04_F", 500000],            //--- Taru Variants
  ["O_Heli_Transport_04_bench_F", 666667],
  ["O_Heli_Transport_04_covered_F", 1400000],
  ["O_Heli_Transport_04_box_F", 2000000],
  ["B_Heli_Transport_01_F", 2000000],           //--- Ghosthawk

  //--- CAS Helicopters
  ["O_Heli_Attack_02_F", 2000000],              //--- Kajman
  ["B_Heli_Attack_01_F", 2000000],              //--- Blackfoot

  //--- Boats
  ["O_Boat_Armed_01_hmg_F", 2000000],

  //--- MRAP
  ["B_MRAP_01_F", 750000],                      //--- Hunter
  ["O_MRAP_02_F", 750000],                      //--- Ifrit
  ["I_MRAP_03_F", 750000],                      //--- Strider

  //--- Armed Offroad
  ["B_G_Offroad_01_armed_F", 250000],

  //--- Medical Trucks
  ["I_Truck_02_medical_F", 500000],
  ["O_Truck_03_medical_F", 500000],
  ["B_Truck_01_medical_F", 500000],

  //--- Slingload Cargo Container
  ["B_Truck_01_medical_F", 500000]
];
__CONST__(life_garage_sell,life_garage_sell);
