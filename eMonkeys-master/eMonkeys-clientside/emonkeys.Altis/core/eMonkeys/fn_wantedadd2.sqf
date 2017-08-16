private["_display","_list","_side"];
disableSerialization;
if (playerSide == civilian) exitWith {hint "Du bist kein Cop"};
waitUntil {!isNull (findDisplay 9900)};
_display = findDisplay 9900;
_list = _display displayCtrl 9902;


ctrlShow[2050,false]; //Gang Icon
ctrlShow[2051,false]; //Gang Button
ctrlShow[2054,false]; //Craft Icon
ctrlShow[2055,false]; //Craft Button

if((call EMonkeys_adminlevel) < 1) then
{
	ctrlShow[2056,false]; //Admin Icon
	ctrlShow[2057,false]; //Admin Button
};

//Purge List
lbClear _list;


{
	_side = switch(side _x) do {case west: {"Cop"}; case civilian : {"Civ"}; case independent : {"Arzt"}; case east : {"Civ"}; default {"Unknown"};};
	_list lbAdd format["%1 - %2", name _x,_side];
	_list lbSetdata [(lbSize _list)-1,str(_x)];
} foreach playableUnits;


_list2 = _display displayCtrl 9991;
lbClear _list2;


//_index = lbAdd [_list2, "Name"];
//lbSetData [_list2, _index, "pfad/zum/bild.paa"];
//lbSetValue  [_list2, _index, "pfad/zum/bild.paa"];

_text = "Fehlende Fahrlizenz €10.000"; // name and price
_data = "1";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fehlende LKW Lizenz €20.000";
_data = "2";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fehlender Pilotenschein €40.000";
_data = "3";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fehlende Bootslizenz €10.000";
_data = "4";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Führen eines illegalen Fahrzeugs €25.000";
_data = "5";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Führen eines Polizeifahrzeugs €30.0000";
_data = "6";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überhöhte Geschwindigkeit < 20 km/h €500";
_data = "7";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Überhöhte Geschwindigkeit > 20 km/h €5.000";
_data = "8";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenkonsum €10.000";
_data = "9";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fahren ohne Licht €1.000";
_data = "10";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Falsch parken €500";
_data = "11";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Gefährdende Fahrweise €5.000";
_data = "12";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Unfallverursachung €10.000";
_data = "13";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Mitnahme von Fhrz. ohne LL €5.000";
_data = "14";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Person auf Ladung €15.0000";
_data = "15";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fliegen ohne Kollisionsl €5.000";
_data = "16";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Tiefflug über Städten €15.000";
_data = "17";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Fehlende Landerlaubnis €20.0000";
_data = "18";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenbesitz < 12k €15.500";
_data = "19";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenbesitz >12k €27.500";
_data = "20";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenbesitz >42k €52.500";
_data = "21";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Drogenbesitz >48k €60.000";
_data = "22";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "leg. Waffe in Stadt €15.000";
_data = "23";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "leg. Waffe ohne Lizenz €10.000";
_data = "24";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "ill. Waffe führen €40.000";
_data = "25";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "ill. Waffe besitzen €25.0000";
_data = "26";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Lärmbelastigung €1.000";
_data = "27";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Raub €25.000";
_data = "28";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "versuchter Mord €100.000";
_data = "29";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Diebstahl von Staatseigentum €35.000";
_data = "30";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Bankraub 75.000€";
_data = "31";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Bankraub Komplize €75.000";
_data = "32";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beamtenbeleidigung €5.000";
_data = "33";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Behind. der Polizeiarbeit €10.0000";
_data = "34";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Widerstand gg die Staatsgw. €15.000";
_data = "35";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "bewaffn. Widerstand gg die Staatsgw. €25.000";
_data = "36";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Missbrauch des Notrufs €10.000";
_data = "37";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Versuchte Beamtenbestechung €10.000";
_data = "38";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Vermummung €500";
_data = "39";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Hehlerei von Goldbarren €50.000";
_data = "40";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Beihilfe zum Gefängnisausbr. €30.000";
_data = "41";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Körperverletzung €20.000";
_data = "42";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Freiheitsberaubung €50.000";
_data = "43";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Hehlerei von Fahrzg. €10.000";
_data = "44";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];

_text = "Betrug €10.000";
_data = "45";
_list2 lbAdd format["%1  (%2)",_text,_data];
_list2 lbSetData [(lbSize _list2)-1,_data];