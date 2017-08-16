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
        conditions = "";
        items[] = { "waterBottle", "tbacon", "apfel","apfelsaft","pfirsich","pfirsichsaft","kirsche","kirschsaft","banane","bananensaft","kiba","weintrauben","fisch","fischkonserve","pickaxe", "fuelFull", "storagesmall", "storagebig", "bandage" };
    };

    class med_market {
        name = "STR_Shops_Market";
        side = "med";
        license = "";
        conditions = "";
        items[] = { "coffee", "tbacon", "donuts", "waterBottle", "apfel","apfelsaft","pfirsich","pfirsichsaft","kirsche","kirschsaft","banane","bananensaft","kiba","weintrauben", "fuelFull", "bandage", "akku" };
    };

    class reb_markt {
        name = "STR_Shops_Rebel";
        side = "civ";
        license = "rebel";
        conditions = "";
        items[] = { "apfel","apfelsaft","pfirsich","pfirsichsaft","kirsche","kirschsaft","banane","bananensaft","kiba","weintrauben", "fuelFull", "bandage", "boltcutter", "blastingcharge", "kabelbinder", "lockpick", "augenbinde" };
    };

    class gang {
        name = "STR_Shops_Gang";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "apfel","apfelsaft","pfirsich","pfirsichsaft","kirsche","kirschsaft","banane","bananensaft","kiba","weintrauben", "fuelFull", "bandage", "boltcutter", "kabelbinder", "lockpick" };
    };

    class coffee {
        name = "STR_Shops_Coffee";
        side = "civ";
        license = "";
        conditions = "";
        items[] = {  "bandage" };
    };

    class f_station_coffee {
        name = "STR_Shop_Station_Coffee";
        side = "";
        license = "";
        conditions = "";
        items[] = {"fuelFull", "bandage"};
    };

    class cop {
        name = "STR_Shops_Cop";
        side = "cop";
        license = "";
        conditions = "";
        items[] = { "coffee", "tbacon", "donuts", "waterBottle", "apfel", "apfelsaft", "pfirsich", "pfirsichsaft", "kirsche", "kirschsaft", "banane", "bananensaft", "kiba", "weintrauben", "fuelFull", "bandage", "akku", "spikeStrip" };
    };

    class kupferankauf {
        name = "STR_Shops_Kupfer";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "kupferbarren"};
    };

    class eisenankauf {
        name = "STR_Shops_Eisen";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "eisenbarren"};
    };

    class drogen {
        name = "STR_Shops_drogen";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "heroinpulver", "hanf", "kokainpulver", "pilzpulver"};
    };

    class museum {
        name = "STR_Shops_museum";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "reliktesauber"};
    };
    class kueche {
        name = "STR_Shops_kueche";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "schildkroetenfleisch"};
    };

    class holz {
        name = "STR_Shops_holz";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "holzbrett"};
    };

    class glas {
        name = "STR_Shops_glas";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "glas"};
    };

    class dia {
        name = "STR_Shops_dia";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "diamanten", "silber"};
    };
    class oel {
        name = "STR_Shops_oel";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "benzin"};
    };

    class salz {
        name = "STR_Shops_salz";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "salz"};
    };

    class zement {
        name = "STR_Shops_zement";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "zement"};
    };

    class kohle {
        name = "STR_Shops_kohle";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "kohlebriketts"};
    };

    class alkschmuggler {
        name = "STR_Shops_schmuggler";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "moonshine"};
    };

    class alkexport {
        name = "STR_Shops_export";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "bier", "wein"};
    };

    class chemhandel {
        name = "STR_Shops_chemhandel";
        side = "civ";
        license = "";
        conditions = "";
        items[] = { "plutonium"};
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
	
	class augenbinde {
        variable = "augenbinde";
        displayName = "STR_Item_augenbinde";
        weight = 3;
        buyPrice = 15000;
        sellPrice = 200;
        illegal = true;
        edible = -1;
        icon = "icons\ico_augenbinde.paa";
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
        buyPrice = 120;
        sellPrice = 60;
        illegal = false;
        edible = 30;
        icon = "icons\ico_donuts.paa";
      };
    //Misc
    class pickaxe {
        variable = "pickaxe";
        displayName = "STR_Item_Pickaxe";
        weight = 2;
        buyPrice = 1750;
        sellPrice = 350;
        illegal = false;
        edible = -1;
        icon = "icons\ico_pickaxe.paa";
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
        buyPrice = 8500;
        sellPrice = 500;
        illegal = false;
        edible = -1;
        icon = "icons\ico_fuel.paa";
    };

    class spikeStrip {
        variable = "spikeStrip";
        displayName = "STR_Item_SpikeStrip";
        weight = 15;
        buyPrice = 10000;
        sellPrice = 1200;
        illegal = true;
        edible = -1;
        icon = "icons\ico_spikeStrip.paa";
    };

    class lockpick {
        variable = "lockpick";
        displayName = "STR_Item_Lockpick";
        weight = 1;
        buyPrice = 15000;
        sellPrice = 750;
        illegal = true;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
    };

    class goldbar {
        variable = "goldBar";
        displayName = "STR_Item_GoldBar";
        weight = 12;
        buyPrice = -1;
        sellPrice = 150000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_goldBar.paa";
    };

    class blastingcharge {
        variable = "blastingCharge";
        displayName = "STR_Item_BCharge";
        weight = 15;
        buyPrice = 55000;
        sellPrice = 10000;
        illegal = true;
        edible = -1;
        icon = "icons\ico_blastingCharge.paa";
    };

    class boltcutter {
        variable = "boltCutter";
        displayName = "STR_Item_BCutter";
        weight = 5;
        buyPrice = 20000;
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
        buyPrice = 155000;
        sellPrice = 50000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageSmall.paa";
    };

    class storagebig {
        variable = "storageBig";
        displayName = "STR_Item_StorageBL";
        weight = 10;
        buyPrice = 350000;
        sellPrice = 125000;
        illegal = false;
        edible = -1;
        icon = "icons\ico_storageBig.paa";
    };

	class akku {
		variable = "akku";
        displayName = "STR_Item_mlockp";
        weight = 1;
        buyPrice = 1000;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon = "icons\ico_lockpick.paa";
	};

	class bandage {
		variable = "bandage";
        displayName = "STR_Item_bandage";
        weight = 1;
        buyPrice = 250;
        sellPrice = 50;
        illegal = false;
        edible = -1;
        icon="icons\ico_bandage.paa";
	};

  class kupfererz {
		variable = "kupfererz";
		displayName = "STR_Item_kupfererz";
		weight = 5;
		buyPrice = -1;
		sellPrice = -1;
		illegal = false;
		edible = -1;
		icon = "icons\ico_copperore.paa";
	};
  class kupferbarren {
		variable = "kupferbarren";
    displayName = "STR_Item_kupferbarren";
    weight = 3;
    buyPrice = -1;
    sellPrice = 1000;
    illegal = false;
    edible = -1;
    icon="icons\ico_copper.paa";
	};
  class eisenerz {
		variable = "eisenerz";
    displayName = "STR_Item_eisenerz";
    weight = 6;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_ironore.paa";
	};
  class eisenbarren {
		variable = "eisenbarren";
    displayName = "STR_Item_eisenbarren";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1200;
    illegal = false;
    edible = -1;
    icon="icons\ico_iron.paa";
	};
  class apfel {
		variable = "apfel";
    displayName = "STR_Item_apfel";
    weight = 2;
    buyPrice = 100;
    sellPrice = 30;
    illegal = false;
    edible = 10;
    icon="icons\ico_apple.paa";
	};
  class apfelsaft {
		variable = "apfelsaft";
    displayName = "STR_Item_apfelsaft";
    weight = 4;
    buyPrice = 300;
    sellPrice = 60;
    illegal = false;
    edible = 20;
    icon="icons\ico_afelsaft.paa";
	};
  class pfirsichsaft {
		variable = "pfirsichsaft";
    displayName = "STR_Item_pfirsichsaft";
    weight = 5;
    buyPrice = 300;
    sellPrice = 75;
    illegal = false;
    edible = 20;
    icon="icons\ico_pfirsichsaft.paa";
	};
  class pfirsich {
		variable = "pfirsich";
    displayName = "STR_Item_pfirsich";
    weight = 2;
    buyPrice = 100;
    sellPrice = 35;
    illegal = false;
    edible = 10;
    icon="icons\ico_peach.paa";
	};
  class heroin {
		variable = "heroin";
    displayName = "STR_Item_heroin";
    weight = 8;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_heroinUnprocessed.paa";
	};
  class heroinpulver {
		variable = "heroinpulver";
    displayName = "STR_Item_heroinpulver";
    weight = 6;
    buyPrice = -1;
    sellPrice = 3547;
    illegal = true;
    edible = -1;
    icon="icons\ico_heroinProcessed.paa";
	};
  class hanfpflanze {
		variable = "hanfpflanze";
    displayName = "STR_Item_hanfpflanze";
    weight = 9;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_marijuana.paa";
	};
  class hanf {
		variable = "hanf";
    displayName = "STR_Item_hanf";
    weight = 7;
    buyPrice = -1;
    sellPrice = 4271;
    illegal = true;
    edible = -1;
    icon="icons\ico_cannabis.paa";
	};
  class kokainstrauch {
		variable = "kokainstrauch";
    displayName = "STR_Item_kokainstrauch";
    weight = 9;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_cocaineUnprocessed.paa";
	};
  class kokainpulver {
		variable = "kokainpulver";
    displayName = "STR_Item_kokainpulver";
    weight = 7;
    buyPrice = -1;
    sellPrice = 4312;
    illegal = true;
    edible = -1;
    icon="icons\ico_cocaineProcessed.paa";
	};
  class relikte {
		variable = "relikte";
    displayName = "STR_Item_relikte";
    weight = 12;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_relikte.paa";
	};
  class reliktesauber {
		variable = "reliktesauber";
    displayName = "STR_Item_reliktesauber";
    weight = 10;
    buyPrice = -1;
    sellPrice = 5746;
    illegal = false;
    edible = -1;
    icon="icons\ico_reliktesauber.paa";
	};
  class schildkroeten {
		variable = "schildkroeten";
    displayName = "STR_Item_schildkroeten";
    weight = 10;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_turtleRaw.paa";
	};
  class schildkroetenfleisch {
		variable = "schildkroetenfleisch";
    displayName = "STR_Item_schildkroetenfleisch";
    weight = 9;
    buyPrice = -1;
    sellPrice = 5041;
    illegal = true;
    edible = -1;
    icon="icons\ico_turtleSoup.paa";
	};
  class fisch {
		variable = "fisch";
    displayName = "STR_Item_fisch";
    weight = 5;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_salemaRaw.paa";
	};
  class fischkonserve {
		variable = "fischkonserve";
    displayName = "STR_Item_fischkonserve";
    weight = 3;
    buyPrice = 2000;
    sellPrice = 1042;
    illegal = false;
    edible = 15;
    icon="icons\ico_cookedFish.paa";
	};
  class holz {
		variable = "holz";
    displayName = "STR_Item_holz";
    weight = 7;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_holz.paa";
	};
  class holzbrett {
		variable = "holzbrett";
    displayName = "STR_Item_holzbrett";
    weight = 6;
    buyPrice = -1;
    sellPrice = 2447;
    illegal = false;
    edible = -1;
    icon="icons\ico_holzbrett.paa";
	};
  class sand {
		variable = "sand";
    displayName = "STR_Item_sand";
    weight = 6;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_sand.paa";
	};
  class glas {
		variable = "glas";
    displayName = "STR_Item_glas";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1085;
    illegal = false;
    edible = -1;
    icon="icons\ico_glass.paa";
	};
  class diamantenerz {
		variable = "diamantenerz";
    displayName = "STR_Item_diamantenerz";
    weight = 9;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_diamondUncut.paa";
	};
  class diamanten {
		variable = "diamanten";
    displayName = "STR_Item_diamanten";
    weight = 8;
    buyPrice = -1;
    sellPrice = 3472;
    illegal = false;
    edible = -1;
    icon="icons\ico_diamondCut.paa";
	};
  class rohoel {
		variable = "rohoel";
    displayName = "STR_Item_rohoel";
    weight = 11;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_oilUnprocessed.paa";
	};
  class benzin {
		variable = "benzin";
    displayName = "STR_Item_benzin";
    weight = 10;
    buyPrice = -1;
    sellPrice = 2014;
    illegal = false;
    edible = -1;
    icon="icons\ico_oilProcessed.paa";
	};
  class salzerz {
		variable = "salzerz";
    displayName = "STR_Item_salzerz";
    weight = 3;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_saltUnprocessed.paa";
	};
  class salz {
		variable = "salz";
    displayName = "STR_Item_salz";
    weight = 2;
    buyPrice = -1;
    sellPrice = 1278;
    illegal = false;
    edible = -1;
    icon="icons\ico_saltProcessed.paa";
	};
  class stein {
		variable = "stein";
    displayName = "STR_Item_stein";
    weight = 5;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_rock.paa";
	};
  class zement {
		variable = "zement";
    displayName = "STR_Item_zement";
    weight = 3;
    buyPrice = -1;
    sellPrice = 1825;
    illegal = false;
    edible = -1;
    icon="icons\ico_cement.paa";
	};
  class kirsche {
		variable = "kirsche";
    displayName = "STR_Item_kirsche";
    weight = 3;
    buyPrice = -1;
    sellPrice = 40;
    illegal = false;
    edible = 20;
    icon="icons\ico_kirsche.paa";
	};
  class kirschsaft {
		variable = "kirschsaft";
    displayName = "STR_Item_kirschsaft";
    weight = 2;
    buyPrice = -1;
    sellPrice = 80;
    illegal = false;
    edible = 20;
    icon="icons\ico_kirschsaft.paa";
	};
  class banane {
		variable = "banane";
    displayName = "STR_Item_banane";
    weight = 3;
    buyPrice = -1;
    sellPrice = 45;
    illegal = false;
    edible = 20;
    icon="icons\ico_banane.paa";
	};
  class bananensaft {
		variable = "bananensaft";
    displayName = "STR_Item_bananensaft";
    weight = 2;
    buyPrice = -1;
    sellPrice = 85;
    illegal = false;
    edible = 20;
    icon="icons\ico_bananensaft.paa";
	};
  class kiba {
		variable = "kiba";
    displayName = "STR_Item_kiba";
    weight = 2;
    buyPrice = -1;
    sellPrice = 115;
    illegal = false;
    edible = 30;
    icon="icons\ico_kiba.paa";
	};
  class kohle {
		variable = "kohle";
    displayName = "STR_Item_kohle";
    weight = 5;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_kohle.paa";
	};
  class kohlebriketts {
		variable = "kohlebriketts";
    displayName = "STR_Item_kohlebriketts";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1452;
    illegal = false;
    edible = -1;
    icon="icons\ico_kohlebriketts.paa";
	};
  class silbererz {
		variable = "silbererz";
    displayName = "STR_Item_silbererz";
    weight = 5;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_silbererz.paa";
	};
  class silber {
		variable = "silber";
    displayName = "STR_Item_silber";
    weight = 3;
    buyPrice = -1;
    sellPrice = 1725;
    illegal = false;
    edible = -1;
    icon="icons\ico_silberbarren.paa";
	};
  class gerste {
		variable = "gerste";
    displayName = "STR_Item_gerste";
    weight = 8;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_gerste.paa";
	};
  class hopfen {
		variable = "hopfen";
    displayName = "STR_Item_hopfen";
    weight = 8;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_hopfen.paa";
	};
  class maische {
		variable = "maische";
    displayName = "STR_Item_maische";
    weight = 9;
    buyPrice = -1;
    sellPrice = -1;
    illegal = false;
    edible = -1;
    icon="icons\ico_maische.paa";
	};
  class bier {
		variable = "bier";
    displayName = "STR_Item_bier";
    weight = 7;
    buyPrice = -1;
    sellPrice = 3574;
    illegal = false;
    edible = -1;
    icon="icons\ico_beer.paa";
	};
  class moonshine {
		variable = "moonshine";
    displayName = "STR_Item_moonshine";
    weight = 7;
    buyPrice = -1;
    sellPrice = 3978;
    illegal = false;
    edible = -1;
    icon="icons\ico_moonshine.paa";
	};
  class weintrauben {
	variable = "weintrauben";
    displayName = "STR_Item_weintrauben";
    weight = 5;
    buyPrice = 750;
    sellPrice = 250;
    illegal = false;
    edible = 20;
    icon="icons\ico_trauben.paa";
	};
  class wein {
		variable = "wein";
    displayName = "STR_Item_wein";
    weight = 4;
    buyPrice = -1;
    sellPrice = 1350;
    illegal = false;
    edible = 30;
    icon="icons\ico_wein.paa";
	};
  class uranerz {
		variable = "uranerz";
    displayName = "STR_Item_uranerz";
    weight = 22;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_uran.paa";
	};
  class plutonium {
		variable = "plutonium";
    displayName = "STR_Item_plutonium";
    weight = 17;
    buyPrice = -1;
    sellPrice = 7374;
    illegal = true;
    edible = -1;
    icon="icons\ico_plutonium.paa";
	};
  class pilz {
		variable = "pilz";
    displayName = "STR_Item_pilz";
    weight = 7;
    buyPrice = -1;
    sellPrice = -1;
    illegal = true;
    edible = -1;
    icon="icons\ico_pilz.paa";
	};

  class pilzpulver {
		variable = "pilzpulver";
    displayName = "STR_Item_pilzpulver";
    weight = 7;
    buyPrice = -1;
    sellPrice = 3457;
    illegal = true;
    edible = -1;
    icon="icons\ico_pilzpulver.paa";
	};

  class kabelbinder {
		variable = "kabelbinder";
    displayName = "STR_Item_kabelbinder";
    weight = 4;
    buyPrice = 5000;
    sellPrice = 500;
    illegal = true;
    edible = -1;
    icon="icons\ico_kabelbinder.paa";
	};

  class angel {
		variable = "angel";
    displayName = "STR_Item_angel";
    weight = 4;
    buyPrice = 10000;
    sellPrice = 500;
    illegal = false;
    edible = -1;
    icon="icons\ico_angel.paa";
	};
};
