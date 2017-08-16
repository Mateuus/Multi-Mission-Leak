/*
*    Format:
*        level: ARRAY (This is for limiting items to certain things)
*            0: Variable to read from
*            1: Variable Value Type (SCALAR / BOOL / EQUAL)
*            2: What to compare to (-1 = Check Disabled)
*            3: Custom exit message (Optional)
*/
class VirtualShops {
	class market {
		name = "Altis Markt";
		 side = "";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "apple", "redgull", "tbacon", "news", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "protest", "nitro", "storagesmall", "storagebig"};
	};

	class rebel {
		name = "Rebellen Markt";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "apple", "news", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};

	class gang {
		name = "Gang Markt";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "waterBottle", "apple", "redgull", "tbacon", "lockpick", "pickaxe", "fuelFull", "peach", "boltcutter", "blastingcharge" };
	};

	class wongs {
		name = "Wong's Spezialitäten";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "turtle_soup", "turtle_raw" };
	};

	class carbon  {
		name = "Altis Industriehandel";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "carbonrefined", "schwarzrefined" };
	};


	class coffee {
		name = "Gyro's Café";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "coffee", "donuts" };
	};

	class drugdealer {
		name = "Drogendealer";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "cocaine_processed", "heroin_processed", "marijuana","lsdp" };
	};

	class oil {
		name = "Ölhändler";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "oil_processed", "pickaxe", "fuelFull" };
	};

	class fishmarket {
		name = "Fischmarkt";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "turtle_raw", "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried" };
	};

	class glass {
		name = "Glashändler";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "glass" };
	};

	class iron  {
		name = "Altis Industriehandel";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "iron_refined", "copper_refined", "bleirefined" };
	};

	class holz  {
		name = "Altis Industriehandel";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "holzrefined" };
	};

	class diamond {
		name = "Juwelier";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "diamond_uncut", "diamond_cut" };
	};
	class uran {
		name = "Uran Shop";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "uranp" };
	};

	class admin {
		name = "Admin Shop";
		side = "";
        license = "";
        level[] = {"life_adminlevel","SCALAR", 4, "Du bist kein admin Lv 4!"};
		items[] = { "gang1","gang2","gang3","gang4","gang5","gang6","gang7","gang8","gang9","heal","pickaxe", "money10", "money50", "Eingeburgert", "fuelEmpty", "news", "pistole", "fuelFull", "spikeStrip", "lockpick", "goldBar", "nitro", "boltCutter", "schein", "storageSmall", "storageBig", "carbonrefined", "schwarzrefined", "cocaine_processed", "heroin_processed", "marijuana","lsdp","oil_processed", "turtle_raw", "salema_raw", "salema_grilled", "ornate_raw", "ornate_grilled", "mackerel_raw", "mackerel_grilled", "tuna_raw", "tuna_grilled", "mullet_raw", "mullet_fried", "catshark_raw", "catshark_fried", "glass", "iron_refined", "copper_refined", "bleirefined", "holzrefined", "diamond_uncut", "diamond_cut", "uranp", "coalp", "salt_refined", "coffee",  "waterBottle", "tbacon", "apple", "redgull", "defusekit", "goldbar", "cement" };
	};

	class coal {
		name = "Kohl Shop";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "coalp" };
	};

	class salt {
		name = "Salzhändler";
		 side = "civ";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = { "salt_refined" };
	};

	class cop {
		name = "APD Gegenstände";
		side = "cop";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = {"coffee", "spikeStrip", "waterBottle", "tbacon", "nitro", "lockpick" , "apple", "redgull", "fuelFull", "defusekit", "heal", "money10","money50","schein", "Eingeburgert" };
	};

	class aus {
		name = "Aus Shop";
		side = "cop";
        license = "aus";
        level[] = { "", "", -1, "" };
		items[] = {"cAir", "swat", "cDriver", "cg" };
	};

	class einwsh {
		name = "APD Gegenstände";
		side = "med";
        license = "";
        level[] = { "", "", -1, "" };
		items[] = {"Eingeburgert", "heal"};
	};

	class cement {
		name = "Juan's Zementleger";
		items[] = { "cement" };
	};

	class gold {
		name = "Goldhändler";
		items[] = { "goldbar" };
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
        displayName = "Spitzhacke";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_pickaxe.paa";
    };

   class protest {
        variable = "protest";
        displayName = "Protest Schild";
        weight = 2;
        buyPrice = 50;
        sellPrice = 20;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class nitro {
        variable = "nitro";
        displayName = "Lachgas";
        weight = 2;
        buyPrice = 25000;
        sellPrice = 20000;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\nitro.paa";
    };
	class gagkit {
        variable = "gagkit";
        displayName = "GagKit";
        weight = 2;
        buyPrice = 750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "";
    };
		class money10 {
        variable = "money10";
        displayName = "10k Geldbeutel";
        weight = 2;
        buyPrice = 10000;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "";
    };
		class money50 {
        variable = "money50";
        displayName = "50k Geldbeutel";
        weight = 2;
        buyPrice = 50000;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class fuelEmpty {
        variable = "fuelEmpty";
        displayName = "Leerer Benzinkanister";
        weight = 2;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_fuelempty.paa";
    };

    class fuelFull {
        variable = "fuelFull";
        displayName = "Gefüllter Benzinkanister";
        weight = 5;
        buyPrice = 850;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "Nagelband";
        weight = 15;
        buyPrice = 2500;
        sellPrice = 1200;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_spikestrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "Dietrich";
        weight = 1;
        buyPrice = 7050;
        sellPrice = 75;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "Goldbarren";
        weight = 12;
        buyPrice = -1;
        sellPrice = 95000;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_goldbar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "Sprengladung";
        weight = 15;
        buyPrice = 35000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_blastingCharge.paa";
    };

	class heal {
		variable = "heal";
        displayName = "Erstehilfekit";
        weight = 3;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class schein {
        variable = "schein";
        displayName = "Jagtschein";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang1 {
        variable = "gang1";
        displayName = "Gang 1";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang2 {
        variable = "gang2";
        displayName = "Gang 2";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang3 {
        variable = "gang3";
        displayName = "Gang 3";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang4 {
        variable = "gang4";
        displayName = "Gang 4";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang5 {
        variable = "gang5";
        displayName = "Gang 5";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang6 {
        variable = "gang6";
        displayName = "Gang 6";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang7 {
        variable = "gang7";
        displayName = "Gang 7";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class gang8 {
        variable = "gang8";
        displayName = "Gang 7";
        weight = 15;
        buyPrice = 500;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "Bolzenschneider";
        weight = 5;
        buyPrice = 7500;
        sellPrice = 1000;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_boltcutters.paa";
    };

    class defusekit {
        variable = "defuseKit";
        displayName = "Bombenentschärfungskit";
        weight = 2;
        buyPrice = 2500;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_defusekit.paa";
    };

    class storagesmall {
        variable = "storageSmall";
        displayName = "Kleine Lagerbox";
        weight = 5;
        buyPrice = 75000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "Große Lagerbox";
        weight = 10;
        buyPrice = 150000;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_storageBig.paa";
    };

    class news {
        variable = "news";
        displayName = "Zeitung";
        weight = 1;
        buyPrice = 50;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };

    class Eingeburgert {
        variable = "Eingeburgert";
        displayName = "Einwanderungsschein (Benutzen)";
        weight = 10;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };
	   class cDriver {
        variable = "cDriver";
        displayName = "Führerschein (Benutzen)";
        weight = 10;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };
	   class cAir {
        variable = "cAir";
        displayName = "Air";
        weight = 10;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };
	 class cg {
        variable = "cg";
        displayName = "Bootschein (Benutzen)";
        weight = 10;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };
		class swat {
        variable = "swat";
        displayName = "S.E.K. Bescheinigung (Benutzen)";
        weight = 10;
        buyPrice = 15;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_zeitung.paa";
    };

    //Mined Items
    class oil_unprocessed {
        variable = "oilUnprocessed";
        displayName = "ÖlU";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_oilUnprocessed.paa";
    };

    class oil_processed {
        variable = "oilProcessed";
        displayName = "ÖlP";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3200;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_oilProcessed.paa";
    };

    class copper_unrefined {
        variable = "copperUnrefined";
        displayName = "Kupfererz";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class copper_refined {
        variable = "copperRefined";
        displayName = "Kupferbarren";
        weight = 6;
        buyPrice = -1;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class iron_unrefined {
        variable = "ironUnrefined";
        displayName = "Eisenerz";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class iron_refined {
        variable = "ironRefined";
        displayName = "Eisenbarren";
        weight = 4;
        buyPrice = -1;
        sellPrice = 400;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class salt_unrefined {
        variable = "saltUnrefined";
        displayName = "Salz";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_saltUnprocessed.paa";
    };

    class salt_refined {
        variable = "saltRefined";
        displayName = "SalzR";
        weight = 2;
        buyPrice = -1;
        sellPrice = 600;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_saltProcessed.paa";
    };

    class sand {
        variable = "sand";
        displayName = "Sand";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class glass {
        variable = "glass";
        displayName = "Glas";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1800;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class diamond_uncut {
        variable = "diamondUncut";
        displayName = "Ungeschliffene Diamanten";
        weight = 4;
        buyPrice = -1;
        sellPrice = 200;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_diamondUncut.paa";
    };

    class diamond_cut {
        variable = "diamondCut";
        displayName = "Geschliffene Diamanten";
        weight = 2;
        buyPrice = -1;
        sellPrice = 1800;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_diamondCut.paa";
    };

    class rock {
        variable = "rock";
        displayName = "Stein";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class cement {
        variable = "cement";
        displayName = "Zement Sack";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon = "";
    };
	   class uranu {
        variable = "uranu";
        displayName = "Uranpulver";
        weight = 8;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class uranp {
        variable = "uranp";
        displayName = "Uranstab";
        weight = 5;
        buyPrice = -1;
        sellPrice = 4500;
        illegal = false;
        edible = -1;
        icon = "";
    };
	   class coalu {
        variable = "coalu";
        displayName = "Kohlepulver";
        weight = 7;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class coalp {
        variable = "coalp";
        displayName = "Kohlebricket";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon = "";
    };

	   class bleiunrefined {
        variable = "bleiunrefined";
        displayName = "Blei Unverarbeitet";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class bleiRefined {
        variable = "bleiRefined";
        displayName = "Blei";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1edible = -1;
        icon = "";
    };

	class holzunrefined {
        variable = "holzunrefined";
        displayName = "Holz Ungeschliffen";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class holzrefined {
        variable = "holzrefined";
        displayName = "Holz";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon = "";
    };

	class carbonunrefined {
        variable = "carbonunrefined";
        displayName = "Carbon Unverarbeitet";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class carbonrefined {
        variable = "carbonrefined";
        displayName = "Carbon";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon = "";
    };
	class schwarzunrefined {
        variable = "schwarzunrefined";
        displayName = "Schwarzpulver Unverarbeitet";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = false;
        edible = -1;
        icon = "";
    };

    class schwarzrefined {
        variable = "schwarzrefined";
        displayName = "Schwarzpulver";
        weight = 5;
        buyPrice = -1;
        sellPrice = 2100;
        illegal = false;
        edible = -1;
        icon = "";
    };

    //Drugs
    class heroin_unprocessed {
        variable = "heroinUnprocessed";
        displayName = "HeroinU";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_heroinUnprocessed.paa";
        processedItem = "heroin_processed";
    };

    class heroin_processed {
        variable = "heroinProcessed";
        displayName = "HeroinP";
        weight = 2;
        buyPrice = 5800;
        sellPrice = 1500;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_heroinProcessed.paa";
    };

    class cannabis {
        variable = "cannabis";
        displayName = "Kannabis";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_cannabis.paa";
        processedItem = "marijuana";
    };

    class marijuana {
        variable = "marijuana";
        displayName = "Marihuana";
        weight = 3;
        buyPrice = 5700;
        sellPrice = 2100;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_marijuana.paa";
    };

    class cocaine_unprocessed {
        variable = "cocaineUnprocessed";
        displayName = "KokainU";
        weight = 6;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_cocaineUnprocessed.paa";
        processedItem = "cocaine_processed";
    };

    class cocaine_processed {
        variable = "cocaineProcessed";
        displayName = "KokainP";
        weight = 4;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_cocaineProcessed.paa";
    };

	    class lsdu {
        variable = "lsdu";
        displayName = "LSD-Zutaten";
        weight = 4;
        buyPrice = -1;
        sellPrice = -1;
        illegal = true;
        edible = -1;
        icon = "";
    };
	    class lsdp {
        variable = "lsdp";
        displayName = "LSD-Pille";
        weight = 4;
        buyPrice = 8000;
        sellPrice = 1600;
        illegal = true;
        edible = -1;
        icon = "";
    };

    //Drink
    class redgull {
        variable = "redgull";
        displayName = "RedGull";
        weight = 1;
        buyPrice = 1500;
        sellPrice = 200;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_redgull.paa";
    };

    class coffee {
        variable = "coffee";
        displayName = "Kaffee";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_coffee.paa";
    };

    class waterBottle {
        variable = "waterBottle";
        displayName = "Wasserflasche";
        weight = 1;
        buyPrice = 10;
        sellPrice = 5;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_waterBottle.paa";
    };

    //Food
    class apple {
        variable = "apple";
        displayName = "Apfel";
        weight = 1;
        buyPrice = 150;
        sellPrice = 50;
        illegal = false;
        edible = 10;
        icon = "MINEFACTORY\icons\ico_apple.paa";
    };

    class peach {
        variable = "peach";
        displayName = "Pfirsich";
        weight = 1;
        buyPrice = 150;
        sellPrice = 55;
        illegal = false;
        edible = 10;
        icon = "MINEFACTORY\icons\ico_peach.paa";
    };

    class tbacon {
        variable = "tbacon";
        displayName = "Taktischer Speck";
        weight = 1;
        buyPrice = 75;
        sellPrice = 25;
        illegal = false;
        edible = 40;
        icon = "MINEFACTORY\icons\ico_tbacon.paa";
    };

    class donuts {
        variable = "donuts";
        displayName = "Donuts";
        weight = 1;
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        edible = 30;
        icon = "MINEFACTORY\icons\ico_donuts.paa";
    };

    class rabbit_raw {
        variable = "rabbitRaw";
        displayName = "Kaninchenfleisch";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class rabbit {
        variable = "rabbit";
        displayName = "Gegrilltes Hasenfleisch";
        weight = 1;
        buyPrice = 150;
        sellPrice = 115;
        illegal = false;
        edible = 20;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class salema_raw {
        variable = "salemaRaw";
        displayName = "Salema Fleisch";
        weight = 2;
        buyPrice = -1;
        sellPrice = 45;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class salema {
        variable = "salema";
        displayName = "Gegrillte Sardine";
        weight = 1;
        buyPrice = 75;
        sellPrice = 55;
        illegal = false;
        edible = 30;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class ornate_raw {
        variable = "ornateRaw";
        displayName = "Ornate Fleisch";
        weight = 2;
        buyPrice = -1;
        sellPrice = 40;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class ornate {
        variable = "ornate";
        displayName = "Gegrillter Kaiserfisch";
        weight = 1;
        buyPrice = 175;
        sellPrice = 150;
        illegal = false;
        edible = 25;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class mackerel_raw {
        variable = "mackerelRaw";
        displayName = "Makrelen Fleisch";
        weight = 4;
        buyPrice = -1;
        sellPrice = 175;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class mackerel {
        variable = "mackerel";
        displayName = "Gegrillte Makrele";
        weight = 2;
        buyPrice = 250;
        sellPrice = 200;
        illegal = false;
        edible = 30;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class tuna_raw {
        variable = "tunaRaw";
        displayName = "Thunfisch Fleisch ";
        weight = 6;
        buyPrice = -1;
        sellPrice = 700;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class tuna {
        variable = "tuna";
        displayName = "Gegrillter Thunfisch";
        weight = 3;
        buyPrice = 1250;
        sellPrice = 1000;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class mullet_raw {
        variable = "mulletRaw";
        displayName = "Meerbarben Fleisch";
        weight = 4;
        buyPrice = -1;
        sellPrice = 250;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class mullet {
        variable = "mullet";
        displayName = "Frittierte Meerbarbe";
        weight = 2;
        buyPrice = 600;
        sellPrice = 400;
        illegal = false;
        edible = 80;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class catshark_raw {
        variable = "catsharkRaw";
        displayName = "Katzenhai Fleisch";
        weight = 6;
        buyPrice = -1;
        sellPrice = 300;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class catshark {
        variable = "catshark";
        displayName = "Frittierter Katzenhai";
        weight = 3;
        buyPrice = 750;
        sellPrice = 500;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class turtle_raw {
        variable = "turtleRaw";
        displayName = "Schildkröten Fleisch";
        weight = 6;
        buyPrice = -1;
        sellPrice = 3000;
        illegal = true;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class turtle_soup {
        variable = "turtleSoup";
        displayName = "Schildkrötensuppe";
        weight = 2;
        buyPrice = 1000;
        sellPrice = 750;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class hen_raw {
        variable = "henRaw";
        displayName = "Rohes Hühnchen";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class hen {
        variable = "hen";
        displayName = "Schwarz Frittiertes Hühnchen";
        weight = 1;
        buyPrice = 115;
        sellPrice = 85;
        illegal = false;
        edible = 65;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class rooster_raw {
        variable = "roosterRaw";
        displayName = "Rohes Hähnchen";
        weight = 1;
        buyPrice = -1;
        sellPrice = 65;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class rooster {
        variable = "rooster";
        displayName = "Gegrilltes Hähnchen";
        weight = 115;
        buyPrice = 90;
        sellPrice = 85;
        illegal = false;
        edible = 45;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class sheep_raw {
        variable = "sheepRaw";
        displayName = "Rohes Schafsfleisch";
        weight = 2;
        buyPrice = -1;
        sellPrice = 95;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };

    class sheep {
        variable = "sheep";
        displayName = "Gegrilltes Schafsfleisch";
        weight = 2;
        buyPrice = 155;
        sellPrice = 115;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };

    class goat_raw {
        variable = "goatRaw";
        displayName = "Rohes Ziegenfleisch";
        weight = 2;
        buyPrice = -1;
        sellPrice = 115;
        illegal = false;
        edible = -1;
        icon = "MINEFACTORY\icons\ico_meat.paa";
    };
	class pistole {
        variable = "pistole";
        displayName = "Benzin Bohrmaschine";
        weight = 5;
        buyPrice = 20000;
        sellPrice = 20;
        illegal = false;
        edible = -1;
        icon = "";
    };
    class goat {
        variable = "goat";
        displayName = "Gegrilltes Ziegenfleisch";
        weight = 2;
        buyPrice = 175;
        sellPrice = 135;
        illegal = false;
        edible = 100;
        icon = "MINEFACTORY\icons\ico_cookedMeat.paa";
    };
//---Crafting Menu---

class Imotor {variable = "Imotor";				displayName = "V8 Motor";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Ireifen {variable = "Ireifen";				displayName = "Reifen";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IStosstange {variable = "IStosstange";			displayName = "Stoßstange";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IFedern {variable = "IFedern";				displayName = "Federung";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IKabelbaum {variable = "IKabelbaum";			displayName = "Kabelbaum";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IGetriebe {variable = "IGetriebe";				displayName = "Doppelkupplungsgetriebe";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IBeleuchtung {variable = "IBeleuchtung";			displayName = "Beleuchtung";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IABS {variable = "IABS";					displayName = "Antiblockiersystem";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class ILenkrad {variable = "ILenkrad";				displayName = "Lenkrad";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class ISitze {variable = "ISitze";				displayName = "Sitze";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IBatterie {variable = "IBatterie";				displayName = "12V Batterie";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IKarosserie {variable = "IKarosserie";			displayName = "Karosserie";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IMRotor {variable = "IMRotor";			displayName = "Hauptrotor";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class ISRotor {variable = "ISRotor";			displayName = "Heckrotor";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Iseilwinde {variable = "Iseilwinde";			displayName = "Seilwinde";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IIsstrumente {variable = "IIsstrumente";			displayName = "Instrumente";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IFahrwerk {variable = "IFahrwerk";					displayName = "Fahrwerk";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IHuelle {variable = "IHuelle";				displayName = "Hulle";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IThermal {variable = "IThermal";								displayName = "Warmesicht";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IPanzerung {variable = "IPanzerung";							displayName = "Panzerung";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Igetriebesand {variable = "Igetriebesand";					displayName = "Getriebesand";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IKolbenzurueckholfeder {variable = "IKolbenzurueckholfeder";	displayName = "Kolbenzurückholfeder";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IFelge {variable = "IFelge";		displayName = "Felge";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IGummi {variable = "IGummi";		displayName = "Plastik";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class ISchrauben {variable = "ISchrauben";		displayName = "Schrauben";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IRitzel {variable = "IRitzel";		displayName = "Zahnrader";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IGluhlampe {variable = "IGluhlampe";		displayName = "Gluhbirne";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IElektronik {variable = "IElektronik";		displayName = "Elektronikplatine";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IStoff {variable = "IStoff";		displayName = "Stoff";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IKugellager {variable = "IKugellager";		displayName = "Kugellager";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class IKruppstahl {variable = "IKruppstahl";		displayName = "Kruppstahl";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};

//Fahrzeuge
class Item_MRAP_01_F {variable = "Item_MRAP_01_F";		displayName = "Hunter Baukit";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Item_MRAP_02_F {variable = "Item_MRAP_02_F";		displayName = "Ifrit Baukit";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Item_Heli_Attack_02_F {variable = "Item_Heli_Attack_02_F";		displayName = "Kajman Baukit";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};
class Item_Heli_Transport_03_F {variable = "Item_Heli_Transport_03_F";		displayName = "Huron Baukit";		weight = 1;			buyPrice = 1;		sellPrice = 1;		illegal = false;			edible = 100;			icon = "";};

//WAFFEN
class IBolzen {variable = "IBolzen";							displayName = "Bolzen";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IFeder {variable = "IFeder";								displayName = "Feder";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class ILauf {variable = "ILauf";								displayName = "Lauf";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IAuswerfer {variable = "IAuswerfer";						displayName = "Auswerfer";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class ISchlagbolzen {variable = "ISchlagbolzen";				displayName = "Schlagbolzen";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IAbzug {variable = "IAbzug";								displayName = "Abzug";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class ISchlitten {variable = "ISchlitten";						displayName = "Schlitten";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IStahlLegirung {variable = "IStahlLegirung";				displayName = "Stahllegierung";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IGriffstuck {variable = "IGriffstuck";					displayName = "Griffstuck";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IRundeForm {variable = "IRundeForm";						displayName = "Runde Form";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IGewindeschneider {variable = "IGewindeschneider";		displayName = "Gewindeschneider";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};
class IGehause {variable = "IGehause";							displayName = "Metall gehause";		weight = 1;		buyPrice = 1;	sellPrice = 1;	illegal = false;	edible = 100;	icon = "";};


};
