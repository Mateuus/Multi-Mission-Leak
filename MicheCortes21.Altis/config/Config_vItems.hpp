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
        items[] = { "pickaxe", "netz", "schaufel", "axt", "fuelFull", "toolkit", "storagesmall", "storagebig", "waterBottle", "rabbit", "apple", "tbacon", "peach", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
    };
	
    class rebellen {
        name = "STR_Shops_Rebellen";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "pickaxe", "netz", "schaufel", "axt", "lockpick", "zipties", "fuelFull", "toolkit", "waterBottle", "blindfold", "apple", "tbacon", "peach"};
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "tbacon", "toolkit", "fuelFull", "peach", "defibrillator", "antikiotika", "bandage", "diaet", "pflaster", "salbe", "schwerzmittel", "skalpell", "lolli", "medictee", "sid" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "tbacon", "lockpick", "pickaxe", "netz", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge" };
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
        items[] = { "pickaxe", "netz", "schaufel", "axt", "fuelFull", "toolkit", "storagesmall", "storagebig", "waterBottle", "redgull", "rabbit", "apple", "tbacon", "peach", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana" };
    };
	
	class undergroundDealer {
        name = "STR_Shops_UndergroundDealer";
        side = "civ";
        license = "lsd";
        level[] = { "", "", -1, "" };
        items[] = { "lsd_processed" };
    };

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oil_processed" };
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
        items[] = { "iron_refined", "copper_refined", "silber_refined" };
    };
	
    class bauernhof  {
        name = "STR_Shops_Bauernhof";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "getreide_unrefined", "mais_unrefined" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "diamond_uncut", "diamond_cut", "perle_refined" };
    };

    class salt {
        name = "STR_Shops_Salt";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "salt_refined" };
    };
	
    class tea {
        name = "STR_Shops_Tea";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "tea_refined" };
    };
	
    class kakao {
        name = "STR_Shops_Kakao";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "schokolade_refined" };
		
    };
	
    class holz {
        name = "STR_Shops_holz";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "holzkohle_refined" };
    };

    class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cement" };
    };
	
    class redburger {
        name = "STR_Shops_redburger";
        side = "civ";
        license = ""; 
        level[] = { "", "", -1, "" };
        items[] = { "burger", "steak", "brezenstange", "softdrink" };
    };
	
	class blueking {
        name = "STR_Shops_blueking";
        side = "civ";
        license = ""; 
        level[] = { "", "", -1, "" };
        items[] = { "pizza", "bratwurst", "broetchen", "bloddymary" };
    };
	
	class seeds {
        name = "STR_Shops_seeds";
        side = "civ";
        license = ""; 
        level[] = { "", "", -1, "" };
        items[] = { "maisseeds", "cornseeds" };
    };

	class pfand {
        name = "STR_Shops_pfand";
        side = "civ";
        license = ""; 
        level[] = { "", "", -1, "" };
        items[] = { "pfandflasche" };
    };
 
    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "donuts", "coffee", "spikeStrip", "sos", "waterBottle", "rabbit", "apple", "redgull", "toolkit", "fuelFull", "defusekit", "lockpick" };
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
	
    class netz {
        variable = "netz";
        displayName = "STR_Item_netz";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_perlennetz.paa";
    };
	
    class schaufel {
        variable = "schaufel";
        displayName = "STR_Item_schaufel";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_schaufel.paa";
		
    };
	
    class axt {
        variable = "axt";
        displayName = "STR_Item_axt";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_axt.paa";
    };

// Medic
	
    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 900;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };
	
    class sid {
        variable = "sid";
        displayName = "STR_Item_sid";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_sid.paa";
    };
	
    class antibiotika {
        variable = "antibiotika";
        displayName = "STR_Item_antibiotika";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_antibiotika.paa";
    };
	
    class pfandflasche {
        variable = "pfandflasche";
        displayName = "STR_Item_pfandflasche";
        weight = 1;
        buyPrice = -1;
        sellPrice = 290;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pfand.paa";
    };
	
    class bandage {
        variable = "bandage";
        displayName = "STR_Item_bandage";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_bandage.paa";
    };
	
    class diaet {
        variable = "diaet";
        displayName = "STR_Item_diaet";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diaet.paa";
    };
	
    class lolli {
        variable = "lolli";
        displayName = "STR_Item_lolli";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lolli.paa";
    };
	
    class medictee {
        variable = "medictee";
        displayName = "STR_Item_medictee";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_medictee.paa";
    };
	
    class pflaster {
        variable = "pflaster";
        displayName = "STR_Item_pflaster";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pflaster.paa";
    };
	
    class salbe {
        variable = "salbe";
        displayName = "STR_Item_salbe";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_salbe.paa";
    };
	
    class schwerzmittel {
        variable = "schwerzmittel";
        displayName = "STR_Item_schwerzmittel";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_schwerzmittel.paa";
    };
	
    class skalpell {
        variable = "skalpell";
        displayName = "STR_Item_skalpell";
        weight = 1;
        buyPrice = 50;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "icons\ico_skalpell.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 4;
        buyPrice = 350;
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
        sellPrice = 10;
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
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };
	
	class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 1;
        buyPrice = 1200;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ziptie.paa";
    };
	
	class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 1;
        buyPrice = 600;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\blindfold.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 95000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 35000;
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
        icon = "icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = 2000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 75000;
        sellPrice = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 150000;
        sellPrice = 125000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };
	// Samen
    class appleseeds {
        variable = "appleseeds";
        displayName = "STR_Item_appleseeds";
        weight = 1;
        buyPrice = 150;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_seeds.paa";
    };
	
    class peachseeds {
        variable = "peachseeds";
        displayName = "STR_Item_peachseeds";
        weight = 1;
        buyPrice = 150;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_seeds.paa";
    };
	
    class cornseeds {
        variable = "cornseeds";
        displayName = "STR_Item_cornseeds";
        weight = 1;
        buyPrice = 150;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_seeds.paa";
    };
	
    class maisseeds {
        variable = "maisseeds";
        displayName = "STR_Item_maisseeds";
        weight = 1;
        buyPrice = 150;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_seeds.paa";
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
        weight = 5;
        buyPrice = 6400;
        sellPrice = 4367;
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
        illegal = false;
        edible = -1;
        icon = "icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = 3000;
        sellPrice = 2010;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copper.paa";
    };
	
	class kakao_unrefined {
        variable = "kakaoUnrefined";
        displayName = "STR_Item_kakaoOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_kakao.paa";
    };

    class schokolade_refined {
        variable = "schokoladeRefined";
        displayName = "STR_Item_schokolade";
        weight = 2;
        buyPrice = 6000;
        sellPrice = 3323;
        illegal = false;
        edible = -1;
        icon = "icons\ico_schokolade.paa";
		
    };
	
	class muschel_unrefined {
        variable = "muschelUnrefined";
        displayName = "STR_Item_muschelOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_muschel.paa";
    };

    class perle_refined {
        variable = "perleRefined";
        displayName = "STR_Item_perle";
        weight = 2;
        buyPrice = 10000;
        sellPrice = 6926;
        illegal = false;
        edible = -1;
        icon = "icons\ico_perle.paa";
    };
	
	class holz_unrefined {
        variable = "holzUnrefined";
        displayName = "STR_Item_holzOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_holz.paa";
    };

    class holzkohle_refined {
        variable = "holzkohleRefined";
        displayName = "STR_Item_holzkohle";
        weight = 3;
        buyPrice = 4500;
        sellPrice = 3127;
        illegal = false;
        edible = -1;
        icon = "icons\ico_holzkohle.paa";
    };

	class getreide_unrefined {
        variable = "getreideUnrefined";
        displayName = "STR_Item_getreideOre";
        weight = 4;
        buyPrice = 4000;
        sellPrice = 3229;
        illegal = false;
        edible = -1;
        icon = "icons\ico_getreideOre.paa";
    };
	
	class mais_unrefined {
        variable = "maisUnrefined";
        displayName = "STR_Item_maisOre";
        weight = 3;
        buyPrice = 3200;
        sellPrice = 1629;
        illegal = false;
        edible = -1;
        icon = "icons\ico_mais.paa";
    };
	
    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 4;
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
        buyPrice = 3500;
        sellPrice = 3312;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
    };
	
    class tea_unrefined {
        variable = "teaUnrefined";
        displayName = "STR_Item_TeaOre";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_teagather.paa";
    };

    class tea_refined {
        variable = "teaRefined";
        displayName = "STR_Item_TeaIngot";
        weight = 1;
        buyPrice = 2230;
        sellPrice = 1012;
        illegal = false;
        edible = -1;
        icon = "icons\ico_tea.paa";
    };
	
    class silber_unrefined {
        variable = "silberUnrefined";
        displayName = "STR_Item_silberOre";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_silverunprocessed.paa";
    };

    class silber_refined {
        variable = "silberRefined";
        displayName = "STR_Item_silberIngot";
        weight = 2;
        buyPrice = 3500;
        sellPrice = 3119;
        illegal = false;
        edible = -1;
        icon = "icons\ico_silverprocessed.paa";
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
        buyPrice = 6000;
        sellPrice = 4303;
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
        buyPrice = 3000;
        sellPrice = 2986;
        illegal = false;
        edible = -1;
        icon = "icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 2;
        buyPrice = 6000;
        sellPrice = 5112;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 3;
        buyPrice = 3000;
        sellPrice = 2711;
        illegal = false;
        edible = -1;
        icon = "icons\ico_cement.paa";
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
        buyPrice = 12000;
        sellPrice = 9881;
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
        buyPrice = 10000;
        sellPrice = 7599;
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
        buyPrice = 7000;
        sellPrice = 6855;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
    };
	
	class lsd_unprocessed {
        variable = "lsdUnprocessed";
        displayName = "STR_Item_LsdU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_frog.paa";
        processedItem = "lsd_processed";
    };
	
	class lsd_processed {
        variable = "lsdProcessed";
        displayName = "STR_Item_LsdP";
        weight = 3;
        buyPrice = 12000;
        sellPrice = 10500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lsd.paa";
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
	
	class softdrink {
        variable = "softdrink";
        displayName = "STR_Item_softdrink";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "icons\ico_softdrink.paa";
    };
	
	class bloddymary {
        variable = "bloddymary";
        displayName = "STR_Item_bloddymary";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "icons\ico_bloddymary.paa";
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
        buyPrice = 85;
        sellPrice = 70;
        illegal = false;
        edible = 10;
        icon = "icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 98;
        sellPrice = 85;
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
        icon = "icons\ico_tBacon.paa";
    };
	
    class burger {
        variable = "burger";
        displayName = "STR_Item_burger";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;                          
        icon = "icons\ico_burger.paa";
    };
	
	class steak {
        variable = "steak";
        displayName = "STR_Item_steak";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_steak.paa";
    };
	
    class brezenstange {
        variable = "brezenstange";
        displayName = "STR_Item_brezenstange";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_brezenstange.paa";
    };
	
    class pizza {
        variable = "piza";
        displayName = "STR_Item_pizza";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_pizza.paa";
    };
	
    class bratwurst {
        variable = "bratwurst";
        displayName = "STR_Item_bratwurst";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_bratwurst.paa";
    };
	
    class broetchen {
        variable = "broetchen";
        displayName = "STR_Item_broetchen";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "icons\ico_brötchen.paa";
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
        sellPrice = 15000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 23000;
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
	
	class sos {
        variable = "sos";
        displayName = "sos";
        weight = 1;
        buyPrice = 150;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "icons\sos.paa";
    };
};