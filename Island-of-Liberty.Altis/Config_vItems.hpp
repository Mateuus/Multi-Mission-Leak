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
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "peach", "trauben", "bananen", "turtle_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "pickaxe" };
    };
    
	class mtdmarket {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "apple","defibrillator", "toolkit", "redgull", "tbacon", "peach", "bananen", "trauben", "lockpick", "fuelFull","tracker" };
    };
	
	class food {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "bananen", "tbacon", "peach", "trauben" };
    };
	
	class metzger {
        name = "STR_Shops_Metzger";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "rabbit", "turtle_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", };
    };
	
	class Markt {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "lockpick", "pickaxe", "fuelFull", "toolkit", "boltcutter", "storagesmall", "storagebig", "feuerwerkrandom", "feuerwerkred", "feuerwerkblue", "feuerwerkgreen", "feuerwerkwhite" };
    };
	
	class baumarkt {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "pickaxe", "fuelFull","toolkit", "boltcutter", "feuerwerkrandom", "feuerwerkred", "feuerwerkblue", "feuerwerkgreen", "feuerwerkwhite","nplate" };
    };
	
	class mtdciv {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "fuelFull","toolkit", "pliers" };
    };

	class medicciv {
        name = "STR_Shops_Apotheke";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "apple", "redgull","knife" };
    };
	
	class housemarkt {
        name = "STR_Shops_House";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "storagesmall", "storagebig" };
    };
	
	class imbiss {
        name = "STR_Shops_Imbiss";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "bananen", "trauben", "redgull", "tbacon", "peach", "trauben", "coffee", "donuts", "turtle_soup", };
    };
	
	class bar {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "redgull", "coffee"};
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "bananen", "pickaxe", "fuelFull", "peach", "trauben", "boltcutter", "blastingcharge","toolkit", "knife", "zipties", "pliers", "handcuffkeys","tracker" };
    };
	
	class smarkt {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "schwarzwaffen";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "bananen", "pickaxe", "fuelFull", "peach", "trauben", "boltcutter", "blastingcharge","toolkit", "knife", "zipties", "pliers", "handcuffkeys","tracker" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "bananen", "redgull","toolkit", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "trauben", "boltcutter", "blastingcharge", "zipties","knife", "pliers", "handcuffkeys","tracker" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts", "redgull", "fuelFull"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "mash", "lsd" };
    };

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oil_processed", "pickaxe", "fuelFull" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
    };

    class glass {
        name = "STR_Shops_Glass";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "glass" };
    };

    class iron  {
        name = "STR_Shops_Minerals";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "iron_refined", "copper_refined" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_uncut", "diamond_cut" };
    };

    class salt {
        name = "STR_Shops_Salt";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salt_refined" };
    };

    class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cement" };
    };
	
    class artefact {
        name = "STR_Shops_Artefact";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "artefact", "artefactg", "artefactb" };
    };

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "goldbar" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "donuts", "coffee", "spikeStrip","defibrillator","toolkit", "waterBottle", "rabbit", "apple", "redgull", "fuelFull", "defusekit","tracker", "lockpick" };
    };
	
	class alkbar {
        name = "STR_Shops_alkbar";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "redgull", "coffee" };
    };
	
	class uranium {
        name = "STR_Shops_Uranium";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "uranium_fuelrod" };
    };
	
	class uraniumil {
        name = "STR_Shops_Uranium";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "uranium_dirty" };
    };
	
	class moebel {
        name = "STR_Shops_moebel";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "bretter" };
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
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };
	
	class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 1;
        buyPrice = 300;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };
	
	class tracker {
        variable = "tracker";
        displayName = "STR_Item_Tracker";
        weight = 1;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\gps.paa";
    };
	
	class pliers {
		variable = "pliers";
		displayName = "STR_Item_pliers";
		weight = 4;
		buyPrice = 840;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\pliers.paa";
	};

	class toolkit {
		variable = "toolkit";
		displayName = "STR_Item_Toolkit";
		weight = 4;
		buyPrice = 550;
		sellPrice = 100;
		illegal = false;
		edible = -1;
		icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
	};

    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "STR_Item_FuelE";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuelEmpty.paa";
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
        sellPrice = 1200;
        illegal = false;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };
	
	class knife {
		variable = "knife";
        displayName = "STR_Item_Knife";
        weight = 4;
        buyPrice = 500;
        sellPrice = -1;
        illegal = false;
        edible = -1;
		icon = "icons\knife.paa";
	};

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 140000;
        sellPrice = 75;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 95000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 1800000;
        sellPrice = 1000;
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
        illegal = false;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 75000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 150000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	
	class zipties {
		variable = "zipties";
		displayName = "STR_Item_zipties";
		weight = 4;
		buyPrice = 20000;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\ziptie.paa";
	};
	
	class handcuffs {
		variable = "handcuffs";
		displayName = "STR_Item_handcuffs";
		weight = 4;
		buyPrice = 200;
		sellPrice = -1;
		illegal = true;
		edible = -1;
		icon = "icons\cuffs.paa";
	};
	
	class handcuffkeys {
		variable = "handcuffkeys";
		displayName = "STR_Item_handcuffkeys";
		weight = 4;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\keys.paa";
	};
	

	class feuerwerkrandom {
		variable = "feuerwerkrandom";
		displayName = "STR_Item_feuerwerkrandom";
		weight = 10;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\feuerwerkrandom.paa";
	};
	
		class feuerwerkred {
		variable = "feuerwerkred";
		displayName = "STR_Item_feuerwerkred";
		weight = 10;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\feuerwerkred.paa";
	};

	class feuerwerkblue {
		variable = "feuerwerkblue";
		displayName = "STR_Item_feuerwerkblue";
		weight = 10;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\feuerwerkblue.paa";
	};
	
	class feuerwerkgreen {
		variable = "feuerwerkgreen";
		displayName = "STR_Item_feuerwerkgreen";
		weight = 10;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\feuerwerkgreen.paa";
	};
	
	class feuerwerkwhite {
		variable = "feuerwerkwhite";
		displayName = "STR_Item_feuerwerkwhite";
		weight = 10;
		buyPrice = 12500;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\feuerwerkwhite.paa";
	};

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 6;
        buyPrice = -1;
        sellPrice = 4200;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilProcessed.paa";
    };
	//Artefakt
	class artefact {
        variable = "artefact";
        displayName = "STR_Item_Artefact";
        weight = 4;
        buyPrice = -1;
        sellPrice = 1500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_artefact.paa";
    };

    class artefactg {
        variable = "artefactg";
        displayName = "STR_Item_Artefactg";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_artefactg.paa";
    };
	
	class artefactb {
        variable = "artefactb";
        displayName = "STR_Item_Artefactb";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_artefactb.paa";
    };
	
    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
	icon = "icons\ico_copper.paa";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 4600;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2450;
        illegal = false;
        edible = -1;
	icon = "icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 2;
        buyPrice = -1;
        sellPrice = 4800;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2250;
        illegal = false;
        edible = -1;
	icon = "icons\ico_cement.paa";
    };
	
    class holz {
        variable = "holz";
        displayName = "STR_Item_Holz";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\holz.paa";
    };
	
    class bretter {
        variable = "bretter";
        displayName = "STR_Item_Bretter";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1950;
        illegal = false;
        edible = -1;
	icon = "icons\holzbretter.paa";
    };
	
	class metal {
        variable = "metal";
        displayName = "STR_Item_metal";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\metalplate.paa";
    };
	class nplate {
        variable = "nplate";
        displayName = "STR_Item_Nplate";
        weight = 1;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
	icon = "icons\numberplate.paa";
    };

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "STR_Item_HeroinP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 7200;
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
        sellPrice = 5550;
        illegal = true;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
    };
	
    class pilze {
        variable = "pilze";
        displayName = "STR_Item_Pilze";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\pilze.paa";
        processedItem = "mash";
    };
	
    class mash {
        variable = "mash";
        displayName = "STR_Item_Mash";
        weight = 3;
        buyPrice = -1;
        sellPrice = 4550;
        illegal = true;
        edible = -1;
        icon = "icons\pilzep.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 8500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };
	class rye {
        variable = "rye";
        displayName = "STR_Item_Rye";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
		icon = "icons\rye.paa";
		processedItem = "rye";
    };
	
	class lsd {
        variable = "lsd";
        displayName = "STR_Item_Lsd";
        weight = 2;
        buyPrice = -1;
        sellPrice = 3500;
        illegal = true;
        edible = -1;
		icon = "icons\lsd.paa";
		processedItem = "lsd";
    };
	
	//Uran

	class uranium_ore {
        variable = "uranium_ore";
        displayName = "STR_Item_UraniumOre";
        weight = 20;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\uranium_ore.paa";
    };
	
	class uranium_cleaned {
        variable = "uranium_cleaned";
        displayName = "STR_Item_UraniumCleaned";
        weight = 16;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium_ore.paa";
    };
	
	class uranium_processed {
        variable = "uranium_processed";
        displayName = "STR_Item_UraniumProcessed";
        weight = 12;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium_ore.paa";
    };
	
	class uranium_enriched {
        variable = "uranium_enriched";
        displayName = "STR_Item_UraniumEnriched";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium_ore.paa";
    };
	
	class uranium_fuelrod {
        variable = "uranium_fuelrod";
        displayName = "STR_Item_UraniumFuelRod";
        weight = 8;
        buyPrice = -1;
        sellPrice = 10500;
        illegal = false;
        edible = -1;
        icon = "icons\uranium_fuelrod.paa";
    };
	
	class uranium_dirty {
        variable = "uranium_dirty";
        displayName = "STR_Item_UraniumDirty";
        weight = 4;
        buyPrice = -1;
        sellPrice = 15500;
        illegal = true;
        edible = -1;
        icon = "icons\uranium_ore.paa";
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

    //Food
    class apple {
        variable = "apple";
        displayName = "STR_Item_Apple";
        weight = 1;
        buyPrice = 65;
        sellPrice = 50;
        illegal = false;
        edible = 10;
        icon = "icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 68;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "icons\ico_peach.paa";
    };
	
	class trauben {
        variable = "trauben";
        displayName = "STR_Item_Traube";
        weight = 1;
        buyPrice = 68;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "icons\traube.paa";
    };
	
	class bananen {
        variable = "bananen";
        displayName = "STR_Item_Banane";
        weight = 1;
        buyPrice = 68;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "icons\banana.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 150;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_tBacon.paa";
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
        icon = "icons\ico_rabbitRaw.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = 150;
        sellPrice = 115;
        illegal = false;
        edible = 20;
        icon = "icons\ico_rabbit.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
        displayName = "STR_Item_SalemaRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 45;
        illegal = false;
        edible = -1;
        icon = "icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 75;
        sellPrice = 55;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 175;
        sellPrice = 150;
        illegal = false;
        edible = 25;
        icon = "icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 175;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 250;
        sellPrice = 200;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 700;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 1250;
        sellPrice = 1000;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 250;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 600;
        sellPrice = 400;
        illegal = false;
        edible = 80;
        icon = "icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 750;
        sellPrice = 500;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = 100;
        icon = "icons\ico_turtleSoup.paa";
    };

    class hen_raw {
        variable = "henRaw";
        displayName = "STR_Item_HenRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "icons\ico_wholeChickenRaw.paa";
    };

    class hen {
        variable = "hen";
        displayName = "STR_Item_Hen";
        weight = 1;
        buyPrice = 115;
        sellPrice = 85;
        illegal = false;
        edible = 65;
        icon = "icons\ico_wholeChicken.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
        displayName = "STR_Item_RoosterRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "icons\ico_chickenDrumstickRaw.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "STR_Item_Rooster";
        weight = 115;
        buyPrice = 90;
        sellPrice = 85;
        illegal = false;
        edible = 45;
        icon = "icons\ico_chickenDrumstick.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
        displayName = "STR_Item_SheepRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lambChopRaw.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "STR_Item_Sheep";
        weight = 2;
        buyPrice = 155;
        sellPrice = 115;
        illegal = false;
        edible = 100;
        icon = "icons\ico_lambChop.paa";
    };

    class goat_raw {
        variable = "goatRaw";
        displayName = "STR_Item_GoatRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 115;
        illegal = false;
        edible = -1;
        icon = "icons\ico_muttonLegRaw.paa";
    };

    class goat {
        variable = "goat";
        displayName = "STR_Item_Goat";
        weight = 2;
        buyPrice = 175;
        sellPrice = 135;
        illegal = false;
        edible = 100;
        icon = "icons\ico_muttonLeg.paa";
    };
	
	//Crafting	
	class barrel {
        variable = "barrel";
        displayName = "STR_Item_Barrel";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\barrel.paa";
    };
	
	class butt {
        variable = "butt";
        displayName = "STR_Item_Butt";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\butt.paa";
    };
	
	class sight {
        variable = "sight";
        displayName = "STR_Item_Sight";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\sight.paa";
    };
	
	class trigger {
        variable = "trigger";
        displayName = "STR_Item_Trigger";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\trigger.paa";
    };
	
	class engine {
        variable = "engine";
        displayName = "STR_Item_Engine";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\engine.paa";
    };
	
	class plans {
        variable = "plans";
        displayName = "STR_Item_Plans";
        weight = 1;
        buyPrice = 460;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\plans.paa";
    };
	
	class rivet {
        variable = "rivet";
        displayName = "STR_Item_rivet";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\rivet.paa";
    };
	class latch {
        variable = "latch";
        displayName = "STR_Item_latch";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\latch.paa";
    };
	class sheet_metal {
        variable = "sheet_metal";
        displayName = "STR_Item_Sheet_metal";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	icon = "icons\craft\metalplate.paa";
    };
};
