/*
	Konfig für Perso	
*/
class Personalausweis {
	// Körpergröße von-bis in cm # Bodysize from-to in cm
	koerpergroesse[] = {150,220};
	// Geburtsjahre von-bis # year of birth from-to
	// Wird mit dem Missionsdatum gegengerechnet # would be calculate with mission date
	jahre[] = {1930,2010};
	// Körpergewicht in kg von-bis # body weight from-to in kg
	gewicht[] = {120,235};
	// Geschlecht M=Männlich, W=Weiblich # sex 'M'=man, change 'W' to 'F' for female
	geschlecht[] = {"M","F"};
	// Polizeimarke o. Logo (Pfad) # police badge destination
	logoWest = "#(rgb,8,8,3)color(0,0,1,0.5)";
	// Sanitäter-Logo (Pfad) # medical badge destination
	logoIndep = "#(rgb,8,8,3)color(0,1,0,0.5)";
	// Zivilisten-Logo (Pfad), ja Farben können angegeben werden # civilian badge destination, yes you can use color
	logoCiv = "#(rgb,8,8,3)color(0.49,0.06,0.44,0.5)";
	// Opfor-Logo (Pfad)/Unbekannte Fraktion # opfor badge destination/unkown side
	logoOpfor = "#(rgb,8,8,3)color(1,0,0,0.5)";
	// Unknown side
	logoUnkn = "#(rgb,8,8,3)color(1,1,1,0.5)";
	// Blutgruppen # bloodtypes
	blutgr[] = {"A","B","AB","0"};
	// taste zum Ausblenden des Persos als Zahl angeben. 68=F10
	tasteAusblenden = 15; // Key as number
	zeichen_n_max = 16; // Maximale Zeichen (mit Leerzeichen) des Spielers # maximum characters of players name
	zeichen_n_min = 3; // Minimale Zeichen (mit Leerzeichen) des Spielers # minimum characters of players name
	aenderungspreis = 10000; // Preis zum Ändern des Persos # price to change your id card
	// Personalausweis_altis_de
	// Personalausweis_altis_en
	// Personalausweis_german_de
	/*
		Mehrere Staatsbürgerschaften verwenden
		{{"Staatsname","Pfad\zum\Persobild"}}
		Nur der Index (Platz des Elements in einem Array) wird in der DB gespeichert und am Ende ausgewertet und via select ausgewählt.
		Die Staatszugehörigkeit muss in dem Bild selber hinterlegt werden, in der uiPerso.hpp wird/wurde dafür kein extra Feld erstellt
	*/
	staatsbuergerschaften[] = {
		{"State of Le Port","Custom\IDSystem\persobilder\IDCard_Eng.paa"},
		{"State of Trinite","Custom\IDSystem\persobilder\IDCard_Eng.paa"},
		{"State of Sofia","Custom\IDSystem\persobilder\IDCard_Eng.paa"},
		{"State of Pygros","Custom\IDSystem\persobilder\IDCard_Eng.paa"}
	};
	erlaube_Indp_aendern = 1; // Fraktion erlauben Persodaten zu ändern
	erlaube_East_aendern = 1;
	erlaube_West_aendern = 1;
	erlaube_Civ_aendern = 1;
	persoNeu_wann = 1; // 0=vor dem Spawnbildschirm erscheint Dialog # dialog to create a new id card befor spawn menu, 1=neuen Perso nach dem Spawnmenü erstellen/prüfen # create/check id card after spawn menu
	erlaubeMehrereNamen_indep = 1; // 1=Erlaube Nutzung anderer Namen, als im Perso hinterlegt # allow player to use different names as in database, 0=verbieten, disallow
	erlaubeMehrereNamen_west = 1; // 1=Erlaube Nutzung anderer Namen, als im Perso hinterlegt # allow player to use different names as in database, 0=verbieten, disallow
	erlaubeMehrereNamen_east = 1; // 1=Erlaube Nutzung anderer Namen, als im Perso hinterlegt # allow player to use different names as in database, 0=verbieten, disallow
	erlaubeMehrereNamen_civ = 1; // 1=Erlaube Nutzung anderer Namen, als im Perso hinterlegt # allow player to use different names as in database, 0=verbieten, disallow
	erlaubteZeichen[] = { 
		/*
			case-SenSiTive, if you are using pre-defined SQL-Statements, do not allow ":",
			abcdefghijklmnopqrstuvwxyzßüäö -_&ABCDEFGHIJKLMNOPQRSTUVWXYZÄÜÖ1234567890.,;?!'"
			hint str (toArray "a") => "97"
			hint toString [97] => a
		*/
		97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,223,252,
		228,246,32,45,95,38,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,196,220,214,
		49,50,51,52,53,54,55,56,57,48,46,44,59,63,33,39,34
	};
	class tasten { // QUERTZ layout, möglicherweise nicht korrekt
		1 = "Escape"; 59 = "F1"; 60 = "F2"; 61 = "F3"; 62 = "F4"; 63 = "F5"; 64 = "F6"; 65 = "F7"; 66 = "F8"; 67 = "F9"; 68 = "F10"; 87 = "F11"; 88 = "F12"; 183 = "Druck";
		70 = "Rollen"; 197 = "Pause"; 41 = "Zirkumflex"; 2 = "1"; 3 = "2"; 4 = "3"; 5 = "4"; 6 = "5"; 7 = "6"; 8 = "7"; 9 = "8"; 10 = "9"; 11 = "0"; 12 = "ß"; 13 = "` ´";
		14 = "<- Zurück"; 15 = "Tab"; 16 = "Q"; 17 = "W"; 18 = "E"; 19 = "R"; 20 = "T"; 21 = "Z"; 22 = "U"; 23 = "I"; 24 = "O"; 25 = "P"; 26 = "Ü"; 27 = " + * ~"; 28 = "Enter";
		58 = "Capslock"; 30 = "A"; 31 = "S"; 32 = "D"; 33 = "F"; 34 = "G"; 35 = "H"; 36 = "J"; 37 = "K"; 38 = "L"; 39 = "Ö"; 40 = "Ä"; 43 = "#"; 42 = "L Shift"; 86 = "< >";
		44 = "Y"; 45 = "X"; 46 = "C"; 47 = "V"; 48 = "B"; 49 = "N"; 50 = "M"; 51 = ","; 52 = "."; 53 = "- _"; 54 = "R Shift"; 29 = "L STRG"; 219 = "L Windows"; 56 = "Alt";
		57 = "Leerstaste"; 184 = "Alt Gr"; 220 = "R Windows"; 221 = "Dropdown (Rechtsklick)"; 203 = "L Pfeil <-"; 205 = "R Pfeil ->"; 200 = "O Pfeil"; 208 = "U Pfeil";
		210 = "Einfügen"; 199 = "Pos1"; 201 = "Bild Hoch"; 209 = "Bild Runter"; 211 = "Entf"; 207 = "Ende"; 69 = "Num Ein/Aus"; 181 = "Num /"; 55 = "Num *"; 74 = "Num -";
		71 = "Num 7"; 72 = "Num 8"; 73 = "Num 9"; 75 = "Num 4"; 76 = "Num 5"; 77 = "Num 6"; 79 = "Num 1"; 80 = "Num 2"; 81 = "Num 3"; 82 = "Num 0"; 83 = "Num Entf"; 
		156 = "Num Enter"; 78 = "Num +";
	};
	/*
		Der Reihenfolge nach, {"1","2",x}, order from rank 1 to x (left - right)
		Muss der Reihenfolge genau der staatsbuergerschaften entsprechen, für die Level!
		cop_lvl[] = {{"Private Staat Altis","Private Staat BRD","Private xxx"},....}; // Neu
	*/
	cop_lvl[] = {{"Polizeianwärter","Polizeianwärter 1"},{"Polizeimeister","Polizeimeister 2"},{"Polizeiobermeister","Polizeiobermeister 3"},{"Polizeikommissar","Polizeikommissar 4"},{"Polizeioberkommissar","Polizeioberkommissar 5"},{"Polizeihauptkommissar", "Polizeihauptkommissar 6"},{"Stellv. Polizeidirektor", "Stellv. Polizeidirektor 7"},{"SEK","SEK 8"},{"Polizeidirektor", "Polizeidirektor 9"}}; // Neu
	med_lvl[] = {{"Private","Private 1"},{"Corporal","Corporal 2"},{"Sergeant","Sergeant 3"},{"Lieutenant","Lieutenant 4"},{"Captain", "Captain 5"},{"Major", "Major 6"},{"Colonel", "Colonel 7"}}; // Neu
	// Wohnort # living city
	class persoOrt {
		class 39071 {
			id = 1;
			name = "Abdera";
			plz = 39071;
			str[] = { {"Kleine Felswand", 5},{"Kleiner Felsbogen",3},{"Ruhender Platz",2} };
		};	
		class 34142 {
			id = 2;
			name = "Aggelochori";
			plz = 34142;
			str[] = { {"Strandmarsch",2},{"Kavalastrasse",12},{"Renergusstrasse",12},{"Meerblick",9},{"Zur Fabrik",12},{"Zum Sportplatz",13} };
		};	
		class 32892 {
			id = 3;
			name = "Agios Dionysios";
			plz = 32892;
			str[] = {{"Hauptstrasse",30},{"Palmenarm",12},{"Zum Mischwalde",6}};
		};	
		class 35557 {
			id = 4;
			name = "Alikampos";
			plz = 35557;
			str[] = {{"Schlesienstrasse",13},{"Muehlenberg",9}};
		};	
		class 32449 {
			id = 5;
			name = "Anthrakia";
			plz = 32449;
			str[] = {{"Frickestrasse",12},{"An der Kirche",9},{"Zur Traenke",3}};
		};	
		class 39136 {
			id = 6;
			name = "Athira";
			plz = 39136;
			str[] = {{"Zum Sportplatz",12},{"Am Markt",9},{"Poststrasse",8},{"Zur Fabrik",3},{"Richtung Glauben",10}};
		};	
		class 32632 {
			id = 7;
			name = "Chalkeia";
			plz = 32632;
			str[] = {{"Ueber den Huegel",8},{"Zur Urne",5},{"Friedensstrasse",2}};
		};	
		class 34949 {
			id = 8;
			name = "Charkia";
			plz = 34949;
			str[] = {{"Muehlenblick",5},{"Zweigstrasse",5},{"Am Industriepark",15}};
		};	
		class 31593 {
			id = 9;
			name = "Dorida";
			plz = 31593;
			str[] = {{"Zum Lichtschein",2},{"Zum Felde",6}};
		};	
		class 39895 {
			id = 10;
			name = "Feres";
			plz = 39895;
			str[] = {{"Ruinenstrasse",8},{"Industriehof",3}};
		};	
		class 38441 {
			id = 11;
			name = "Frini";
			plz = 38441;
			str[] = {{"Vom Walde",5}};
		};	
		class 33300 {
			id = 12;
			name = "Galati";
			plz = 33300;
			str[] = {{"Am Berg",12},{"Am Blumenbeet",4}};
		};	
		class 30932 {
			id = 13;
			name = "Gravia";
			plz = 30932;
			str[] = {{"Halbstrasse",5},{"Zum Flugfeld",7},{"Vom Sportplatz",3}};
		};	
		class 35682 {
			id = 14;
			name = "Kalithea";
			plz = 35682;
			str[] = {{"Meerblick",2},{"Fischerhafen",3}};
		};	
		class 30352 {
			id = 15;
			name = "Kalochori";
			plz = 30352;
			str[] = {{"Matschweg",10},{"Stettinerstrasse",3}};
		};	
		class 39159 {
			id = 16;
			name = "Katalaki";
			plz = 39159;
			str[] = {{"Anglerpier",4},{"Ueber den Kies",3}};
		};	
		class 37690 {
			id = 17;
			name = "Kavala";
			plz = 37690;
			str[] = {{"Burgblick",4},{"Hauptstrasse",25},{"Am Krankenhaus",9},{"Palmenweg",8},{"Ruhrstrasse",6}};
		};	
		class 38212 {
			id = 18;
			name = "Kore";
			plz = 38212;
			str[] = {{"Scharfer Blick",5},{"Huegelweg",3}};
		};	
		class 38023 {
			id = 19;
			name = "Lakka";
			plz = 38023;
			str[] = {{"Hauptstrasse",3},{"Fliegerwiese",4}};
		};	
		class 35026 {
			id = 20;
			name = "Molos";
			plz = 35026;
			str[] = {{"Zur Salzindustrie",8},{"Kreuzstrasse",8}};
		};	
		class 38319 {
			id = 21;
			name = "Negades";
			plz = 38319;
			str[] = {{"Am Hang",12},{"Zum Meer",2}};
		};
		class 30854 {
			id = 22;
			name = "Neochori";
			plz = 30854;
			str[] = {{"Am Walde",12},{"Am Markt",4},{"Hafenstrasse",3},{"Fischerweg",2},{"Gradestrasse",5},{"Feldstrasse",4}};
		};	
		class 39394 {
			id = 23;
			name = "Neri";
			plz = 39394;
			str[] = {{"Kirchenblick",4},{"Am Felsbruch",5},{"Mannsweg",5}};
		};	
		class 39399 {
			id = 24;
			name = "Oreokastro";
			plz = 39399;
			str[] = {{"Im Oberland",9},{"Burgstrasse",3}};
		};	
		class 37410 {
			id = 25;
			name = "Panagia";
			plz = 37410;
			str[] = {{"Mischweg",8},{"Kreuzstrasse",4}};
		};	
		class 35865 {
			id = 26;
			name = "Panochori";
			plz = 35865;
			str[] = {{"Kavalablick",9},{"Unter dem Hang",6}};
		};	
		class 37708 {
			id = 27;
			name = "Paros";
			plz = 37708;
			str[] = {{"Hauptstrasse",21},{"Astweg",6},{"Zweigstrasse",1},{"Kaeufermarkt",4},{"Zum Unterstand",6}};
		};	
		class 35182 {
			id = 28;
			name = "Poliakko";
			plz = 35182;
			str[] = {{"Huettenstrasse",8},{"Zur Wende",2}};
		};	
		class 36893 {
			id = 29;
			name = "Pyrgos";
			plz = 36893;
			str[] = {{"Hauptstrasse",12},{"Kanalweg",8},{"Muehlenstrasse",5},{"Inselweg",4},{"Felsenfest",4},{"Weinsbergwiese",8}};
		};	
		class 36602 {
			name = "Rodopoli";
			plz = 36602;
			str[] = {{"An zwei Muehlen",4},{"Hauptstrasse",5},{"Kuesterweg",4}};
		};	
		class 30081 {
			id = 30;
			name = "Sofia";
			plz = 30081;
			str[] = {{"Hauptstrasse",16},{"Am Sportplatz",6},{"Radarweg",7},{"Langensberg",6}};
		};	
		class 34301 {
			id = 31;
			name = "Stavros";
			plz = 34301;
			str[] = {{"An der Nadel",12},{"Im Nadelwald",4},{"Agia Marinaweg",4}};
		};	
		class 37083 {
			id = 32;
			name = "Syrta";
			plz = 37083;
			str[] = {{"Girnaweg",11},{"Millerweg",2}};
		};	
		class 31535 {
			id = 33;
			name = "Telos";
			plz = 31535;
			str[] = {{"Vierer Rad",14},{"Hauptstrasse",3},{"Finanzweg",5}};
		};	
		class 35427 {
			id = 34;
			name = "Therisa";
			plz = 35427;
			str[] = {{"Sonnenweg",6},{"Am Feldplatz",3}};
		};	
		class 38255 {
			id = 35;
			name = "Topolia";
			plz = 38255;
			str[] = {{"Ygontweg",2}};
		};	
		class 31167 {
			id = 36;
			name = "Zaros";
			plz = 31167;
			str[] = {{"Glaubensweiser",12},{"Am Sportplatz",6},{"Zur Hauptstrasse",8},{"Am Wald",4}};
		};	
	};
	// Vorhandene Gesichter # some faces
	class persoBild
	{
		class 1
		{
			id = 1;
			name = "Chad";
			pfad = "Custom\IDSystem\persobilder\IDBang.jpg";
		};
		class 2
		{
			id = 2;
			name = "Paul";
			pfad = "Custom\IDSystem\persobilder\IDPaul.jpg";
		};
		class 3
		{
			id = 3;
			name = "Tyler";
			pfad = "Custom\IDSystem\persobilder\IDShortMan.jpg";
		};
		class 4
		{
			id = 4;
			name = "Trump";
			pfad = "Custom\IDSystem\persobilder\IDTrump.jpg";
		};
		class 5
		{
			id = 5;
			name = "Jerry";
			pfad = "Custom\IDSystem\persobilder\IDJerry.jpg";
		};
		class 6
		{
			id = 6;
			name = "Pepe";
			pfad = "Custom\IDSystem\persobilder\IDPepe.jpg";
		};
		class 7
		{
			id = 7;
			name = "John";
			pfad = "Custom\IDSystem\persobilder\IDYoucantseeme.jpg";
		};
		class 8
		{
			id = 8;
			name = "Tri";
			pfad = "Custom\IDSystem\persobilder\IDTrihard.jpg";
		};
		class 9
		{
			id = 9;
			name = "Meeseeks";
			pfad = "Custom\IDSystem\persobilder\IDMeeseeks.jpg";
		};
		class 10
		{
			id = 10;
			name = "Dat Boi";
			pfad = "Custom\IDSystem\persobilder\IDBoi.jpg";
		};
		class 11
		{
			id = 11;
			name = "Alison";
			pfad = "Custom\IDSystem\persobilder\IDQuinn.jpg";
		};
		class 12
		{
			id = 12;
			name = "Commy";
			pfad = "Custom\IDSystem\persobilder\IDCommunism.jpg";
		};
		class 13
		{
			id = 13;
			name = "Cat";
			pfad = "Custom\IDSystem\persobilder\IDCat.jpg";
		};
		class 14
		{
			id = 14;
			name = "Rob";
			pfad = "Custom\IDSystem\persobilder\IDBlock.jpg";
		};
		class 15
		{
			id = 15;
			name = "Steve";
			pfad = "Custom\IDSystem\persobilder\IDCookie.jpg";
		};
		class 16
		{
			id = 16;
			name = "Frog";
			pfad = "Custom\IDSystem\persobilder\IDFrog.jpg";
		};
	};
};

#include "Personalausweis.hpp"