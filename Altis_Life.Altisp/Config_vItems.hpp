/*
*    Format:pliki acida
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
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "toolkit", "pickaxe", "fuelFull", "peach", "rabbit_raw", "hen_raw", "rooster_raw", "storagesmall", "storagebig", "sheep_raw", "tobacco_processed", "goat_raw" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "ziptie", "scalpel", "storagesmall", "storagebig" };
    };

    class zolnierz {
        name = "STR_Shops_Zolnierz";
        side = "civ";
        license = "zolnierz";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "ziptie", "scalpel", "storagesmall", "storagebig" };
    };

    class sec{
        name = "STR_Shops_Sec";
        side = "civ";
        license = "sec";
        level[] = { "", "", -1, "" };
        items[] = { "coffee", "donuts", "redgull", "pickaxe", "toolkit", "fuelFull", "ziptie" };
    };

    class don_market {
        name = "STR_Shops_Market";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "ziptie", "scalpel" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "pickaxe", "toolkit", "fuelFull", "peach" };
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
        items[] = { "coffee", "donuts", "redgull", "toolkit", "fuelFull"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "moonshine", "bottledshine", "buran" };
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

    class guma {
        name = "STR_Shops_Guma";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "guma" };
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
        items[] = { "donuts", "coffee", "spikeStrip", "redgull", "toolkit", "fuelFull", "defusekit"};
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "fuelFull", "peach", "toolkit", "defibrillator", "morphine", "lizak", "kidney" };
    };

    class bar {
        name = "STR_Shops_Bar";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "bottles", "beer", "whiskey", "bottledbeer", "bottledwhiskey" };
    };

    class speakeasy {
        name = "STR_Shops_Speakeasy";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "bottledwhiskey", "bottledshine", "bottledbeer", "moonshine", "cornmeal", "bottles" };
    };
    class prety {
        name = "STR_Shops_prety";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "uranpre" };
    };
	class jewelery {
        name = "STR_Shops_jewelery";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "jewelery" };
    };
	class silver {
        name = "STR_Shops_s_shop";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "s_pro" };
    };
	class organ {
        name = "STR_Shops_szalony";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "scalpel", "kidney" };
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
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 2000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "\a3\weapons_f\items\data\UI\gear_toolkit_ca.paa";
    };

    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 90;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
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
        sellPrice = -1;
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
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 20000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class ziptie {
        variable = "ziptie";
        displayName = "STR_Item_Ziptie";
        weight = 1;
        buyPrice = 30000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_ziptie.paa";
    };


    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 10;
        buyPrice = -1;
        sellPrice = 200000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 150000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 120000;
        sellPrice = -1;
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
        buyPrice = 50000;
        sellPrice = 1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 100000;
        sellPrice = 1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	
	class morphine {
        variable = "morphine";
        displayName = "STR_Item_Morphine";
        weight = 2;
        buyPrice = 1500;
        sellPrice = 1;
        illegal = true;
        edible = -1;
        icon = "icons\Morphine.paa";
    };

    class lizak {
        variable = "lizak";
        displayName = "STR_Item_Lizak";
        weight = 2;
        buyPrice = 200;
        sellPrice = 1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lizak.paa";
    };

    //Alkohole
    class bottledwhiskey {
        variable = "bottledwhiskey";
        displayName = "STR_Item_BottledWhiskey";
        weight = 2;
        buyPrice = 16000;
        sellPrice = 12000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_Whiskey.paa";
    };

    class bottledbeer {
        variable = "bottledbeer";
        displayName = "STR_Item_BottledBeer";
        weight = 2;
        buyPrice = 8000;
        sellPrice = 6500;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class whiskey {
        variable = "whiskey";
        displayName = "STR_Item_Whiskey";
        weight = 2;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class beer {
        variable = "beer";
        displayName = "STR_Item_Beer";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2000;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class rye {
        variable = "rye";
        displayName = "STR_Item_Rye";
        weight = 2;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class hops {
        variable = "hops";
        displayName = "STR_Item_Hops";
        weight = 2;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class yeast {
        variable = "yeast";
        displayName = "STR_Item_Yeast";
        weight = 2;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class cornmeal {
        variable = "cornmeal";
        displayName = "STR_Item_Cornmeal";
        weight = 2;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class bottles {
        variable = "bottles";
        displayName = "STR_Item_Bottles";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1800;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class bottledshine {
        variable = "bottledshine";
        displayName = "STR_Item_BottledShine";
        weight = 2;
        buyPrice = 16000;
        sellPrice = 9500;
        illegal = true;
        edible = -1;
        icon = "";
    };

    class moonshine {
        variable = "moonshine";
        displayName = "STR_Item_Moonshine";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "";
    };

    class mash {
        variable = "mash";
        displayName = "STR_Item_Mash";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "";
    };

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 1;
        buyPrice = -1;
        sellPrice = 6250;
        illegal = false;
        edible = -1;
        icon = "icons\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1900;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_copper.paa";
    };

    class kauczuk {
        variable = "kauczuk";
        displayName = "STR_Item_Kauczuk";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
          icon = "icons\kauczuk.paa";
    };

    class guma {
        variable = "guma";
        displayName = "STR_Item_Guma";
        weight = 2;
        buyPrice = -1;
        sellPrice = 5700;
        illegal = false;
        edible = -1;
          icon = "icons\guma.paa";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3600;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 2;
        buyPrice = -1;
        sellPrice = 3950;
        illegal = false;
        edible = -1;
        icon = "icons\ico_saltProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 2;
        buyPrice = -1;
        sellPrice = 4600;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 6;
        buyPrice = -1;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 4;
        buyPrice = -1;
        sellPrice = 7000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 7;
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
        sellPrice = 4200;
        illegal = false;
        edible = -1;
	      icon = "icons\ico_cement.paa";
    };

    //Drugs
	 class tobacco_unprocessed {
        variable = "tobaccoUnprocessed";
        displayName = "STR_Item_TobaccoU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "";
        processedItem = "tobacco_processed";
    };
	
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 5;
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
        sellPrice = 12000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 5;
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
        sellPrice = 9000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
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
        sellPrice = 14000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 8000;
        sellPrice = -1;
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
        buyPrice = 60;
        sellPrice = 60;
        illegal = false;
        edible = 10;
        icon = "icons\ico_peach.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 75;
        sellPrice = -1;
        illegal = false;
        edible = 40;
        icon = "icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = -1;
        illegal = false;
        edible = 30;
        icon = "icons\ico_donuts.paa";
    };
	
	class tobacco_processed {
        variable = "tobaccoProcessed";
        displayName = "STR_Item_Tobacco";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1200;
        illegal = false;
        edible = -1;
        icon = "icons\papier.paa";
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
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 750;
        sellPrice = 550;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 1750;
        sellPrice = 1500;
        illegal = false;
        edible = 25;
        icon = "icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 4000;
        sellPrice = 3500;
        illegal = false;
        edible = 30;
        icon = "icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 4000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 7250;
        sellPrice = 6500;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 8000;
        sellPrice = 7000;
        illegal = false;
        edible = 80;
        icon = "icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 7500;
        sellPrice = 7100;
        illegal = false;
        edible = 100;
        icon = "icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 25000;
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
        sellPrice = 950;
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
        sellPrice = 1150;
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
	//uran
	class uranwy {
        variable = "uranwy";
        displayName = "STR_Item_uranwy";
        weight = 11;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\uranium1.paa";
    };
	class uranoc {
        variable = "uranoc";
        displayName = "STR_Item_uranoc";
        weight = 10;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\uran1.paa";
    };
	class uranpr {
        variable = "uranpr";
        displayName = "STR_Item_uranpr";
        weight = 9;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\uran2.paa";
    };
	class uranwz {
        variable = "uranwz";
        displayName = "STR_Item_uranwz";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\uran4.paa";
    };
	class uranpre {
        variable = "uranpre";
        displayName = "STR_Item_uranpre";
        weight = 7;
        buyPrice = -1;
        sellPrice = 59000;
        illegal = false;
        edible = -1;
        icon = "icons\fuel_rod.paa";
    };
	class buran {
        variable = "buran";
        displayName = "STR_Item_buran";
        weight = 8;
        buyPrice = -1;
        sellPrice = 40000;
        illegal = true;
        edible = -1;
        icon = "icons\uran3.paa";
    };
	class s_ore {
        variable = "s_ore";
        displayName = "STR_Item_s_ore";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\s_ore.paa";
    };
	class s_pro {
        variable = "s_pro";
        displayName = "STR_Item_s_pro";
        weight = 6;
        buyPrice = -1;
        sellPrice = 4000;
        illegal = false;
        edible = -1;
        icon = "icons\silver.paa";
    };
	class jewelery {
        variable = "jewelery";
        displayName = "STR_Item_jewelery";
        weight = 5;
        buyPrice = -1;
        sellPrice = 41000;
        illegal = false;
        edible = -1;
        icon = "icons\schmuck.paa";
    };
	class kidney {
        variable = "kidney";
        displayName = "STR_Item_kidney";
        weight = 2;
        buyPrice = 150000;
        sellPrice = 40000;
        illegal = true;
        edible = -1;
        icon = "icons\nera.paa";
    };
	class scalpel {
        variable = "scalpel";
        displayName = "STR_Item_skalpel";
        weight = 2;
        buyPrice = 20000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\skalpel.paa";
    };
};
