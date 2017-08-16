#include "..\..\macros.hpp"
private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9900)};
_display = findDisplay 9900;
_list = _display displayCtrl 9902;

//Purge List
lbClear _list;


{
	
	_side = _x getVariable["playertype","Unbekannt"];
	_list lbAdd format["%1 (%2)",getPlayerDName(_x),_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;


_list2 = _display displayCtrl 9991;
lbClear _list2;


//_index = lbAdd [_list2, "Name"];
//lbSetData [_list2, _index, "pfad/zum/bild.paa"];
//lbSetValue  [_list2, _index, "pfad/zum/bild.paa"];

_text = "A-01 Fliegen ohne Lizenz 50000€"; // name and price
_data = "1";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "A-02 Landen an ungeeigneten Platz 50000€";
_data = "2";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "A-03 Fliegen/Schweben unterhalb 300m ü.Stadt 25000€";
_data = "3";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "A-04 Nutzung eines Illegalen Helikopters (Einsatzfahrzeuge) 150000€";
_data = "4";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "A-05 Fliegen ohne Kollisionslichter 25000€";
_data = "5";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "B-01 Boot fahren ohne Bootsführerschein 15000€";
_data = "6";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "B-02 Wasserfahrzeug an ungeeigneten Platz anlegen 10000€";
_data = "7";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "B-03 Mutwiliges rammen von anderen Wasserfahrzeugen 50000€";
_data = "8";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "B-04 Es darf nur ein legales Wasserfahrzeug geführt werden 150000€";
_data = "9";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-01 Fahren ohne Führerschein (PKW) 10000€"; // name and price
_data = "10";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-02 Fahren ohne Führerschein (LKW) 40000€"; // name and price
_data = "11";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-03 Überhöhte Geschwindigkeit innerorts 20000€";
_data = "12";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-04 Überhöhte Geschwindigkeit außerorts 10000€";
_data = "13";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-05 Rücksichtloses Führen eines Pkw / Lkw 25000€";
_data = "14";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-06 Rücksichtloses Fahren mit Todesfolge 25000€";
_data = "15";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-07 Missachtung der Polizeisirenen 10000€";
_data = "16";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-08 Flucht vor der Polizei 25000€";
_data = "17";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-09 Fahren ohne Licht bei Nacht 25000€";
_data = "18";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-10 Fahren abseits der Straßen (Off-Roading) 25000€";
_data = "19";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-11 Blockieren von Straßen 10000€";
_data = "20";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-12 Fahren von illegalen Fahrzeugen 150000€";
_data = "21";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-13 Illegales Straßenrennen 50000€";
_data = "22";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-14 Falsch parken 10000€";
_data = "23";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-15 Wiederholtes Hupen in der Stadt 10000€";
_data = "24";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "C-16 Fahrerflucht nach einem Unfall 30000€";
_data = "25";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-01 Führen oder Besitzen einer Schusswaffe ohne Lizenz 50000€";
_data = "26";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-02 Offenes tragen einer Schusswaffe innerhalb einer Stadt 25000€";
_data = "27";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-03 Besitz von Illegalen Schusswaffen 50000€";
_data = "28";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-04 Nutzen einer Schusswaffe in einer Stadt. INHAFTIEREN";
_data = "29";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-05 Besitz von Sprengstoffen. INHAFTIEREN";
_data = "30";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "D-06 Nutzung von illegalen Schusswaffen 100000€";
_data = "31";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-01 Mord INHAFTIEREN (200.000€)";
_data = "32";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-02 Mord in Notwehr. Verwarnung wenn bewiesen, dass es in Notwehr war";
_data = "33";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-03 Versuchter Mord 150000€";
_data = "34";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-04 Entführung, Freiheitsberaubung INHAFTIEREN";
_data = "35";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-05 Versuchte Entführung 50000€";
_data = "36";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-06 Überfall auf Personen/Fahrzeuge 50000€";
_data = "37";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-07 Fahrzeugdiebstahl 50000€";
_data = "38";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-08 Versuchter Fahrzeugdiebstahl 25000€";
_data = "39";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-09 Besitzt oder Handel von illegaler Ware 100000€";
_data = "40";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-10 Aufbewahren von Suchtmittel in Häusern 250000€";
_data = "41";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-11 Banküberfall 100000€";
_data = "42";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-12 Nutzung von Sprengstoffen. INHAFTIEREN + Schadensersatz";
_data = "43";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-13 Beamtenbeleidigung / Beamtenbelästigung / Missbrauch von 110 25000€";
_data = "44";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-14 Betreten von Polizeilichen Sperrzonen. (Ohne Genehmigung) 10000€";
_data = "45";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-15 Angriff auf einen Polizisten INHAFTIEREN";
_data = "46";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-16 Besitz und tragen von Polizeiuniform als Zivilist 150000€";
_data = "47";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-17 Amtsanmaßung 150000€";
_data = "48";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-18 Körperverletzung 25000€";
_data = "49";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-19 Tragen von Rebellenkleidung in Kavalla 15000€";
_data = "50";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-20 Androhung einer Straftat (Bedrohen von Polizisten) 50000€";
_data = "51";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-21 Autos beim Fahrzeugschieber verkaufen 100000€";
_data = "52";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-22 Widerstand gegen Polizeibefehle 10000€";
_data = "53";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-23 Erregung öffentlich Ärgernisses (In Boxershorts) 10000€";
_data = "54";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-24 Versuchte Beamtenbestechung 100000€";
_data = "55";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-25 Organdiebstahl 150000€";
_data = "56";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-26 Ausbruchshilfe aus dem Gefängnis 100000€";
_data = "57";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-27 Tankstellenraub 30000€";
_data = "58";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-28 Filialen Bankraub 50000€";
_data = "59";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-29 Diebstahl aus einer Leiche 20000€";
_data = "60";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "E-30 Öffentlich in Städten orinieren 10000€";
_data = "61";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];