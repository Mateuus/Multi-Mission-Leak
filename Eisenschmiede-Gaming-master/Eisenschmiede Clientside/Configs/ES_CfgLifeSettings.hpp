/*
	Master settings for various features and functionality	
*/
class ES_Settings {
	/* Persistent Settings */
	save_civ_weapons = true; //Allow civilians to save weapons on them?
	save_virtualItems = true; //Save Virtual items (all sides)?

	/* Revive system settings */
	revive_cops = false; //true to enable cops the ability to revive everyone or false for only medics/ems.
	revive_fee = 15000; //Revive fee that players have to pay and medics / EMS are rewarded
	
	/* House related settings */
	house_limit = 2; //Maximum amount of houses a player can own.

	/* Gang related settings */
	gang_price = 75000; //Price for creating a gang, remember they are persistent so keep it reasonable to avoid millions of gangs.
	gang_upgradeBase = 13000; //The base cost for upgrading slots in a gang
	gang_upgradeMultiplier = 2.5; //Not sure if in use?

	/* Player-related systems */
	enable_fatigue = false; //Set to false to disable the ARMA 3 false system.
	total_maxWeight = 144; //Static variable for the maximum weight allowed without having a backpack
	total_maxWeightT = 64; //Static variable for the maximum weight allowed without having a backpack
	paycheck_period = 5; //Scaled in minutes
	medpaycheck_period = 30; //Scaled in minutes
	
	/* Impound Variables */
	impound_car = 2850; //Price for impounding cars
	impound_boat = 4650; //Price for impounding boats
	impound_air = 5650; //Price for impounding helicopters / planes

	/* Initial Bank Amount */
	bank_cop = 70000; //Amount of cash on bank for new cops
	bank_civ = 70000; //Amount of cash on bank for new civillians
	bank_med = 70000; //Amount of cash on bank for new medics

	/* Paycheck Amount */
	paycheck_cop = 850; //Payment for cops
	paycheck_civ = 650; //Payment for civillians
	paycheck_med = 0; //Payment for medics

	/* Medic related settings*/
    allow_medic_weapons = true; // true allows medics to hold/use weapons - false disallows

	/* Cop related settings */
	cops_online_min = 0; //minimum cops online for robbing a bank

	/* Federal Reserve settings */
	noatm_timer = 15; //Time in minutes that players won't be able to deposit his money after selling stolen gold

	/* Pump settings */
	Pump_service = true; //Allow users to use pump service on the map. Default = false

	/* Car-shop Settings */
	vehicleShop_rentalOnly[] = { "B_G_Offroad_01_armed_F" };

	/* Job-related stuff */
	delivery_points[] = { "dp_1", "dp_2", "dp_3", "dp_4", "dp_5", "dp_6", "dp_7", "dp_8", "dp_9", "dp_10", "dp_11", "dp_12", "dp_13", "dp_14", "dp_15", "dp_15", "dp_16", "dp_17", "dp_18", "dp_19", "dp_20", "dp_21", "dp_22", "dp_23", "dp_24", "dp_25" };

	sellArray[] = {
		{"arifle_sdar_F", 0},
		{"hgun_P07_snds_F", 0},
		{"hgun_P07_F", 0},
		{"ItemGPS", 0},
		{"ToolKit", 0},
		{"FirstAidKit", 0},
		{"Medikit", 0},
		{"NVGoggles", 0},
		{"16Rnd_9x21_Mag", 0},
		{"20Rnd_556x45_UW_mag", 0},
		{"ItemMap", 0},
		{"ItemCompass", 0},
		{"Chemlight_blue", 0},
		{"Chemlight_yellow", 0},
		{"Chemlight_green", 0},
		{"Chemlight_red", 0},
		{"hgun_Rook40_F", 0},
		{"arifle_Katiba_F", 0},
		{"30Rnd_556x45_Stanag", 0},
		{"20Rnd_762x51_Mag", 0},
		{"30Rnd_65x39_caseless_green", 0},
		{"DemoCharge_Remote_Mag", 0},
		{"SLAMDirectionalMine_Wire_Mag", 0},
		{"optic_ACO_grn", 0},
		{"acc_flashlight", 0},
		{"srifle_EBR_F", 0},
		{"arifle_TRG21_F", 0},
		{"optic_MRCO", 0},
		{"optic_Aco", 0},
		{"arifle_MX_F", 0},
		{"arifle_MXC_F", 0},
		{"arifle_MXM_F", 0},
		{"MineDetector", 0},
		{"optic_Holosight", 0},
		{"acc_pointer_IR", 0},
		{"arifle_TRG20_F", 0},
		{"SMG_01_F", 0},
		{"arifle_Mk20C_F", 0},
		{"30Rnd_45ACP_Mag_SMG_01", 0},
		{"30Rnd_9x21_Mag", 0}
	};

	infoMenu[] = {
		{"Eisenschmiede","Eisenschmiede","Wilkommen"},
		{"Server","So kannst du uns erreichen:","<a color='#FF8000' href='http://eisenschmiede-gaming.de'>Webseite</a><br/><br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/forum2/index.php?board-list/'>Forum</a><br/><br/><a color='#FF8000' href='http://invite.teamspeak.com/ts.eisenschmiede-gaming.de/'>Teamspeak</a>"},
		{"Extras","Extras","Als Clan oder Einzelperson habt ihr die Möglichkeit Ingame-Extras wie Kleidungs-, Waffen- und Fahrzeugskins gegen eine einmalige Gebühr zu erwerben.<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/spenden'>Hier Klicken</a>"},
		{"Allgemeine-Regeln","Allgemeine-Regeln","Seht her, die Welt wird nie wieder die alte sein… dies sind die Gebote der Eisenschmiede!!!<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/server/altis-life/allgemeine-regeln'>Hier Klicken</a>"},
		{"Zivil-Regeln","Zivil-Regeln","Das Zusammenleben in einer Gemeinschaft ist schön, dass es auch schön bleibt gibt es grundliegende Dinge die alle wissen sollten.<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/server/altis-life/allgemeine-regeln'>Zivil-Regeln</a>"},
		{"Rebellen-Regeln","Rebellen-Regeln","Wir glauben nicht an das System und die Gesetze, es lebe die Rebellion!<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/server/altis-life/rebellen-regeln'>Hier Klicken</a>"},
		{"Polizei-Regeln","Polizei-Regeln","Das Gesetzt ist für alle da, um das alle nachlesen zu können gibt es ein Gesetzbuch! Lesen bildet.<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/server/altis-life/polizeiregeln'>Hier Klicken</a>"},
		{"Feuerwehr-Regeln","Feuerwehr-Regeln","Zum wohl der Bevölkerung gibt es mutige Männer und Frauen die sich dem Beruf der Feuerwehr verschrieben haben! Getreu dem Motto „Wir sind für Sie da… immer! 112“<br/><a color='#FF8000' href='http://eisenschmiede-gaming.de/index.php/server/altis-life/feuerwehrregeln'>Hier Klicken</a>"}
	};

	anfangmenu[] = {
		{"Anfängertipps","Anfängertipps","Lieber Spieler,<br/>ich schätze wenn du dies liest bist du neu hier auf dieser Insel.<br/>In diesem kleinen Guide erklkäre ich dir ein paar Sachen die du in deinem späteren Leben gut gebrauchen kannst.<br/><br/><t underline ='true'>Z-Inventar:</t><br/>In diesem Inventar findest du sämtliche Angaben über deinen Charakter.<br/>Oben rechts in der Ecke findest du Informationen über dein Kontostand. Direkt darunter findest du deine Lizenzen, welche du benötigst um z.B. ein Auto zu fahren.<br/>Oben in der Mitte siehst du dein aktuelles Inventar. Hier kannst du deine Virtuellen Items verwalten, sie löschen oder benutzen.<br/>Links oben findest du eine Liste, welche Spieler in deiner Nähe auflistet. Diese Liste und dein komplettes Inventar kannst du mit dem 'Aktualisieren-Button' aktualisieren.<br/><br/>Auf der linken Seite siehst du alle Funktionen die du mit dem Z-Inventar ausführen kannst. Eine Funktion ist z.B. dein Telefon, mit welchem du Personen anschreiben kannst und Notrufe absetzen kannst.<br/><br/><t underline = 'true'>I-Inventar:</t><br/>In diesem Inventar findest du alle Items die du z.B. im General Store kaufen kannst, oder später auch deine Waffen.<br/>Im General Store kaufst du zum Start am besten ein Werkzeugkasten, ein GPS und eine Nachtsichtbrille.<br/><br/><t underline='true'>Wie fange ich denn nun an ?</t><br/>Diese Frage werden sich wahrscheinlich die meisten von euch stellen.<br/>Nun, am besten fangt ihr damit an, indem ihr euch ein Auto beim Auto Laden kauft, nachdem ihr den Führerschein erworben habt.<br/>Nun fahrt ihr zum Apfel oder Pfirsichfeld und pflückt dort euer Obst, welches ihr am Markt verkaufen könnt.<br/>Später, wenn ihr mehr Geld habt könnt ihr auch eine Ausbildung zum Saftpresser machen. Durch diese Ausbildung könnt ihr aus dem Obst Saft herstellen."},
		{"Steuerung","Steuerung","Hier findest du ein paar Steuerungen die dir am Anfang helfen werden.<br/><br/>		Linkes Umschalt: Ingame Voice Chat<br/><br/>		Punkt und Komma: Switch zwischen Ingame Chats (Side-Chat,Direkt,Fahrzeug,Gruppen-Chat)<br/><br/>		Z: Spielerinventar öffnen<br/><br/>		T: Fahrzeuginventar öffnen<br/><br/>		M: Karte öffnen<br/><br/>		Recht. Strg + M: GPS öffnen (General Store)<br/><br/>		Windows Taste: Interaktionstaste (Interagieren mit gefesselten Spielern,Abbau von Gütern,<br/> 		              	Interagieren mit Fahrzeugen)<br/><br/>		Q/E: Blinker benutzen<br/><br/>		Q: Abbauen von Gütern (Spitzhacke benötigt)<br/><br/>		N: Nachtsichtbrille Ein-/Ausschalten<br/><br/>		U: Fahrzeug Auf-/Abschließen<br/>		"},
		{"Lizenzpreise","Lizenzpreise","<t underline = 'true'>Legal:</t><br/>		Führerschein: 500 $<br/>		LKW-Führerschein: 20.000 $<br/>		Bootsschein: 1.000 $<br/>		Fluglizenz: 25.000 $<br/>		Waffenlizenz: 10.000 $<br/>		Taucherlizenz: 2.000 $<br/>		Eigentumslizenz: 7.500.000 $<br/><br/><t underline ='true'>Illegal:</t><br/>		Rebellenlizenz: 750.000 $<br/>		Söldner Lizenz: 10.000.000 $<br/>		Militär Lizenz: 20.000.000 $"},
		{"Güterlizenzen","Güterlizenzen","<t underline = 'true'>Legal:</t><br/>		Öllizenz: 10.000 $<br/>		Diamantenlizenz: 35.000 $<br/>		Salzlizenz: 12.000 $<br/>		Sand-/Glaslizenz: 14.500 $<br/>		Eisenlizenz: 75.000 $<br/>		Kupferlizenz: 8.000 $<br/>		Zementlizenz: 6.500 $<br/>		Kohlelizenz: 75.000 $<br/>		Saftlizenz: 5.000 $<br/>		Weinlizenz: 75.000 $<br/>		Holzlizenz: 125.000 $<br/>		AlkoholLizenz: 100.000 $<br/>		Maischenlizenz: 100.000 $<br/><br/><t underline ='true'>Illegal:</t><br/>		Destillierlizenz: 500.000 $<br/>		Abfüllerlizenz: 100.000 $<br/>		Heroinlizenz: 25.000 $<br/>		Marihuanalizenz: 19.500 $<br/>		Kokainlizenz: 30.000 $<br/>		Pilzlizenz: 75.000 $<br/>		Methlizenz: 75.000 $<br/>		Speedlizenz: 75.000 $<br/>		Medikamentelizenz: 175.000 $<br/>		Schwarzpulverlizenz: 75.000 $<br/>		Uranlizenz: 1.750.000 $"},
		{"Güterherstellung","Güterherstellung","<t underline = 'true'>Apfelsaft:</t><br/>Apfel Feld>Saftpresse>Markt<br/><br/><t underline='true'>Pfirsichsaft:</t><br/>Pfirsich Feld>Saftpresse>Markt<br/><br/><t underline = 'true'>Kupfer:</t><br/>Kupfermine>Kupfer Verarbeiter> Kupferhändler<br/><br/><t underline = 'true'>Eisen:</t><br/>Eisenmine>Eisenschmiede>Eisenhändler<br/><br/><t underline = 'true'>Öl:</t><br/>Öl Feld>Öl Verarbeiter>Öl Händler<br/><br/><t underline = 'true'>Glas:</t><br/>Sand Mine>Sand Verarbeiter> Glas Ankäufer<br/><br/><t underline = 'true'>Holz:</t><br/>Förster Gebiet>Holz Verarbeiter>Markt<br/><t underline = 'true'>Wein:</t><br/>Weintrauben>Wein Verarbeiter>Markt<br/><br/><t underline = 'true'>Salz:</t><br/>Salz Mine>Salz Verarbeiter>Salz Händler<br/><br/><t underline = 'true'>Zement:</t><br/>Steinbruch>Stein Verarbeiter>Zement Verkäufer<br/><br/><t underline = 'true'>Kohle:</t><br/>Kohle Mine>Kohle Herstellung>Markt<br/><br/><t underline = 'true' color = '#FF0000'>Heroin:</t><br/>Heroin Feld>Heroin Verarbeiter>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Marihuana:</t><br/>Marijuana Feld>Marijuana Verarbeiter>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Kokain:</t><br/>Kokain Feld>Kokain Verarbeiter>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Pilze:</t><br/>Pilzgebiet>Magic Mushrooms>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Meth:</t><br/>Meth Zutaten>Meth Labor>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Speed:</t><br/>Speed Zutaten>Speed Labor>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Medikamente:</t><br/>Medikament Zutaten>Medikamenten Labor>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Schwarzpulver:</t><br/>Schwarzpulver Mine>Schwarzpulver Labor>Drogendealer<br/><br/><t underline = 'true' color = '#FF0000'>Uran:</t><br/>Verstrahltes Gebiet>Uran 1>Uran 2>Uran 3>Uran Schmuggler<br/><br/><t underline = 'true' color = '#FF0000'>Whiskey:</t><br/>Rogen Feld+Hefe Feld>Whiskey Destillierer(1000$ pro Flasche)<br/><br/><t underline = 'true' color = '#FF0000'>Moonshine:</t><br/>Whiskey>Whyskey Abfüller<br/><br/><t underline = 'true' color = '#FF0000'>Bier:</t><br/>hopfen Feld+Hefe Feld> Bier Brauerei<br/><br/><t underline = 'true' color = '#FF0000'>Abgefülltes Bier:</t><br/>Bier>Bier Abfüller"},
		{"Güterpreise","Güterpreise","Diese Preise werden pro Einheit gewertet, dass heißt eine Einheit bringt den unten benannten Preis.<br/>Linkst steht der Preis und rechts daneben steht der Platz im unverarbeiteten Zustand und davon rechts der im verarbeiteten Zustand, welches das Item verbraucht.<br/><br/><t underline = 'true'>Legal:</t><br/>		Öl: 3.200$ | 7 | 6<br/>		Kupfer: 2.500$ | 4 | 3<br/>		Eisen: 5.000$ | 5 | 3<br/>		Salz: 2.450$ | 3 | 1<br/>		Glas: 2.250$ | 3 | 1<br/>		Diamten: 4.150$ | 4  | 2<br/>		Zement: 2.950$ | 6 | 5<br/>		Apfel: 50$ | 1 | X<br/>		Pfirsich: 55$ | 1 | X<br/>		Bacon: 25$ | 1 | X<br/>		Hasenfleisch: 125$ | 2 | 1<br/>		Rohes Hühnchen: 3.500$ | 1 | X<br/>		Hühnchen: 3.140$ | 1 | X<br/>		Rohes Hähnchenfleisch: 3.500$ | 1 | X<br/>		Hähnchenfleisch: 85$ | 1 | X<br/>		Rohes Schaf: 5.000$ | 2 | X<br/>		Schaf: 7.500$ | 2 | X<br/>		Rohe Ziege: 7.500$ | 2 | X<br/>		Ziege: 7.500$ | 2 | X<br/>		Kohle: 3.050$ | 5 | 3<br/>		Wein: 3.300 | 5 | 3<br/>		Apfelsaft: 760$ | 3 | X<br/>		Pfirsichsaft: 760$ | 3 | X<br/>		Holz: 3.500$ | 5 | 3<br/>		Abgefülltes Bier: 4.900$ | 2 | X<br/>		Bier: 3.500$ | 2 | X<br/>		Hefe: 1.200$ | 2 | X<br/>		Hopfen: 600$ | 2 | X<br/>		Roggen: 1.000$ | 2 | X<br/><br/><t underline ='true'>Illegal:</t><br/>		Uran: 9.200$ | 5 | 3<br/>		Whiskey: 4.300$ | 2 | X<br/>		Moonshine: 5.000$ | 2 | X<br/>		Pilze: 4.150$ | 5 | 3<br/>		Meth: 4.200$ | 5 | 3<br/>		Speed: 4.100$ | 5 | 3<br/>		Schwarzpulver: 4.400$ | 5 | 3<br/>		Medikamente: 4.600$ | 5 | 3<br/>		Heroin: 5.460$ | 6 | 4<br/>		Marihuana: 4.500$ | 4 | 3<br/>		Kokain: 6.800$ | 6 | 4"}
	};

	lvlInfoCOP[] = {
		{"Erfahrungsstufe 3","Erfahrungssystem","Der Tanzkurs zahlt sich aus. Du hast soeben einen Special Move erlernt.."},
		{"Erfahrungsstufe 5","Erfahrungssystem","Ein Loch in der Hose hilft. Solltest du mal pinkeln müssen, kannst du es jetzt."},
		{"Erfahrungsstufe 6","Erfahrungssystem","Der Bürgermeister hat hat dir soeben die Lizenz übertragen, um UAV-Terminals zu kaufen."},
		{"Erfahrungsstufe 7","Erfahrungssystem","Flashbang gefällig? Nur zu. Ab sofort sind diese kleinen Freunde für dich verfügbar."},
		{"Erfahrungsstufe 8","Erfahrungssystem","Du kannst mit deiner soeben abgeschlossenen Mechaniker-Ausbildung nun schneller Fahrzeuge reparieren."},
		{"Erfahrungsstufe 9","Erfahrungssystem","Du kannst ab sofort Sprengladunge kaufen."},
		{"Erfahrungsstufe 12","Erfahrungssystem","Es ist Zeit für eine Gehaltserhöhung. Auf dein Grundlohn bekommst du 2800€ dazu."},
		{"Erfahrungsstufe 15","Erfahrungssystem","Deine Mechaniker-Ausbildung zahlt sich aus. Ab sofort kannst du noch schneller reparieren. Es wird Zeit für mehr Verantwortung. Wir geben dir nun die Möglichkeit eine Zafir zu kaufen."},
		{"Erfahrungsstufe 16","Erfahrungssystem","Du kannst ab sofort dein Team als taktischer Scharfschütze unterstützen. Sniper LRR ist kaufbar."},
		{"Erfahrungsstufe 18","Erfahrungssystem","Herzlichen Glückwunsch, die Waffe des Typs “SPMG” ist nun für dich verfügbar."},
		{"Erfahrungsstufe 20","Erfahrungssystem","Um mal richtig die Sau raus zu lassen, brauchst du eine entsprechende Waffe. Typ Mk200 erfolgreich freigeschaltet."}
	};

	lvlInfoMED[] = {
		{"Erfahrungsstufe 3","Erfahrungssystem","Der Tanzkurs zahlt sich aus. Du hast soeben einen Special Move erlernt.."},
		{"Erfahrungsstufe 5","Erfahrungssystem","Ein Loch in der Hose hilft. Solltest du mal pinkeln müssen, kannst du es jetzt."},
		{"Erfahrungsstufe 6","Erfahrungssystem","Herzlichen Glückwunsch. Du kannst ab sofort schneller reanimieren."},
		{"Erfahrungsstufe 8","Erfahrungssystem","Du kannst mit deiner soeben abgeschlossenen Mechaniker-Ausbildung nun schneller Fahrzeuge reparieren."},
		{"Erfahrungsstufe 10","Erfahrungssystem","Es ist Zeit für eine Gehaltserhöhung. Auf dein Grundlohn bekommst du 1500€ dazu."},
		{"Erfahrungsstufe 11","Erfahrungssystem","Du hast deine Fähigkeiten erweitert, und kannst nun noch schneller reanimieren."},
		{"Erfahrungsstufe 15","Erfahrungssystem","Deine Mechaniker-Ausbildung zahlt sich aus. Ab sofort kannst du noch schneller reparieren. Es wird Zeit für mehr Verantwortung. Wir geben dir nun die Möglichkeit eine Zafir zu kaufen."},
		{"Erfahrungsstufe 18","Erfahrungssystem","Du erweiterst deine Fähigkeiten immer weiter. Ab sofort bist du noch schneller im reanimieren."},
		{"Erfahrungsstufe 20","Erfahrungssystem","Super! Du hast deine Fähigkeiten im medizinischen Bereich perfektioniert. Schnellste Stufe des Wiederbelebens erreicht."}
	};

	lvlInfoCIV[] = {
		{"Erfahrungsstufe 3","Erfahrungssystem","Der Tanzkurs zahlt sich aus. Du hast soeben einen Special Move erlernt.."},
		{"Erfahrungsstufe 4","Erfahrungssystem","Herzlichen Glückwunsch. Ab sofort kannst du eine Gang erstellen, um damit die Straßen unsicher zu machen."},
		{"Erfahrungsstufe 5","Erfahrungssystem","Ein Loch in der Hose hilft. Solltest du mal pinkeln müssen, kannst du es jetzt."},
		{"Erfahrungsstufe 6","Erfahrungssystem","Der Bürgermeister hat hat dir soeben die Lizenz übertragen, um UAV-Terminals zu kaufen."},
		{"Erfahrungsstufe 7","Erfahrungssystem","Flashbang gefällig? Nur zu. Ab sofort sind diese kleinen Freunde für dich verfügbar."},
		{"Erfahrungsstufe 8","Erfahrungssystem","Du kannst mit deiner soeben abgeschlossenen Mechaniker-Ausbildung nun schneller Fahrzeuge reparieren."},
		{"Erfahrungsstufe 9","Erfahrungssystem","Du kannst ab sofort Sprengladunge kaufen."},
		{"Erfahrungsstufe 10","Erfahrungssystem","Es wird Zeit um dein Territorium zu markieren. Du hast nun die Möglichkeit Gangverstecke einzunehmen."},
		{"Erfahrungsstufe 12","Erfahrungssystem","Neue Karre gefällig? Ab sofort kannst du Fahrzeuge schneller aufbrechen."},
		{"Erfahrungsstufe 13","Erfahrungssystem","Es ist Zeit für eine Gehaltserhöhung. Auf dein Grundlohn bekommst du 2800€ dazu."},
		{"Erfahrungsstufe 14","Erfahrungssystem","Grundkurs im Apfelpflücken erfolgreich abgeschlossen. Somit kannst du nun alles schneller farmen."},
		{"Erfahrungsstufe 15","Erfahrungssystem","Deine Mechaniker-Ausbildung zahlt sich aus. Ab sofort kannst du noch schneller reparieren. Es wird Zeit für mehr Verantwortung. Wir geben dir nun die Möglichkeit eine Zafir zu kaufen."},
		{"Erfahrungsstufe 16","Erfahrungssystem","Du kannst ab sofort dein Team als taktischer Scharfschütze unterstützen. Sniper LRR ist kaufbar."},
		{"Erfahrungsstufe 20","Erfahrungssystem","Um mal richtig die Sau raus zu lassen, brauchst du eine entsprechende Waffe. Typ Mk200 erfolgreich freigeschaltet."},
		{"Erfahrungsstufe 22","Erfahrungssystem","Um schneller vor den Cops zu flüchten, kannst du nun noch schneller Fahrzeuge knacken."},
		{"Erfahrungsstufe 25","Erfahrungssystem","Durch viel Praxis und einige Kurse kannst du nun effektiver und schneller farmen."},
		{"Erfahrungsstufe 28","Erfahrungssystem","Du hast noch nicht genug vom Autos knacken? Gerne. Nun ist es möglich noch schneller Fahrzeuge aufzubrechen."},
		{"Erfahrungsstufe 32","Erfahrungssystem","Herzlichen Glückwunsch. Du hast alle Kurse des farmings abgeschlossen und bist nun der schnellste beim abbauen."},
		{"Erfahrungsstufe 34","Erfahrungssystem","Wir schenken dir einen neuen Schraubenschlüssel, somit kannst du nun sehr schnell Fahrzeuge reparieren."},
		{"Erfahrungsstufe 36","Erfahrungssystem","Du solltest deinen Fuhrpark erweitern. Knacke ab sofort noch schneller Fahrzeuge."},
		{"Erfahrungsstufe 40","Erfahrungssystem","Herzlichen Glückwunsch. Du bist ab sofort Meisterdieb und hast die höchste Stufe des Autoknacken erreicht."}
	};
};