class VirtualShops {
    class market {
        name = "STR_Shops_Market";
        side = "civ";
        conditions = "";
        items[] = { "debitcard", "bandages", "protest", "flashlight", "campfire", "gokart", "airhorn", "axe", "timber", "pdrill", "pickaxe", "toolkit", "fuelFull", "peach", "cloth", "goldcoin", "waterBottle", "apple", "pepsi", "cocaCola", "monsterEnergy", "doritos", "shittynoodles", "kfc", "easterEggs", "beer", "whiskey", "moonshine", "redgull", "tbacon", "rabbit_raw", "hen_raw", "rooster_raw", "sheep_raw", "goat_raw" };
    };

    class furniture {
        name = "STR_Shops_Furniture";
        side = "civ";
        conditions = "";
        items[] = {  "storagesmall", "storagebig", "furniturewoodtable","furnituretarget","furnitureportgen","furniturefmradio","furniturewoodblue","furnituremetalrack","furniturePalletVert","furnitureMapAltis","furnitureTentA","furnitureSunChairGreen","furnitureSunChair","furnitureSleepingBagBrown","furnitureSleepingBagBlue","furnitureSleepingBag","furniturecampingtable","furnitureopenlaptop","furniturebagshort","furniturechair","furnituredesk" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        conditions = "";
        items[] = { "debitcard", "bandages", "morphine", "flashlight", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "toolkit", "fuelFull", "peach", "defibrillator" };
    };

    class rebel {
        name = "STR_Shops_Rebel";
        side = "civ";
        conditions = "mav_ttm_var_rebel == 1;";
        items[] = { "debitcard",  "cyanideCapsule", "speedbomb", "gokart", "gpstracker", "flashlight", "barrel", "butt", "zipties", "pliers", "blindfold", "codeCracker", "bandages", "morphine", "cprKit", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "demolitioncharge" };
    };

    class terrorist {
        name = "STR_Shops_Rebel";
        side = "civ";
        conditions = "mav_ttm_var_terrorist == 1;";
        items[] = { "debitcard", "gokart", "speedbomb", "cyanideCapsule", "gpstracker", "flashlight", "barrel", "butt", "zipties", "pliers", "blindfold", "codeCracker", "bandages", "morphine", "cprKit", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "demolitioncharge" };
    };

    class donator {
        name = "STR_Shops_Donator";
        side = "civ";
        conditions = "call life_donorlevel >= 1";
        items[] = { "debitcard", "gokart", "speedbomb", "cyanideCapsule", "gpstracker", "flashlight", "barrel", "butt", "zipties", "pliers", "blindfold", "codeCracker", "bandages", "morphine", "cprKit", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "demolitioncharge" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        conditions = "";
        items[] = { "debitcard", "bandages", "gokart", "protest", "flashlight", "morphine", "waterBottle", "rabbit", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "toolkit", "fuelFull", "peach", "boltcutter", "blastingcharge", "demolitioncharge" };
    };

    class wongs {
        name = "STR_Shops_Wongs";
        side = "civ";
        conditions = "";
        items[] = { "turtle_soup", "turtle_raw" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        conditions = "";
        items[] = { "coffee", "donuts" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        conditions = "";
        items[] = { "coffee", "donuts", "redgull", "bandages", "toolkit", "fuelFull"};
    };

    class drugdealer {
        name = "STR_Shops_DrugDealer";
        side = "civ";
        conditions = "";
        items[] = { "cocaine_processed", "heroin_processed", "marijuana", "LSD", "ecstasy" };
    };

    class oil {
        name = "STR_Shops_Oil";
        side = "civ";
        conditions = "";
        items[] = { "oil_processed", "pickaxe", "fuelFull" };
    };

    class fishmarket {
        name = "STR_Shops_FishMarket";
        side = "civ";
        conditions = "";
        items[] = { "salema_raw", "salema", "ornate_raw", "ornate", "mackerel_raw", "mackerel", "tuna_raw", "tuna", "mullet_raw", "mullet", "catshark_raw", "catshark" };
    };

    class glass {
        name = "STR_Shops_Glass";
        side = "civ";
        conditions = "";
        items[] = { "glass" };
    };

    class iron  {
        name = "STR_Shops_Minerals";
        side = "civ";
        conditions = "";
        items[] = { "iron_refined", "copper_refined" };
    };

    class diamond {
        name = "STR_Shops_Diamond";
        side = "civ";
        conditions = "";
        items[] = { "diamond_uncut", "diamond_cut" };
    };

    class jeweler {
        name = "STR_Shops_Jeweler";
        side = "civ";
        conditions = "";
        items[] = { "rubyC" };
    };

    class salt {
        name = "STR_Shops_Salt";
        side = "civ";
        conditions = "";
        items[] = { "salt_refined" };
    };

    class cement {
        name = "STR_Shops_Cement";
        side = "civ";
        conditions = "";
        items[] = { "cement" };
    };

    class gold {
        name = "STR_Shops_Gold";
        side = "civ";
        conditions = "";
        items[] = { "goldenbarz3" };
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        conditions = "";
        items[] = { "debitcard", "panicbutton", "dogwhistle", "gpstracker", "flashlight", "fueldart", "gokart", "morphine", "handcuffs", "keys", "donuts", "coffee", "spikeStrip", "waterBottle", "rabbit", "apple", "redgull", "toolkit", "fuelFull", "defusekit", "defibrillator" };
    };

    class counterfitCash {
        name = "STR_Shops_CounterfitCash";
        side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
        items[] = { "counterfitCash" };
    };

    class uranium {
        name = "STR_Shops_uranium";
        side = "civ";
        conditions = "";
        items[] = {"uranium" };
    };

    class archeologist {
        name = "STR_Shops_archeologist";
        side = "civ";
        conditions = "mav_ttm_var_relicReward3 == 1;";
        items[] = {"excavator" };
    };

    class planeWreck {
        name = "STR_Shops_planeWreck";
        side = "civ";
        conditions = "mav_ttm_var_relicReward3 == 1;";
        items[] = {"oilSupplies" };
    };
};

class VirtualItems {

    //relics
    class relic1 {
        variable = "relic1";
        displayName = "STR_Item_relic1";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_relic1.paa";
    };
    class relic2 {
        variable = "relic2";
        displayName = "STR_Item_relic2";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_relic2.paa";
    };
    class relic3 {
        variable = "relic3";
        displayName = "STR_Item_relic3";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_relic3.paa";
    };
    class relic4 {
        variable = "relic4";
        displayName = "STR_Item_relic4";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_relic4.paa";
    };
    //relicTransport
    class relicTransport {
        variable = "relicTransport";
        displayName = "STR_Item_relicTransport";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_relicTransport.paa";
    };
    //RelicFed
    class relicFed {
        variable = "relicFed";
        displayName = "STR_Item_relicFed";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_relicFed.paa";
    };
    //relic end

    class oilSupplies {
        variable = "oilSupplies";
        displayName = "STR_Item_oilSupplies";
        weight = 20;
        buyPrice = -1;
        sellPrice = 95000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_oilSupplies.paa";
    };

    class MDMA {
        variable = "MDMA";
        displayName = "STR_Item_MDMA";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_MDMA.paa";
    };

    class ecstasy {
        variable = "ecstasy";
        displayName = "STR_Item_ecstasy";
        weight = 3;
        buyPrice = 7000;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_ecstasy.paa";
    };

    class speedbomb {
        variable = "speedbomb";
        displayName = "STR_Item_speedbomb";
        weight = 8;
        buyPrice = 400000;
        sellPrice = 1550;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_speedbomb.paa";
    };

    class excavator {
        variable = "excavator";
        displayName = "STR_Item_excavator";
        weight = 10;
        buyPrice = 14000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_excavator.paa";
    };

    class knife {
        variable = "knife";
        displayName = "STR_Item_knife";
        weight = 3;
        buyPrice = 4000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_knife.paa";
    };


    class cyanideCapsule {
        variable = "cyanideCapsule";
        displayName = "STR_Item_CyanideCapsule";
        weight = 1;
        buyPrice = 200;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_cyanideCapsule.paa";
    };

    class pdrill {
        variable = "pdrill";
        displayName = "STR_Item_drill";
        weight = 10;
        buyPrice = 9000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_pdrill.paa";
    };

    class uraniumU {
        variable = "uraniumU";
        displayName = "STR_Item_uraniumU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_uraniumU.paa";
    };

    class fueldart {
        variable = "fueldart";
        displayName = "STR_Item_fueldart";
        weight = 7;
        buyPrice = 5000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_fuelrocket.paa";
    };

    class mushrooms {
        variable = "mushrooms";
        displayName = "STR_Item_Mushrooms";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_mushrooms.paa";
    };

    class LSD {
        variable = "LSD";
        displayName = "STR_Item_LSD";
        weight = 4;
        buyPrice = -1;
        sellPrice = 5000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_LSD.paa";
    };

    class rubyU {
        variable = "rubyU";
        displayName = "STR_Item_rubyU";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_rubyU.paa";
    };

    class rubyC {
        variable = "rubyC";
        displayName = "STR_Item_rubyC";
        weight = 2;
        buyPrice = -1;
        sellPrice = 2800;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_rubyC.paa";
    };

    //

    class lumber {
        variable = "lumber";
        displayName = "STR_Item_Lumber";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_lumber.paa";
    }; 

    class airhorn {
        variable = "airhorn";
        displayName = "STR_Item_airhorn";
        weight = 2;
        buyPrice = 2000;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_airhorn.paa";
    };

    class dogwhistle {
        variable = "dogwhistle";
        displayName = "STR_Item_dogwhistle";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_dogwhistle.paa";
    };

    class flashlight {
        variable = "flashlight";
        displayName = "STR_Item_flashlight";
        weight = 4;
        buyPrice = 1000;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_flashlight.paa";
    };

    class head {
        variable = "head";
        displayName = "STR_Item_head";
        weight = 2;
        buyPrice = 500;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_head.paa";
    };


    class gpstracker {
        variable = "gpstracker";
        displayName = "STR_Item_gpstracker";
        weight = 2;
        buyPrice = 4000;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_gps.paa";
    };

    class campfire {
        variable = "campfire";
        displayName = "STR_Item_campfire";
        weight = 1;
        buyPrice = 2000;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_campfire.paa";
    };

    class gokart {
        variable = "gokart";
        displayName = "STR_Item_gokart";
        weight = 9;
        buyPrice = 5000;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_gokart.paa";
    };

    class tent1 {
        variable = "tent1";
        displayName = "STR_Item_tent1";
        weight = 4;
        buyPrice = 5000;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_tent.paa";
    };

    class protest {
        variable = "protest";
        displayName = "STR_Item_protest";
        weight = 4;
        buyPrice = 6000;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_protest.paa";
    };

    class volleyball {
        variable = "volleyball";
        displayName = "STR_Item_volleyball";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 100;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_volleyball.paa";
    };

    class prize {
        variable = "prize";
        displayName = "STR_Item_prize";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_prize.paa";
    };

    class uranium {
        variable = "uranium";
        displayName = "STR_Item_uranium";
        weight = 4;
        buyPrice = -1;
        sellPrice = 5400;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_uraniumP.paa";
    };

    class timber {
        variable = "timber";
        displayName = "STR_Item_Timber";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3800;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_timber.paa";
    };

    class axe {
        variable = "axe";
        displayName = "STR_Item_axe";
        weight = 2;
        buyPrice = 3750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_axe.paa";
    };

    class pliers {
        variable = "pliers";
        displayName = "STR_Item_pliers";
        weight = 4;
        buyPrice = 8400;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\craft\pliers.paa";
	};

	class barrel {
        variable = "barrel";
        displayName = "STR_Item_Barrel";
        weight = 2;
        buyPrice = 18000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\craft\barrel.paa";
	};

	class butt {
        variable = "butt";
        displayName = "STR_Item_Butt";
        weight = 1;
        buyPrice = 16000;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\craft\butt.paa";
	};

	class sight {
        variable = "sight";
        displayName = "STR_Item_Sight";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\craft\sight.paa";
	};

	class trigger {
        variable = "trigger";
        displayName = "STR_Item_Trigger";
        weight = 1;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\craft\trigger.paa";
	};

	class engine {
        variable = "engine";
        displayName = "STR_Item_Engine";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\craft\engine.paa";
	};

	class plans {
        variable = "plans";
        displayName = "STR_Item_Plans";
        weight = 1;
        buyPrice = 460;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\craft\plans.paa";
	};

    class rubberU {
		variable = "rubberU";
		displayName = "STR_Item_rubberu";
		weight = 3;
		buyPrice = 2025;
		sellPrice = 500;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\rubberU.paa";
	};

	class rubber {
		variable = "rubber";
		displayName = "STR_Item_rubber";
		weight = 3;
		buyPrice = 3225;
		sellPrice = 2100;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\rubber.paa";
	};

	class goldcoin {
		variable = "goldcoin";
		displayName = "STR_Item_goldcoin";
		weight = 2;
		buyPrice = -1;
		sellPrice = 1200;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\goldcoin.paa";
	};

	class nitroamine {
		variable = "nitroamine";
		displayName = "STR_Item_nitroamine";
		weight = 4;
		buyPrice = 11025;
		sellPrice = 1500;
		illegal = true;
		edible = -1;
		icon = "images\icons\craft\nitroamine.paa";
	};

	class C4 {
		variable = "C4";
		displayName = "STR_Item_C4";
		weight = 6;
		buyPrice = 12025;
		sellPrice = 6500;
		illegal = true;
		edible = -1;
		icon = "images\icons\craft\C4.paa";
	};

	class steel {
		variable = "steel";
		displayName = "STR_Item_steel";
		weight = 4;
		buyPrice = 4025;
		sellPrice = 2500;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\steel.paa";
	};

	class steelplate {
		variable = "steelplate";
		displayName = "STR_Item_steelplate";
		weight = 6;
		buyPrice = 9025;
		sellPrice = 6500;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\steelplate.paa";
	};

	class wool {
		variable = "wool";
		displayName = "STR_Item_wool";
		weight = 3;
		buyPrice = 2025;
		sellPrice = 800;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\wool.paa";
	};

	class cloth {
		variable = "cloth";
		displayName = "STR_Item_cloth";
		weight = 2;
		buyPrice = 6025;
		sellPrice = 2000;
		illegal = false;
		edible = -1;
		icon = "images\icons\craft\cloth.paa";
	};

	class sulfur {
		variable = "sulfur";
		displayName = "STR_Item_sulfur";
		weight = 2;
		buyPrice = 3025;
		sellPrice = 2200;
		illegal = true;
		edible = -1;
		icon = "images\icons\craft\sulfur.paa";
	};

	class gunpowder {
		variable = "gunpowder";
		displayName = "STR_Item_gunpowder";
		weight = 2;
		buyPrice = 8025;
		sellPrice = 3200;
		illegal = true;
		edible = -1;
		icon = "images\icons\craft\gunpowder.paa";
	};
    //craftend

    //Custom Food/Water
    class doritos {
        variable = "doritos";
        displayName = "STR_Doritos";
        weight = 1;
        buyPrice = 40;
        sellPrice = 10;
        illegal = false;
        edible = 30;
        icon = "images\icons\ico_doritos.paa";
    };

    class pepsi {
        variable = "pepsi";
        displayName = "STR_Pepsi";
        weight = 1;
        buyPrice = 20;
        sellPrice = 10;
        illegal = false;
        edible = 50;
        icon = "images\icons\ico_pepsi.paa";
    };

    class cocacola {
        variable = "cocacola";
        displayName = "STR_CocaCola";
        weight = 1;
        buyPrice = 20;
        sellPrice = 10;
        illegal = false;
        edible = 50;
        icon = "images\icons\ico_cocacola.paa";
    };

    class monsterEnergy {
        variable = "monsterEnergy";
        displayName = "STR_MonsterEnergy";
        weight = 1;
        buyPrice = 100;
        sellPrice = 10;
        illegal = false;
        edible = 60;
        icon = "images\icons\ico_monsterEnergy.paa";
    };

    class shittynoodles {
        variable = "shittynoodles";
        displayName = "STR_小馅饼";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 25;
        icon = "images\icons\ico_shittyNoodles.paa";
    };

    class kfc {
        variable = "kfc";
        displayName = "STR_KFC";
        weight = 1;
        buyPrice = 70;
        sellPrice = 10;
        illegal = false;
        edible = 70;
        icon = "images\icons\ico_kfc.paa";
    };

    class easterEggs {
        variable = "easterEggs";
        displayName = "STR_EasterEggs";
        weight = 1;
        buyPrice = 40;
        sellPrice = 10;
        illegal = false;
        edible = 50;
        icon = "images\icons\ico_easterEggs.paa";
    };

    
    //end food.drink

    //alchohol
    class beer {
		variable = "beer";
		displayName = "STR_Item_beer";
		weight = 2;
		buyPrice = 2025;
		sellPrice = 1200;
		illegal = false;
		edible = 100;
		icon = "images\icons\ico_beer.paa";
	};

	class whiskey {
		variable = "whiskey";
		displayName = "STR_Item_whiskey";
		weight = 2;
		buyPrice = 3025;
		sellPrice = 1800;
		illegal = false;
		edible = 100;
		icon = "images\icons\ico_whiskey.paa";
	};

	class moonshine {
		variable = "moonshine";
		displayName = "STR_Item_moonshine";
		weight = 2;
		buyPrice = 4025;
		sellPrice = 3200;
		illegal = false;
		edible = 100;
		icon = "images\icons\ico_moonshine.paa";
	};

    //end alch

    class debitcard {
        variable = "debitcard";
        displayName = "STR_Debit_Card";
        weight = 1;
        buyPrice = 2000;
        sellPrice = 1200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_debit.paa";
    };

    class codeCracker {
        variable = "codeCracker";
        displayName = "STR_Item_codeCracker";
        weight = 2;
        buyPrice = 210000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "images\icons\codeCracker.paa";
    };

    class zipties {
        variable = "zipties";
        displayName = "STR_Item_ZipTies";
        weight = 0;
        buyPrice = 1200;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ziptie.paa";
    };
	
	class blindfold {
        variable = "blindfold";
        displayName = "STR_Item_Blindfold";
        weight = 0;
        buyPrice = 600;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\blindfold.paa";
    };

    class counterfitCash {
        variable = "counterfitCash";
        displayName = "STR_Item_counterfitCash";
        weight = 14;
        buyPrice = -1;
        sellPrice = 252500;
        illegal = true;
        edible = -1;
        icon = "images\icons\counterfitCash.paa";
    };

    class cprKit {
        variable = "cprKit";
        displayName = "STR_Item_CPRMediKit";
        weight = 5;
        buyPrice = 15000;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_defib.paa";
    };  

    class panicbutton {
        variable = "panicbutton";
        displayName = "STR_Item_panicbutton";
        weight = 5;
        buyPrice = 150;
        sellPrice = 10;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_panicbutton.paa";
    };  

    class morphine {
        variable = "morphine";
        displayName = "STR_Item_Morphine";
        weight = 2;
        buyPrice = 1500;
        sellPrice = 300;
        illegal = true;
        edible = -1;
        icon = "images\icons\Morphine.paa";
    };

    class bandages {
        variable = "bandages";
        displayName = "STR_Item_Bandages";
        weight = 2;
        buyPrice = 200;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_bandages.paa";
    };

    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_pickaxe.paa";
    };

    class defibrillator {
        variable = "defibrillator";
        displayName = "STR_Item_Defibrillator";
        weight = 4;
        buyPrice = 900;
        sellPrice = 450;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_defibrillator.paa";
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
        icon = "images\icons\ico_fuelEmpty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "STR_Item_FuelF";
        weight = 5;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1200;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 150;
        sellPrice = 75;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_lockpick.paa";
    };

    class goldenbarz3 {
        variable = "goldenbarz3";
        displayName = "STR_Item_goldenbarz3";
        weight = 3;
        buyPrice = -1;
        sellPrice = 205000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_goldenbarz3.paa";
    };

    class handcuffs {
        variable = "handcuffs";
        displayName = "STR_Item_handcuff";
        weight = 1;
        buyPrice = 35;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_cuffs.paa";
    };	

    class keys {
        variable = "keys";
        displayName = "STR_Item_Keys";
        weight = 1;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_keys.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 325000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_blastingCharge.paa";
    };

    class demolitioncharge {
        variable = "demolitioncharge";
        displayName = "STR_Item_demolitioncharge";
        weight = 10;
        buyPrice = 125000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_demolitioncharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 27500;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_boltCutter.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "STR_Item_DefuseKit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = 2000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_defuseKit.paa";
    };

     class storagesmall {
        variable = "storageSmall";
		displayName = "STR_Item_StorageBS";
        weight = 5;
        buyPrice = 82500;
        sellPrice = 5500;
        varPrice = 1;
        maxPrice = 55000;
        minPrice = 55000;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_storageSmall.paa";
		furniture = false;
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 165000;
        sellPrice = 13750;
        varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
        factor = 0;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_storageBig.paa";
		furniture = false;
    };

	class furnituredesk {
		variable = "furnitureDesk";
        displayName = "STR_Item_FurnitureDK";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_TableDesk_F.jpg";
		furniture = true;
	};
	
	class furniturechair {
		variable = "furnitureChair";
        displayName = "STR_Item_FurnitureCH";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1700;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_CampingChair_V1_F.jpg";
		furniture = true;
	};
	
	class furniturebagshort {
		variable = "furnitureBagShort";
        displayName = "STR_Item_FurnitureBS";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_BagFence_Short_F.jpg";
		furniture = true;
	};
	
	class furnitureopenlaptop {
		variable = "furnitureOpenLaptop";
        displayName = "STR_Item_FurnitureOL";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Laptop_unfolded_F.jpg";
		furniture = true;
	};
	
	class furniturecampingtable {
		variable = "furnitureCampingTable";
        displayName = "STR_Item_FurnitureCT";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13700;
        minPrice = 13700;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_CampingTable_F.jpg";
		furniture = true;
	};
	
	class furnituresleepingbag {
		variable = "furnitureSleepingBag";
        displayName = "STR_Item_FurnitureSB";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_F.jpg";
		furniture = true;
	};
	
	class furnituresleepingbagblue {
		variable = "furnitureSleepingBagBlue";
        displayName = "STR_Item_FurnitureSBBL";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1700;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_F.jpg";
		furniture = true;
	};
	
	class furnituresleepingbagbrown {
		variable = "furnitureSleepingBagBrown";
        displayName = "STR_Item_FurnitureSBBR";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1700;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sleeping_bag_F.jpg";
		furniture = true;
	};
	
	class furnituresunchair {
		variable = "furnitureSunChair";
        displayName = "STR_Item_FurnitureSCH";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sun_chair_F.jpg";
		furniture = true;
	};
	
	class furnituresunchairgreen {
		variable = "furnitureSunChairGreen";
        displayName = "STR_Item_FurnitureSCHG";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Sun_chair_green_F.jpg";
		furniture = true;
	};
	
	class furnituretenta {
		variable = "furnitureTentA";
        displayName = "STR_Item_FurnitureTA";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_TentA_F.jpg";
		furniture = true;
	};
	
	class furnituremapaltis {
		variable = "furnitureMapAltis";
        displayName = "STR_Item_FurnitureMA";
        weight = 10;
        buyPrice = 20000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\MapBoard_altis_F.jpg";
		furniture = true;
	};
	
	class furniturepalletvert {
		variable = "furniturePalletVert";
        displayName = "STR_Item_FurniturePV";
        weight = 10;
        buyPrice = 50000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Pallet_vertical_F.jpg";
		furniture = true;
	};
	
	class furnituremetalrack {
		variable = "furnitureMetalRack";
        displayName = "STR_Item_FurnitureMR";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Metal_wooden_rack_F.jpg";
		furniture = true;
	};
	class furniturewoodblue {
		variable = "furnitureWoodBlue";
        displayName = "STR_Item_FurnitureWB";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_ShelvesWooden_blue_F.jpg";
		furniture = true;
	};
	
	class furniturefmradio {
		variable = "furnitureFMRadio";
        displayName = "STR_Item_FurnitureFMR";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_FMradio_F.jpg";
		furniture = true;
	};
	
	class furnitureportgen {
		variable = "furniturePortGen";
        displayName = "STR_Item_FurniturePG";
        weight = 10;
        buyPrice = 350000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = true;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_Portable_generator_F.jpg";
		furniture = true;
	};
	
	class furnituretarget {
		variable = "furnitureTarget";
        displayName = "STR_Item_FurnitureTT";
        weight = 10;
        buyPrice = 50000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Target_F.jpg";
		furniture = true;
	};
	
	class furniturewoodtable {
		variable = "furnitureWoodTable";
        displayName = "STR_Item_FurnitureWT";
        weight = 10;
        buyPrice = 25000;
        sellPrice = 1750;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_WoodenTable_small_F.jpg";
		furniture = true;
	};

    class furniturespotlight {
		variable = "furnitureSpotlight";
        displayName = "STR_Item_Spotlight";
        weight = 6;
        buyPrice = 50000;
        sellPrice = 5000;
		varPrice = 1;
        maxPrice = 13750;
        minPrice = 13750;
		factor = 0;
        illegal = false;
        edible = -1;
        icon = "\A3\EditorPreviews_F\Data\CfgVehicles\Land_PortableLight_single_F.jpg";
		furniture = true;
	};

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "STR_Item_OilU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "STR_Item_OilP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3100;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "STR_Item_CopperOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_copperOre.paa";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "STR_Item_CopperIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2500;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_copper.paa";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "STR_Item_IronOre";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_ironOre.paa";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "STR_Item_IronIngot";
        weight = 3;
        buyPrice = -1;
        sellPrice = 2600;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_iron.paa";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "STR_Item_Salt";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "STR_Item_SaltR";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1450;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_saltProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "STR_Item_Sand";
        weight = 3;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_sand.paa";
    };

    class glass {
        variable = "glass";
        displayName = "STR_Item_Glass";
        weight = 1;
        buyPrice = -1;
        sellPrice = 1450;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_glass.paa";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "STR_Item_DiamondU";
        weight = 4;
        buyPrice = -1;
        sellPrice = 750;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "STR_Item_DiamondC";
        weight = 3;
        buyPrice = -1;
        sellPrice = 3200;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "STR_Item_Rock";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_rock.paa";
    };

    class cement {
        variable = "cement";
        displayName = "STR_Item_CementBag";
        weight = 5;
        buyPrice = -1;
        sellPrice = 1950;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_cement.paa";
    };

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "STR_Item_HeroinU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "STR_Item_HeroinP";
        weight = 4;
        buyPrice = 6500;
        sellPrice = 4560;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "STR_Item_Cannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "STR_Item_Marijuana";
        weight = 3;
        buyPrice = 3800;
        sellPrice = 3350;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_marijuana.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "STR_Item_CocaineU";
        weight = 5;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "STR_Item_CocaineP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 4500;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_cocaineProcessed.paa";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "STR_Item_RedGull";
        weight = 1;
        buyPrice = 120;
        sellPrice = 20;
        illegal = false;
        edible = 65;
        icon = "images\icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "STR_Item_Coffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "STR_Item_WaterBottle";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 65;
        icon = "images\icons\ico_waterBottle.paa";
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
        icon = "images\icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "STR_Item_Peach";
        weight = 1;
        buyPrice = 68;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "images\icons\ico_peach.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "STR_Item_TBacon";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "images\icons\ico_tBacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "STR_Item_Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        edible = 30;
        icon = "images\icons\ico_donuts.paa";
    };

    class rabbit_raw {
        variable = "rabbitRaw";
        displayName = "STR_Item_RabbitRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_rabbitRaw.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "STR_Item_Rabbit";
        weight = 1;
        buyPrice = 150;
        sellPrice = 115;
        illegal = false;
        edible = 20;
        icon = "images\icons\ico_rabbit.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
        displayName = "STR_Item_SalemaRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 45;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_salemaRaw.paa";
    };

    class salema {
        variable = "salema";
        displayName = "STR_Item_Salema";
        weight = 1;
        buyPrice = 75;
        sellPrice = 55;
        illegal = false;
        edible = 30;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "STR_Item_OrnateRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_ornateRaw.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "STR_Item_Ornate";
        weight = 1;
        buyPrice = 175;
        sellPrice = 150;
        illegal = false;
        edible = 25;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "STR_Item_MackerelRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 175;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_mackerelRaw.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "STR_Item_Mackerel";
        weight = 2;
        buyPrice = 250;
        sellPrice = 200;
        illegal = false;
        edible = 30;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "STR_Item_TunaRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 700;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_tunaRaw.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "STR_Item_Tuna";
        weight = 3;
        buyPrice = 1250;
        sellPrice = 1000;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "STR_Item_MulletRaw";
        weight = 4;
        buyPrice = -1;
        sellPrice = 250;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_mulletRaw.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "STR_Item_Mullet";
        weight = 2;
        buyPrice = 600;
        sellPrice = 400;
        illegal = false;
        edible = 80;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "STR_Item_CatSharkRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_catsharkRaw.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "STR_Item_CatShark";
        weight = 3;
        buyPrice = 750;
        sellPrice = 500;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_cookedFish.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "STR_Item_TurtleRaw";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "images\icons\ico_turtleRaw.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "STR_Item_TurtleSoup";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_turtleSoup.paa";
    };

    class hen_raw {
        variable = "henRaw";
        displayName = "STR_Item_HenRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_wholeChickenRaw.paa";
    };

    class hen {
        variable = "hen";
        displayName = "STR_Item_Hen";
        weight = 1;
        buyPrice = 115;
        sellPrice = 85;
        illegal = false;
        edible = 65;
        icon = "images\icons\ico_wholeChicken.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
        displayName = "STR_Item_RoosterRaw";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_chickenDrumstickRaw.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "STR_Item_Rooster";
        weight = 115;
        buyPrice = 90;
        sellPrice = 85;
        illegal = false;
        edible = 45;
        icon = "images\icons\ico_chickenDrumstick.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
        displayName = "STR_Item_SheepRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_lambChopRaw.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "STR_Item_Sheep";
        weight = 2;
        buyPrice = 155;
        sellPrice = 115;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_lambChop.paa";
    };

    class goat_raw {
        variable = "goatRaw";
        displayName = "STR_Item_GoatRaw";
        weight = 2;
        buyPrice = -1;
        sellPrice = 115;
        illegal = false;
        edible = -1;
        icon = "images\icons\ico_muttonLegRaw.paa";
    };

    class goat {
        variable = "goat";
        displayName = "STR_Item_Goat";
        weight = 2;
        buyPrice = 175;
        sellPrice = 135;
        illegal = false;
        edible = 100;
        icon = "images\icons\ico_muttonLeg.paa";
    };
};
