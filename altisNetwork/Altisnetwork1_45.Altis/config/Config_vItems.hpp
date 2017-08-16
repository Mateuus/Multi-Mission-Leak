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
        items[] = { "waterBottle", "lockpick", "shovel", "goldteeth", "hemp", "axe", "woodplanks", "spring", "gunmetal", "rabbit", "apple", "redgull", "tbacon", "pickaxe", "toolkit", "fuelFull", "peach", "storagesmall", "storagebig", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw", "artifactold","artifactoldp","artifactnew","artifactnewp","gold","goldp" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "toolkit", "fuelFull", "peach", "defibrillator", "snapgun" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "zipties", "blindfold" };
    };

    class gangbase {
        name = "STR_Shops_GangBase";
        side = "civ";
        license = "rebel";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "zipties", "blindfold" };
    };
	
	class bountyhunter_m {
        name = "Bounty Hunter Market";
        side = "civ";
        license = "bountyhunter";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "zipties" };
    };
	
 	class corp {
		name = "STR_Shops_Corp";
		side = "civ";
		license = "corp";
		level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "rabbit", "coconut", "redgull", "tbacon", "lockpick", "toolkit", "pickaxe", "chainsaw", "fuelFull", "banana", "boltcutter" };
	};

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "zipties", "blindfold" };
    };

    class mineral {
		name = "STR_Shops_mineral";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "silverp", "platinum_processed","iron_refined", "copper_refined", "ruby_refined", "diamond_cut" };
	};
	
	class uranium {
		name = "STR_Shops_uranium";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "uranium1", "uranium2","uranium3","uranium4","uranium5", "uraniump" };
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
        items[] = { "coffee", "donuts", "redgull", "toolkit", "fuelFull" };
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "methp", "LSDp", "heroin_unprocessed", "cannabis", "cocaine_unprocessed", "LSDu", "methu" };
    };
	
	class cold {
		name = "STR_Shops_cold";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "cold", "ephedrine" };
	};

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "oilp", "pickaxe", "fuelFull", "oilu","emptyoil" };
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
	//--tobacco
    class tabacop  {
        name = "STR_Shops_tabacop";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "tabacop" };
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
	
    class rice {
        name = "STR_Shops_rice";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "ricep" };
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
        items[] = { "gpstracker", "carC4","donuts", "coffee","panicbutton", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "toolkit", "fuelFull", "defusekit", "snapgun" };
    };

    class counterfitCash {
        name = "STR_Shops_CounterfitCash";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "counterfitCash" };
    };
	
	class pub {
		name = "STR_Shops_Pub";
		side = "civ";
		license = "";
		level[] = { "", "", -1, "" };
		items[] = { "apple_cider" };
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

    class emptyoil {
        variable = "emptyoil";
        displayName = "STR_Item_emptyoil";
        weight = 4;
        buyPrice = 2000;
        sellPrice = 1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_emptyoil.paa";
        description = "Empty Oil Barrel can be filled at the oil rig";  
    };

    class carC4 {
        variable = "carC4";
        displayName = "STR_Item_carC4";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class codeCracker {
        variable = "codeCracker";
        displayName = "STR_Item_codeCracker";
        weight = 2;
        buyPrice = 14000;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "icons\codeCracker.paa";
    };

    class counterfitCash {
        variable = "counterfitCash";
        displayName = "STR_Item_counterfitCash";
        weight = 4;
        buyPrice = -1;
        sellPrice = 52500;
        illegal = true;
        edible = -1;
        icon = "icons\counterfitCash.paa";
    };
    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 500;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
    };

	class shovel {
        variable = "shovel";
        displayName = "STR_Item_Shovel";
        weight = 2;
        buyPrice = 500;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_shovel.paa";
    };
	
	class axe {
        variable = "axe";
        displayName = "STR_Item_axe";
        weight = 2;
        buyPrice = 500;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_axe.paa";
    };
	
    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defibrillator.paa";
    };
	
	class gpstracker {
        variable = "gpstracker";
        displayName = "STR_Item_GPSTracker";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_gpstracker.paa";
    };

    class toolkit {
        variable = "toolkit";
        displayName = "STR_Item_Toolkit";
        weight = 2;
        buyPrice = 1500;
        sellPrice = 0;
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

	class snapgun {
        variable = "snapgun";
        displayName = "STR_Item_Snapgun";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

	
    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 500;
        sellPrice = 499;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 1;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 3000;
        sellPrice = 75;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class cprKit {
        variable = "cprKit";
        displayName = "STR_Item_CPRMediKit";
        weight = 5;
        buyPrice = 20000;
        sellPrice = 7500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_defib.paa";
    }; 
//--Part of zipties
    class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 0;
        buyPrice = 1200;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ziptie.paa";
    };
	
	class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 0;
        buyPrice = 600;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\blindfold.paa";
    };
//--End of 
    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 125000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 100000;
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
        buyPrice = 0;
        sellPrice = 0;
        illegal = true;
        edible = -1;
        icon = "icons\ico_defuseKit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 250000;
        sellPrice = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 750000;
        sellPrice = 125000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

    //Mined Items
    class oilu {
        variable = "oilu";
        displayName = "STR_Item_OilU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_oilUnprocessed.paa";
    };

    class oilp {
        variable = "oilp";
        displayName = "STR_Item_OilP";
        weight = 4;
        buyPrice = 25000;
        sellPrice = 12000;
        illegal = true;
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
        weight = 2;
        buyPrice = 3000;
        sellPrice = 2600;
        illegal = false;
        edible = -1;
        icon = "icons\ico_copper.paa";
        description = "license Price: 150k | You can buy the license from any of the mineral Processors";
    };
	
    class silveru {
        variable = "silveru";
        displayName = "STR_Item_silveru";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\silveru.paa";
    };

    class silverp {
        variable = "silverp";
        displayName = "STR_Item_silverp";
        weight = 3;
        buyPrice = 3100;
        sellPrice = 2700;
        illegal = false;
        edible = -1;
        icon = "icons\silverp.paa";
        description = "license Price: 350k | You can buy the license from any of the mineral Processors";
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
        weight = 2;
        buyPrice = 3000;
        sellPrice = 2300;
        illegal = false;
        edible = -1;
        icon = "icons\ico_iron.paa";
        description = "license Price: 250k | You can buy the license from any of the mineral Processors";
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
        description = "Un-refined Salt. Processed at the Salt Processor. Also gathered from the Tears of Reaper Two Fingers Apollo.";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 1;
        buyPrice = 3000;
        sellPrice = 1500;
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
        sellPrice = 1300;
        illegal = false;
        edible = -1;
        icon = "icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = 1500;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 3;
        buyPrice = 6000;
        sellPrice = 3650;
        illegal = false;
        edible = -1;
        icon = "icons\ico_diamondCut.paa";
        description = "license Price: 550k | You can buy the license from any of the mineral Processors";
    };
	
    class riceu {
        variable = "riceu";
        displayName = "STR_Item_riceu";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\riceu.paa";
    };
	
    class ricep {
        variable = "ricep";
        displayName = "STR_Item_ricep";
        weight = 2;
        buyPrice = 2000;
        sellPrice = 1000;
        illegal = false;
        edible = -1;
        icon = "icons\ricep.paa";
    };
	
    class tabacou {
        variable = "tabacou";
        displayName = "STR_Item_tabacou";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\tobacou.paa";
    };

    class tabacop {
        variable = "tabacop";
        displayName = "STR_Item_tabacop";
        weight = 3;
        buyPrice = 2000;
        sellPrice = 1250;
        illegal = false;
        edible = -1;
        icon = "icons\tobacop.paa";
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
	
    class uranium1 {
        variable = "uranium1";
        displayName = "STR_Item_uranium1";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium1.paa";
    };
	
    class uranium2 {
        variable = "uranium2";
        displayName = "STR_Item_uranium2";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium2.paa";
    };
	
    class uranium3 {
        variable = "uranium3";
        displayName = "STR_Item_uranium3";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium3.paa";
    };
	
    class uranium4 {
        variable = "uranium4";
        displayName = "STR_Item_uranium4";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium4.paa";
    };
	
    class uranium5 {
        variable = "uranium5";
        displayName = "STR_Item_uranium5";
        weight = 2;
        buyPrice = 50000;
        sellPrice = 25500;
        illegal = true;
        edible = -1;
        icon = "icons\uranium5.paa";
    };
	
    class uraniump {
        variable = "uraniump";
        displayName = "STR_Item_uraniump";
        weight = 2;
        buyPrice = 10000; //10000
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\uranium5.paa";
    };
	
    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 5;
        buyPrice = 1000;
        sellPrice = 1050;
        illegal = false;
        edible = -1;
        icon = "icons\ico_cement.paa";
    };
	
	class platinum_unrefined {
        variable = "platinum_unrefined";
        displayName = "STR_Item_PlatinumU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
		icon = "icons\ico_ironOre.paa";
    };

	class platinum_processed {
        variable = "platinum_processed";
        displayName = "STR_Item_PlatinumP";
        weight = 4;
        buyPrice = 6000;
        sellPrice = 3550;
        illegal = false;
        edible = -1;
		icon = "icons\ico_iron.paa";
        description = "license Price: 650k | You can buy the license from any of the mineral Processors";
    };

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 4;
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
        weight = 3;
        buyPrice = 6000;
        sellPrice = 4500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_heroinProcessed.paa";
        description = "license Price: 350k | You can buy the license from any of the license offices";
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
        buyPrice = 6000;
        sellPrice = 4000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_marijuana.paa";
        description = "license Price: 150k | You can buy the license from any of the license offices";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 4;
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
        weight = 3;
        buyPrice = 8000;
        sellPrice = 5500;
        illegal = true;
        edible = -1;
        icon = "icons\ico_cocaineProcessed.paa";
        description = "license Price: 550k | You can buy the license from any of the license offices";
    };
	
    class LSDu {
        variable = "LSDu";
        displayName = "STR_Item_LSDu";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_LSDu.paa";
        processedItem = "LSDp";
    };

    class LSDp {
        variable = "LSDp";
        displayName = "STR_Item_LSDp";
        weight = 4;
        buyPrice = 8500;
        sellPrice = 6900;
        illegal = true;
        edible = -1;
        icon = "icons\ico_LSDp.paa";
        description = "license Price: 750k | You can buy the license from any of the license offices";
    };
	
    class ephedrine {
        variable = "ephedrine";
        displayName = "STR_Item_ephedrine";
        weight = 4;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "icons\ico_ephedrene.paa";
    };
	
    class cold {
        variable = "cold";
        displayName = "STR_Item_cold";
        weight = 4;
        buyPrice = 1000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\ico_cold.paa";
    };

    class methu	{  
        variable = "methu";  
        displayName = "STR_Item_methu";  
        weight = 5;  
        buyPrice = -1;  
        sellPrice = -1;  
        illegal = true;  
        edible = -1;   
        //processedItem = "meth"; 
        icon = "icons\ico_methu.paa"; 
    };  
	class methp {  
        variable = "methp";  
        displayName = "STR_Item_Methp";  
        weight = 4;  
        buyPrice = 8000;  
        sellPrice = 6300; 
        illegal = true;  
        edible = -1;  
        icon = "icons\ico_methp.paa";
        description = "license Price: 950k | You can buy the license from any of the license offices";  
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
        buyPrice = 500;
        sellPrice = 80;
        illegal = false;
        edible = 5;
        icon = "icons\ico_apple.paa";
    };
	
	class apple_cider {
		variable = "apple_cider";
		displayName  = "STR_Item_AppleC";
		weight = 5;
		buyPrice = 1200;
		sellPrice = 1000;
		illegal = false;
		edible = 50;
		icon = "";
	};

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 200;
        sellPrice = 80;
        illegal = false;
        edible = 5;
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

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 60;
        sellPrice = 40;
        illegal = false;
        edible = 100;
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
        weight = 9;
        buyPrice = -1;
        sellPrice = 8000;
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
	
	class ruby_raw {
        variable = "ruby_raw";
        displayName = "STR_Item_RubyRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\rubyr.paa";
    };

    class ruby_refined {
        variable = "ruby_refined";
        displayName = "STR_Item_Ruby";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3250;
        illegal = false;
        edible = -1;
        icon = "icons\ruby.paa";
        description = "license Price: 450k | You can buy the license from any of the mineral Processors";
    };

    class woodplanks {
        variable = "woodplanks";
        displayName = "STR_Item_woodPlanks";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "icons\ico_wood.paa";
    };

	class hemp {
        variable = "hemp";
        displayName = "STR_Item_hemp";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = 100;
        icon = "icons\ico_hemp.paa";
    };
	
   class spring {
        variable = "spring";
        displayName = "STR_Item_spring";
        weight = 3;
        buyPrice = -1;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "icons\spring.paa";
    };
	
	class goldteeth {
        variable = "goldteeth";
        displayName = "STR_Item_goldteeth";
        weight = 3;
        buyPrice = 18000;
        sellPrice = 350;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldteeth.paa";
    };
	
	class riflebody {
		variable = "riflebody";
		displayName = "STR_Item_riflebody";
		weight = 20;
		buyPrice = -1;
		sellPrice = 5000;
		illegal = true;
		edible = false;
		icon = "icons\rbody.paa";
	};

	class riflestock {
		variable = "riflestock";
		displayName = "STR_Item_riflestock";
		weight = 8;
		buyPrice = -1;
		sellPrice = 5000;
		illegal = true;
		edible = false;
		icon = "icons\rstock.paa";
	};

	class riflebarrel {
		variable = "riflebarrel";
		displayName  = "STR_Item_riflebarrel";
		weight = 7;
		buyPrice = -1;
		sellPrice = 5000;
		illegal = true;
		edible = false;
		icon = "icons\rbarrel.paa";
	};

	class pistolbody {
		variable = "pistolbody";
		displayName = "STR_Item_pistolbody";
		weight = 15;
		buyPrice = -1;
		sellPrice = 2500;
		illegal = true;
		edible = false;
		icon = "icons\pbody.paa";
	};

	class pistolbarrel {
		variable = "pistolbarrel";
		displayName  = "STR_Item_pistolbarrel";
		weight = 7;
		buyPrice = -1;
		sellPrice = 2500;
		illegal = true;
		edible = false;
		icon = "icons\pbarrel.paa";
	};
	
	class gunmetal {
        variable = "gunmetal";
        displayName = "STR_Item_gunmetal";
        weight = 2;
        buyPrice = -1;
        sellPrice = 100;
        illegal = true;
        edible = -1;
        icon = "icons\gmetal.paa";
    };
	
    //shipwrecks
    class artifactold {
        variable = "artifactold";
        displayName = "STR_Item_artifactold";
        weight = 12;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\artifactold.paa";
    };

    class artifactoldp {
        variable = "artifactoldp";
        displayName = "STR_Item_artifactold2";
        weight = 12;
        buyPrice = -1;
        sellPrice = 415000;
        illegal = false;
        edible = -1;
        icon = "icons\artifactoldp.paa";
    };

    class artifactnew {
        variable = "artifactnew";
        displayName = "STR_Item_artifactnew";
        weight = 12;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "icons\artifactnew.paa";
    };
	
	class artifactnewp {
        variable = "artifactnewp";
        displayName = "STR_Item_artifactnew2";
        weight = 12;
        buyPrice = -1;
        sellPrice = 250000;
        illegal = false;
        edible = -1;
        icon = "icons\artifactnewp.paa";
    };

    class gold {
        variable = "gold";
        displayName = "STR_Item_goldflake";
        weight = 12;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class goldp {
        variable = "goldp";
        displayName = "STR_Item_goldflake2";
        weight = 10;
        buyPrice = -1;
        sellPrice = 250000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class panicbutton {
        variable = "panicbutton";
        displayName = "STR_Item_PanicButton";
        weight = 2;
        buyPrice = 0;
        sellPrice = 0;
        illegal = false;
        edible = -1;
        icon = "icons\redbutton.paa";
    };
    //--New Gems
    class quartz {
        variable = "quartz";
        displayName = "STR_Item_quartz";
        weight = 1;
        buyPrice = 0;
        sellPrice = 800;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class emerald {
        variable = "emerald";
        displayName = "STR_Item_emerald";
        weight = 1;
        buyPrice = 0;
        sellPrice = 1100;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class sapphire {
        variable = "sapphire";
        displayName = "STR_Item_sapphire";
        weight = 1;
        buyPrice = 0;
        sellPrice = 1500;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class topaz {
        variable = "topaz";
        displayName = "STR_Item_topaz";
        weight = 1;
        buyPrice = 0;
        sellPrice = 1800;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class aquamarine {
        variable = "aquamarine";
        displayName = "STR_Item_aquamarine";
        weight = 1;
        buyPrice = 0;
        sellPrice = 2800;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class amber {
        variable = "amber";
        displayName = "STR_Item_amber";
        weight = 1;
        buyPrice = 0;
        sellPrice = 3500;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class jade {
        variable = "jade";
        displayName = "STR_Item_jade";
        weight = 1;
        buyPrice = 0;
        sellPrice = 3800;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class tigereye {
        variable = "tigereye";
        displayName = "STR_Item_tigereye";
        weight = 1;
        buyPrice = 0;
        sellPrice = 4000;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class amethyst {
        variable = "amethyst";
        displayName = "STR_Item_amethyst";
        weight = 1;
        buyPrice = 0;
        sellPrice = 4500;
        illegal = false;
        edible = -1;
        icon = "";
    };
};
