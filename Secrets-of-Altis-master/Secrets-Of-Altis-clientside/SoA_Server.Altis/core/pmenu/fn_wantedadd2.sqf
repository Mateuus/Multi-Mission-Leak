//fn_wantedadd2.sqf

private["_display","_list","_side"];
disableSerialization;
waitUntil {!isNull (findDisplay 9900)};
_display = findDisplay 9900;
_list = _display displayCtrl 9902;

//Purge List
lbClear _list;

{
    _list lbAdd format["%1",name _x];
    _list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;


_list2 = _display displayCtrl 9991;
lbClear _list2;

_text = "Fahren ohne Führerschein";
_data = "1";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Versuchter Diebstahl eines Zivilfahrzeugs";
_data = "2";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Diebstahl/Führen eines fremden Zivilfahrzeugs";
_data = "3";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren ohne Licht";
_data = "4";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überhöhte Geschwindigkeit";
_data = "5";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Gefährliche Fahrweise";
_data = "6";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Versuchter Diebstahl eines Polizeifahrzeugs";
_data = "7";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Diebstahl von Polizeifahrzeugen";
_data = "8";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];


_text = "Landen in einer Flugverbotszone";
_data = "9";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren von illegalen Fahrzeugen";
_data = "10";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Unfallverursacher/Fahrerflucht nach Unfall";
_data = "11";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahrerflucht vor der Polizei";
_data = "12";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überfahren eines anderen Spielers";
_data = "13";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Illegale Strassensperren";
_data = "14";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Widerstand gegen die Staatsgewalt";
_data = "15";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Nichtbefolgen einer polizeilichen Anordnung";
_data = "16";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beleidigung";
_data = "17";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Belästigung eines Polizisten";
_data = "18";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Betreten einer Sperrzone";
_data = "19";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Töten eines Polizisten";
_data = "20";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beschuss auf Polizei/Beamte/Eigentum";
_data = "21";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Zerstörung von Polizeieigentum";
_data = "22";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogendelikte";
_data = "23";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Waffenbesitz ohne Lizenz";
_data = "24";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Mit gezogener Waffe durch Stadt";
_data = "25";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Besitz einer verbotenen Waffe";
_data = "26";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Schusswaffengebrauch innerhalb Städte";
_data = "27";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Geiselnahme";
_data = "28";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überfall auf Personen/Fahrzeuge";
_data = "29";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Bankraub";
_data = "30";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Mord";
_data = "31";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Aufstand";
_data = "32";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Angriff durch Rebellen";
_data = "33";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Angriff/Belagerung von Hauptstädten";
_data = "34";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Parken in einer Flugverbotszone";
_data = "35";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fliegen in der Stadt unterhalb 100m";
_data = "36";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Ausbruch aus dem Gefängnis";
_data = "37";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fliegen ohne Fluglizenz";
_data = "38";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Dauerhaft störendes Hupen";
_data = "39";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Handel mit exotischen Gütern";
_data = "40";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Hacking";
_data = "41";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Entführung";
_data = "207";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Folter";
_data = "208";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Geldautomat aufgebrochen";
_data = "211";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Öffentliches Betrinken";
_data = "390";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Organ-Handel";
_data = "919";
_list2 lbAdd format["%1",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];