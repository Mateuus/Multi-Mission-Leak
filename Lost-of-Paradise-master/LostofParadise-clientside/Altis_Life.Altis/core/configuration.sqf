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
life_garage_store = false;
life_session_tries = 0;
mdone = false;
safe = false; 
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_action_gather = false;
life_TankLaster = 1; // Tanklaster
life_fadeSound = false; // Ohrstöpsel
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_mauer = ObjNull;
life_geld = ObjNull;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
//life_respawn_timer = 1; //Scaled in minutes
life_knockout = false;
life_channel_send = true;
life_interrupted = false;
life_respawned = false;
life_pickAxeAllowed = true;
life_removeWanted = false;

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,TRUE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,2500); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

__CONST__(life_enableFatigue,false); //Enable / Disable the ARMA 3 Fatigue System

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
life_eat_doner = 40;

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
__CONST__(life_paycheck_period,5); //Five minutes
life_6cash = 0;
__CONST__(life_impound_car,2500);
__CONST__(life_impound_boat,5000);
__CONST__(life_impound_air,20000);
life_istazed = false;
life_my_gang = ObjNull;

life_2vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atm5cash = 15000;
		life_paycheck = 25000;
	};
	case civilian: 
	{
		life_atm5cash = 50000; //Starting Bank Money
		life_paycheck = 750; //Paycheck Amount
	};
	
	case independent: {
		life_atm5cash = 15000;
		life_paycheck = 15000;
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_G_Offroad_01_armed_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_silberu",
	"life_inv_silberp",
	"life_inv_kerosin",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_zucker",
	"life_inv_bleiu",
	"life_inv_bleigp",
	"life_inv_bleilp",
	"life_inv_rabbit",
	"life_inv_mais",
	"life_inv_salema",
	"life_inv_dixi",
	"life_inv_tisch",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mauer",
	"life_inv_geld",
	"life_inv_sperre",
	"life_inv_scalpel",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_bauma",
	"life_inv_brenn",
	"life_inv_schnaps",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_bier",
	"life_inv_doner",
	"life_inv_donuts",
	"life_inv_pille",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_kidney",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_radioaktivu",
	"life_inv_radioaktivp",
	"life_inv_brennstabu",
	"life_inv_brennstabp",
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
	"life_inv_schmuck",
	"life_inv_badcocaine",
	"life_inv_atomwaffe",
	"life_inv_muschelu",
	"life_inv_muschelp",
	"life_inv_pilsu",
	"life_inv_pilsp",
	"life_inv_krokodile",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_goldu",
	"life_inv_goldp",
	"life_inv_frogu",
	"life_inv_frogp",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_generator",
	"life_inv_matratze",
	"life_inv_lampe",
	"life_inv_zelt",
	"life_inv_wand",
	"life_inv_schranke",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_henraw",
	"life_inv_roosterraw",
	"life_inv_sheepraw",
	"life_inv_goatraw",
	"life_inv_rabbitraw",
	"life_inv_wolfraw",
	"life_inv_wolf1raw"
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_cop_admin2","cop"],
	["license_cop_zoll","cop"],
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
	["license_civ_schmuck","civ"],
	["license_civ_badcocaine","civ"],
	["license_civ_krokodile","civ"],
	["license_civ_radioaktiv","civ"],
	["license_civ_meth","civ"],
	["license_civ_gold","civ"],
	["license_civ_frog","civ"],
	["license_civ_muschel","civ"],
	["license_civ_pils","civ"],
	["license_civ_legierung","civ"],
	["license_civ_bleiglas","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_silber","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_bhc","civ"],
	["license_civ_kerosin","civ"],
	["license_civ_admin1","civ"],
	["license_civ_uran","civ"],
	["license_civ_atomwaffe","civ"],
	["license_civ_donator1","civ"],
	["license_civ_dm","civ"],
	["license_civ_leer","civ"],
	["license_civ_ssg","civ"],
	["license_civ_x","civ"],
	["license_civ_kartell","civ"],
	["license_civ_presse","civ"],
	["license_civ_home","civ"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

//life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",SHEROIN],["heroinp",SHEROIN],["schnaps",SSCHNAPS],["spikeStrip",5000],["lockpick",2500],["geld",20000],["cocaine",SCOCAIN],["cannabis",SGRAS],["marijuana",SGRAS],["atomwaffe",SURANM],["brennstabp",SURAN],["brennstabu",SURAN],["cocainep",SCOCAIN],["methu",SMETH],["methp",SMETH],["frogu",SLSD],["frogp",SLSD],["goldbar",120000],["badcocaine",SBADCOCAIN],["krokodile",SKROKS],["turtle",STURTLE],["blastingcharge",10000],["scalpel",5000],["kidney",SNIERE],["boltcutter",500]];

/*
	Sell / buy arrays
*/
sleep 2;
sell_array = 
[
	["apple",50],
	["bleiu",100],
	["heroinu",SHEROIN],
	["heroinp",SHEROIN],
	["bleigp",SBLEIGLAS],
	["bleilp",SLEGIERUNG],
	["radioaktivu",SRadioaktiv],
	["radioaktivp",SRadioaktiv],
	["salema",45],
	["ornate",40],
	["pille",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["scalpel",0],
	["rabbit",65],
	["oilp",SOIL],
	["goldbarp",75000],
	["turtle",STURTLE],
	["kerosin",SKEROSIN],
	["water",5],
	["mauer",100],
	["lampe",100],
	["wand",100],
	["schranke",100],
	["sperre",100],
	["zelt",100],
	["matratze",100],
	["generator",100],
	["dixi",100],
	["tisch",100],
	["geld",0],
	["coffee",5],
	["bier",150],
	["doner",200],
	["turtlesoup",100],
	["donuts",60],
	["marijuana",SGRAS],
	["cannabis",SGRAS],
	["tbacon",50],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["peach",55],
	["cocaine",SCOCAIN],
	["cocainep",SCOCAIN],
	["badcocaine",SBADCOCAIN],
	["schmuck",SSCHMUCK],
	["atomwaffe",SURANM],
	["krokodile",SKROKS],
	["methu",SMETH],
	["methp",SMETH],
	["goldu",100],
	["goldp",SGOLD],
	["silberu",100],
	["silberp",SSILBER],
	["frogu",SLSD],
	["frogp",SLSD],
	["kidney",SNIERE],
	["diamond",100],
	["diamondc",SDIA],
	["brennstabu",SURAN],
	["brennstabp",SURAN],
	["iron_r",SIRON],
	["muschelu",100],
	["muschelp",SMUSCHEL],
	["schnaps",SSCHNAPS],
	["pilsu",100],
	["pilsp",SBIER],
	["copper_r",SCOPPER],
	["salt_r",SSALT],
	["glass",SGLAS],
	["fuelF",0],
	["spikeStrip",0],
	["cement",SCEMENT],
	["goldbar",120000],
	["blastingcharge",0],
	["boltcutter",0],
	["defusekit",0],
	["storagesmall",0],
	["storagebig",0],
	["henraw",SHENRAW],
	["roosterraw",SROOSTERRAW],
	["sheepraw",SSHEEPRAW],
	["goatraw",SGOATRAW],
	["wolfraw",SWOLFRAW],
	["wolf1raw",SWOLF1RAW],
	["rabbitraw",SRABBITRAW]
];
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["pille",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",100],
	["bier",300],
	["doner",400],
	["turtlesoup",2500],
	["donuts",120],
	["kidney",30000],
	["coffee",10],
	["tbacon",75],
	["methp",20000],
	["frogp",20000],
	["cocainep",20000],
	["marijuana",20000],
	["heroinp",20000],
	["krokodile",20000],
	["badcocaine",20000],
	["lockpick",2500],
	["pickaxe",1200],
	["redgull",150],
	["fuelF",850],
	["mauer",100],
	["geld",20000],
	["tisch",100],
	["matratze",100],
	["lampe",100],
	["zelt",100],
	["dixi",100],
	["wand",100],
	["schranke",100],
	["generator",100],
	["sperre",100],
	["peach",68],
	["spikeStrip",500],
	["scalpel",15000],
	["blastingcharge",350000],
	["boltcutter",250000],
	["defusekit",2500],
	["storagesmall",250000],
	["storagebig",1000000]
];
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
["arifle_TRG20_F",0],
	["arifle_Katiba_F",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["srifle_DMR_01_F",0],
	["arifle_SDAR_F",0],
	["srifle_GM6_F",0],
	["optic_SOS",0],
	["optic_MRCO",0],
	["optic_Arco",0],
	["optic_ACO_grn",0],
	["optic_Holosight",0],
	["acc_flashlight",0],
	["optic_Hamr",0],
	["30Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["30Rnd_556x45_Stanag",0],
	["10Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_mag",0],
	["30Rnd_65x39_caseless_green",0],
	["5Rnd_127x108_Mag",0],
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
	["B_QuadBike_01_F",300],
	["C_Hatchback_01_F",1500],
	["C_Offroad_01_F",2500],
	["B_G_Offroad_01_F",3500],
	["C_SUV_01_F",5250],
	["C_Van_01_transport_F",7890],
	["C_Hatchback_01_sport_F",2350],
	["C_Van_01_fuel_F",4500],
	["I_Heli_Transport_02_F",100000],
	["O_Heli_Transport_04_medevac_F",50000], //Medic
	["O_Heli_Transport_04_F",75000], //ADAC
	["O_Heli_Transport_04_bench_F",75000], // Rebellen
	["O_Heli_Transport_04_fuel_F",70000], // Tanker
	["O_Heli_Transport_04_box_F",70000], // Fracht
	["B_Heli_Transport_03_unarmed_F",100000], //CIV Chainok
	["B_Heli_Transport_03_F",75000], // Cop Chainok
	["C_Kart_01_Blu_F",25000],
	["C_Kart_01_Fuel_F",25000],
	["C_Kart_01_Red_F",25000],
	["C_Kart_01_Vrana_F",25000],
	["C_Kart_01_F",25000],
	["C_Van_01_box_F",9000],
	["I_Truck_02_transport_F",12000],
	["I_Truck_02_covered_F",14500],
	["B_Truck_01_transport_F",25650],
	["B_Truck_01_covered_F",25650],
	["O_Truck_03_repair_F",40000],
	["C_Offroad_02_unarmed_F",4000],
	["B_T_LSV_01_unarmed_F",10000],
	["O_T_LSV_02_unarmed_F",10000],
	["C_Plane_Civil_01_F",30000],
	["B_T_VTOL_01_infantry_F",80000],
	["B_T_VTOL_01_vehicle_F",80000],
	["I_C_Boat_Transport_02_F",5000],
	["C_Scoooter_Transport_01_F",2000],
	["O_Truck_03_device_F",100000],
	["O_Plane_CAS_02_F",100000],
	["O_Truck_03_ammo_F",200000],
	["B_Truck_01_box_F",35000],
	["O_MRAP_02_F",85000],
	["B_Heli_Light_01_F",10000],
	["C_Heli_Light_01_civil_F",10000],
	["B_MRAP_01_hmg_F",50000],
	["O_Heli_Light_02_unarmed_F",65000],
	["C_Rubberboat",400],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",450],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["B_Truck_01_fuel_F",30000],
	["B_Truck_01_ammo_F",30000],
	["B_Truck_01_medical_F",30000],
	["O_Truck_03_fuel_F",30000],
	["O_Truck_03_transport_F",30000],
	["I_Truck_02_fuel_F",15000],
	["I_MRAP_03_F",60000],
	["I_Heli_light_03_unarmed_F",30000],
	["B_Heli_Transport_01_camo_F",10000],
	["B_Heli_Transport_01_F",15000],
	["O_Truck_03_covered_F",40000],
	["B_MRAP_01_F",75000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	["B_Quadbike_01_F",300],
	["C_Kart_01_Blu_F",25000],
	["C_Kart_01_Fuel_F",25000],
	["C_Kart_01_Red_F",25000],
	["C_Kart_01_Vrana_F",25000],
	["C_Kart_01_F",25000],
	["C_Hatchback_01_F",8000],
	["C_Offroad_01_F",10000],
	["B_MRAP_01_F",90000],
	["O_Plane_CAS_02_F",20000000],
	["O_Truck_03_device_F",10000000],
	["C_SUV_01_F",17500],
	["C_Van_01_transport_F",20000],
	["C_Van_01_box_F",30000],
	["C_Van_01_Fuel_F",3000],
	["I_Truck_02_transport_F",80000],
	["I_Truck_02_covered_F",50000],
	["I_Truck_02_fuel_F",90000],
	["B_Truck_01_transport_F",75000],
	["B_Truck_01_covered_F",100000],
	["O_Truck_03_transport_F",150000],
	["O_Truck_03_covered_F",400000],
	["O_Truck_03_repair_F",400000],
	["B_Truck_01_fuel_F",200000],
	["B_Truck_01_box_F",200000],
	["B_Truck_01_ammo_F",125000],
	["O_Truck_03_fuel_F",250000],
	["I_MRAP_03_F",250000],
	["O_MRAP_02_F",250000],
	["C_Hatchback_01_sport_F",50000]
	
];
__CONST__(life_garage_sell,life_garage_sell);


life_team_bhc = [
				// BHC Lead
				"76561198021048398",	//Sebi
				// BHC MEMBER
				"76561198026200398", 	//DerSvenH
				"76561198028103951",	//Razer
				"76561198101890407",	//Moe
				"76561198040822510",	//Oktas
				"76561197993365585",	//Sungo
				"76561198136849812",    //Matti
				"76561197999455942",	//Joshua69
				"76561198026200274",	//Pinklady
				"76561197974711330",	//Klaus
				"76561198108898750",	//Caro
				"76561198015730869"		//Richi
				];