/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
class VirtualShops {
    //Virtual Shops
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "banana", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull","xpresent" };
   };
   
   class fuel {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts", "redgull", "fuelFull","fuelEmpty","hose","xpresent"};
    };

   	class butcher {
        name = "STR_Shops_Butcher";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "rabbit", "hen", "rooster", "sheep","xpresent" };
    };
	
	class depot {
        name = "STR_Shops_depot";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "storagesmall", "storagebig", "pickaxe","xpresent"};
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "banana", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge","ziptie","hose","lance","weldingtool","xpresent" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "banana", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge","hose","lance","weldingtool","ziptie","xpresent" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "turtle_soup", "turtle_raw","xpresent" };
    };
	
	class bar {
        name = "STR_Shops_Bar";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "vodka", "bacardi", "cocktail","xpresent" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts","xpresent" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts", "redgull", "toolkit", "fuelFull","xpresent"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "meth_processed","xpresent" };
    };

    class oil {
        name = "STR_Shops_Resource";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oil_processed", "copper_refined", "crate","xpresent" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark","xpresent" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_uncut", "diamond_cut","xpresent" };
    };

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "treasure", "goldbar","silverbar","ruby","ancientcoins", "head","xpresent" };
    };
	
	class redburger {
        name = "STR_Shops_redburger";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "burger", "waterBottle","xpresent" };
    };
	
	class bluking {
        name = "STR_Shops_blueking";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "pizza", "waterBottle", "spaghetti","xpresent" };
    };
	
	class blackm {
        name = "STR_Shops_blackmarket";
        side = "civ";
        license = "blackmarket";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "banana", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "boltcutter", "blastingcharge","hose","lance","weldingtool","ziptie","xpresent"};
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "banana", "redgull", "toolkit", "fuelFull", "defusekit","xpresent" };
    };
	
	class medic {
        name = "STR_Shops_Medic";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "apple", "peach", "fuelFull","xpresent"};
    };
	
	class swat {
        name = "STR_Shops_Swat";
        side = "cop";
        license = "";
	    level[] = { "life_swatlevel", "SCALAR", 1, "" };
        items[] = { "donuts", "coffee", "spikeStrip", "defusekit", "ram","xpresent" };
    };
	
	class army {
        name = "STR_Shops_Army";
        side = "cop";
        license = "";
	    level[] = { "life_armylevel", "SCALAR", 1, "" };
        items[] = { "coffee", "spikeStrip", "waterBottle", "fuelFull", "defusekit", "ram","xpresent"};
    };
	
	class price {
        items[] = { "treasure", "ancientcoins", "head", "goldbar", "silverbar", "ruby", "storagebig", "storagesmall",
		"oil_unprocessed", "oil_processed", "copper_unrefined", "copper_refined", "diamond_uncut", "diamond_cut",
		"meth_unprocessed", "meth_processed", "cocaine_unprocessed", "cocaine_processed", "heroin_unprocessed", "heroin_processed", "cannabis", "marijuana", "turtle_raw",
		"blastingcharge", "boltcutter", "ziptie", "lance", "weldingtool", "fuelFull", "fuelEmpty", "lockpick", "hose",
		"spikeStrip", "defusekit", "ram",
		"redgull", "coffee", "waterBottle", "vodka", "bacardi", "cocktail", "pizza", "burger", "spaghetti", "apple", "peach", "banana", "tbacon", "donuts",
		"rabbit_raw", "rabbit", "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark", "turtle_soup",
		"hen_raw", "hen", "rooster_raw", "rooster", "sheep_raw", "sheep", "goat_raw", "goat",
		"xpresent"};
    };
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price
*        illegal = Illegal Item
*        edible = Item Edible (-1 = Disabled)
*        icon = Item Icon
*        processedItem = Processed Item
*/
class VirtualItems {
    //Virtual Items

    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 750;
        sellPrice = -1;
		contraband = 500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 900;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 350;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = 250;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 850;
        sellPrice = -1;
		contraband = -1;
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
		contraband = 1000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 2500;
        sellPrice = -1;
		contraband = 1500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 11;
        buyPrice = -1;
        sellPrice = 190000;
		contraband = 190000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };
	
	class treasure {
        variable = "treasure";
        displayName = "STR_Item_treasure";
        weight = 50;
        buyPrice = -1;
        sellPrice = 15000000;
		contraband = 15000000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_treasure.paa";
    };
	
	class ruby {
        variable = "ruby";
        displayName = "STR_Item_Ruby";
        weight = 1;
        buyPrice = -1;
        sellPrice = 50000;
		contraband = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ruby.paa";
    };
		
	class silverbar {
        variable = "silverbar";
        displayName = "STR_Item_SilverBar";
        weight = 8;
        buyPrice = -1;
        sellPrice = 100000;
		contraband = 100000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_silver.paa";
    };
	
	class ancientcoins {
        variable = "ancientcoins";
        displayName = "STR_Item_AC";
        weight = 25;
        buyPrice = -1;
        sellPrice = 999999;
		contraband = 999999;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ac.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 50000;
        sellPrice = -1;
		contraband = 50000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };
	
	class hose {
        variable = "hose";
        displayName = "STR_Item_hose";
        weight = 5;
        buyPrice = 2500;
        sellPrice = -1;
		contraband = 2000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_hose.paa";
    };
	
	class weldingtool {
        variable = "weldingtool";
        displayName = "STR_Item_Wetool";
        weight = 5;
        buyPrice = 7500;
        sellPrice = -1;
		contraband = 5000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_tools.paa";
    };
	
	class lance {
        variable = "lance";
        displayName = "STR_Item_Lance";
        weight = 5;
        buyPrice = 60000;
        sellPrice = -1;
		contraband = 50000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lance.paa";
    };
	
	class ram {
        variable = "ram";
        displayName = "STR_Item_Ram";
        weight = 5;
        buyPrice = 5000;
        sellPrice = -1;
		contraband = 5000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_ram.paa";
    };
	
	class ziptie {
        variable = "ziptie";
        displayName = "STR_Item_Ziptie";
        weight = 2;
        buyPrice = 5000;
        sellPrice = -1;
		contraband = 4000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_ziptie.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 50000;
        sellPrice = -1;
		contraband = 50000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = -1;
		contraband = 200;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 200000;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 400000;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	
	class head {
        variable = "head";
        displayName = "STR_Item_Head";
        weight = 2;
        buyPrice = -1;
        sellPrice = 500000;
		contraband = 500000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_head.paa";
    };

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 13000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 8750;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copper.paa";
    };
	
	class xpresent {
        variable = "xpresent";
        displayName = "STR_Item_xpresent";
        weight = 4;
        buyPrice = -1;
        sellPrice = 50000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_box.paa";
    };
	
	class tree {
        variable = "tree";
        displayName = "STR_Item_tree";
        weight = 25;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tree.paa";
    };
	
	class crate {
        variable = "crate";
        displayName = "STR_Item_crate";
        weight = 5;
        buyPrice = -1;
        sellPrice = 13000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_crate.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 1;
        buyPrice = -1;
        sellPrice = 3700;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };


    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "STR_Item_HeroinP";
        weight = 2;
        buyPrice = -1;
        sellPrice = 13000;
		contraband = 13000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 1;
        buyPrice = -1;
        sellPrice = 12000;
		contraband = 12000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 3;
        buyPrice = -1;
        sellPrice = 14000;
		contraband = 14000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };
	
	class meth_unprocessed {
        variable = "methUnprocessed";
        displayName = "STR_Item_methU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
		contraband = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_chemicals.paa";
    };

    class meth_processed {
        variable = "methProcessed";
        displayName = "STR_Item_methP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 17000;
		contraband = 17000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_meth.paa";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 1500;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_waterBottle.paa";
    };
		class vodka {
        variable = "vodka";
        displayName = "STR_Item_Vodka";
        weight = 1;
        buyPrice = 10;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_vodka.paa";
    };
	
	class bacardi {
        variable = "bacardi";
        displayName = "STR_Item_Bacardi";
        weight = 1;
        buyPrice = 10;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_bacardi.paa";
    };
	
	class cocktail {
        variable = "cocktail";
        displayName = "STR_Item_Sexonthebeach";
        weight = 1;
        buyPrice = 10;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cocktail.paa";
    };

    //Food
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 65;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 10;
        icon = "icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 68;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 10;
        icon = "icons\ico_peach.paa";
    };
	
	class banana {
        variable = "banana";
        displayName = "STR_Item_Banana";
        weight = 1;
        buyPrice = 600;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 20;
        icon = "icons\ico_banana.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 75;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = -1;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_donuts.paa";
    };

    class rabbit_raw {
        variable = "rabbitRaw";
        displayName = "STR_Item_RabbitRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 950;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_rabbitRaw.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = -1;
        sellPrice = 115;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_rabbit.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
        displayName = "STR_Item_SalemaRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 2500;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = -1;
        sellPrice = 55;
		contraband = -1;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 2500;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = -1;
        sellPrice = 150;
		contraband = -1;
        illegal = false;
        edible = 25;
        icon = "icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 1750;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = -1;
        sellPrice = 200;
		contraband = -1;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 20000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = -1;
        sellPrice = 12;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 2500;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = -1;
        sellPrice = 400;
		contraband = -1;
        illegal = false;
        edible = 80;
        icon = "icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 25;
        buyPrice = -1;
        sellPrice = 15000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = -1;
        sellPrice = 500;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 15;
        buyPrice = -1;
        sellPrice = 65000;
		contraband = 65000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = -1;
        sellPrice = 750;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_turtleSoup.paa";
    };

    class hen_raw {
        variable = "henRaw";
        displayName = "STR_Item_HenRaw";
        weight = 5;
        buyPrice = -1;
        sellPrice = 6500;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_wholeChickenRaw.paa";
    };

    class hen {
        variable = "hen";
        displayName = "STR_Item_Hen";
        weight = 1;
        buyPrice = -1;
        sellPrice = 85;
		contraband = -1;
        illegal = false;
        edible = 65;
        icon = "icons\ico_wholeChicken.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
        displayName = "STR_Item_RoosterRaw";
        weight = 5;
        buyPrice = -1;
        sellPrice = 6500;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_chickenDrumstickRaw.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "STR_Item_Rooster";
        weight = 115;
        buyPrice = -1;
        sellPrice = 85;
		contraband = -1;
        illegal = false;
        edible = 45;
        icon = "icons\ico_chickenDrumstick.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
        displayName = "STR_Item_SheepRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 20000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lambChopRaw.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "STR_Item_Sheep";
        weight = 2;
        buyPrice = -1;
        sellPrice = 115;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_lambChop.paa";
    };

    class goat_raw {
        variable = "goatRaw";
        displayName = "STR_Item_GoatRaw";
        weight = 20;
        buyPrice = -1;
        sellPrice = 20000;
		contraband = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_muttonLegRaw.paa";
    };

    class goat {
        variable = "goat";
        displayName = "STR_Item_Goat";
        weight = 2;
        buyPrice = -1;
        sellPrice = 135;
		contraband = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_muttonLeg.paa";
    };
	
	class pizza {
        variable = "pizza";
        displayName = "STR_Item_Pizza";
        weight = 2;
        buyPrice = 100;
        sellPrice = 0;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_pizza.paa";
    };
	
	class burger {
        variable = "burger";
        displayName = "STR_Item_Burger";
        weight = 2;
        buyPrice = 100;
        sellPrice = 0;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_burger.paa";
    };
	
	class spaghetti {
        variable = "spaghetti";
        displayName = "STR_Item_Spaghetti";
        weight = 2;
        buyPrice = 100;
        sellPrice = 0;
		contraband = -1;
        illegal = false;
        edible = 15;
        icon = "icons\ico_spaghetti.paa";
    };
	
	
};
