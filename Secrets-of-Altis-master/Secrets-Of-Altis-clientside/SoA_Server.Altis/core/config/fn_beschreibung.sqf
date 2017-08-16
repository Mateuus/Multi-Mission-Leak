private["_type","_type2"];
_type = [_this,0,"",[""]] call BIS_fnc_param;
if(_type == "") exitWith {""};

switch (_type) do
{

	//Apps
	case "app_auktion": {
	"Mit EGO-Versicherungen sind deine Fahrzeuge stets versichert. Ob Teil- oder Vollkaskoversicherung, uns ist jede Police recht!<br/><br/>EGO. Ohne uns, kein wir.";
	};
	
	case "app_lizenzen": {
	"Die App 'onLine Lizenzen' bietet dir eine komfortable Übersicht über deine Lizenzen.<br/><br/>Mithilfe der integrierten Super-Clear-Pixel-App lassen sich Lizenzen ohne Probleme einlesen."
	};
	
	case "app_dp": {
	"Du benötigst dringend Geld? Hast aber keine Ahnung wie du schnell daran kommst? Dann besorge dir jetzt die mobile Altis Post App.<br/><br/>Hiermit laufen die Aufträge wie geschmiert."
	};
	
	case "app_konto": {
	"Du benötigst alle Informationen über deine Finanzen und die aktuellen Marktpreise? Wie steht der Schmuck? Was kostet der Diamant? Wie sind die Prognosen?<br/><br/>Dann kaufe jetzt unsere App.<br/>(Von Marktwissenschaftlern empfohlen.)"
	};
	
	case "app_hilfe": {
	"Die perfekten Einsteigertipps für unterwegs. Alles nützliche rund um Altis und dessen Gebrauchsweise."
	};
	
	case "app_karte": {
	"Du weisst nicht wohin? Mit AltisMaps© kommst du immer ans Ziel. Egal wohin du willst, tippe den Ort ein und du erhältst eine Übersicht über die Gegend.<br/><br/>Empfohlen von der (NSA)ltis."
	};
	
	case "app_crafting": {
	"Du bist leidenschaftlicher Handwerker und deine Lieblingsserie war 'Hör mal wer da hämmert!'?<br/><br/>WeCraft bietet dir per neumoderner 3D-Drucktechnik an, deine Träume zu verwirklichen! Jetzt runterladen!"
	};
	
	case "app_selfie": {
	"Die langweiligen Bilder deiner alten Digitalkamera sind dir zu hässlich?<br/><br/>Mit Selfie4U schießst du aus der perfekten Perspektive. Verewige dich noch heute!"
	};
	
	case "app_notizen": {
	"Du kannst dir nichts mehr merken? Mit unserer App schreibst du deine Gedanken einfach auf!<br/><br/>Der Notizblock ist eine Applikation von G00-Systems Inc.!"
	};
	
	//Lizenzen
	case "license_civ_driver": 		{"Der Führerschein ermöglicht dir die legale Führung eines Personenkraftwagens der Klassen B und BF17.<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_air": 		{"Der Pilotenschein oder auch Privatpilotenlizenz ermöglicht dir die legale Führung eines Flugfahrzeuges der Klasse PPL(H).<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_fly": 		{"Der Flugschein ermöglicht dir die legale Führung eines Flugfahrzeuges der Klasse PPL(A).<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_boat": 		{"Der internationale Bootsschein ermöglicht dir die legale Führung eines Sportbootes.<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_gun": 		{"Die Regierung erlaubt dir nun die Nutzung von Waffen der niedrigeren Klassen.<br/><br/>Den Waffenschein solltest du bei jeder Kontrolle dennoch dabei haben. Waffen sind nicht zur Selbstjustiz gedacht."};
	case "license_cop_air": 		{"Der Pilotenschein oder auch Privatpilotenlizenz ermöglicht dir die legale Führung eines Flugfahrzeuges der Klasse PPL(H).<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_cop_cg": 			{"Der internationale Bootsschein ermöglicht dir die legale Führung eines Sportbootes.<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_lotse": 		{"Offizieller SoA-Lotse."};	
	case "license_civ_rebel": 		{"Du bist nun eingefleischter Rebell. Die hartnäckige Ausbildung und die jahrelange Erfahrung haben dich zu einer unaufhaltsamen Kampfmaschine gedrillt.<br/><br/>Die Rebellenorganisationen erlauben dir nun die Nutzung ihrer Fahrzeuge und den Kauf ihrer Schwarzmarktartikel."};
	case "license_civ_hack": 		{"Die Weiterbildung zum IT-Anwendungsentwickler hat dir Kenntnisse über den spezifischen Umgang mit Linux gegeben.<br/><br/>Du weisst so gut wie alles über Hacking, Cracking und das Ändern deines Passwortes bei Altis-Talk."};
	case "license_civ_gang": 		{"Offizielles Gangmitglied."};
	case "license_civ_truck": 		{"Der LKW-Führerschein ermöglicht dir die legale Führung eines Lastkraftwagens der Klassen C, CE, C1 und C1E.<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_diamond":	 	{"Du hast deine Ausbildung als Diamantschleifer erfolgreich absolviert.<br/><br/>Deine geschliffenen Juwelen glänzen voller Pracht!"};
	case "license_civ_copper": 		{"Der Baustoffverband erlaubt dir nun den Abbau und die damit verbundene Weiterverarbeitung von Kupfer.<br/><br/>Eine Spitzhacke wird vorausgesetzt!"};
	case "license_civ_iron": 		{"Der Baustoffverband erlaubt dir nun den Abbau und die damit verbundene Weiterverarbeitung von Eisen.<br/><br/>Eine Spitzhacke wird vorausgesetzt!"};
	case "license_civ_sand": 		{"Der Weg zum Glasbläser ist weit. Die Weiterverarbeitung von Sand ist dir nun schon mal bekannt.<br/><br/>Da hat sich der Aufenthalt im Sandkasten ja gelohnt."};
	case "license_civ_salt": 		{"Salz ist ein gefragter Rohstoff auf Altis, seitdem die große Salzwüste freigegeben wurde.<br/><br/>Mit dieser Lizenz hast du du die Möglichkeit das abgebaute Salz weiterverarbeiten zu können."};
	case "license_civ_coke": 		{"Als Drogenjunkie wird man es nie leicht haben. Gut, dass du keiner bist.<br/><br/>Dein Kumpel, der Dealer hat dich allerdings nun in die Verarbeitung von Kokain eingeweiht."};
	case "license_civ_marijuana": 	{"Als Drogenjunkie hat man es nicht leicht. Gut, dass du keiner bist.<br/><br/>Dein Kumpel, der Dealer hat dich allerdings nun in die Verarbeitung von Marihuana eingeweiht."};
	case "license_civ_cement": 		{"Der Baustoffverband erlaubt dir nun die Weiterverarbeitung von Stein zu Zement.<br/><br/>Eine Spitzhacke wird vorausgesetzt!"};
	case "license_civ_heroin": 		{"Als Drogenjunkie hat man es immer noch nicht leicht. Gut, dass du keiner bist.<br/><br/>Dein Kumpel, der Dealer hat dich allerdings nun in die Verarbeitung von Heroin eingeweiht."};
	case "license_civ_oil": 		{"Der führende Öl-Scheich Abd-El-Faggot höchstpersönlich hat dir nun die Freigabe zur Schöpfung von Öl aus seiner Bohrinsel südlich von Altis erlaubt.<br/><br/>Er macht gute Geschäfte, sagt man."};
	case "license_civ_dive": 		{"Der Tauchgang mit Schildkröten hat sich gelohnt, du wolltest aber mehr.<br/><br/>Der Tauchverband von Altis hat dir nun die offizielle Lizenz zum Tauchen verteilt. Hab deinen Tauchschein also immer dabei, wenn du in tiefen Gewässern tauchst."};
	case "license_med_air": 		{"Der Pilotenschein oder auch Privatpilotenlizenz ermöglicht dir die legale Führung eines Flugfahrzeuges der Klasse PPL(H).<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_med_boat": 		{"Der internationale Bootsschein ermöglicht dir die legale Führung eines Sportbootes.<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_adac_air":		{"Der Pilotenschein oder auch Privatpilotenlizenz ermöglicht dir die legale Führung eines Flugfahrzeuges der Klasse PPL(H).<br/><br/>Für die Führung höherer Klassen ist eine Weiterbildung von Nöten."};
	case "license_civ_home": 		{"Ein kleines Haus mit Garten? Oder doch eher die Villa am Strand?<br/><br/>Die Eigentumslizenz ist deine Möglichkeit. Dir stehen nun alle Türen der Immobilienwelt offen. Naja, fast alle."};
	case "license_civ_gruppe": 		{"Mit der Gruppierungskauflizenz hast du jeglichen Zugang zum Gruppierungsinternen Bereich des Ganggebietes."};
	case "license_civ_presse": 		{"Der Presseausweis gibt dir die Erlaubnis bei jedem Spektakel dabei zu sein.<br/><br/>Auf der Rückseite steht geschrieben: 'Achtung Kamera - Altis 95.8/Altis Allgemeine Nachrichtensprecher'."};
	case "license_civ_altisair": 	{"Nicht mehr verfügbar."};
	case "license_civ_esc": 		{"Du bist offizielles Mitglied der merkwürdigen Familie Escobar."};	
	case "license_civ_ims":		 	{"Du bist offizielles Mitglied des Iss Mal Salat e.V.."};
	case "license_civ_lud":		 	{"Du bist offizielles Mitglied der Familie Ludolf."};
	case "license_civ_pm":		 	{"Du bist offizielles Mitglied der Polen Mafia."};	
	case "license_civ_imf":		 	{"Du bist offizielles Mitglied der Impossible Mission Forces."};
	case "license_civ_slg": 		{"Du bist offizielles Mitglied der Salt Lake-Gang."};
	case "license_civ_stiller": 	{"Die Spirituosenlizenz ist eine Weiterbildung der Ausbildung zum Bierbrauer und gibt dir die Kenntnisse über Alkohol mit hohem Alkoholgehalt.<br/><br/>Achtung: Bei zu viel Hitze brennbar!"};
	case "license_civ_liquor": 		{"Der Meisterbrief erlaubt dir die Ausführung der Tätigkeit eines Bierbrauers im hohen Niveau.<br/><br/>Jede Biersorte ist dir bekannt!"};
	case "license_civ_bottler": 	{"Mit der Glaserausbildung hast du erlernt, wie Glas geformt wird.<br/><br/>Zum Abschluss der Ausbildung musstest du über 100 Flaschen formen."};
	case "license_civ_hunter": 		{"Der Jagdschein erlaub dir die Nutzung von Jagdwaffen innerhalb eines Jagdgebietes zum Jagen von Wild.<br/><br/>Im größeren Umkreis als 1.5km außerhalb des Jagdgebietes wird der Gebrauch der Waffe illegal!"
	};
	case "license_civ_plutonium": 	{"Mit der Ausbildung zum Chemikanten hast du das Wissen rund um alles was dir um die Ohren fliegen kann.<br/><br/>Atommüll ist dein Fachgebiet."};
	case "license_civ_holz": 		{"Die Holzfällerausbildung ermöglicht dir die Weiterverarbeitung von Holzprodukten.<br/><br/>Vergiss deine Axt nicht!"};
	case "license_civ_president": 	{"Du bist der Präsident von Altis. Du hast die Aufgabe Sitzungen im Ratshaus abzuhalten und die Insel zu informieren.<br/><br/>Dein Anwesen ist das heiße Haus."};
	case "license_civ_ausweis": 	{"Dein Personalausweis, welchen du immer bei dir tragen solltest.<br/><br/>Wichtige Daten wie Name und Anschrift sind enthalten."};
	case "license_civ_radio": 		{"Du bist Radiomoderator.<br/><br/>Mit Shift+POS1 gehst du mit dem Radio live."};
	case "license_civ_archo": 		{"Mit deiner Archäologieausbildung hast du die Möglichkeit und die Befugnis an der Grabungsstätte Altis zu graben."};
};