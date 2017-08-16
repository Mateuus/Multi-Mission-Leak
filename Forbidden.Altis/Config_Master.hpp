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
#include "Config_Safekeeping.hpp"


class Life_Settings {
	
	save_civ_weapons = true; 
	save_virtualItems = true; 

	
	revive_cops = false; 
	revive_fee = 15000; 
	
	
	house_limit = 3; 

	
	gang_price = 75000; 
	gang_upgradeBase = 10000; 
	gang_upgradeMultiplier = 2.5; 

	
	enable_fatigue = true; 
	total_maxWeight = 24; 
	paycheck_period = 5; 
	
	
	impound_car = 5000; 
	impound_boat = 1000; 
	impound_air = 7000; 

	
	vehicleShop_rentalOnly[] = { "B_MRAP_01_hmg_F", "B_G_Offroad_01_armed_F" };

	
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	sellArray[] = {
		{"arifle_sdar_F", 20},
		{"hgun_P07_snds_F", 20},
		{"hgun_P07_F", 20},
		{"ItemGPS", 10},
		{"ToolKit", 10},
		{"FirstAidKit", 2},
		{"Medikit", 2},
		{"NVGoggles", 2},
		{"16Rnd_9x21_Mag", 2},
		{"20Rnd_556x45_UW_mag", 2},
		{"ItemMap", 2},
		{"ItemCompass", 2},
		{"Chemlight_blue", 2},
		{"Chemlight_yellow", 2},
		{"Chemlight_green", 2},
		{"Chemlight_red", 2},
		{"hgun_Rook40_F", 10},
		{"arifle_Katiba_F", 20},
		{"30Rnd_556x45_Stanag", 10},
		{"20Rnd_762x51_Mag", 10},
		{"30Rnd_65x39_caseless_green", 10},
		{"DemoCharge_Remote_Mag", 10},
		{"SLAMDirectionalMine_Wire_Mag", 10},
		{"optic_ACO_grn", 10},
		{"acc_flashlight", 10},
		{"srifle_EBR_F", 10},
		{"arifle_TRG21_F", 10},
		{"optic_MRCO", 10},
		{"optic_Aco", 10},
		{"arifle_MX_F", 10},
		{"arifle_MXC_F", 10},
		{"arifle_MXM_F", 10},
		{"MineDetector", 10},
		{"optic_Holosight", 10},
		{"acc_pointer_IR", 20},
		{"arifle_TRG20_F", 25},
		{"SMG_01_F", 20},
		{"arifle_Mk20C_F", 25},
		{"30Rnd_45ACP_Mag_SMG_01", 25},
		{"30Rnd_9x21_Mag", 30}
	};
	
	illegal_items[] = { "blastingcharge","boltcutter","heroin_unprocessed","heroin_processed","cannabis","marijuana","cocaine_unprocessed","cocaine_processed","horor","horor_avlusade","goldbar","guldsmycke","lockpick","spikeStrip","methamphetamine","crystalmethamphetamine" };

	
	vItemsToSave[] = {"pickaxe","fuelEmpty","fuelFull", "rabbit_raw", "spikeStrip", "lockpick", "defuseKit","storageSmall","storageBig","redgull","coffee","waterBottle","apple","peach","tbacon","donuts","bandage","gpstracker","xp500","xp1000","anim_rabbit","anim_hen","anim_cock","anim_sheep","anim_goat","can",
		"rabbit_grilled","turtleSoup","medmarijuana","beer","liquor","falseID","zipties","blastingcharge","boltcutter","crispbread","RoadCone_L_F","RoadBarrier_small_F","sniperoptik","piggelin","calippo","sandwich","glass88","solero","magnum_double","magnum_swhite","cornetto","daimstrut",
		"alarm","alarmbad","alvedon","penodil","treo","kylbalsam","febertermometer","plaster","nassprej","ogondroppar","idominsalva","lypsyl","ritalin","insulin","morfin","stesolid","antideprissiva","xyloproct","adrenalin","betapred","clarityn","tramadol","metadon","tradolan",
		"costume_rabbit","costume_hen","costume_cock","costume_sheep","costume_goat","titanium"};
};


class VirtualItems {
	
	VITEMMACRO(pickaxe, "STR_Item_Pickaxe", "pickaxe", 2, 750, -1, false, -1, "icons\ico_pickaxe.paa")
	VITEMMACRO(fuelEmpty, "STR_Item_FuelE", "fuelEmpty", 2, -1, -1, false, -1, "icons\ico_fuelempty.paa")
	VITEMMACRO(fuelFull, "STR_Item_FuelF", "fuelFull", 5, 1500, 500, false, -1, "icons\ico_fuel.paa")
	VITEMMACRO(spikeStrip, "STR_Item_SpikeStrip", "spikeStrip", 15, 15000, 1200, false, -1, "icons\ico_spikestrip.paa")
	VITEMMACRO(lockpick, "STR_Item_Lockpick", "lockpick", 1, 500, 75, false, -1, "icons\ico_lockpick.paa")
	VITEMMACRO(goldbar, "STR_Item_GoldBar", "goldBar", 20, -1, 100000, true, -1, "icons\ico_goldbar.paa")
	VITEMMACRO(blastingcharge, "STR_Item_BCharge", "blastingCharge", 15, 30000, -1, true, -1, "icons\ico_blastingCharge.paa")
	VITEMMACRO(boltcutter, "STR_Item_BCutter", "boltCutter", 5, 7500, -1, true, -1, "icons\ico_boltcutters.paa")
	VITEMMACRO(defusekit, "STR_Item_DefuseKit", "defuseKit", 2, 2500, -1, false, -1, "icons\ico_defusekit.paa")
	VITEMMACRO(storagesmall, "STR_Item_StorageBS", "storageSmall", 5, 75000, -1, false, -1, "icons\ico_storageSmall.paa")
	VITEMMACRO(storagebig, "STR_Item_StorageBL", "storageBig", 10, 150000, -1, false, -1, "icons\ico_storageBig.paa")
	VITEMMACRO(falseID, "STR_Item_FalseID", "falseID", 1, 100000, -1, false, -1, "icons\ico_falseid.paa")
	VITEMMACRO(zipties, "STR_Item_Zipties", "zipties", 1, 250, -1, false, -1, "icons\ico_zipties.paa")
	VITEMMACRO(RoadBarrier_small_F, "STR_Item_RoadBarrier_small_F", "RoadBarrier_small_F", 1, 200, -1, false, -1, "icons\ico_roadbarrier.paa")
	VITEMMACRO(RoadCone_L_F, "STR_Item_RoadCone_L_F", "RoadCone_L_F", 1, 200, -1, false, -1, "icons\ico_roadcone.paa")
	VITEMMACRO(alarm, "STR_Item_Alarm", "alarm", 5, 1000000, -1, false, -1, "icons\ico_alarm.paa")
	VITEMMACRO(alarmbad, "STR_Item_AlarmBad", "alarmbad", 5, 300000, -1, false, -1, "icons\ico_alarmbad.paa")
	VITEMMACRO(bandage, "STR_Item_Bandage", "bandage", 1, 500, -1, false, -1, "icons\ico_bandage.paa")
	VITEMMACRO(gpstracker, "STR_Item_GPSTracker", "gpstracker", 1, 50000, -1, false, -1, "icons\gpstracker.paa")
	VITEMMACRO(xp500, "STR_Item_XP500", "xp500", 1, -1, -1, false, -1, "icons\ico_xp500.paa")
	VITEMMACRO(xp1000, "STR_Item_XP1000", "xp1000", 1, -1, -1, false, -1, "icons\ico_xp1000.paa")
	VITEMMACRO(can, "STR_Item_Can", "can", 1, -1, 50, false, -1, "icons\ico_can.paa")
	VITEMMACRO(titanium, "STR_Item_Titanium", "titanium", 1, 1500000, -1, false, -1, "icons\ico_titanium.paa")
	VITEMMACRO(pipe, "STR_Item_Pipe", "pipe", 5, 120000, -1, false, -1, "icons\ico_pipe.paa")
	VITEMMACRO(piston, "STR_Item_Piston", "piston", 5, 120000, -1, false, -1, "icons\ico_piston.paa")
	VITEMMACRO(plastic, "STR_Item_Plastic", "plastic", 1, -1, -1, false, -1, "")
	VITEMMACRO(helikoptermotor, "STR_Item_Helikoptermotor", "helikoptermotor", 10, 70000, -1, false, -1, "")
	VITEMMACRO(kevlar, "STR_Item_Kevlar", "kevlar", 1, -1, -1, false, -1, "")
    VITEMMACRO(motor, "STR_Item_Motor", "motor", 1, -1, -1, false, -1, "")
    VITEMMACRO(propeller, "STR_Item_Propeller", "propeller", 1, -1, -1, false, -1, "")	
	VITEMMACRO(hjul, "STR_Item_Hjul", "Hjul", 1, -1, -1, false, -1, "")
	VITEMMACRO(seat, "STR_Item_Seat", "Seat", 1, -1, -1, false, -1, "")
	VITEMMACRO(glasruta, "STR_Item_Glasruta", "Glasruta", 1, -1, -1, false, -1, "")
	VITEMMACRO(tyg, "STR_Item_Tyg", "tyg", 1, -1, -1, false, -1, "")
	
	
	VITEMMACRO(anim_rabbit, "STR_Item_anim_rabbit", "anim_rabbit", 1, 2000, -1, false, -1, "icons\ico_anim_rabbit.paa")
	VITEMMACRO(anim_hen, "STR_Item_anim_hen", "anim_hen", 1, 2000, -1, false, -1, "icons\ico_anim_hen.paa")
	VITEMMACRO(anim_cock, "STR_Item_anim_cock", "anim_cock", 1, 2000, -1, false, -1, "icons\ico_anim_cock.paa")
	VITEMMACRO(anim_sheep, "STR_Item_anim_sheep", "anim_sheep", 1, 2000, -1, false, -1, "icons\ico_anim_sheep.paa")
	VITEMMACRO(anim_goat, "STR_Item_anim_goat", "anim_goat", 1, 2000, -1, false, -1, "icons\ico_anim_goat.paa")
	
	
	VITEMMACRO(costume_rabbit, "STR_Item_costume_rabbit", "costume_rabbit", 1, 2000, -1, false, -1, "icons\ico_anim_rabbit.paa")
	VITEMMACRO(costume_hen, "STR_Item_costume_hen", "costume_hen", 1, 2000, -1, false, -1, "icons\ico_anim_hen.paa")
	VITEMMACRO(costume_cock, "STR_Item_costume_cock", "costume_cock", 1, 2000, -1, false, -1, "icons\ico_anim_cock.paa")
	VITEMMACRO(costume_sheep, "STR_Item_costume_sheep", "costume_sheep", 1, 2000, -1, false, -1, "icons\ico_anim_sheep.paa")
	VITEMMACRO(costume_goat, "STR_Item_costume_goat", "costume_goat", 1, 2000, -1, false, -1, "icons\ico_anim_goat.paa")
	
	
	VITEMMACRO(oil_unprocessed, "STR_Item_OilU", "oilUnprocessed", 6, -1, -1, false, -1, "icons\oil_unprocessed.paa")
    VITEMMACRO(oil_processed, "STR_Item_OilP", "oilProcessed", 4, -1, 2500, false, -1, "icons\oil_processed.paa")
    VITEMMACRO(copper_unrefined, "STR_Item_CopperOre", "copperUnrefined", 5, -1, -1, false, -1, "icons\copper_unrefined.paa")
    VITEMMACRO(copper_refined, "STR_Item_CopperIngot", "copperRefined", 2, -1, 1531, false, -1, "icons\copper_refined.paa")
    VITEMMACRO(kanel, "STR_Item_Kanel", "kanel", 4, -1, -1, false, -1, "icons\kanel.paa")
	VITEMMACRO(kanel_deg, "STR_Item_KanelDeg", "kanel_deg", 2, -1, -1, false, -1, "icons\kanel.paa")
    VITEMMACRO(kanelbulle, "STR_Item_Kanelbulle", "kanelbulle", 2, 8000, 8000, false, 100, "icons\kanelbulle.paa")
    VITEMMACRO(horor, "STR_Item_Horor", "horor", 30, -1, -1, true, -1, "icons\horor.paa")
    VITEMMACRO(horor_avlusade, "STR_Item_HororAvlusade", "horor_avlusade", 15, 62311, 23458, true, -1, "icons\horor.paa")
    VITEMMACRO(iron_unrefined, "STR_Item_IronOre", "ironUnrefined", 5, -1, -1, false, -1, "icons\iron_unrefined.paa")
    VITEMMACRO(iron_refined, "STR_Item_IronIngot", "ironRefined", 2, -1, 1524, false, -1, "icons\iron_refined.paa")
    VITEMMACRO(salt_unrefined, "STR_Item_Salt", "saltUnrefined", 3, -1, -1, false, -1, "icons\salt_unrefined.paa")
    VITEMMACRO(salt_refined, "STR_Item_SaltR", "saltRefined", 1, -1, 1624, false, -1, "icons\salt_refined.paa")
    VITEMMACRO(sand, "STR_Item_Sand", "sand", 3, -1, -1, false, -1, "icons\sands.paa")
    VITEMMACRO(glass, "STR_Item_Glass", "glass", 1, -1, 1260, false, -1, "icons\glass.paa")
    VITEMMACRO(diamond_uncut, "STR_Item_DiamondU", "diamondUncut", 4, -1, 750, false, -1, "icons\diamond_uncut.paa")
    VITEMMACRO(diamond_cut, "STR_Item_DiamondC", "diamondCut", 2, -1, 2032, false, -1, "icons\diamond_cut.paa")
    VITEMMACRO(rock, "STR_Item_Rock", "rock", 6, -1, -1, false, -1, "icons\rock.paa")
    VITEMMACRO(cement, "STR_Item_CementBag", "cement", 5, -1, 2345, false, -1, "icons\cement.paa")

	
	VITEMMACRO(heroin_unprocessed, "STR_Item_HeroinU", "heroinUnprocessed", 6, -1, -1, true, -1, "")
	VITEMMACRO(heroin_processed, "STR_Item_HeroinP", "heroinProcessed", 3, 10345, 4123, true, -1, "icons\ico_heroinprocessed.paa")
	VITEMMACRO(cannabis, "STR_Item_Cannabis", "cannabis", 4, -1, -1, true, -1, "icons\ico_cannabis.paa")
	VITEMMACRO(marijuana, "STR_Item_Marijuana", "marijuana", 2, 6478, 2986, true, -1, "icons\ico_marijuana.paa")
	VITEMMACRO(medmarijuana, "STR_Item_MedMarijuana", "medmarijuana", 1, 50, 20, false, -1, "icons\ico_marijuana.paa")
	VITEMMACRO(cocaine_unprocessed, "STR_Item_CocaineU", "cocaineUnprocessed", 6, -1, 3000, true, -1, "icons\ico_cocaine_unpocessed.paa") 
    VITEMMACRO(cocaine_processed, "STR_Item_CocaineP", "cocaineProcessed", 3, 12321, 4238, true, -1, "icons\ico_cocaine.paa") 
    VITEMMACRO(hydrogenchloride, "STR_Item_HydrogenChloride", "hydrogenchloride", 4, -1, -1, false, -1, "icons\ico_hydrogenchloride.paa") 
    VITEMMACRO(myriaticacid, "STR_Item_MyriaticAcid", "myriaticacid", 4, -1, -1, false, -1, "icons\ico_myriaticacid.paa")
    VITEMMACRO(mixedchemicals, "STR_Item_MixedChemicals", "mixedchemicals", 4, -1, -1, false, -1, "icons\ico_mixedchemicals") 
    VITEMMACRO(causticsoda, "STR_Item_CausticSoda", "causticsoda", 4, -1, -1, false, -1, "icons\ico_causticsoda.paa") 
    VITEMMACRO(methamphetamine, "STR_Item_Methamphetamine", "methamphetamine", 4, -1, 4238, true, -1, "icons\ico_methamphetamine.paa") 
    VITEMMACRO(crystalmethamphetamine, "STR_Item_CrystalMethamphetamine", "crystalmethamphetamine", 2, -1, 4238, true, -1, "icons\ico_crystalmethamphetamine.paa") 
   
    
    VITEMMACRO(alvedon, "STR_Item_Alvedon", "alvedon", 1, 10, -1, false, 0, "icons\ico_alvedon.paa")
    VITEMMACRO(penodil, "STR_Item_Penodil", "penodil", 1, 10, -1, false, 0, "icons\ico_penodil.paa")
    VITEMMACRO(treo, "STR_Item_Treo", "treo", 1, 10, -1, false, 0, "icons\ico_treo.paa") 
    VITEMMACRO(kylbalsam, "STR_Item_Kylbalsam", "kylbalsam", 1, 10, -1, false, 0, "icons\ico_kylbalsam.paa")
    VITEMMACRO(febertermometer, "STR_Item_Febertermometer", "febertermometer", 1, 10, -1, false, 0, "icons\ico_febertermometer.paa") 
    VITEMMACRO(plaster, "STR_Item_Plaster", "plaster", 1, 10, -1, false, 0, "icons\ico_plaster.paa") 
    VITEMMACRO(nassprej, "STR_Item_Nassprej", "nassprej", 1, 10, -1, false, 0, "icons\ico_nassprej.paa") 
    VITEMMACRO(ogondroppar, "STR_Item_Ogondroppar", "ogondroppar", 1, 10, -1, false, 0, "icons\ico_ogondroppar.paa") 
    VITEMMACRO(idominsalva, "STR_Item_Idominsalva", "idominsalva", 1, 10, -1, false, 0, "icons\ico_idominsalva.paa")
    VITEMMACRO(lypsyl, "STR_Item_Lypsyl", "lypsyl", 1, 10, -1, false, 0, "icons\ico_lypsyl.paa")
   
    VITEMMACRO(ritalin, "STR_Item_Ritalin", "ritalin", 1, 10, -1, false, 0, "icons\ico_ritalin.paa") 
    VITEMMACRO(insulin, "STR_Item_Insulin", "insulin", 1, 10, -1, false, 0, "icons\ico_insulin.paa") 
    VITEMMACRO(morfin, "STR_Item_Morfin", "morfin", 1, 10, -1, false, 0, "icons\ico_morfin.paa") 
    VITEMMACRO(stesolid, "STR_Item_Stesolid", "stesolid", 1, 10, -1, false, 0, "icons\ico_stesolid.paa") 
    VITEMMACRO(antideprissiva, "STR_Item_Antideprissiva", "antideprissiva", 1, 10, -1, false, 0, "icons\ico_antidepressiva.paa") 
    VITEMMACRO(xyloproct, "STR_Item_Xyloproct", "xyloproct", 1, 10, -1, false, 0, "icons\ico_xyloproct.paa")  
    VITEMMACRO(adrenalin, "STR_Item_Adrenalin", "adrenalin", 1, 10, -1, false, 0, "icons\ico_adrenalin.paa") 
    VITEMMACRO(betapred, "STR_Item_Betapred", "betapred", 1, 10, -1, false, 0, "icons\ico_betapred.paa") 
    VITEMMACRO(clarityn, "STR_Item_Clarityn", "clarityn", 1, 10, -1, false, 0, "icons\ico_clarityn.paa") 
    VITEMMACRO(tramadol, "STR_Item_Tramadol", "tramadol", 1, 10, -1, false, 0, "icons\ico_tramadol.paa") 
    VITEMMACRO(metadon, "STR_Item_Metadon", "metadon", 1, 10, -1, false, 0, "icons\ico_metadon.paa") 
    VITEMMACRO(tradolan, "STR_Item_Tradolan", "tradolan", 1, 10, -1, false, 0, "icons\ico_tradolan.paa") 
 
    
    VITEMMACRO(krut, "STR_Item_Krut", "krut", 1, -1, -1, false, -1, "icons\ico_krut.paa") 
    VITEMMACRO(guldsmycke, "STR_Item_Guldsmycke", "guldsmycke", 1, -1, -1, true, -1, "icons\ico_guldsmycke.paa") 
    VITEMMACRO(kolfiber, "STR_Item_Kolfiber", "kolfiber", 1, -1, -1, false, -1, "icons\ico_kolfiber.paa") 
    VITEMMACRO(fiber, "STR_Item_Fiber", "fiber", 4, 5000, 600, false, -1, "")
    VITEMMACRO(MKIdelar, "STR_Item_MKIdelar", "MKIdelar", 1, -1, -1, false, -1, "icons\ico_MKIdelar.paa") 
    VITEMMACRO(MK14delar, "STR_Item_MK14delar", "MK14delar", 1, -1, -1, false, -1, "icons\ico_MK14delar.paa")
    VITEMMACRO(kol, "STR_Item_Kol", "kol", 1, -1, -1, false, -1, "icons\ico_kol.paa") 
    VITEMMACRO(giantbun, "STR_Item_Giantbun", "giantbun", 1, -1, -1, false, -1, "icons\ico_giantbun.paa") 
    VITEMMACRO(optik, "STR_Item_Optik", "optik", 1, -1, -1, false, -1, "icons\ico_optik.paa") 
    VITEMMACRO(sniperoptik, "STR_Item_Sniperoptik", "sniperoptik", 1, 15000, -1, false, -1, "icons\ico_sniperoptik.paa") 
    VITEMMACRO(granatspill, "STR_Item_Granatspill", "granatspill", 1, -1, -1, false, -1, "icons\ico_granatspill.paa") 
    VITEMMACRO(giant_rabbit, "STR_Item_GiantRabbit", "giantrabbit", 1, -1, -1, false, -1, "icons\ico_giantrabbit.paa") 
   
    
    VITEMMACRO(redgull, "STR_Item_RedGull", "redgull", 1, 150, -1, false, 100, "icons\ico_redgull.paa")
    VITEMMACRO(coffee, "STR_Item_Coffee", "coffee", 1, 10, 5, false, 100, "icons\ico_coffee.paa") 
    VITEMMACRO(waterBottle, "STR_Item_WaterBottle", "waterBottle", 1, 25, 5, false, 100, "icons\ico_waterBottle.paa")
    VITEMMACRO(beer, "STR_Item_Beer", "beer", 1, 100, 25, false, 100, "icons\ico_beer.paa") 
    VITEMMACRO(liquor, "STR_Item_Liquor", "liquor", 1, 200, 50, false, 100, "icons\ico_liquor.paa") 
 
    
    VITEMMACRO(piggelin, "STR_Item_Piggelin", "piggelin", 1, 20, -1, false, 5, "icons\ico_piggelin.paa")
    VITEMMACRO(calippo, "STR_Item_Calippo", "calippo", 1, 23, -1, false, 7, "icons\ico_calippo.paa")
    VITEMMACRO(sandwich, "STR_Item_Sandwich", "sandwich", 1, 24, -1, false, 10, "icons\ico_sandwich.paa")
    VITEMMACRO(glass88, "STR_Item_Glass88", "glass88", 1, 50, -1, false, 10, "icons\ico_glass88.paa")
    VITEMMACRO(solero, "STR_Item_Solero", "solero", 1, 70, -1, false, 20, "icons\ico_solero.paa")
    VITEMMACRO(magnum_double, "STR_Item_MagnumDouble", "magnum_double", 1, 150, -1, false, 30, "icons\ico_magnum_double.paa")
    VITEMMACRO(magnum_swhite, "STR_Item_MagnumSWhite", "magnum_swhite", 1, 150, -1, false, 30, "icons\ico_magnum_swhite.paa")
    VITEMMACRO(cornetto, "STR_Item_Cornetto", "cornetto", 1, 250, -1, false, 50, "icons\ico_cornetto.paa")
    VITEMMACRO(daimstrut, "STR_Item_Daimstrut", "daimstrut", 1, 500, -1, false, 100, "icons\ico_daimstrut.paa")
   
    
    VITEMMACRO(apple, "STR_Item_Apple", "apple", 1, -1, 50, false, 3, "icons\food.paa")
    VITEMMACRO(peach, "STR_Item_Peach", "peach", 1, -1, 65, false, 4, "icons\ico_peach.paa") 
    VITEMMACRO(tbacon, "STR_Item_TBacon", "tbacon", 1, 75, 25, false, 40, "icons\ico_tbacon.paa")
    VITEMMACRO(crispbread, "STR_Item_Crispbread", "crispbread", 1, 75, 25, false, 40, "") 
    VITEMMACRO(donuts, "STR_Item_Donuts", "donuts", 1, 120, 60, false, 100, "icons\ico_donuts.paa") 
    VITEMMACRO(rabbit_raw, "STR_Item_Rabbit", "rabbitRaw", 1, -1, 65, false, -1, "icons\ico_rabbit_raw.paa") 
    VITEMMACRO(rabbit_grilled, "STR_Item_RabbitGrilled", "rabbitGrilled", 1, 70, 50, false, 20, "icons\ico_cookedMeat.paa") 
    VITEMMACRO(salema_raw, "STR_Item_Salema", "salemaRaw", 2, -1, 45, false, -1, "icons\ico_salema_raw.paa") 
    VITEMMACRO(salema_grilled, "STR_Item_SalemaGrilled", "salemaGrilled", 1, 75, 55, false, 30, "icons\ico_cookedMeat.paa")
    VITEMMACRO(ornate_raw, "STR_Item_OrnateMeat", "ornateRaw", 2, -1, 40, false, -1, "icons\ico_ornate_raw.paa") 
    VITEMMACRO(ornate_grilled, "STR_Item_OrnateGrilled", "ornateGrilled", 1, 175, 150, false, 25, "icons\ico_cookedMeat.paa")
    VITEMMACRO(mackerel_raw, "STR_Item_MackerelMeat", "mackerelRaw", 4, -1, 175, false, -1, "icons\ico_mackerel_raw.paa") 
    VITEMMACRO(mackerel_grilled, "STR_Item_MackerelGrilled", "mackerelGrilled", 2, 250, 200, false, 30, "icons\ico_cookedMeat.paa")
    VITEMMACRO(tuna_raw, "STR_Item_TunaMeat", "tunaRaw", 6, -1, 700, false, -1, "icons\ico_tuna_raw.paa")
    VITEMMACRO(tuna_grilled, "STR_Item_TunaGrilled", "tunaGrilled", 3, 1250, 1000, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(mullet_raw, "STR_Item_MulletMeat", "mulletRaw", 4, -1, 250, false, -1, "icons\ico_mullet_raw.paa")
    VITEMMACRO(mullet_fried, "STR_Item_MulletFried", "mulletFried", 2, 600, 400, false, 80, "icons\ico_cookedMeat.paa")
    VITEMMACRO(catshark_raw, "STR_Item_CatSharkMeat", "catsharkRaw", 6, -1, 300, false, -1, "icons\ico_catshark_raw.paa") 
    VITEMMACRO(catshark_fried, "STR_Item_CatSharkFried", "catsharkFried", 3, 750, 500, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(turtle_raw, "STR_Item_TurtleMeat", "turtleRaw", 6, 32100, 15000, true, -1, "icons\ico_turtle_raw.paa") 
    VITEMMACRO(turtle_soup, "STR_Item_TurtleSoup", "turtleSoup", 2, 9000, 1000, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(hen_raw, "STR_Item_HenRaw", "henRaw", 1, -1, 35, false, -1, "icons\ico_hen_raw.paa") 
    VITEMMACRO(hen_fried, "STR_Item_HenFried", "henFried", 1, 115, 85, false, 65, "icons\ico_cookedMeat.paa")
    VITEMMACRO(rooster_raw, "STR_Item_RoosterRaw", "roosterRaw", 1, -1, 35, false, -1, "icons\rooster_raw.paa") 
    VITEMMACRO(rooster_grilled, "STR_Item_RoosterGrilled", "roosterGrilled", 115, 85, false, 45, "icons\ico_cookedMeat.paa")
    VITEMMACRO(sheep_raw, "STR_Item_SheepRaw", "sheepRaw", 2, -1, 50, false, -1, "icons\sheep_raw.paa") 
    VITEMMACRO(sheep_grilled, "STR_Item_SheepGrilled", "sheepGrilled", 2, 155, 115, false, 100, "icons\ico_cookedMeat.paa")
    VITEMMACRO(goat_raw, "STR_Item_GoatRaw", "goatRaw", 2, -1, 75, false, -1, "icons\goat_raw.paa")
    VITEMMACRO(goat_grilled, "STR_Item_GoatGrilled", "goatGrilled", 2, 175, 135, false, 100, "icons\ico_cookedMeat.paa")
	
	
	VITEMMACRO(factory_main, "STR_Const_Factory_main", "factory_main", 1, -1, -1, false, -1, "")
	VITEMMACRO(const_Land_Mil_WallBig_4m_F, "STR_Const_Land_Mil_WallBig_4m_F", "const_Land_Mil_WallBig_4m_F", 1, -1, -1, false, -1, "")
	VITEMMACRO(const_Land_HBarrier_1_F, "STR_Const_Land_HBarrier_1_F", "const_Land_HBarrier_1_F", 1, -1, -1, false, -1, "")
	VITEMMACRO(const_Land_City_Gate_F, "STR_Const_Land_City_Gate_F", "const_Land_City_Gate_F", 1, -1, -1, false, -1, "")
};


class Licenses {
	LICENSEMACRO(driver,"STR_License_Driver","driver",2000,false,"civ")
	LICENSEMACRO(boat,"STR_License_Boat","boat",1000,false,"civ")
	LICENSEMACRO(pilot,"STR_License_Pilot","pilot",25000,false,"civ")
	LICENSEMACRO(gun,"STR_License_Firearm","gun",10000,false,"civ")
	LICENSEMACRO(dive,"STR_License_Diving","dive",2000,false,"civ")
	LICENSEMACRO(oil,"STR_License_Oil","oil",10000,false,"civ")
	LICENSEMACRO(cAir,"STR_License_Pilot","cAir",15000,false,"cop")
	LICENSEMACRO(coastguard,"STR_License_CG","cg",8000,false,"cop")
	LICENSEMACRO(heroin,"STR_License_Heroin","heroin",140000,true,"civ")
	LICENSEMACRO(marijuana,"STR_License_Marijuana","marijuana",140000,true,"civ")
	LICENSEMACRO(medmarijuana,"STR_License_Medmarijuana","medmarijuana",15000,false,"civ")
	LICENSEMACRO(rebel,"STR_License_Rebel","rebel",150000,true,"civ")
	LICENSEMACRO(trucking,"STR_License_Truck","trucking",20000,false,"civ")
	LICENSEMACRO(diamond,"STR_License_Diamond","diamond",50000,false,"civ")
	LICENSEMACRO(salt,"STR_License_Salt","salt",30000,false,"civ")
	LICENSEMACRO(cocaine,"STR_License_Cocaine","cocaine",140000,false,"civ")
	LICENSEMACRO(sand,"STR_License_Sand","sand",10000,false,"civ")
	LICENSEMACRO(iron,"STR_License_Iron","iron",10000,false,"civ")
	LICENSEMACRO(copper,"STR_License_Copper","copper",10000,false,"civ")
	LICENSEMACRO(kanel,"STR_License_Kanel","kanel",30000,false,"civ")
	LICENSEMACRO(horor,"STR_License_Horor","horor",200000,false,"civ")
	LICENSEMACRO(methamphetamine,"STR_License_Methamphetamine","methamphetamine",100000,false,"civ")
	LICENSEMACRO(cement,"STR_License_Cement","cement",5000,false,"civ")
	LICENSEMACRO(mAir,"STR_License_Pilot","mAir",15000,false,"med")
	LICENSEMACRO(home,"STR_License_Home","home",75000,false,"civ")
};

class VirtualShops {
	class market {
		name = "STR_Shops_Market";
		items[] = { "apple", "peach", "waterBottle", "rabbit_grilled", "redgull", "can", "tbacon", "pickaxe", "fiber", "fuelFull", "alarm", "storagesmall", "storagebig" };
	};

	class rebel {
		name = "STR_Shops_Rebel";
		items[] = { "waterBottle", "rabbit_grilled", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "spikeStrip", "blastingcharge" };
	};

	class gang {
		name = "STR_Shops_Gang";
		items[] = { "titanium", "waterBottle", "rabbit_grilled", "redgull", "tbacon","zipties", "lockpick", "pickaxe", "fuelFull", "boltcutter", "spikeStrip", "blastingcharge" };
	};
	
	class blackmarket {
		name = "STR_Shops_BlackMarket";
		items[] = { "waterBottle", "rabbit_grilled", "redgull", "tbacon","zipties", "lockpick", "pickaxe", "fuelFull", "boltcutter", "spikeStrip", "blastingcharge", "sniperoptik", "pipe", "piston", "helikoptermotor", "alarm", "alarmbad", "storagesmall", "storagebig" };
	};

	class wongs {
		name = "STR_Shops_Wongs";
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class coffee {
		name = "STR_Shops_Coffee";
		items[] = { "coffee", "donuts" };
	};
	
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		items[] = { "crystalmethamphetamine", "methamphetamine", "cocaine_processed", "heroin_processed", "marijuana" };
	};

	class oil {
		name = "STR_Shops_Oil";
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
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
	
	class kanel  {
		name = "STR_Shops_Kanel";
		items[] = { "kanelbulle" };
	};
	
	class horor  {
		name = "STR_Shops_Horor";
		items[] = { "horor_avlusade" };
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
		items[] = { "donuts", "coffee", "spikeStrip", "lockpick", "waterBottle", "rabbit_grilled", "apple", "redgull", "fuelFull", "RoadBarrier_small_F", "RoadCone_L_F", "blastingcharge", "boltcutter", "defusekit" };
	};

	class cement {
		name = "STR_Shops_Cement";
		items[] = { "cement" };
	};

	class gold {
		name = "STR_Shops_Gold";
		items[] = { "goldbar" };
	};
	
	class medic {
		name = "Receptbelagt";
		items[] = { "medmarijuana", "RoadBarrier_small_F", "RoadCone_L_F", "ritalin","insulin","morfin","stesolid","antideprissiva","xyloproct","adrenalin","betapred","clarityn","tramadol","metadon","tradolan" };
	};
	
	class medic_receptfri {
		name = "Receptfritt";
		items[] = { "tbacon","waterBottle","redgull","alvedon","penodil","treo","kylbalsam","febertermometer","plaster","nassprej","ogondroppar","idominsalva","lypsyl" };
	};
	
	class bar {
		name = "Bar";
		items[] = { "beer", "liquor" };
	};
	
	class gas {
		name = "Bensinmack";
		items[] = { "fuelFull" };
	};
	
	class icecream {
		name = "Glassbil";
		items[] = { "piggelin","calippo","sandwich","glass88","solero","magnum_double","magnum_swhite","cornetto","daimstrut" };
	};
};

#include "Config_Vehicles.hpp"