#define VITEMMACRO(NAME,DISPLAYNAME,VARNAME,WEIGHT,BUYPRICE,SELLPRICE,ILLEGAL,EDIBLE,ICON) class NAME { \
		variable = VARNAME; \
		weight = WEIGHT; \
		displayName = DISPLAYNAME; \
		buyPrice = BUYPRICE; \
		sellPrice = SELLPRICE; \
		illegal = ILLEGAL; \
		edible = EDIBLE; \
		icon = ICON; \
	};
	
#define LICENSEMACRO(NAME,DISPLAYNAME,VARNAME,PRICE,ILLEGAL,SIDE) class NAME { \
		variable = VARNAME; \
		displayName = DISPLAYNAME; \
		price = PRICE; \
		illegal = ILLEGAL; \
		side = SIDE; \
	};

#define true 1
#define false 0
#include "Config_Clothing.hpp"
#include "Config_Shops.hpp"


/*
	Master settings for various features and functionality	
*/
class Life_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = true; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 10000; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 5; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 10000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = true; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 24; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
	total_maxWeightT = 24;  //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes
	
	/* Impound Variables */
	impound_car = 1350; //Price for impounding cars
	impound_boat = 1250; //Price for impounding boats
	impound_air = 1850; //Price for impounding helicopters / planes
	impound_tank = 1850;
	
	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = {"RHS_Mi24V_AT_vdv","B_G_Offroad_01_armed_F", "rhs_btr80a_msv", "I_Plane_Fighter_03_CAS_F", "O_Plane_CAS_02_F", "B_Plane_CAS_01_F", "RHS_A10","RHS_Su25SM_vvs", "B_Heli_Light_01_armed_F", "rhs_prp3_vdv", "rhs_btr80_msv","rhs_t80b", "B_APC_Wheeled_01_cannon_F" ,"RHS_Mi8mt_vvs" ,"rhsusf_rg33_m2_d"};
	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	crimes[] = { 
		//{"STR_Crime_187V","10350","1"}, 
		//{"STR_Crime_187","10500","2"}, 
		//{"STR_Crime_901","20500","3"}, 
		//{"STR_Crime_215","3500","4"}, 
		//{"STR_Crime_213","10000","5"},
		//{"STR_Crime_211","10000","6"}, 
		//{"STR_Crime_207","5000","7"}, 
		//{"STR_Crime_207A","4000","8"}, 
		//{"STR_Crime_390","30","9"}, 
		//{"STR_Crime_487","1000","10"}, 
		//{"STR_Crime_488","500","11"}, 
		//{"STR_Crime_480","5000","12"}, 
		//{"STR_Crime_481","3500","13"}, 
		//{"STR_Crime_482","10000","14"}, 
		//{"STR_Crime_483","10000","15"}, 
		//{"STR_Crime_459","5000","16"}, 
		//{"STR_Crime_666","40","17"}, 
		//{"STR_Crime_667","30000","18"}, 
		//{"STR_Crime_668","1000","19"}, 
		{"STR_Crime_1","350","20"}, 
		{"STR_Crime_2","1500","21"}, 
		{"STR_Crime_3","2500","22"}, 
		{"STR_Crime_4","3500","23"}, 
		{"STR_Crime_5","10000","24"}, 
		{"STR_Crime_6","5000","25"}, 
		{"STR_Crime_7","10000","26"}, 
		//{"STR_Crime_8","350","27"}, 
		//{"STR_Crime_9","1500","28"}, 
		//{"STR_Crime_10","2500","29"}, 
		//{"STR_Crime_11","3500","30"}, 
		//{"STR_Crime_12","10000","31"}, 
		//{"STR_Crime_13","5000","32"}, 
		//{"STR_Crime_14","3500","33"}, 
		//{"STR_Crime_15","10000","34"}, 
		//{"STR_Crime_16","5000","35"}, 
		//{"STR_Crime_17","10000","36"},
		//{"STR_Crime_18","350","37"}, 
		//{"STR_Crime_19","1500","38"}, 
		//{"STR_Crime_20","2500","39"}, 
		//{"STR_Crime_21","3500","40"}, 
		//{"STR_Crime_22","10000","41"}, 
		//{"STR_Crime_23","5000","42"}, 
		//{"STR_Crime_24","10000","43"}, 
		//{"STR_Crime_25","5000","44"}, 
		//{"STR_Crime_26","5000","45"},
		//{"STR_Crime_27","10000","46"} 

		
	};
	
	sellArray[] = {
		{"arifle_sdar_F", 0},
		{"hgun_P07_snds_F", 0},
		{"hgun_P07_F", 0},
		{"ItemGPS", 0},
		{"ToolKit", 0},
		{"FirstAidKit", 0},
		{"Medikit", 0},
		{"NVGoggles", 0},
		{"16Rnd_9x21_Mag", 0},
		{"20Rnd_556x45_UW_mag", 0},
		{"ItemMap", 0},
		{"ItemCompass", 0},
		{"Chemlight_blue", 0},
		{"Chemlight_yellow", 0},
		{"Chemlight_green", 0},
		{"Chemlight_red", 0},
		{"hgun_Rook40_F", 0},
		{"arifle_Katiba_F", 0},
		{"30Rnd_556x45_Stanag", 0},
		{"20Rnd_762x51_Mag", 0},
		{"30Rnd_65x39_caseless_green", 0},
		{"DemoCharge_Remote_Mag", 0},
		{"SLAMDirectionalMine_Wire_Mag", 0},
		{"optic_ACO_grn", 0},
		{"acc_flashlight", 0},
		{"srifle_EBR_F", 0},
		{"arifle_TRG21_F", 0},
		{"optic_MRCO", 0},
		{"optic_Aco", 0},
		{"arifle_MX_F", 0},
		{"arifle_MXC_F", 0},
		{"arifle_MXM_F", 0},
		{"MineDetector", 0},
		{"optic_Holosight", 275},
		{"acc_pointer_IR", 0},
		{"arifle_TRG20_F", 0},
		{"SMG_01_F", 0},
		{"arifle_Mk20C_F", 0},
		{"30Rnd_45ACP_Mag_SMG_01", 0},
		{"30Rnd_9x21_Mag", 0}
	};

	allowedSavedVirtualItems[] = { 
	"pickaxe", "mre","fuelEmpty", "fuelFull", "ziptie", "spikeStrip", "lockpick", "boltCutter", "defuseKit", "storageSmall", "storageBig", "redgull",
	"coffee", "waterBottle", "apple", "peach", "tbacon", "donut", "rabbitGrilled", "salemaGrilled", "ornateGrilled", "mackerelGrilled", "tunaGrilled",
	"mulletGrilled", "catsharkGrilled", "turtleSoup", "henGrilled", "roosterGrilled", "sheepGrilled", "goatGrilled", "rabbitRaw", "salemaRaw", "ornateRaw", "mackerelRaw", "tunaRaw",
	"mulletRaw", "catsharkRaw", "turtleRaw", "henRaw", "roosterRaw", "sheepRaw", "goatRaw", "zipties", "tea", "chainsaw"
	};
};

//Virtual Items
class VirtualItems {
	//Misc
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, 350, false, -1, "")
	VITEMMACRO(ziptie, "STR_Item_Ziptie", "ziptie", 5, 2500, 350, false, -1, "")
	VITEMMACRO(chainsaw, "STR_Item_Chainsaw", "chainsaw", 2, 1750, 1350, false, -1, "")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "\eg_sndimg\icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 850, 500, false, -1, "\eg_sndimg\icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 2500, 1200, false, -1, "")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 150, 75, false, -1, "")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 12, -1, 95000, false, -1, "")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 35000, -1, true, -1, "\eg_sndimg\icons\ico_blastingCharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "\eg_sndimg\icons\ico_boltcutters.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "\eg_sndimg\icons\ico_storageSmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "\eg_sndimg\icons\ico_storageBig.paa")
	VITEMMACRO(roadcone, "STR_Item_RoadCone", "roadcone", 8, 150, -1, false, -1, "")
	VITEMMACRO(fire, "STR_Item_Fire", "fire", 8, 1500, -1, false, -1, "")
	VITEMMACRO(openShop, "STR_Item_openShop", "openShop", 1, 10000, -1, false, -1, "")

	//Mined Items
	VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 4, -1, -1, false, -1, "")
	VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 3, -1, 1115, false, -1, "")
	VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "")
	VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 3, -1, 4090, false, -1, "")
	VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "")
	VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 2466, false, -1, "")
	VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "")
	VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1745, false, -1, "")
	VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "")
	VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 5553, false, -1, "")
	VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "")
	VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 953, false, -1, "")
	VITEMMACRO(wood, "STR_Item_Wood", "wood", 4, -1, -1, false, -1, "")
	VITEMMACRO(lumber, "STR_Item_Lumber", "lumber", 3, -1, 1500, false, -1, "")
	VITEMMACRO(flowers, "STR_Item_Flowers", "flowers", 1, -1, 50, false, -1, "")
	VITEMMACRO(jaws, "STR_Item_Jaws", "jaws", 10, 50, 50, false, -1, "")
	
	//Oil Items
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 7, -1, -1, false, -1, "")
	VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 6, -1, 3200, false, -1, "")
	VITEMMACRO(oil_diesel, "STR_Item_OilD", "oil_diesel", 6, -1, 3600, false, -1, "")
	VITEMMACRO(oil_jet, "STR_Item_OilJ", "oil_jet", 6, -1, 6200, false, -1, "")
	VITEMMACRO(oil_heavy, "STR_Item_OilH", "oil_heavy", 6, -1, 5200, false, -1, "")
	VITEMMACRO(gas_unprocessed, "STR_Item_GasU", "gas_unprocessed", 6, -1, 3200, false, -1, "")
	VITEMMACRO(gas_processed, "STR_Item_GasP", "gas_processed", 6, -1, 3200, false, -1, "")
	
	//Organ Harvesting Items
	
	//Drugs
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 5, -1, -1, true, -1, "")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 4, -1, 5760, true, -1, "")
	VITEMMACRO(morphine, "STR_Item_Morphine", "morphine", 4, -1, 4000, true, -1, "")
	VITEMMACRO(krokodil, "STR_Item_Krokodil", "krokodil", 4, -1, 6000, true, -1, "")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 3, -1, 3675, true, -1, "\eg_sndimg\icons\ico_marijuana.paa")
	VITEMMACRO(hashish, "STR_Item_Hashish", "hashish", 3, -1, 7000, true, -1, "")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, 3000, true, -1, "")
	VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 4, -1, 5000, true, -1, "")
	VITEMMACRO(mushrooms, "STR_Item_Mushrooms", "mushrooms", 4, 2200, 1600, true, -1, "")
	VITEMMACRO(khat, "STR_Item_Khat", "khat", 4, 2200, 1600, true, -1, "")
	
	//Spray Paint Items
	VITEMMACRO(paintBlack, "STR_Item_PaintBlack", "paintBlack", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintWhite, "STR_Item_PaintWhite", "paintWhite", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintRed, "STR_Item_PaintRed", "paintRed", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintBlue, "STR_Item_PaintBlue", "paintBlue", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintGreen, "STR_Item_PaintGreen", "paintGreen", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintYellow, "STR_Item_PaintYellow", "paintYellow", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintPurple, "STR_Item_PaintPurple", "paintPurple", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintOrange, "STR_Item_PaintOrange", "paintOrange", 1, 50000, 4000, false, -1, "")
	VITEMMACRO(paintPink, "STR_Item_PaintPink", "paintPink", 1, 100000, 8000, false, -1, "")
	VITEMMACRO(paintCamo, "STR_Item_PaintCamo", "paintCamo", 1, 150000, 12000, false, -1, "")
	
	//Meth Related Items
	VITEMMACRO(meth_unprocessed, "STR_Item_MethU", "meth_unprocessed", 4, 2200, 1600, true, -1, "")
	VITEMMACRO(meth_processed, "STR_Item_MethP", "meth_processed", 4, 2200, 1600, true, -1, "")
	VITEMMACRO(pseudo, "STR_Item_Pseudo", "pseudo", 4, 2200, 1600, false, -1, "")
	VITEMMACRO(matches, "STR_Item_Matches", "matches", 4, 2200, 1600, false, -1, "")
	VITEMMACRO(chem_set, "STR_Item_ChemSet", "chem_set", 4, 2200, 1600, true, -1, "")

	//Drink
	VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 150, 20, false, 100, "\eg_sndimg\icons\ico_redgull.paa")
	VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "")
	VITEMMACRO(tea, "STR_Item_Tea", "tea", 1, 10, 5, false, 100, "")
	VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 10, 5, false, 100, "\eg_sndimg\icons\ico_waterBottle.paa")

	//Food
	VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, 100, 50, false, 10, "\eg_sndimg\icons\food.paa")
	VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, 110, 55, false, 10, "\eg_sndimg\icons\peach.paa")
	VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "\eg_sndimg\icons\ico_tbacon.paa")
	VITEMMACRO(donut, "STR_Item_Donuts", "donut", 1, 120, 60, false, 30, "\eg_sndimg\icons\donut.paa")
	VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbitRaw", 2, -1, 650, false, -1, "\eg_sndimg\icons\raw.paa")
	VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbitGrilled", 1, 150, 115, false, 20, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(salema_raw, "STR_Item_Salema", "salemaRaw", 2, -1, 45, false, -1, "\eg_sndimg\icons\food.paa")
	VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salemaGrilled", 1, 750, 550, false, 30, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "\eg_sndimg\icons\ornate.paa")
	VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornateGrilled", 1, 750, 500, false, 25, "\eg_sndimg\icons\ornate.paa")
	VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 75, false, -1, "\eg_sndimg\icons\mackerel.paa")
	VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerelGrilled", 2, 750, 550, false, 30, "\eg_sndimg\icons\mackerel.paa")
	VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 75, false, -1, "\eg_sndimg\icons\tuna.paa")
	VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tunaGrilled", 3, 750, 550, false, 100, "\eg_sndimg\icons\tuna.paa")
	VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "\eg_sndimg\icons\mullet.paa")
	VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mulletFried", 2, 550, 350, false, 80, "\eg_sndimg\icons\mullet.paa")
	VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 50, false, -1, "\eg_sndimg\icons\shark.paa")
	VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catsharkFried", 3, 750, 550, false, 100, "\eg_sndimg\icons\shark.paa")
	VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, 950, 85, true, -1, "\eg_sndimg\icons\turtle.paa")
	VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 850, 750, false, 100, "\eg_sndimg\icons\soup.paa")
	VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 35, false, -1, "\eg_sndimg\icons\raw.paa")
	VITEMMACRO(hen_fried, "STR_Item_HenFried", "henFried", 1, 1150, 850, false, 65, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 35, false, -1,"\eg_sndimg\icons\raw.paa")
	VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "roosterGrilled", 1150, 850, false, 45, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 50, false, -1, "\eg_sndimg\icons\raw.paa")
	VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheepGrilled", 2, 1550, 1150, false, 100, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 75, false, -1, "\eg_sndimg\icons\raw.paa")
	VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goatGrilled", 2, 1750, 1350, false, 100, "\eg_sndimg\icons\ico_cookedMeat.paa")
	VITEMMACRO(mre, "STR_Item_MRE", "mre", 2, 1000, 20, false, 100, "")
};


/*
	Licenses
	
	Params:
	CLASS ENTRY,DisplayName,VariableName,price,illegal,side indicator
*/
class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",500,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",1000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",25000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",10000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",50000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(coastguard,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",25000,true,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",19500,true,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",15000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",75000,true,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",35000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",12000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",30000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",14500,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",9500,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",8000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",6500,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",75000,false,"civ")
	LICENSEMACRO(hunt,"STR_License_Hunt","hunt",20000,false,"civ")
	LICENSEMACRO(passport,"STR_License_Passport","passport",20000,false,"civ")
	LICENSEMACRO(whitelist,"STR_License_Whitelisted","whitelist",0,false,"civ")
	LICENSEMACRO(pmc,"STR_License_PMC","pmc",0,false,"civ")
	LICENSEMACRO(hashish,"STR_License_Hashish","hashish",19500,true,"civ")
	LICENSEMACRO(morphine,"STR_License_Morphine","morphine",35000,false,"civ")
	LICENSEMACRO(krokodil,"STR_License_Krokodil","krokodil",50000,false,"civ") 
	LICENSEMACRO(meth_basic,"STR_License_Meth_Basic","meth_basic",10000,false,"civ")
	LICENSEMACRO(meth_adv,"STR_License_Meth_Adv","meth_adv",45000,false,"civ")
	LICENSEMACRO(tokill,"STR_License_ToKill","tokill",0,false,"civ")
	LICENSEMACRO(pilotadv,"STR_License_PilotAdv","pilotadv",250000,false,"civ")
	LICENSEMACRO(pilotpro,"STR_License_PilotPro","pilotpro",250000,false,"civ")
};

class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "waterBottle", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "storagesmall", "storagebig", "matches", "flowers", "openShop", "paintBlack", "paintWhite", "paintBlue", "paintRed", "paintGreen", "paintOrange", "paintYellow", "paintPurple", "paintPink", "paintCamo" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "ziptie", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "waterBottle", "ziptie", "rabbit_grilled", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw", "rabbit_raw", "rabbit_grilled", "hen_raw", "hen_fried", "rooster_raw", "rooster_grilled", "sheep_raw", "sheep_grilled", "goat_raw", "goat_grilled" };
	};
	
	class wood {
		name = "STR_Shops_Wood";
		items[] = { "wood" };
	};

	class ems {
		name = "STR_Shops_EMS";
		items[] = { "waterBottle", "mre", "redgull", "fuelFull", "jaws" };
	};
	
	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donut" };
	};
	
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "cocaine_processed", "heroin_processed", "meth_processed", "marijuana", "mushrooms", "hashish", "morphine", "krokodil", "pseudo", "khat" };
	};

	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed","oil_diesel","oil_jet","oil_heavy","gas_processed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "STR_Shops_FishMarket";
		items[] = { "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "STR_Shops_Glass";
		items[] = { "glass" };
	};

	class iron  {
		name = "STR_Shops_Minerals";
		items[] = { "iron_refined", "copper_refined" };
	};

	class diamond {
		name = "STR_Shops_Diamond";
		items[] = { "diamond_uncut", "diamond_cut" };
	};

	class salt {
		name = "STR_Shops_Salt";
		items[] = { "salt_refined" };
	};

	class cop {
		name = "STR_Shops_Cop";
		items[] = { "mre", "spikeStrip", "waterBottle", "rabbit_grilled", "apple", "redgull", "fuelFull", "defusekit", "roadcone", "jaws" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar" };
	};
};

#include "Config_Vehicles.hpp"
#include "Config_Houses.hpp"
