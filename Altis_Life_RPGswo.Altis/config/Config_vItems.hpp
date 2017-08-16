/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call DWEV_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*/
class VirtualShops {
    //Virtual Shops
	/*
		class market -> Classname die vom NPCschild abgerufen wird
		name = ""; -> Name der im Shop angezeigt wird
		side -> Playerside die zugreifen darf. leer wenn alle
		conditions = ""; -> Extra regelungen wie lizenzen oder coplevel
		items[] = -> Items die in diesem Shop verkauft werden können, items die kaufbar sind, nur wenn sie ein buyprice haben
		rebuy[] = -> Items sie man kaufen kann. Verkaufspreis + 10% aufschlag.
	*/
	
    class market {
        name = "Supermarkt";
        side = "civ";
        conditions = "";
		items[] = { "water", "beer", "rabbit", "apple", "redgull", "tbacon", "lockpick", "hammer", "pickaxe", "shovel", "kopflampe", "fuelF", "peach", "apfelsaft", "pfirsichsaft", "sechouse", "melon", "kokos", "banana", "melonp", "kokosp", "bananap", "kokosbananamilk" };
		rebuy[] = { "melon","kokos","banana","melonp","kokosp","bananap" };
    };
	
	class marketkavala {
        name = "Supermarkt";
        side = "civ";
        conditions = "";
		items[] = { "water","beer","rabbit","apple","redgull","tbacon","pickaxe","shovel","fuelF","peach","apfelsaft","pfirsichsaft","sechouse","melon","kokos","banana","melonp","kokosp","bananap","kokosbananamilk","kopflampe" };
		rebuy[] = { "melon","kokos","banana","melonp","kokosp","bananap" };
    };
	
	class bistro {
        name = "Tankwart";
        side = "civ";
        conditions = "";
		items[] = { "water","tbacon","fuelF","nitro" };
		rebuy[] = {};
    };
	
	class iron {
        name = "Schrottplatz";
        side = "civ";
        conditions = "";
		items[] = { "iron_r","copper_r","goldberuf","silberbar","pickaxe" };
		rebuy[] = { "iron_r","copper_r","goldberuf","silberbar" };
    };
	
	class diamond {
        name = "Joes Diamanten";
        side = "civ";
        conditions = "";
		items[] = { "diamond","diamondc","pickaxe" };
		rebuy[] = {};
    };
	
	class salt {
        name = "Gewürzhändler";
        side = "civ";
        conditions = "";
		items[] = { "salt_r","pfefferp","pickaxe","curryp","zimtp" };
		rebuy[] = {};
    };
	
	class cement {
        name = "Zementhändler";
        side = "civ";
        conditions = "";
		items[] = { "cement" };
		rebuy[] = {};
    };
	
	class wein {
        name = "Weinhändler";
        side = "civ";
        conditions = "";
		items[] = { "vodka" };
		rebuy[] = {};
    };
	
	class pilzh {
        name = "Pilzsuppenhändler";
        side = "civ";
        conditions = "";
		items[] = { "pilzsuppe" };
		rebuy[] = {};
    };
	
	class rebbistro {
        name = "Bistrorebell";
        side = "civ";
        conditions = "lc_rebel";
		items[] = { "water","tbacon","lockpick","hammer","fahrsperre","alarmanlage","redgull","handschellen","boltcutter","blastingcharge","ipuranium","kopflampe" };
		rebuy[] = {};
    };
	
	class muell {
        name = "Muelly`s Mülldeponie";
        side = "civ";
        conditions = "";
		items[] = { "muell" };
		rebuy[] = {};
    };
	
	class broker_illegal {
        name = "Illegaler Wertpapierhändler";
        side = "civ";
        conditions = "";
		items[] = { "ring","perlenk" };
		rebuy[] = {};
    };
	
	class broker {
        name = "Wertpapierhändler";
        side = "civ";
        conditions = "";
		items[] = { "wp_oil","wp_glass","wp_iron","wp_copper","wp_goldberuf","wp_silberbar","wp_diamond","wp_salt","wp_pfeffer","wp_curry","wp_zimt" };
		rebuy[] = { "wp_oil","wp_glass","wp_iron","wp_copper","wp_goldberuf","wp_silberbar"/*,"wp_diamond"*/,"wp_salt","wp_pfeffer","wp_curry","wp_zimt" };
    };
	
	class juwelier {
        name = "Juwelier";
        side = "civ";
        conditions = "";
		items[] = { "ring","perlenk" };
		rebuy[] = {};
    };
	
	class gemuese {
        name = "Gemüsehändler";
        side = "civ";
        conditions = "";
		items[] = { "salatp","kartoffelp" };
		rebuy[] = {};
    };
	
	class imbiss {
        name = "Imbiss";
        side = "civ";
        conditions = "";
		items[] = { "pommes","salatb" };
		rebuy[] = {};
    };
	
	class gang {
        name = "Gangmarkt";
        side = "civ";
        conditions = "";
		items[] = { "water","redgull","tbacon","lockpick","hammer","pickaxe","shovel","fuelF","handschellen","blastingcharge","boltcutter","kopflampe" };
		rebuy[] = {};
    };
	
	class casino {
        name = "Casinofutter";
        side = "civ";
        conditions = "";
		items[] = { "water","tbacon","redgull" };
		rebuy[] = {};
    };
	
	class knast {
        name = "Knastfutter";
        side = "civ";
        conditions = "";
		items[] = { "water","brot" };
		rebuy[] = {};
    };
	
	class oil {
        name = "Ölhändler";
        side = "civ";
        conditions = "";
		items[] = { "oilp","pickaxe","fuelF" };
		rebuy[] = {};
    };
	
	class fishmarket {
        name = "Fischmarkt";
        side = "civ";
        conditions = "";
		items[] = { "netz","salema","ornate","mackerel","mullet","tuna","catshark" };
		rebuy[] = {};
    };
	
	class glass {
        name = "Glashändler";
        side = "civ";
        conditions = "";
		items[] = { "glass" };
		rebuy[] = {};
    };
	
	class uranium {
        name = "Uranium Shop";
        side = "civ";
        conditions = "";
		items[] = { "uranium5" };
		rebuy[] = {};
    };
	
	class gold {
        name = "Bankgoldhändler";
        side = "civ";
        conditions = "";
		items[] = { "goldbar" };
		rebuy[] = {};
    };
	
	class wongs {
        name = "Wong`s Restaurant";
        side = "civ";
        conditions = "";
		items[] = { "turtle","moonshine","schenkel","ksuppe" };
		rebuy[] = {};
    };
	
	class heroin {
        name = "Drogenhändler";
        side = "civ";
        conditions = "";
		items[] = { "cocainep","heroinp","marijuana","meth","dmt","zauberpilz" };
		rebuy[] = {};
    };
	
	class drogen {
        name = "Drogenhändler";
        side = "civ";
        conditions = "";
		items[] = { "methge","dmtge","cocainege","heroinge","marijuanage","zauberpilzge" };
		rebuy[] = {};
    };
	
	class drogenkunde {
        name = "Drogenkunde";
        side = "civ";
        conditions = "";
		items[] = { "heroinsp","joint" };
		rebuy[] = {};
    };
	
	class organ {
        name = "Organhändler";
        side = "civ";
        conditions = "";
		items[] = { "kidney","skalpell" };
		rebuy[] = {};
    };
	
	class WSC {
        name = "Kantine";
        side = "WSC";
        conditions = "";
		items[] = { "water","coffee","redgull","tbacon","donuts","schnuller","fuelF" };
		rebuy[] = {};
    };
	
	class medessen {
        name = "Kantine";
        side = "med";
        conditions = "";
		items[] = { "defibrillator","water","coffee","tbacon","donuts","pille","kidney","schnuller","fuelF","kopflampe" };
		rebuy[] = {};
    };
	
	class cop {
        name = "Kantine";
        side = "cop";
        conditions = "";
		items[] = { "donuts","coffee","redgull","spikeStrip","schnuller","fuelF","defusekit","kopflampe" };
		rebuy[] = {};
    };
	
	//		TANOA ANFANG
	
	class tiermode {
        name = "Tiermode Händler";
        side = "civ";
        conditions = "";
		items[] = { "anakondastreck","krokostreck" };
		rebuy[] = {};
    };
	
	class schwarzmarkt {
        name = "Schwarzmarkt";
        side = "civ";
        conditions = "";
		items[] = { "krokop","schlafmohnp","anakondap" };
		rebuy[] = {};
    };
	
	class warenschieber {
        name = "Warenschieber";
        side = "civ";
        conditions = "";
		items[] = { "schlafmohnstreck","reliktstreck","kriegsschrottstreck" };
		rebuy[] = {};
    };
	
	class antitrader {
        name = "Antiquitätenhändler";
        side = "civ";
        conditions = "";
		items[] = { "kriegsschrottp","reliktp" };
		rebuy[] = {};
    };
	
	class sammel {
        name = "Sammelverkäufer";
        side = "civ";
        conditions = "";
		items[] = { "zuckerrohrp","kakaop","schoko" };
		rebuy[] = {};
    };
	
	class reifen {
        name = "Reifenhändler";
        side = "civ";
        conditions = "";
		items[] = { "reifen" };
		rebuy[] = {};
    };
	
	class tabakshop {
        name = "Tabakshop";
        side = "civ";
        conditions = "";
		items[] = { "tabakp" };
		rebuy[] = {};
    };
	
	class baustoff {
        name = "Baustoffhändler";
        side = "civ";
        conditions = "";
		items[] = { "lehmp","tropenholzp" };
		rebuy[] = {};
    };
	
	class brikett {
        name = "Briketthändler";
        side = "civ";
        conditions = "";
		items[] = { "kohlep" };
		rebuy[] = {};
    };
	
	class steinhauer {
        name = "Steinhauer";
        side = "civ";
        conditions = "";
		items[] = { "magmap" };
		rebuy[] = {};
    };
	
	class gummi {
        name = "Gummihändler";
        side = "civ";
        conditions = "";
		items[] = { "kautschukp" };
		rebuy[] = {};
    };
	
	class felge {
        name = "Autotuner";
        side = "civ";
        conditions = "";
		items[] = { "platinp" };
		rebuy[] = {};
    };
	
	//		Tanoa Ende
};

/*
*    CLASS:
*        variable = Variable Name
*        displayName = Item Name
*        weight = Item Weight
*        buyPrice = Item Buy Price
*        sellPrice = Item Sell Price // nicht vorhanden bei uns, wird aus datenbank gezogen
*        illegal = Illegal Item
*        edible = Item essbar (-1 = Disabled)
*		 drink = Item trinkbar (-1 = Disabled)
*        icon = Item Icon
*/
class VirtualItems {
    //Virtual Items

    class defibrillator {
        variable = "defibrillator";
        displayName = "Defibrillator";
        weight = 4;
        buyPrice = 1000;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\defibrillator.paa";
    };

    class water {
        variable = "water";
        displayName = "Wasserflasche";
        weight = 1;
        buyPrice = 10;
        illegal = false;
        edible = -1;
		drink = 70;
        icon = "icons\items\water.paa";
    };
	
	class beer {
        variable = "beer";
        displayName = "Bierflasche";
        weight = 1;
        buyPrice = 50;
        illegal = false;
        edible = 5;
		drink = 20;
        icon = "icons\items\beer.paa";
    };
	
	class rabbit {
        variable = "rabbit";
        displayName = "Hasenfleisch";
        weight = 1;
        buyPrice = 80;
        illegal = false;
        edible = 20;
		drink = -1;
        icon = "icons\items\meat.paa";
    };
	
	class apple {
        variable = "apple";
        displayName = "Apfel";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 10;
		drink = -1;
        icon = "icons\items\apple.paa";
    };
	
	class redgull {
        variable = "redgull";
        displayName = "Energy Drink";
        weight = 3;
        buyPrice = 1500;
        illegal = false;
        edible = -1;
		drink = 100;
        icon = "icons\items\redgull.paa";
    };
	
	class tbacon {
        variable = "tbacon";
        displayName = "Frühstücksspeck";
        weight = 1;
        buyPrice = 80;
        illegal = false;
        edible = 40;
		drink = -1;
        icon = "icons\items\meat.paa";
    };
	
	class salema {
        variable = "salema";
        displayName = "Salema Filet";
        weight = 2;
        buyPrice = 60;
        illegal = false;
        edible = 30;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class ornate {
        variable = "ornate";
        displayName = "Ornate Filet";
        weight = 2;
        buyPrice = 50;
        illegal = false;
        edible = 25;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class mackerel {
        variable = "mackerel";
        displayName = "Makrelenfilet";
        weight = 4;
        buyPrice = 200;
        illegal = false;
        edible = 30;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class tuna {
        variable = "tuna";
        displayName = "Thunfisch Steak";
        weight = 6;
        buyPrice = 900;
        illegal = false;
        edible = 100;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class mullet {
        variable = "mullet";
        displayName = "Meeräschenfilet";
        weight = 4;
        buyPrice = 300;
        illegal = false;
        edible = 80;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class catshark {
        variable = "catshark";
        displayName = "Katzenhaifilet";
        weight = 6;
        buyPrice = 360;
        illegal = false;
        edible = 100;
		drink = -1;
        icon = "icons\items\fish.paa";
    };
	
	class donuts {
        variable = "donuts";
        displayName = "Donuts";
        weight = 1;
        buyPrice = 80;
        illegal = false;
        edible = 40;
		drink = -1;
        icon = "icons\items\donut.paa";
    };
	
	class brot {
        variable = "brot";
        displayName = "Brot";
        weight = 1;
        buyPrice = 20;
        illegal = false;
        edible = 10;
		drink = -1;
        icon = "icons\items\brot.paa";
    };
	
	class coffee {
        variable = "coffee";
        displayName = "Kaffee";
        weight = 1;
        buyPrice = 10;
        illegal = false;
        edible = -1;
		drink = 30;
        icon = "icons\items\coffee.paa";
    };
	
	class lockpick {
        variable = "lockpick";
        displayName = "Dietrich";
        weight = 5;
        buyPrice = 5000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\lockpick.paa";
    };
	
	class hammer {
        variable = "hammer";
        displayName = "Hammer";
        weight = 5;
        buyPrice = 100000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\hammer.paa";
    };
	
	class pickaxe {
        variable = "pickaxe";
        displayName = "Spitzhacke";
        weight = 2;
        buyPrice = 1500;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pickaxe.paa";
    };
	
	class shovel {
        variable = "shovel";
        displayName = "Schaufel";
        weight = 2;
        buyPrice = 2500;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Schaufel.paa";
    };
	
	class kopflampe {
        variable = "kopflampe";
        displayName = "Kopflampe";
        weight = 5;
        buyPrice = 2500;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\kopflampe.paa";
    };
	
	class netz {
        variable = "netz";
        displayName = "Fischernetz";
        weight = 2;
        buyPrice = 2000;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\fishingpoles.paa";
    };
	
	class fuelE {
        variable = "fuelE";
        displayName = "Leerer Benzinkanister";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\fuel_can.paa";
    };
	
	class fuelF {
        variable = "fuelF";
        displayName = "Voller Benzinkanister";
        weight = 5;
        buyPrice = 900;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\fuel_can.paa";
    };
	
	class peach {
        variable = "peach";
        displayName = "Pfirsich";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 10;
		drink = -1;
        icon = "icons\items\peach.paa";
    };
	
	class apfelsaft {
        variable = "apfelsaft";
        displayName = "Apfelsaft";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\apfelsaft.paa";
    };
	
	class pfirsichsaft {
        variable = "pfirsichsaft";
        displayName = "Pfirsichsaft";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pfirsichsaft.paa";
    };
	
	class sechouse {
        variable = "sechouse";
        displayName = "Haus Sicherheitssystem";
        weight = 4;
        buyPrice = 200000;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\sechouse.paa";
    };
	
	class ironore {
        variable = "ironore";
        displayName = "Eisenerz";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\iron_ore.paa";
    };
	
	class iron_r {
        variable = "iron_r";
        displayName = "Eisenbarren";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\iron.paa";
    };
	
	class oilu {
        variable = "oilu";
        displayName = "Rohöl";
        weight = 7;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\oil_unprocessed.paa";
    };
	
	class oilp {
        variable = "oilp";
        displayName = "Raffiniertes Öl";
        weight = 6;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\oil_processed.paa";
    };
	
	class golderz {
        variable = "golderz";
        displayName = "Golderz";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\golderz.paa";
    };
	
	class goldberuf {
        variable = "goldberuf";
        displayName = "Goldbarren";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\goldbar.paa";
    };
	
	class silbererz {
        variable = "silbererz";
        displayName = "Silbererz";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\silbererz.paa";
    };
	
	class silberbar {
        variable = "silberbar";
        displayName = "Silberbarren";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\silberbar.paa";
    };
	
	class ring {
        variable = "ring";
        displayName = "Ring";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\ring.paa";
    };
	
	class kartoffel {
        variable = "kartoffel";
        displayName = "Schmutz Kartoffel";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\schmutzkartoffel.paa";
    };
	
	class kartoffelp {
        variable = "kartoffelp";
        displayName = "Kartoffel";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\kartoffel.paa";
    };
	
	class pommes {
        variable = "pommes";
        displayName = "Pommes";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pommes.paa";
    };
	
	class diamond {
        variable = "diamond";
        displayName = "Ungeschliffener Diamant";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\diamond_unprocessed.paa";
    };
	
	class diamondc {
        variable = "diamondc";
        displayName = "Geschliffener Diamant";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\diamond.paa";
    };
	
	class zimt {
        variable = "zimt";
        displayName = "Zimtstange";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\zimtstange.paa";
    };
	
	class zimtp {
        variable = "zimtp";
        displayName = "Zimt";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\zimt.paa";
    };
	
	class muschel {
        variable = "muschel";
        displayName = "Muschel";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\muschel.paa";
    };
	
	class perlen {
        variable = "perlen";
        displayName = "Perlen";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\perle.paa";
    };
	
	class perlenk {
        variable = "perlenk";
        displayName = "Perlenkette";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\perlenkette.paa";
    };
	
	class gussform {
        variable = "gussform";
        displayName = "Gussform";
        weight = 10;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\gussform.paa";
    };
	
	class titan {
        variable = "titan";
        displayName = "Titanbarren";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\titan.paa";
    };
	
	class stoff {
        variable = "stoff";
        displayName = "Stoff";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\stoff.paa";
    };
	
	class kraftriegel {
        variable = "kraftriegel";
        displayName = "Kraftriegel";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\kraftriegel.paa";
    };
	
	class farbeblau {
        variable = "farbeblau";
        displayName = "Blaue Farbe";
        weight = 6;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\farbeblau.paa";
    };
	
	class verband {
        variable = "verband";
        displayName = "Verband";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\verband.paa";
    };
	
	class traubenzucker {
        variable = "traubenzucker";
        displayName = "Traubenzucker";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\traubenzucker.paa";
    };
	
	class redshot {
        variable = "redshot";
        displayName = "EnergyShot";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\redshot.paa";
    };
	
	class sand {
        variable = "sand";
        displayName = "Sand";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\sand.paa";
    };
	
	class glass {
        variable = "glass";
        displayName = "Glas";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\glass.paa";
    };
	
	class copperore {
        variable = "copperore";
        displayName = "Kupfererz";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\copper_ore.paa";
    };
	
	class copper_r {
        variable = "copper_r";
        displayName = "Kupferbarren";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\copper.paa";
    };
	
	class rock {
        variable = "rock";
        displayName = "Stein";
        weight = 6;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\rock.paa";
    };
	
	class cement {
        variable = "cement";
        displayName = "Zement Sack";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\cement.paa";
    };
	
	class storagesmall {
        variable = "storagesmall";
        displayName = "kleine Lagerkiste";
        weight = 25;
        buyPrice = -1; //500000
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\storagesmall.paa";
    };
	
	class storagebig {
        variable = "storagebig";
        displayName = "große Lagerkiste";
        weight = 30;
        buyPrice = -1; //1000000
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\storagebig.paa";
    };
	
	class schnuller {
        variable = "schnuller";
        displayName = "Schnuller";
        weight = 4;
        buyPrice = 1000;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\schnuller.paa";
    };
	
	class pille {
        variable = "pille";
        displayName = "Schmerzmittel";
        weight = 2;
        buyPrice = 100;
        illegal = true;
        edible = 10;
		drink = -1;
        icon = "icons\items\pille.paa";
    };
	
	class defusekit {
        variable = "defusekit";
        displayName = "Entschärfungskit";
        weight = 2;
        buyPrice = 2500;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\defusekit.paa";
    };
	
	class grapes {
        variable = "grapes";
        displayName = "Weintrauben";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\grape.paa";
    };
	
	class vodka {
        variable = "vodka";
        displayName = "Wein";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = 20;
        icon = "icons\items\wein.paa";
    };
	
	class salt {
        variable = "salt";
        displayName = "Salzbrocken";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt_unprocessed.paa";
    };
	
	class salt_r {
        variable = "salt_r";
        displayName = "Salz";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class pfeffer {
        variable = "pfeffer";
        displayName = "Pfefferkörner";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pfeffer.paa";
    };
	
	class pfefferp {
        variable = "pfefferp";
        displayName = "Pfeffer";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pfefferp.paa";
    };
	
	class pilz {
        variable = "pilz";
        displayName = "Pilze";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pilz.paa";
    };
	
	class pilzsuppe {
        variable = "pilzsuppe";
        displayName = "Pilzsuppe";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\pilzsuppe.paa";
    };
	
	class salat {
        variable = "salat";
        displayName = "Schmutz Salat";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\schmutzsalat.paa";
    };
	
	class salatp {
        variable = "salatp";
        displayName = "Salatkopf";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salat.paa";
    };
	
	class salatb {
        variable = "salatb";
        displayName = "Salatblatt";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salatblatt.paa";
    };
	
	class curry {
        variable = "curry";
        displayName = "Currykraut";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\currykraut.paa";
    };
	
	class curryp {
        variable = "curryp";
        displayName = "Curry";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\curry.paa";
    };
	
	class wp_oil {
        variable = "wp_oil";
        displayName = "Öl Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_glass {
        variable = "wp_glass";
        displayName = "Glas Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_iron {
        variable = "wp_iron";
        displayName = "Eisen Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_copper {
        variable = "wp_copper";
        displayName = "Kupfer Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_goldberuf {
        variable = "wp_goldberuf";
        displayName = "Gold Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_silberbar {
        variable = "wp_silberbar";
        displayName = "Silber Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_diamond {
        variable = "wp_diamond";
        displayName = "Diamanten Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_salt {
        variable = "wp_salt";
        displayName = "Salz Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_pfeffer {
        variable = "wp_pfeffer";
        displayName = "Pfeffer Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_curry {
        variable = "wp_curry";
        displayName = "Curry Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class wp_zimt {
        variable = "wp_zimt";
        displayName = "Zimt Aktie";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\aktie.paa";
    };
	
	class fahrsperre {
        variable = "fahrsperre";
        displayName = "Hacker Tablet";
        weight = 10;
        buyPrice = 30000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\tablet.paa";
    };
	
	class heroinu {
        variable = "heroinu";
        displayName = "unreines Heroin";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\heroin_unprocessed.paa";
    };
	
	class heroinp {
        variable = "heroinp";
        displayName = "Heroin";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\heroin_processed.paa";
    };
	
	class heroinge {
        variable = "heroinge";
        displayName = "Gestreckes Heroin";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\heroinge.paa";
    };
	
	class heroinsp {
        variable = "heroinsp";
        displayName = "Heroinspritze";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\heroin_spritze.paa";
    };
	
	class cannabis {
        variable = "cannabis";
        displayName = "Cannabis";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\cannabis.paa";
    };
	
	class marijuana {
        variable = "marijuana";
        displayName = "Marijuana";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\marijuana.paa";
    };
	
	class marijuanage {
        variable = "marijuanage";
        displayName = "Gestreckes Marijuana";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\marijuanage.paa";
    };
	
	class joint {
        variable = "joint";
        displayName = "joint";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\joint.paa";
    };
	
	class cocaine {
        variable = "cocaine";
        displayName = "unreines Kokain";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\cocain_unprocessed.paa";
    };
	
	class cocainep {
        variable = "cocainep";
        displayName = "Feines Kokain";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\cocain_processed.paa";
    };
	
	class cocainege {
        variable = "cocainege";
        displayName = "Gestreckes Kokain";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\cocainege.paa";
    };
	
	class alarmanlage {
        variable = "alarmanlage";
        displayName = "Seitenschneider";
        weight = 5;
        buyPrice = 10000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\seitenschneider.paa";
    };
	
	class skalpell {
        variable = "skalpell";
        displayName = "Skalpell";
        weight = 2;
        buyPrice = 20000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\skalpell.paa";
    };
	
	class blastingcharge {
        variable = "blastingcharge";
        displayName = "Sprengladung";
        weight = 15;
        buyPrice = 70000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\blastingcharge.paa";
    };
	
	class boltcutter {
        variable = "boltcutter";
        displayName = "Bolzenschneider";
        weight = 5;
        buyPrice = 15000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\boltcutter.paa";
    };
	
	class kidney {
        variable = "kidney";
        displayName = "Schwarzmarkt Niere";
        weight = 15;
        buyPrice = 150000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\kidney.paa";
    };
	
	class spikeStrip {
        variable = "spikeStrip";
        displayName = "Stacheldraht";
        weight = 15;
        buyPrice = 2500;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\spikestrip.paa";
    };
	
	class handschellen {
        variable = "handschellen";
        displayName = "Handschellen";
        weight = 10;
        buyPrice = 6000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\handschellen.paa";
    };
	
	class goldbar {
        variable = "goldbar";
        displayName = "Bank Gold";
        weight = 12;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\goldbar.paa";
    };
	
	class schwarzmarktoel {
        variable = "schwarzmarktoel";
        displayName = "Schwarzmarktöl";
        weight = 7;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\schwarzmarktoel.paa";
    };
	
	class ozelotpelz {
        variable = "ozelotpelz";
        displayName = "Ozelotpelz";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\ozelotpelz.paa";
    };
	
	class kevlar {
        variable = "kevlar";
        displayName = "Kevlar";
        weight = 10;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\kevlar.paa";
    };
	
	class chemikalie {
        variable = "chemikalie";
        displayName = "Giftige Chemikalie";
        weight = 5;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\chemikalie.paa";
    };
	
	class nitro {
        variable = "nitro";
        displayName = "NOS Einspritzung";
        weight = 5;
        buyPrice = 18000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\nitro.paa";
    };
	
	class nitrov2 {
        variable = "nitrov2";
        displayName = "NoS V2";
        weight = 5;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\nitrov2.paa";
    };
	
	class turtle {
        variable = "turtle";
        displayName = "Schildkrötenfleisch";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = 100;
		drink = -1;
        icon = "icons\items\turtle.paa";
    };
	
	class moonshine {
        variable = "moonshine";
        displayName = "Schwarzgebrannter Obstschnaps";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = 20;
        icon = "icons\items\moonshine.paa";
    };
	
	class schenkel {
        variable = "schenkel";
        displayName = "Krötenschenkel";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\schenkel.paa";
    };
	
	class ksuppe {
        variable = "ksuppe";
        displayName = "Krötensuppe";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\ksuppe.paa";
    };
	
	class kroete {
        variable = "kroete";
        displayName = "Aga Kröten";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\kroete.paa";
    };
	
	class bufo {
        variable = "bufo";
        displayName = "Schleimfolie";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\bufo.paa";
    };
	
	class dmt {
        variable = "dmt";
        displayName = "Dimethyltryptamin";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\dmt.paa";
    };
	
	class dmtge {
        variable = "dmtge";
        displayName = "Gestreckes DMT";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\dmtge.paa";
    };
	
	class methst {
        variable = "methst";
        displayName = "Methylamphetamin Zutaten";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\methst.paa";
    };
	
	class methpla {
        variable = "methpla";
        displayName = "Methylamphetamin Platten";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\methpla.paa";
    };
	
	class meth {
        variable = "meth";
        displayName = "Crystal Meth";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\meth.paa";
    };
	
	class methge {
        variable = "methge";
        displayName = "Gestreckes Meth";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\methge.paa";
    };
	
	class zaupilz {
        variable = "zaupilz";
        displayName = "Unreine Zauberpilze";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\zaupilz.paa";
    };
	
	class zauberpilz {
        variable = "zauberpilz";
        displayName = "Zauberpilz";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\zauberpilz.paa";
    };
	
	class zauberpilzge {
        variable = "zauberpilzge";
        displayName = "Gestreckter Zauberpilz";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\zauberpilzge.paa";
    };
	
	class ipuranium {
        variable = "ipuranium";
        displayName = "Uraniumfilter";
        weight = 3;
        buyPrice = 9000;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\ipuranium.paa";
    };
	
	class uranium1 {
        variable = "uranium1";
        displayName = "Uranium Müll";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\uranium1.paa";
    };
	
	class uranium2 {
        variable = "uranium2";
        displayName = "Roh-Uranium";
        weight = 2;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\uranium2.paa";
    };
	
	class uranium3 {
        variable = "uranium3";
        displayName = "Gereinigtes Uranium";
        weight = 5;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\uranium3.paa";
    };
	
	class uranium4 {
        variable = "uranium4";
        displayName = "Uranium Konzentrat";
        weight = 5;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\uranium4.paa";
    };
	
	class uranium5 {
        variable = "uranium5";
        displayName = "Uranium";
        weight = 5;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\uranium5.paa";
    };
	
	class muell {
        variable = "muell";
        displayName = "Müll";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\muell.paa";
    };
	
	class money {
        variable = "money";
        displayName = "Geld";
        weight = 0;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\money.paa";
    };
	
//			TANOA ANFANG
	
	class melon {
        variable = "melon";
        displayName = "Melonen";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = 10;
		drink = 10;
        icon = "icons\items\Melone.paa";
    };
	
	class melonp {
        variable = "melonp";
        displayName = "Meloneneis";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 20;
		drink = 10;
        icon = "icons\items\Meloneneis.paa";
    };
	
	class kokos {
        variable = "kokos";
        displayName = "Kokosnuss";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 10;
		drink = 10;
        icon = "icons\items\Kokosnuss.paa";
    };
	
	class kokosp {
        variable = "kokosp";
        displayName = "Kokosmilch";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 20;
		drink = 10;
        icon = "icons\items\salt.paa";
    };
	
	class banana {
        variable = "banana";
        displayName = "Bananen";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 10;
		drink = 10;
        icon = "icons\items\Bananen.paa";
    };
	
	class bananap {
        variable = "bananap";
        displayName = "Bananenmilch";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = 20;
		drink = 10;
        icon = "icons\items\salt.paa";
    };
	
	class kokosbananamilk {
        variable = "kokosbananamilk";
        displayName = "Kokos-Bananenmilch";
        weight = 1;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class schoko {
        variable = "schoko";
        displayName = "Schokolade";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class reifen {
        variable = "reifen";
        displayName = "Rennreifen";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Reifen.paa";
    };
	
	class lehm {
        variable = "lehm";
        displayName = "Lehm";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Lehm.paa";
    };
	
	class lehmp {
        variable = "lehmp";
        displayName = "Ziegel";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Ziegel.paa";
    };
	
	class kautschuk {
        variable = "kautschuk";
        displayName = "Kautschuk";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class kautschukp {
        variable = "kautschukp";
        displayName = "Gummi";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Gummi.paa";
    };
	
	class tropenholz {
        variable = "tropenholz";
        displayName = "Tropenholz";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Tropenholz.paa";
    };
	
	class tropenholzp {
        variable = "tropenholzp";
        displayName = "Bauholz";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Bauholz.paa";
    };
	
	class kakao {
        variable = "kakao";
        displayName = "Kakaoschote";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Kakao.paa";
    };
	
	class kakaop {
        variable = "kakaop";
        displayName = "Kakaopulver";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Kakaopulver.paa";
    };
	
	class tabak {
        variable = "tabak";
        displayName = "Tabak";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Tabak.paa";
    };
	
	class tabakp {
        variable = "tabakp";
        displayName = "getrockneter Tabak";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Tabak_getrocknet.paa";
    };
	
	class magma {
        variable = "magma";
        displayName = "Obsidian";
        weight = 7;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Magma.paa";
    };
	
	class magmap {
        variable = "magmap";
        displayName = "geschliffener Obsidian";
        weight = 5;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Geschliffener_Obsidian.paa";
    };
	
	class zuckerrohr {
        variable = "zuckerrohr";
        displayName = "Zuckerrohr";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Zuckerrohr.paa";
    };
	
	class zuckerrohrp {
        variable = "zuckerrohrp";
        displayName = "Zucker";
        weight = 2;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Zucker.paa";
    };
	
	class kohle {
        variable = "kohle";
        displayName = "Kohle";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Kohle.paa";
    };
	
	class kohlep {
        variable = "kohlep";
        displayName = "Kohlebriketts";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class platin {
        variable = "platin";
        displayName = "Platinerz";
        weight = 4;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Platin.paa";
    };
	
	class platinp {
        variable = "platinp";
        displayName = "Platinfelgen";
        weight = 3;
        buyPrice = -1;
        illegal = false;
        edible = -1;
		drink = -1;
        icon = "icons\items\Felgen.paa";
    };
//		Tanoa Illegal

	class relikt {
        variable = "relikt";
        displayName = "altes Relikt";
        weight = 8;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Relikt.paa";
    };
	
	class reliktp {
        variable = "reliktp";
        displayName = "wertvolles Relikt";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\geschaetztes_Relikt.paa";
    };
	
	class reliktstreck {
        variable = "reliktstreck";
        displayName = "verpacktes Relikt";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\paket.paa";
    };
	
	class schlafmohn {
        variable = "schlafmohn";
        displayName = "Schlafmohn";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Schlafmohn.paa";
    };
	
	class schlafmohnp {
        variable = "schlafmohnp";
        displayName = "Opium";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Opium.paa";
    };
	
	class schlafmohnstreck {
        variable = "schlafmohnstreck";
        displayName = "gestrecktes Opium";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
	
	class kroko {
        variable = "kroko";
        displayName = "Krokodileier";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Krokodileier.paa";
    };
	
	class krokop {
        variable = "krokop";
        displayName = "Krokodilbaby";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Krokodilbaby.paa";
    };
	
	class krokostreck {
        variable = "krokostreck";
        displayName = "Krokodilleder";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\schlangenhaut.paa";
    };
	
	class kriegsschrott {
        variable = "kriegsschrott";
        displayName = "alte Kriegswaffen";
        weight = 6;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Kriegsschrott.paa";
    };
	
	class kriegsschrottp {
        variable = "kriegsschrottp";
        displayName = "gereinigte Kriegswaffen";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Gereinigte_Kriegswaffen.paa";
    };
	
	class kriegsschrottstreck {
        variable = "kriegsschrottstreck";
        displayName = "verpackte Kriegswaffen";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\paket.paa";
    };
	
	class anakonda {
        variable = "anakonda";
        displayName = "Anakonda";
        weight = 4;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Anakonda.paa";
    };
	
	class anakondap {
        variable = "anakondap";
        displayName = "Schlangenhaut";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\Schlangenhaut.paa";
    };
	
	class anakondastreck {
        variable = "anakondastreck";
        displayName = "Schlangenhauttasche";
        weight = 3;
        buyPrice = -1;
        illegal = true;
        edible = -1;
		drink = -1;
        icon = "icons\items\salt.paa";
    };
//		TANOA ENDE
};

class VirtualWaffen {
	
	//LEGAL
	class hgun_Rook40_F { displayName = "Legal: Rook"; };
	class hgun_P07_F { displayName = "Legal: P07"; };
	class hgun_ACPC2_F { displayName = "Legal: ACP"; };
	class hgun_PDW2000_F { displayName = "Legal: PDW"; };
	class hgun_Pistol_01_F { displayName = "Legal: PM 9"; };
	class hgun_Pistol_Signal_F { displayName = "Legal: Signal Pistole"; };
	class SMG_05_F { displayName = "Legal: Protector 9mm";  };
	
	//ILLEGAL
	class arifle_Katiba_F { displayName = "Illegal: Katiba"; };
	class arifle_Katiba_C_F { displayName = "Illegal: Katiba"; };
	class arifle_MXC_F { displayName = "Illegal: MXC Desert"; };
	class arifle_MXC_khk_F { displayName = "Illegal: MXC Khaki"; };
	class arifle_MXC_Black_F { displayName = "Illegal: MXC Schwarz"; };
	class arifle_MX_F { displayName = "Illegal: MX Desert"; };
	class arifle_MX_Black_F { displayName = "Illegal: MX Schwarz"; };
	class arifle_MX_khk_F { displayName = "Illegal: MX Khaki"; };
	class arifle_MXM_F { displayName = "Illegal: MXM Desert"; };
	class arifle_MXM_Black_F { displayName = "Illegal: MXM Schwarz"; };
	class arifle_MXM_khk_F { displayName = "Illegal: MXM Khaki"; };
	class arifle_SDAR_F	{ displayName = "Illegal: SDAR"; };
	class arifle_TRG20_F { displayName = "Illegal: TRG-20"; };
	class arifle_TRG21_F { displayName = "Illegal: TRG-21"; };
	class arifle_MK20C_plain_F { displayName = "Illegal: Mk20"; };
	class arifle_Mk20C_F { displayName = "Illegal: Mk20C"; };
	class SMG_02_F { displayName = "Illegal: Sting"; };
	class SMG_01_F { displayName = "Illegal: Varmin"; };
	class srifle_EBR_F { displayName = "Illegal: MK-18"; };
	class srifle_DMR_03_F { displayName = "Illegal: MK-1"; };
	class srifle_DMR_03_khaki_F { displayName = "Illegal: MK-1"; };
	class srifle_DMR_03_tan_F { displayName = "Illegal: MK-1"; };
	class srifle_DMR_03_multicam_F { displayName = "Illegal: MK-1"; };
	class srifle_DMR_03_woodland_F { displayName = "Illegal: MK-1"; };
	class SmokeShellRed { displayName = "Illegal: Tränengas"; };
	class SmokeShellBlue { displayName = "Illegal: Tränengas"; };
	class SmokeShellGreen { displayName = "Illegal: Gruenes Rauch"; };
	class arifle_SPAR_01_blk_F { displayName = "Illegal: SPAR-16"; };
	class arifle_SPAR_01_khk_F { displayName = "Illegal: SPAR-16"; };
	class arifle_SPAR_01_snd_F { displayName = "Illegal: SPAR-16"; };
	class arifle_SPAR_03_khk_F { displayName = "Illegal: SPAR-17"; };
	class arifle_SPAR_03_snd_F { displayName = "Illegal: SPAR-17"; };
	class arifle_SPAR_03_blk_F { displayName = "Illegal: SPAR-17"; };
	class muzzle_snds_H_khk_F { displayName = "Illegal: Schalldaempfer 6.5mm Khaki"; };
	class muzzle_snds_H_snd_F { displayName = "Illegal: Schalldaempfer 6.5mm Sand"; };
	class muzzle_snds_H { displayName = "Illegal: Schalldaempfer 6.5mm Schwarz"; };
	class muzzle_snds_65_TI_blk_F { displayName = "Illegal: Schalldaempfer 6.5mm Schwarz"; };
	class muzzle_snds_65_TI_ghex_F { displayName = "Illegal: Schalldaempfer 6.5mm Green Hex"; };
	class muzzle_snds_65_TI_hex_F { displayName = "Illegal: Schalldaempfer 6.5mm Hex"; };
	class muzzle_snds_58_blk_F { displayName = "Illegal: Schalldaempfer 5.8mm Schwarz"; };
	class muzzle_snds_58_ghex_F { displayName = "Illegal: Schalldaempfer 5.8mm Green Hex"; };
	class muzzle_snds_58_hex_F { displayName = "Illegal: Schalldaempfer 5.8mm Hex"; };
	class arifle_ARX_blk_F { displayName = "Illegal: Type 115 6.5mm Black"; };
	class arifle_ARX_ghex_F { displayName = "Illegal: Type 115 6.5mm Green Hex"; };
	class arifle_ARX_hex_F { displayName = "Illegal: Type 115 6.5mm Hex"; };
	class arifle_AKM_F { displayName = "Illegal: AKM 7.62 mm"; };
	class arifle_CTAR_blk_F { displayName = "Illegal: CAR-95 5.8mm Black"; };
	class arifle_CTAR_hex_F { displayName = "Illegal: CAR-95 5.8mm Hex"; };
	class arifle_CTAR_ghex_F { displayName = "Illegal: CAR-95 5.8mm Green Hex"; };
	class srifle_DMR_01_F { displayName = "Illegal: Rahim"; };
	class hgun_P07_khk_F { displayName = "Illegal: Taser Zivilist"; };
	class hgun_Pistol_heavy_01_snds_F { displayName = "Illegal: Taser Cop"; };
};	
