/*
	File: fn_WantedAdd2.sqf
	Date: 21.01.2016
	Edit: configurated for LoP-Wanted List by Acar Mali & Mark Jefferson

*/

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9900)};
_display = findDisplay 9900;
_list = _display displayCtrl 9902;
 
//Purge List
lbClear _list;
 
 
{
    _side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; default {"Unknown"};};
    _list lbAdd format["%1 - %2", name _x,_side];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;
 
 
_list2 = _display displayCtrl 9991;
lbClear _list2;
 
 
//_index = lbAdd [_list2, "Name"];
//lbSetData [_list2, _index, "pfad/zum/bild.paa"];
//lbSetValue [_list2, _index, "pfad/zum/bild.paa"];
 
_text = "  Bußgeldkatalog ";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = "  von Lost of Paradise ";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = " §1 Verkehrsdelikte";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];

_text = " §1.1 Bodenfahrzeuge";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Fahren auf der falschen Fahrbahn $100.000";
_data = "1";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren abseits der Fahrbahn $25.000";
_data = "2";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren mit Illegalen Fahrzeugen $50.000 + Impound";
_data = "4";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren ohne PKW Führerschein $25.000";
_data = "5";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren ohne LKW Führerschein $50.000";
_data = "6";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren eines gestohlenen Fahrzeuges $50.000";
_data = "7";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahren ohne Licht $25.000";
_data = "8";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Falschparken $10.000";
_data = "3";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Gefährliche Fahrweise $20.000";
_data = "13";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Geschwindigkeitsübertretung 10 - 20 km/h $10.000";
_data = "10";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Geschwindigkeitsübertretung 20 - 30km/h $25.000";
_data = "11";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Geschwindigkeitsübertretung in Extremfällen $100.000";
_data = "12";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Missachtung der Vorfahrt $10.000";
_data = "15";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Umfahren von Checkpoints $100.000";
_data = "9";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Unfallverursacher + Fahrerflucht $50.000";
_data = "20";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Zerstören eines fremden Fahrzeuges $100.000 + Ersatz + 5min";
_data = "27";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §1.2 Luftfahrzeuge";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Fliegen ohne Pilotenschein $50.000";
_data = "16";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fliegen ohne Kollisionslichter $25.000";
_data = "17";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fliegen unter der Mindesthöhe $50.000";
_data = "18";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Landen in Flugverbotszonen $100.000";
_data = "19";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fliegen mit illegalen Flugobjekten $50.000";
_data = "20";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Zerstören eines fremden Helikopters $200.000 + Ersatz + 5min";
_data = "27";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §2 Drogenschutzgesetze";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Befragung des Händlers $200.000";
_data = "22";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Drogenkonsum $50.000";
_data = "23";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Handel mit illegale Substanzen $100.000 + 50% des Wertes";
_data = "24";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Mitführen von illegale Substanzen $100.000 + 50% des Wertes";
_data = "21";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Besitz eines illegalen Gegenstandes $75.000";
_data = "41";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §3 Diebstahl / Überfälle";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Banküberfall $500.000 + 10min";
_data = "34";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Versuchter Fahrzeugdiebstahl $25.000";
_data = "26";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Fahrzeugdiebstahl $50.000";
_data = "25";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Versuchter Diebstahl eines Einsatzfahrzeuges $75.000";
_data = "28";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Diebstahl eines Einsatzfahrzeuges $100.000";
_data = "29";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Nieren Diebstahl $250.000";
_data = "919";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Raubüberfall $200.000 + Ersatz";
_data = "33";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §4 Körperverletzung";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Fahrlässige Tötung $100.000";
_data = "32";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Anstiftung zum Mord $100.000 + $100k/Mord";
_data = "30";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Mord $500.000 + 10min";
_data = "31";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §5 Verhaltensdelikte";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Amtsanmaßung $50.000";
_data = "39";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Aufstand $50.000";
_data = "51";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Beamtenbeleidigung $50.000";
_data = "42";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Beleidigung $25.000";
_data = "43";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Behinderung von Ermittlungen $25.000";
_data = "37";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Betreten einer Sperrzone $100.000";
_data = "46";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Freizügigkeit in der Öffentlichkeit $10.000";
_data = "49";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Illegale Straßensperren $100.000";
_data = "52";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Illegales Straßenrennen $100.000";
_data = "53";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Lärmbelästigung $10.000";
_data = "50";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Missachtung polizeilicher Anweisungen $25.000";
_data = "38";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Missbrauch des Notrufes $25.000";
_data = "40";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Vermumung am Kavala-Markt $10.000";
_data = "48";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Widerstand gegen die Staatsgewalt $50.000";
_data = "36";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §6 Waffenschutzgesetze";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §6.1 Waffenbesitz";
_data = "1";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Besitz von illegalen Attachments $25.000";
_data = "61";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Besitz einer illegalen Waffe / Polizeiwaffe $50.000";
_data = "60";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Waffenbesitz ohne Lizenz $25.000";
_data = "59";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §6.2 Waffengebrauch";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Beschuss auf Polizei/ARS/Einsatzfahrzeuge $200.000";
_data = "63";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "öffentliches Tragen von Waffen an Marktplätzen $25.000";
_data = "64";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Schusswaffengebrauch innerhalb von Städten $50.000";
_data = "62";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Verwendung von Rauchgranaten $25.000";
_data = "65";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §7 Erpessung";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Bedrohung $50.000";
_data = "58";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Erpressung $50.000";
_data = "57";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Geiselnahme / Entführung $400.000 + 10min";
_data = "47";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §8 Gebiete";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Angriff / Belagerung von Hauptstädten $500.000 + 5min";
_data = "54";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Besetzen fremder Gebiete $200.000";
_data = "56";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Einnahme von Polizeiquartieren / Checkpoints $300.000";
_data = "55";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = " §9 Gefängnis";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "---------------------------------------------";
_data = "999";
_list2 lbAdd format["%1 (%2)",_text];
_list2 lbSetData [(lbSize _list2)-1];
 
_text = "Beihilfe zur Gefängnisflucht $250.000";
_data = "45";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];
 
_text = "Gefängnisflucht alte Strafe + 5min";
_data = "44";
_list2 lbAdd format["%1 (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];