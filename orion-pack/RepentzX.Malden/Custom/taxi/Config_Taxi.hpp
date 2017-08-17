/*
	Aktueller Hotkey zum Ein-/Ausschalten:
		SHIFT + NUM7
*/
class CfgTaxi {
	Preis_km = 3500; // Preis pro Kilometer, der raufgerechnet wird
	Welche_Kilometer = 1; // 0=beendete Kilometer (floor), 1=angefangene Kilometer 8 (ceil)
	Preis_Zeit = 250; // Siehe Taxi_Grundpreis_Aktua 
	Preis_Start = 250; // Startpreis
	Preis_Multi_Auto = 1; // Aktueller Preis * dies
	Preis_Multi_Luft = 1.5; // Aktueller Preis * dies
	Preis_Multi_Boot = 1.25; // Aktueller Preis * dies
	Taxi_Grundpreis_Aktua = .25; // Alle Taxi_Grundpreis_Aktua * 60 Sekunden Preis_Zeit auf den aktuellen Preis raufgerechnet wird
	Erlaubte_Fraktionen[] = {{"CIV","license_civ_taxi"}}; // Welche Fraktionen das Taxiscript nutzen dürfen CIV=civilian, WEST=Blofor/Cop, GUER=independent/Medic, EAST=Opfor(/manchal ADAC)
	Erlaubte_Fahrzeuge[] = {"C_SUV_01_F"}; // Fahrzeugklassen angeben
	Taximeter_Sleep = 2.5; // In Sekunden (Empfohlen 1.5)
	Taximeter_Info_Step = 3; // Taximeter_Sleep * Steps = alle x Sekunden/Minuten erhalten Kunden eine Kostennachricht
	debug = 0; // 0=nein, 1=ja => Manche Übeprüfungen werden ignoriert
	Taximeter_Farbe_M_An = "#0ffff0";
	Taximeter_Farbe_M_Aus = "#ff0000";
	tasteTaximeter = 41; // Tastennummer zum Ein-/Ausschalten
	class tasten { // Tastennummern
		1 = "Escape"; 59 = "F1"; 60 = "F2";	61 = "F3"; 62 = "F4"; 63 = "F5"; 64 = "F6"; 65 = "F7"; 66 = "F8"; 67 = "F9"; 68 = "F10"; 87 = "F11"; 88 = "F12"; 183 = "Druck";
		70 = "Rollen"; 197 = "Pause"; 41 = "Zirkumflex"; 2 = "1"; 3 = "2"; 4 = "3"; 5 = "4"; 6 = "5"; 7 = "6"; 8 = "7"; 9 = "8"; 10 = "9"; 11 = "0"; 12 = "ß"; 13 = "` ´";
		14 = "<- Zurück"; 15 = "Tab"; 16 = "Q"; 17 = "W"; 18 = "E"; 19 = "R"; 20 = "T"; 21 = "Z"; 22 = "U"; 23 = "I"; 24 = "O"; 25 = "P"; 26 = "Ü"; 27 = " + * ~"; 28 = "Enter";
		58 = "Capslock"; 30 = "A"; 31 = "S"; 32 = "D"; 33 = "F"; 34 = "G"; 35 = "H"; 36 = "J"; 37 = "K"; 38 = "L"; 39 = "Ö"; 40 = "Ä"; 43 = "#"; 42 = "L Shift"; 86 = "< >";
		44 = "Y"; 45 = "X"; 46 = "C"; 47 = "V"; 48 = "B"; 49 = "N"; 50 = "M"; 51 = ","; 52 = "."; 53 = "- _"; 54 = "R Shift"; 29 = "L STRG"; 219 = "L Windows"; 56 = "Alt";
		57 = "Leerstaste"; 184 = "Alt Gr"; 220 = "R Windows"; 221 = "Dropdown (Rechtsklick)"; 203 = "L Pfeil <-"; 205 = "R Pfeil ->"; 200 = "O Pfeil"; 208 = "U Pfeil";
		210 = "Einfügen"; 199 = "Pos1"; 201 = "Bild Hoch"; 209 = "Bild Runter"; 211 = "Entf"; 207 = "Ende"; 69 = "Num Ein/Aus"; 181 = "Num /"; 55 = "Num *"; 74 = "Num -";
		71 = "Num 7"; 72 = "Num 8"; 73 = "Num 9"; 75 = "Num 4"; 76 = "Num 5"; 77 = "Num 6"; 79 = "Num 1"; 80 = "Num 2"; 81 = "Num 3"; 82 = "Num 0"; 83 = "Num Entf"; 
		156 = "Num Enter"; 78 = "Num +";
	};
};