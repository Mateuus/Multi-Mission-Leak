#define true 1
#define false 0

class cfgFuelstationSys
{
	leaseddays = 7;							//Pachtzeit in Tagen | Default: 7
	auctionTime = 2;						//Auktionszeit wenn Tankstelle nicht ersteigert wurde | Default: 2
	benzinlager = 5000;						//Standart Benzinlager  | Default: 100000
	diesellager = 5000;						//Standart Diesellager  | Default: 100000
	fuelstationLimit = 3;					//Limit der Tankstellen die pro Spieler gepachtet werden kann  | Default: 3
	fuelCanCapicity = 10;					//Gesamtvolumen in Liter von Spritkanister
	fuellocations[] = 
	{
		{"super","Super"},
		{"superplus","Super Plus"},
		{"diesel","Diesel"},
		{"biodiesel","Biodiesel"}
	};

	class fuelnames
	{
		class super
		{
			name = "Super";
		};
		class superplus
		{
			name = "Super Plus";
		};
		class diesel
		{
			name = "Diesel";
		};
		class biodiesel
		{
			name = "Biodiesel";
		};
		class kerosin
		{
			name = "Kerosin";
		};
	};
	
	class Prices
	{
		leasedprice = 50000;				//Preis für das Pachten der Tankstelle | Default: 50000
		superprice = 103;					//Standart Superpreis | Default: 17
		superplusprice = 103;				//Standart Superpluspreis | Default: 17
		dieselprice = 98;					//Standart Dieselpreis | Default: 21
		biodieselprice = 98;				//Standart Bioieselpreis | Default: 21
		kerosinprice = 130;					//Standart Kerosinpreis | Default: 26
		repairprice = 1000;					//Standart Reparierpreis  | Default: 1000
		paintprice = 10000;					//Standart Lackierpreis  | Default: 10000
		fuel_minPrice = 50;					//Mindestpreis von Sprit
		fuel_maxPrice = 150;				//Maximalpreis von Sprit
		repair_minPrice = 200;				//Mindestpreis von Reperaturen
		repair_maxPrice = 2000;				//Maximalpreis von Reperaturen
		paint_minPrice = 5000;				//Mindestpreis von Lackierung
		paint_maxPrice = 15000;				//Maximalpreis von Lackierung
		updatePrice = 15000;				//Preis von Updaten der Tankstelle
	};
	
	class Rob
	{
		rob_minCops[] = {7,{0,0,5,0,0,0,0}};	//ab Mind. Cops ausraubbar   | Default: 7,{0,0,5,0,0,0,0}
		rob_localCooldown = 600;				//Spieler Cooldown in Sek. für Tankstellenraub  | Default: 600
		rob_globalCooldown = 300;				//Globaler Cooldown in Sek. für Tankstellenraub  | Default: 300
		rob_minkasse = 10000;					//Min. Tankstellenkasseninhalt ab wann Inhalt zur Beute dazu zählt  | Default: 10000
		rob_kasse[] = {1000,4}; 				//25% vom Kasseninhalt + 1000 werden zur Beute dazugerechnet
		rob_beute[] = {10000,100000}; 			//Beute min 1000 - max 10000
	};
	
	fuelstationPosition[] =
	{
		{{3752.89,13461.9,-0.409237},"Kavala"},
		{{4020.12,12589,-0.347351},"Neri"},
		{{5053.01,14442.8,-0.0601807},"Aggelochori"},
		{{6188.17,15089.2,-0.116341},"Negades"},
		{{6794.25,15583.1,-0.0634689},"Topolia"},
		{{9032.14,15719.8,-0.366096},"Agios Dionysios"},
		{{12036.5,15815.9,-0.359745},"Lakka"},
		{{14165.5,16524.9,-0.152884},"Flughafen"},
		{{15315.5,17589.8,-0.369711},"Gravia"},
		{{14233.6,18315.1,-0.363331},"Athira"},
		{{8491.19,18271.2,-0.360764},"Syrta"},
		{{5797.39,20075.9,0.622131},"Oreokastro"},
		{{11845.1,14150.9,-0.376972},"Neochori"},
		{{9223.41,12103.3,-0.29137},"Zaros"},
		{{15750.9,17471.6,0.631945},"Telos"},
		{{16836.8,15470.9,-0.23239},"Anthrakia"},
		{{17429.4,13942.4,-0.337311},"Charkia"},
		{{16757.9,12505.5,-0.243967},"Pyrgos"},
		{{19961.4,11431.9,-0.204697},"Chalkeia"},
		{{21233.7,7099.73,-0.122471},"Selakano"},
		{{20769.1,16663.9,-0.297794},"Paros "},
		{{23361.8,19806.6,-0.402572},"Ioannina"},
		{{25691.2,21384.3,-0.120985},"Sofia "},
		{{18753.5,16768.5,-0.258846},"Rodopoli"}
	};
};