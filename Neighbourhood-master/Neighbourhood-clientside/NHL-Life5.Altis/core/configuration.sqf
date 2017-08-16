#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_nottoofast = 0;
life_action_delay = time;
life_spyglassamount = 0;
life_query_time = time;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_HC_Timer = 0;
cooldown = false;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_erfahrung = 0;  /////LEVEL
life_level = 0;
life_parken = false;
life_erfahrungnext = 0;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_sitzen = false;
life_spikestrip = ObjNull;
life_respawn_timer = 2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
Life_request_timer = false;
life_removeWanted = false;
life_action_gathering = false;
life_fadeSound = false;
life_musikan = false; //jukebox
life_smartphoneTarget = ObjNull;
life_TankLaster = 1;
mdone = false;
safe = false;
life_disable_getIn = false;
life_disable_getOut = false;
life_channel_send = true; //Channel 7
play_LSanfragen = [];
play_fuckyou = true;
life_fatigue = 0.5; //ich bin BI und bin behindert, denn ich habe ein Ausdauersystem mit dem ich alles zerstöre!
life_beladen = false; //für neues FARMING wow so much innovation

//Persistent Saving
__CONST__(life_save_civ,TRUE); //Save weapons for civs?
__CONST__(life_save_yinv,TRUE); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,FALSE); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,5000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,5); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,50000); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
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
life_delivery_in_progress = false;
life_action_in_use = false;
D41_Tankt = false;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,10); //10 minutes
life_cash = 0;
__CONST__(life_impound_car,5000);
__CONST__(life_impound_boat,10000);
__CONST__(life_impound_air,10000);
life_istazed = false;
life_my_gang = ObjNull;

life_bekanntschaften = [];


life_vehicles = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 2500; //Paycheck Amount
	};
	case civilian: 
	{
		life_atmcash = 50000; //Starting Bank Money
		life_paycheck = 1500; //Paycheck Amount
	};
	
	case independent: {
		life_atmcash = 50000;
		life_paycheck = 5500;
	};
};

/*
	Master Array of items?
*/

life_masked = [
"H_Shemag_olive",
"H_Shemag_tan",
"H_Shemag_khk",
"H_Shemag_olive_hs",
"H_ShemagOpen_khk",
"H_ShemagOpen_tan"



];

life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","O_G_Offroad_01_armed_F","I_Heli_light_03_unarmed_F","B_Heli_Transport_01_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..
life_illegal_stuffs =
[	

	//waffen
	"hgun_P07_snds_F",
	"SMG_01_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_TRG20_F",
	"arifle_Mk20C_F",
	"arifle_AK12_F",
	"arifle_AKS_F",
	"srifle_DMR_07_ghex_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_GM6_ghex_F",
	"LMG_03_F",
	"srifle_LRR_tna_F",
	"arifle_MX_khk_F",
	"arifle_MX_SW_khk_F",
	"arifle_MXC_khk_F",
	"arifle_MXM_khk_F",
	"arifle_SPAR_01_khk_F",
	"arifle_SPAR_01_snd_F",
	"arifle_SPAR_01_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"arifle_SPAR_03_blk_F",
	"arifle_MXC_F",
	"arifle_MXM_F",
	"arifle_MX_Black_F",
	"arifle_MX_F",
	"arifle_MXC_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MX_SW_F",
	"arifle_MXM_Black_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"srifle_GM6_camo_F",
	"LMG_Mk200_F",
	"srifle_DMR_01_F",
	"srifle_LRR_F",
	"arifle_AKS_F",
	"srifle_LRR_camo_F",
	"LMG_Zafir_F",
	"srifle_DMR_01_F",
	"srifle_DMR_02_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_04_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_06_camo_F",
	"MMG_01_hex_F",
	"MMG_02_black_F",
	"srifle_EBR_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_03_F",
	"srifle_GM6_F",
	"launch_RPG32_F",
	//mags
	"30Rnd_45ACP_Mag_SMG_01",
	"11Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"30Rnd_556x45_Stanag",
	"30Rnd_65x39_caseless_green",
	"30Rnd_65x39_caseless_mag",
	"200Rnd_65x39_cased_Box",
	"20Rnd_762x51_Mag",
	"7Rnd_408_Mag",
	"5Rnd_127x108_Mag",
	"10Rnd_762x54_Mag",
	"RPG32_F",
	"5Rnd_127x108_Mag",
	"HandGrenade_Stone",
	"30Rnd_762x39_Mag_F",
	"30Rnd_545x39_Mag_F",
	"30Rnd_580x42_Mag_F",
	"200Rnd_556x45_Box_F",
	//schallis
	"muzzle_snds_L",
	//kleidung
	"U_Rangemaster",
	//westen
	"V_TacVest_blk_POLICE",
	"V_PlateCarrier1_blk",
	//hüte
	"H_Beret_Colonel",
	"H_Beret_blk_POLICE",
	"H_Watchcap_sgg",
	"H_Watchcap_blk",
	"H_MilCap_blue",
	"H_Cap_police"
];

life_all_stuffs =
[
	//waffen
	"hgun_P07_snds_F",
	"SMG_01_F",
	"arifle_TRG20_F",
	"arifle_TRG21_F",
	"arifle_AK12_F",
	"arifle_AKS_F",
	"srifle_DMR_07_ghex_F",
	"srifle_DMR_07_blk_F",
	"srifle_DMR_07_hex_F",
	"srifle_GM6_ghex_F",
	"LMG_03_F",
	"srifle_LRR_tna_F",
	"arifle_MX_khk_F",
	"arifle_MX_SW_khk_F",
	"arifle_MXC_khk_F",
	"arifle_MXM_khk_F",
	"arifle_SPAR_01_khk_F",
	"arifle_SPAR_01_snd_F",
	"arifle_SPAR_01_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"arifle_SPAR_03_blk_F",
	"arifle_AKM_F",
	"arifle_TRG20_F",
	"arifle_Mk20C_F",
	"arifle_MXC_F",
	"arifle_MXM_F",
	"arifle_MX_F",
	"arifle_MX_SW_F",
	"arifle_MX_Black_F",
	"arifle_MXC_Black_F",
	"arifle_MX_SW_Black_F",
	"arifle_MXM_Black_F",
	"arifle_Katiba_F",
	"arifle_Katiba_GL_F",
	"srifle_GM6_camo_F",
	"LMG_Mk200_F",
	"srifle_DMR_01_F",
	"srifle_LRR_F",
	"LMG_Zafir_F",
	"srifle_DMR_02_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_06_camo_F",
	"srifle_LRR_camo_F",
	"srifle_DMR_04_F",
	"srifle_DMR_05_blk_F",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_02_camo_F",
	"MMG_01_hex_F",
	"MMG_02_black_F",
	"srifle_EBR_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_03_F",
	"srifle_GM6_F",
	"hgun_Pistol_heavy_01_MRD_F",
	"hgun_Pistol_heavy_02_F",
	"launch_RPG32_F",
	//mags
	"30Rnd_45ACP_Mag_SMG_01",
	"11Rnd_45ACP_Mag",
	"6Rnd_45ACP_Cylinder",
	"30Rnd_556x45_Stanag",
	"30Rnd_65x39_caseless_green",
	"30Rnd_65x39_caseless_mag",
	"200Rnd_65x39_cased_Box",
	"20Rnd_762x51_Mag",
	"RPG32_F",
	"5Rnd_127x108_Mag",
	"7Rnd_408_Mag",
	"5Rnd_127x108_Mag",
	"10Rnd_762x54_Mag",
	"HandGrenade_Stone",
	"30Rnd_762x39_Mag_F",
	"30Rnd_545x39_Mag_F",
	"30Rnd_580x42_Mag_F",
	"200Rnd_556x45_Box_F",
	//schallis
	"muzzle_snds_L",
	//kleidung
	"U_Rangemaster",
	//westen
	"V_TacVest_blk_POLICE",
	"V_PlateCarrier1_blk",
	//hüte
	"H_Beret_Colonel",
	"H_Beret_blk_POLICE",
	"H_Watchcap_sgg",
	"H_Watchcap_blk",
	"H_MilCap_blue",
	"H_Cap_police",
	//legales
	"arifle_SDAR_F",
	"hgun_Rook40_F",
	"hgun_ACPC2_F",
	"hgun_PDW2000_F",
	"optic_ACO_grn_smg",
	"V_Rangemaster_belt",
	"20Rnd_556x45_UW_mag",
	"16Rnd_9x21_Mag",
	"9Rnd_45ACP_Mag",
	"30Rnd_9x21_Mag"
	
];
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
	"life_inv_barrier",
	"life_inv_barricade",
	"life_inv_strahler",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_blastingcharge",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_brenn",
	"life_inv_bauma",
	"life_inv_mais",
	"life_inv_zucker",
	"life_inv_schnaps",
	"life_inv_papier",
	"life_inv_flasche",
	"life_inv_dose",
	"life_inv_stein",
	"life_inv_eisenkugel",
	"life_inv_holzbrett",
	"life_inv_schmuck",
	"life_inv_vase",
	"life_inv_muenze",
	"life_inv_schaufel",
	"life_inv_silberu",
	"life_inv_silberp",
	"life_inv_weinu",
	"life_inv_weinp",
	"life_inv_zigarettenu",
	"life_inv_zigarettenp",
	"life_inv_zigarrenu",
	"life_inv_zigarrenp",
	"life_inv_sprengstoffu",
	"life_inv_sprengstoffp",
	"life_inv_lsdu",
	"life_inv_lsdp",
	"life_inv_methu",
	"life_inv_methp",
	"life_inv_goldu",
	"life_inv_goldp",
	"life_inv_sschmuck",
	"life_inv_gschmuck",
	"life_inv_bauschaufel",
	"life_inv_presslufthammer",
	"life_inv_kerosin",
	"life_inv_zipties",
	"life_inv_baumwolle",
	"life_inv_lauf",
	"life_inv_mantel",
	"life_inv_schulterstuetze",
	"life_inv_verschluss",
	"life_inv_handgriff",
	"life_inv_stahl",
	"life_inv_plastik",
	"life_inv_bplrr",
	"life_inv_bplynx",
	"life_inv_bpakm",
	"life_inv_bpak12",
	"life_inv_bpspar17",
	"life_inv_bpmarten",
	"life_inv_bpzafir",
	"life_inv_zweibein",
	"life_inv_kohle",
	"life_inv_bpmk1",
	"life_inv_bpmk14",
	"life_inv_bpmk18",
	"life_inv_lagerkiste",
	"life_inv_kies",
	"life_inv_xtc",
	"life_inv_sense",
	"life_inv_margarita",
	"life_inv_calzone",
	"life_inv_usb",
	"life_inv_parkticket",
	"life_inv_megaphone"
	
	
];

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	//cop lizenzen
	["license_cop_air","cop"],
	["license_cop_air2","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_cop_adf","cop"],
	["license_cop_mrsf","cop"],
	
	
	//med lizenzen
	["license_med_air","med"],
	
	//civ lizenzen 
	["license_civ_driver","civ"],
	["license_civ_truck","civ"],
	["license_civ_air","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_dive","civ"],	
	["license_civ_gun","civ"],
	["license_civ_dutyfree","civ"],
	["license_civ_luftfracht","civ"],
	["license_civ_fracht","civ"],
	["license_civ_aufenthalt","civ"],
	["license_civ_arbeitsgenehmigung","civ"],
	["license_civ_muell","civ"],
	
	["license_civ_rebel","civ"],
	["license_civ_bm","civ"],
	//rohstoffe legal
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_oil","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_civ_arch","civ"],
	["license_civ_silber","civ"],
	["license_civ_gold","civ"],
	["license_civ_sschmuck","civ"],
	["license_civ_gschmuck","civ"],
	["license_civ_zigaretten","civ"],
	["license_civ_wein","civ"],
	["license_civ_stahl","civ"],
	["license_civ_plastik","civ"],
	
	//lizenzen illegal
	["license_civ_coke","civ"],
	["license_civ_meth","civ"],
	["license_civ_sprengstoff","civ"],
	["license_civ_zigarren","civ"],
	["license_civ_lsd","civ"],
	["license_civ_sense","civ"],
	//firma
	["license_civ_whinc","civ"],
	["license_civ_lotto","civ"],
	["license_civ_mrsf","civ"],
	["license_civ_pizza","civ"],
	["license_civ_cc","civ"],
	//waffen bauanleitung
	["license_civ_zafir","civ"],
	["license_civ_marten","civ"],
	["license_civ_lynx","civ"],
	["license_civ_lrr","civ"],
	["license_civ_mk1","civ"],
	["license_civ_mk14","civ"],
	["license_civ_akm","civ"],
	["license_civ_spar17","civ"],
	["license_civ_ak12","civ"],
	["license_civ_mk18","civ"]
	
	
	
	
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["marijuana",2000],["cannabis",1000],["turtle",10000],["blastingcharge",10000],["boltcutter",5000],["schnaps",5000],["methu",2400],["lsdu",2400],["sprengstoffu",3000],["zigarrenu",400],["methp",4000],["sprengstoffp",6000],["lsdp",3100],["zigarrenp",3200],["goldbar",45000],["xtc",1400],["sense",9000]];


/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",50],
	["heroinu",1850],
	["heroinp",2650],
	["salema",45],
	["ornate",40],
	["mackerel",175],
	["tuna",700],
	["mullet",250],
	["catshark",300],
	["rabbit",65],
	["oilp",3200],
	["turtle",3000],
	["water",5],
	["coffee",5],
	["turtlesoup",1000],
	["donuts",60],
	["marijuana",2350],
	["tbacon",25],
	["lockpick",75],
	["pickaxe",10],
	["redgull",200],
	["peach",55],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",100],
	["spikeStrip",100],
	["barrier",100],
	["barricade",100],
	["strahler",100],
	["cement",1950],
	["goldbar",45000],
	["bauma",100],
	["mais",100],
	["zucker",100],
	["brenn",100],
	["schnaps",100],
	["schaufel",100],
	["vase",1450],
	["muenze",2950],
	["schmuck",9800],
	["silberu",400],
	["silberp",400],
	["zigarettenu",400],
	["zigarettenp",400],
	["weinu",400],
	["weinp",400],
	["sprengstoffu",400],
	["sprengstoffp",400],
	["zigarrenu",400],
	["zigarrenp",400],
	["lsdu",400],
	["lsdp",400],
	["goldu",400],
	["goldp",400],
	["sschmuck",400],
	["gschmuck",400],
	["methu",400],
    ["methp",4000],
	["bauschaufel",100],
	["kerosin",400],
	["zipties",400],
	["baumwolle",400],
	["stahl",2400],
	["plastik",1400],
	["kohle",400],
	["kies",400],
	["xtc",1400],
	["sense",6400]
	
];


buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",50],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["peach",68],
	["spikeStrip",1250],
	["barrier",1250],
	["barricade",1250],
	["strahler",1250],
	["blastingcharge",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",500000],
	["storagebig",1000000],
	["lagerkiste",2000000],
	["schaufel",1200],
	["margarita",50],
	["calzone",50],
	["megaphone",5000]

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
	["NVGoggles",0],
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
	//Autos
	["B_QuadBike_01_F",550],
	["C_Hatchback_01_F",1000],
	["C_Offroad_01_F", 2500],
	["B_G_Offroad_01_F",2500],
	["C_SUV_01_F",3000],
	["C_Hatchback_01_sport_F",10000],
	
	//Lkws
	["C_Van_01_transport_F",5000],
	["C_Van_01_fuel_F",4500],
	["C_Van_01_box_F",6000],
	
	["I_Truck_02_transport_F",7500],
	["I_Truck_02_covered_F",10000],
	
	["B_Truck_01_transport_F",12000],
	["B_Truck_01_covered_F", 14000],
	["B_Truck_01_ammo_F", 14000],
	["B_Truck_01_medical_F", 200],
	["B_Truck_01_mover_F", 200],
	["B_Truck_01_box_F", 20000],
	
	["O_Truck_03_device_F", 20000],
	["O_Truck_03_transport_F", 12000],
	["O_Truck_03_covered_F", 14000],
	["O_Truck_03_fuel_F", 15000],
	["O_Truck_03_ammo_F", 20000],
	
	["I_Heli_Transport_02_F",20000],
	["B_Heli_Light_01_F",10000],
	["O_Heli_Light_02_unarmed_F",30000],
	["C_Rubberboat",4000],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",4500],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["O_MRAP_02_F",50000],
	["I_MRAP_03_F",50000],
	["B_MRAP_01_F",50000]
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
	//Autos
	["B_QuadBike_01_F",2500],
	["C_Hatchback_01_F",5000],
	["C_Offroad_01_F", 25000],
	["B_G_Offroad_01_F",25000],
	["C_SUV_01_F",37500],
	["C_Hatchback_01_sport_F",175000],
	
	//Lkws
	["C_Van_01_transport_F",50000],
	["C_Van_01_fuel_F",75000],
	["C_Van_01_box_F",75000],
	
	["I_Truck_02_transport_F",150000],
	["I_Truck_02_covered_F",200000],
	
	["B_Truck_01_transport_F",750000],
	["B_Truck_01_covered_F", 1250000],
	["B_Truck_01_ammo_F", 1700000],
	["B_Truck_01_medical_F", 200],
	["B_Truck_01_mover_F", 200],
	["B_Truck_01_box_F", 2250000],
	
	["O_Truck_03_device_F", 3000000],
	["O_Truck_03_transport_F", 900000],
	["O_Truck_03_covered_F", 1450000],
	["O_Truck_03_fuel_F", 1250000],
	["O_Truck_03_ammo_F", 2500000],
	
	["I_Heli_Transport_02_F",20000],
	["B_Heli_Light_01_F",300000],
	["O_Heli_Light_02_unarmed_F",30000],
	["C_Rubberboat",4000],
	["C_Boat_Civil_01_F",4500],
	["B_Boat_Transport_01_F",4500],
	["C_Boat_Civil_01_police_F",3500],
	["B_Boat_Armed_01_minigun_F",16500],
	["B_SDV_01_F",25000],
	["O_MRAP_02_F",20000],
	["I_MRAP_03_F",20000],
	["B_MRAP_01_F",20000]
];
__CONST__(life_garage_sell,life_garage_sell);
Amarok_RestrictSling = 
["I_Truck_02_transport_F",
"I_Truck_02_covered_F",
"B_Truck_01_transport_F",
"B_Truck_01_covered_F",
"B_Truck_01_box_F",
"O_Truck_02_covered_F",
"O_Truck_03_device_F"
];__CONST__(Amarok_RestrictSling,Amarok_RestrictSling);