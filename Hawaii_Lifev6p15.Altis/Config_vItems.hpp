/*
*	Format:
*		level: ARRAY (This is for limiting items to certain things)
*			0: Variable to read from
*			1: Variable Value Type (SCALAR / BOOL / EQUAL)
*			2: What to compare to (-1 = Check Disabled)
*			3: Custom exit message (Optional)
*/
class VirtualShops {
	//Virtual Shops
	class market {
		name = "STR_MAR_market";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "donuts", "coffee", "waterBottle", "rabbit", "painkillers", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "storagesmall", "storagebig", "sechouse", "gpstracker", "protestSign", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
	};
	class rebel {
		name = "STR_MAR_rebel";
		side = "civ";
		license = "rebel";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "donuts", "coffee", "waterBottle", "rabbit", "painkillers", "morphium", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge", "zyankalikapsel", "blindfold", "handcuffs", "gpstracker", "protestSign" };
	};
	class gang {
		name = "STR_MAR_gang";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "donuts", "coffee", "waterBottle", "rabbit", "painkillers", "morphium", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge", "zyankalikapsel", "blindfold", "handcuffs", "gpstracker", "protestSign" };
	};
	class black {
		name = "STR_MAR_black";
		side = "civ";
		license = "black";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "donuts", "coffee", "waterBottle", "rabbit", "painkillers", "morphium", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge", "zyankalikapsel", "blindfold", "handcuffs", "gpstracker", "protestSign" };
	};
	class cop {
		name = "STR_MAR_cop";
		side = "cop";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "lockpick", "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "redgull", "fuelFull", "defusekit", "painkillers", "handcuffs", "handcuffkeys", "gpstracker" };
	};
	class medic {
		name = "STR_MAR_medic";
		side = "med";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "banane", "ananas", "peach", "donuts", "coffee", "waterBottle", "rabbit", "redgull", "tbacon", "lockpick", "painkillers", "morphium", "fuelFull" };
	};
	class wongs {
		name = "STR_MAR_Turtle_Dealer";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "turtlesoup", "turtleMeat" };
	};
	class coffee {
		name = "STR_MAR_coffee";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "coffee", "donuts" };
	};
	class fishmarket {
		name = "STR_MAR_Fish_Market";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "salema", "ornate", "mackerel", "mullet", "tuna", "catshark", "salema_raw", "ornate_raw", "mackerel_raw", "mullet_raw", "tuna_raw", "catshark_raw" };
	};
	class gold {
		name = "STR_MAR_Gold_Bars_Buyer";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "goldbar" };
	};
	class drugdealer {
		name = "STR_Shops_DrugDealer";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "cocain", "meth", "marijuana", "heroin" };
	};
	class kokos {
		name = "STR_MAR_kokos";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "kokosmilch", "kokosfleisch" };
	};
	class wolle {
		name = "STR_MAR_wolle";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "wolle" };
	};
	class kaffee {
		name = "STR_MAR_kaffee";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "kaffee" };
	};
	class zucker {
		name = "STR_MAR_zucker";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "zucker" };
	};
	class bholz {
		name = "STR_MAR_bholz";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "bholz" };
	};
	class palmenOl {
		name = "STR_MAR_palmenOl";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "palmenOl" };
	};
	class zigaretten {
		name = "STR_MAR_zigaretten";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "zigaretten" };
	};
	class salz {
		name = "STR_MAR_salz";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "salz" };
	};
	class kristalle {
		name = "STR_MAR_kristalle";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "kristalle" };
	};
	class uranIL {
		name = "STR_MAR_uranIL";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "uranIL" };
	};
	class uranL {
		name = "STR_MAR_uranL";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "uranL" };
	};
	class solarp {
		name = "STR_MAR_solarp";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "solarp" };
	};
	class antiqui {
		name = "STR_MAR_antiqui";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "antiqui" };
	};
	class crab {
		name = "STR_MAR_crab";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "crab" };
	};
	class coral {
		name = "STR_MAR_coral";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "coralP" };
	};
	class cocktail {
		name = "STR_MAR_cocktail";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "beer", "bottledwhiskey", "bottledshine" };
	};
	class humanflesh {
		name = "STR_MAR_humanflesh";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "humanflesh" };
	};
};

/*
*	CLASS:
*		variable = Variable Name
*		displayName = Item Name
*		weight = Item Weight
*		buyPrice = Item Buy Price
*		sellPrice = Item Sell Price
*		illegal = Illegal Item
*		edible = Item Edible (-1 = Disabled)
*		icon = Item Icon
*		processedItem = Processed Item
*/
class VirtualItems {
	//Virtual Items

	//Misc
	class pickaxe {
		variable = "pickaxe";
		displayName = "STR_Item_Pickaxe";
		weight = 2;
		buyPrice = 1200;
		sellPrice = 750;
		illegal = false;
		edible = -1;
		icon = "icons\ico_pickaxe.paa";
	};

	class fuelEmpty {
		variable = "fuelEmpty";
		displayName = "STR_Item_FuelE";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fuelempty.paa";
	};

	class fuelFull {
		variable = "fuelFull";
		displayName = "STR_Item_FuelF";
		weight = 5;
		buyPrice = 850;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fuel.paa";
	};

	class spikeStrip {
		variable = "spikeStrip";
		displayName = "STR_Item_SpikeStrip";
		weight = 15;
		buyPrice = 2500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_spikestrip.paa";
	};

	class lockpick {
		variable = "lockpick";
		displayName = "STR_Item_Lockpick";
		weight = 4;
		buyPrice = 4500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_lockpick.paa";
	};

	class goldbar {
		variable = "goldBar";
		displayName = "STR_Item_GoldBar";
		weight = 12;
		buyPrice = -1;
		sellPrice = 90000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_goldbar.paa";
	};

	class blastingcharge {
		variable = "blastingCharge";
		displayName = "STR_Item_BCharge";
		weight = 15;
		buyPrice = 75000;
		sellPrice = 10000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_blastingCharge.paa";
	};

	class boltcutter {
		variable = "boltCutter";
		displayName = "STR_Item_BCutter";
		weight = 5;
		buyPrice = 7500;
		sellPrice = 1000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_boltcutters.paa";
	};

	class defusekit {
		variable = "defuseKit";
		displayName = "STR_Item_DefuseKit";
		weight = 2;
		buyPrice = 2500;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_defusekit.paa";
	};

	class storagesmall {
		variable = "storageSmall";
		displayName = "STR_Item_StorageBS";
		weight = 5;
		buyPrice = 150000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_storageSmall.paa";
	};

	class storagebig {
		variable = "storageBig";
		displayName = "STR_Item_StorageBL";
		weight = 10;
		buyPrice = 250000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_storageBig.paa";
	};

	class painkillers {
		variable = "painkillers";
		displayName = "STR_Item_painkillers";
		weight = 5;
		buyPrice = 500;
		sellPrice = 100;
		illegal = false;
		edible = -1;
		icon = "icons\ico_painkillers.paa";
	};

	class morphium {
		variable = "morphium";
		displayName = "STR_Item_morphium";
		weight = 6;
		buyPrice = 5000;
		sellPrice = 100;
		illegal = false;
		edible = -1;
		icon = "icons\ico_morphium.paa";
	};

	class zyankalikapsel {
		variable = "zyankalikapsel";
		displayName = "STR_Item_zyan";
		weight = 1;
		buyPrice = 50000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zyan.paa";
	};

	class handcuffs {
		variable = "handcuffs";
		displayName = "STR_Item_Handcuffs";
		weight = 1;
		buyPrice = 500;
		sellPrice = 10;
		illegal = true;
		edible = -1;
		icon = "icons\ico_handcuffs.paa";
	};

	class handcuffkeys {
		variable = "handcuffkeys";
		displayName = "STR_Item_Handcuffkeys";
		weight = 1;
		buyPrice = 1000;
		sellPrice = 100;
		illegal = true;
		edible = -1;
		icon = "icons\ico_handcuffkeys.paa";
	};

	class blindfold {
		variable = "blindfold";
		displayName = "STR_Item_Blindfold";
		weight = 1;
		buyPrice = 500;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_blindfold.paa";
	};

	class protestSign {
		variable = "protestSign";
		displayName = "STR_Item_protestSign";
		weight = 10;
		buyPrice = 20000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_protest.paa";
	};

	class sechouse {
		variable = "sechouse";
		displayName = "STR_Item_sechouse";
		weight = 4;
		buyPrice = 200000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_sechouse.paa";
	};

	class gpstracker {
		variable = "gpstracker";
		displayName = "STR_Item_gpstracker";
		weight = 4;
		buyPrice = 50000;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_gpstracker.paa";
	};

	//Mined Items
	class kokos {
		variable = "kokos";
		displayName = "STR_Item_kokos";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kokos.paa";
	};

	class kokosmilch {
		variable = "kokosmilch";
		displayName = "STR_Item_kokosmilch";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kokosf.paa";
	};

	class kokosfleisch {
		variable = "kokosfleisch";
		displayName = "STR_Item_kokosfleisch";
		weight = 3;
		buyPrice = -1;
		sellPrice = 1250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kokosm.paa";
	};
	
	class ukaffee {
		variable = "ukaffee";
		displayName = "STR_Item_ukaffee";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_ukaffee.paa";
	};

	class kaffee {
		variable = "kaffee";
		displayName = "STR_Item_kaffee";
		weight = 3;
		buyPrice = -1;
		sellPrice = 1400;
		illegal = false;
		edible = -1;
		icon = "icons\ico_kaffee.paa";
	};
	
	class uwolle {
		variable = "uwolle";
		displayName = "STR_Item_uwolle";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uwolle.paa";
	};

	class wolle {
		variable = "wolle";
		displayName = "STR_Item_wolle";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1300;
		illegal = false;
		edible = -1;
		icon = "icons\ico_wolle.paa";
	};
	
	class zuckerr {
		variable = "zuckerr";
		displayName = "STR_Item_zuckerr";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zuckerr.paa";
	};

	class zucker {
		variable = "zucker";
		displayName = "STR_Item_zucker";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1100;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zucker.paa";
	};
	
	class bambusr {
		variable = "bambusr";
		displayName = "STR_Item_bambusr";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_bambus.paa";
	};

	class bholz {
		variable = "bholz";
		displayName = "STR_Item_bholz";
		weight = 3;
		buyPrice = -1;
		sellPrice = 1200;
		illegal = false;
		edible = -1;
		icon = "icons\ico_bholz.paa";
	};
	
	class tabakr {
		variable = "tabakr";
		displayName = "STR_Item_tabakr";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_tabak.paa";
	};

	class zigaretten {
		variable = "zigaretten";
		displayName = "STR_Item_zigaretten";
		weight = 4;
		buyPrice = -1;
		sellPrice = 3000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_zigarette.paa";
	};
	
	class salzerz {
		variable = "salzerz";
		displayName = "STR_Item_salzerz";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_salt_unprocessed.paa";
	};

	class salz {
		variable = "salz";
		displayName = "STR_Item_salz";
		weight = 2;
		buyPrice = -1;
		sellPrice = 2250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_salt.paa";
	};
	
	class solarr {
		variable = "solarr";
		displayName = "STR_Item_solarr";
		weight = 8;
		buyPrice = -1;
		sellPrice = 5500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_solar.paa";
	};

	class solarp {
		variable = "solarp";
		displayName = "STR_Item_solarp";
		weight = 6;
		buyPrice = -1;
		sellPrice = 5500;
		illegal = false;
		edible = -1;
		icon = "icons\ico_solar.paa";
	};

	class crab {
		variable = "crab";
		displayName = "STR_Item_crab";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1750;
		illegal = false;
		edible = -1;
		icon = "icons\ico_crab.paa";
	};

	//Drugs
	class uheroin {
		variable = "uheroin";
		displayName = "STR_Item_HeroinU";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_heroinUnprocessed.paa";
		processedItem = "heroin";
	};

	class heroin {
		variable = "heroin";
		displayName = "STR_Item_HeroinP";
		weight = 4;
		buyPrice = -1;
		sellPrice = 4000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_heroinProcessed.paa";
	};

	class hanf {
		variable = "hanf";
		displayName = "STR_Item_Cannabis";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cannabis.paa";
		processedItem = "marijuana";
	};

	class marijuana {
		variable = "marijuana";
		displayName = "STR_Item_Marijuana";
		weight = 3;
		buyPrice = -1;
		sellPrice = 1700;
		illegal = true;
		edible = -1;
		icon = "icons\ico_marijuana.paa";
	};

	class ucocain {
		variable = "ucocain";
		displayName = "STR_Item_CocaineU";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cocaineUnprocessed.paa";
		processedItem = "cocain";
	};

	class cocain {
		variable = "cocain";
		displayName = "STR_Item_CocaineP";
		weight = 4;
		buyPrice = -1;
		sellPrice = 4500;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cocaineProcessed.paa";
	};
	
	class coral {
		variable = "coral";
		displayName = "STR_Item_coral";
		weight = 4;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_coral.paa";
	};

	class coralP {
		variable = "coralP";
		displayName = "STR_Item_coralP";
		weight = 3;
		buyPrice = -1;
		sellPrice = 2500;
		illegal = true;
		edible = -1;
		icon = "icons\ico_coral.paa";
	};
	
	class palmenb {
		variable = "palmenb";
		displayName = "STR_Item_palmenb";
		weight = 4;
		buyPrice = -1;
		sellPrice = 2500;
		illegal = true;
		edible = -1;
		icon = "icons\ico_palmenb.paa";
	};

	class palmenOl {
		variable = "palmenOl";
		displayName = "STR_Item_palmenOl";
		weight = 2;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_palmenol.paa";
	};
	
	class umeth {
		variable = "umeth";
		displayName = "STR_Item_umeth";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_meth.paa";
	};

	class meth {
		variable = "meth";
		displayName = "STR_Item_meth";
		weight = 4;
		buyPrice = -1;
		sellPrice = 3750;
		illegal = true;
		edible = -1;
		icon = "icons\ico_meth.paa";
	};
	
	class magmas {
		variable = "magmas";
		displayName = "STR_Item_magmas";
		weight = 10;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_magmas.paa";
	};

	class kristalle {
		variable = "kristalle";
		displayName = "STR_Item_kristalle";
		weight = 4;
		buyPrice = -1;
		sellPrice = 7000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_kristall.paa";
	};
	
	class uuran {
		variable = "uuran";
		displayName = "STR_Item_uuran";
		weight = 8;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uranu.paa";
	};

	class uranL {
		variable = "uranL";
		displayName = "STR_Item_uranL";
		weight = 5;
		buyPrice = -1;
		sellPrice = 6000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_uran.paa";
	};
	
	class uranIL {
		variable = "uranIL";
		displayName = "STR_Item_uranIL";
		weight = 6;
		buyPrice = -1;
		sellPrice = 7000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_uran.paa";
	};

	class antiqui {
		variable = "antiqui";
		displayName = "STR_Item_antiqui";
		weight = 4;
		buyPrice = -1;
		sellPrice = 5000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_antiqui.paa";
	};
	
	class turtle {
		variable = "turtle";
		displayName = "STR_Item_turtle";
		weight = 6;
		buyPrice = -1;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ico_turtle.paa";
	};

	class turtleMeat {
		variable = "turtleMeat";
		displayName = "STR_Item_TurtleRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 6200;
		illegal = true;
		edible = -1;
		icon = "icons\ico_turtle.paa";
	};

	class humanflesh {
		variable = "humanflesh";
		displayName = "STR_Item_humanflesh";
		weight = 4;
		buyPrice = -1;
		sellPrice = 2750;
		illegal = true;
		edible = -1;
		icon = "icons\ico_cookedMeat.paa";
	};

	//Drink
	class redgull {
		variable = "redgull";
		displayName = "STR_Item_RedGull";
		weight = 1;
		buyPrice = 1500;
		sellPrice = 200;
		illegal = false;
		edible = 100;
		icon = "icons\ico_redgull.paa";
	};

	class coffee {
		variable = "coffee";
		displayName = "STR_Item_Coffee";
		weight = 1;
		buyPrice = 10;
		sellPrice = 5;
		illegal = false;
		edible = 100;
		icon = "icons\ico_coffee.paa";
	};

	class waterBottle {
		variable = "waterBottle";
		displayName = "STR_Item_WaterBottle";
		weight = 1;
		buyPrice = 10;
		sellPrice = 5;
		illegal = false;
		edible = 100;
		icon = "icons\ico_waterBottle.paa";
	};

	class beer {
		variable = "beer";
		displayName = "STR_Item_beer";
		weight = 2;
		buyPrice = 1500;
		sellPrice = -1;
		illegal = false;
		edible = 10;
		icon = "icons\ico_beer.paa";
	};

	class bottledwhiskey {
		variable = "bottledwhiskey";
		displayName = "STR_Item_bottledwhiskey";
		weight = 2;
		buyPrice = 2000;
		sellPrice = -1;
		illegal = false;
		edible = 10;
		icon = "icons\ico_bottledshine.paa";
	};

	class bottledshine {
		variable = "bottledshine";
		displayName = "STR_Item_bottledshine";
		weight = 2;
		buyPrice = 3000;
		sellPrice = -1;
		illegal = false;
		edible = 10;
		icon = "icons\ico_bottledwhiskey.paa";
	};

	//Food	
	class banane {
		variable = "banane";
		displayName = "STR_Item_Banane";
		weight = 1;
		buyPrice = 68;
		sellPrice = 60;
		illegal = false;
		edible = 15;
		icon = "icons\ico_banane.paa";
	};
	
	class ananas {
		variable = "ananas";
		displayName = "STR_Item_Ananas";
		weight = 1;
		buyPrice = 68;
		sellPrice = 60;
		illegal = false;
		edible = 15;
		icon = "icons\ico_ananas.paa";
	};

	class peach {
		variable = "peach";
		displayName = "STR_Item_Peach";
		weight = 1;
		buyPrice = 68;
		sellPrice = 50;
		illegal = false;
		edible = 10;
		icon = "icons\ico_peach.paa";
	};

	class tbacon {
		variable = "tbacon";
		displayName = "STR_Item_TBacon";
		weight = 1;
		buyPrice = 75;
		sellPrice = 25;
		illegal = false;
		edible = 40;
		icon = "icons\ico_tbacon.paa";
	};

	class donuts {
		variable = "donuts";
		displayName = "STR_Item_Donuts";
		weight = 1;
		buyPrice = 120;
		sellPrice = 60;
		illegal = false;
		edible = 30;
		icon = "icons\ico_donuts.paa";
	};

	class rabbit_raw {
		variable = "rabbitRaw";
		displayName = "STR_Item_RabbitRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 95;
		illegal = false;
		edible = -1;
		icon = "icons\ico_meat.paa";
	};

	class rabbit {
		variable = "rabbit";
		displayName = "STR_Item_Rabbit";
		weight = 1;
		buyPrice = 150;
		sellPrice = 115;
		illegal = false;
		edible = 20;
		icon = "icons\ico_cookedMeat.paa";
	};

	class salema_raw {
		variable = "salemaRaw";
		displayName = "STR_Item_SalemaRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 45;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class salema {
		variable = "salema";
		displayName = "STR_Item_Salema";
		weight = 1;
		buyPrice = 75;
		sellPrice = 55;
		illegal = false;
		edible = 30;
		icon = "icons\ico_cookedMeat.paa";
	};

	class ornate_raw {
		variable = "ornateRaw";
		displayName = "STR_Item_OrnateRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 40;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class ornate {
		variable = "ornate";
		displayName = "STR_Item_Ornate";
		weight = 1;
		buyPrice = 175;
		sellPrice = 150;
		illegal = false;
		edible = 25;
		icon = "icons\ico_cookedMeat.paa";
	};

	class mackerel_raw {
		variable = "mackerelRaw";
		displayName = "STR_Item_MackerelRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 175;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class mackerel {
		variable = "mackerel";
		displayName = "STR_Item_Mackerel";
		weight = 2;
		buyPrice = 250;
		sellPrice = 200;
		illegal = false;
		edible = 30;
		icon = "icons\ico_cookedMeat.paa";
	};

	class tuna_raw {
		variable = "tunaRaw";
		displayName = "STR_Item_TunaRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 700;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class tuna {
		variable = "tuna";
		displayName = "STR_Item_Tuna";
		weight = 3;
		buyPrice = 1250;
		sellPrice = 1000;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedMeat.paa";
	};

	class mullet_raw {
		variable = "mulletRaw";
		displayName = "STR_Item_MulletRaw";
		weight = 4;
		buyPrice = -1;
		sellPrice = 250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class mullet {
		variable = "mullet";
		displayName = "STR_Item_Mullet";
		weight = 2;
		buyPrice = 600;
		sellPrice = 400;
		illegal = false;
		edible = 80;
		icon = "icons\ico_cookedMeat.paa";
	};

	class catshark_raw {
		variable = "catsharkRaw";
		displayName = "STR_Item_CatSharkRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 300;
		illegal = false;
		edible = -1;
		icon = "icons\ico_fish.paa";
	};

	class catshark {
		variable = "catshark";
		displayName = "STR_Item_CatShark";
		weight = 3;
		buyPrice = 750;
		sellPrice = 500;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedMeat.paa";
	};

	class turtle_raw {
		variable = "turtleRaw";
		displayName = "STR_Item_TurtleRaw";
		weight = 6;
		buyPrice = -1;
		sellPrice = 3000;
		illegal = true;
		edible = -1;
		icon = "icons\ico_turtle.paa";
	};

	class turtlesoup {
		variable = "turtleSoup";
		displayName = "STR_Item_TurtleSoup";
		weight = 2;
		buyPrice = 2500;
		sellPrice = 1000;
		illegal = false;
		edible = 100;
		icon = "icons\ico_turtle_soup.paa";
	};

	class hen_raw {
		variable = "henRaw";
		displayName = "STR_Item_HenRaw";
		weight = 1;
		buyPrice = -1;
		sellPrice = 1250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_meat.paa";
	};

	class hen {
		variable = "hen";
		displayName = "STR_Item_Hen";
		weight = 1;
		buyPrice = 115;
		sellPrice = 75;
		illegal = false;
		edible = 65;
		icon = "icons\ico_cookedMeat.paa";
	};

	class rooster_raw {
		variable = "roosterRaw";
		displayName = "STR_Item_RoosterRaw";
		weight = 1;
		buyPrice = -1;
		sellPrice = 1450;
		illegal = false;
		edible = -1;
		icon = "icons\ico_meat.paa";
	};

	class rooster {
		variable = "rooster";
		displayName = "STR_Item_Rooster";
		weight = 1;
		buyPrice = 90;
		sellPrice = 65;
		illegal = false;
		edible = 45;
		icon = "icons\ico_cookedMeat.paa";
	};

	class sheep_raw {
		variable = "sheepRaw";
		displayName = "STR_Item_SheepRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 2000;
		illegal = false;
		edible = -1;
		icon = "icons\ico_meat.paa";
	};

	class sheep {
		variable = "sheep";
		displayName = "STR_Item_Sheep";
		weight = 2;
		buyPrice = 155;
		sellPrice = 95;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedMeat.paa";
	};

	class goat_raw {
		variable = "goatRaw";
		displayName = "STR_Item_GoatRaw";
		weight = 2;
		buyPrice = -1;
		sellPrice = 2250;
		illegal = false;
		edible = -1;
		icon = "icons\ico_meat.paa";
	};

	class goat {
		variable = "goat";
		displayName = "STR_Item_Goat";
		weight = 2;
		buyPrice = 175;
		sellPrice = 115;
		illegal = false;
		edible = 100;
		icon = "icons\ico_cookedMeat.paa";
	};
};
