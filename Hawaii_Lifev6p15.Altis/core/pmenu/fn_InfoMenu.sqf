/*
	Function by TeamElan
	Dialog and content by HawaiiLife
*/
private ["_start"];
_start = [_this,0,0,[0]] call BIS_fnc_param;

//InfoMenus
if(_start isEqualTo 0) exitWith {
disableSerialization;
createDialog "infoMenu";
switch(playerSide) do {case west:{ctrlShow[2011,false];ctrlShow[2016,false];};case independent:{ctrlShow[2011,false];ctrlShow[2016,false];};};

_InfoMenus = ((findDisplay 41500) displayCtrl 2300);
lbClear _InfoMenus;

_InfoMenus lbAdd "Allgemeines";lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0.694,0.141,1]];
_InfoMenus lbAdd "Server Informationen"; lbSetValue [2300, (lbSize _InfoMenus)-1, 1];
_InfoMenus lbAdd "Regeln"; lbSetValue [2300, (lbSize _InfoMenus)-1, 2];
_InfoMenus lbAdd "Steuerung"; lbSetValue [2300, (lbSize _InfoMenus)-1, 3];
_InfoMenus lbAdd "Lizenzpreise"; lbSetValue [2300, (lbSize _InfoMenus)-1, 4];
_InfoMenus lbAdd "Erste Schritte"; lbSetValue [2300, (lbSize _InfoMenus)-1, 5];
_InfoMenus lbAdd "";
_InfoMenus lbAdd "Changelog"; lbSetValue [2300, (lbSize _InfoMenus)-1, 6];lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0,0.082,1]];

_InfoMenus lbSetCurSel 1;
};

//Infos
if(_start isEqualTo 1) exitWith {
private ["_index","_infoText"];
_index = ((findDisplay 41500) displayCtrl 2300) lbValue (lbCurSel 2300);
((findDisplay 41500) displayCtrl 2301) ctrlSetText lbText [2300, lbCurSel 2300];

if(_index isEqualTo 0) exitWith {};


_infoText = call {
//Server
if(_index isEqualTo 1) exitWith {
"Atlis Life Server<br/>
<t color='#FFB124'>Name:</t> [GER] Hawaii Life RPG<br/>
<t color='#FFB124'>IP:</t> s.hawaii-life.net<br/>
<t color='#FFB124'>Port:</t> 2302<br/><br/>
<t color='#FFB124'>Direktlinks:</t><br/>
<a href='http://invite.teamspeak.com/ts.hawaii-life.net/'>Teamspeak: ts.hawaii-life.net</a><br/>
<a href='http://www.hawaii-life.net/'>Homepage: hawaii-life.net</a><br/><br/>
Restart<br/>
<t color='#FFB124'>0:00, 4:00, 8:00, 12:00, 16:00, 20:00</t>
";
};

//Regeln
if(_index isEqualTo 2) exitWith {"Die kompletten Regeln stehen auf unserer Homepage. Um direkt zu den Regeln zu kommen:<br/><a color='#FFB124' href='http://www.hawaii-life.net/regeln.html'>Hier klicken</a>"};

//Steuerung
if(_index isEqualTo 3) exitWith {
"<t color='#FFB124'>Z</t> Spieler Menu<br/>
<t color='#FFB124'>U</t> Fahrzeuge/Haeuser auf/zuschliessen<br/>
<t color='#FFB124'>T</t> Vehicle Z Inventar<br/>
<t color='#FFB124'>Q</t> Spitzhacke<br/>
<t color='#FFB124'>^</t> Ton reduzieren<br/>
<t color='#FFB124'>1-4</t> Hand bewegen<br/>
<t color='#FFB124'>F1</t> View Distance Einstellungen<br/>
<t color='#FFB124'>Linkes Shift + F4</t> Animations Menu<br/>
<t color='#FFB124'>Linkes Shift + R</t> Festnehmen (Cop/Civ)<br/>
<t color='#FFB124'>Linkes Shift + B</t> Ergeben<br/>
<t color='#FFB124'>Linkes Shift + G</t> Knockout (nur mit Waffe)<br/>
<t color='#FFB124'>Linkes Shift + Space</t> Springen<br/>
<t color='#FFB124'>Linkes Shift + H</t> Waffe Holstern<br/>
<t color='#FFB124'>Linkes Windows</t> Farmen an Feldern<br/>
<t color='#FFB124'>Linkes Windows</t> Interaktionsmenu<br/>";
};

//Lizensen
if(_index isEqualTo 4) exitWith {
"Allgemeine Lizenzen<br/>
<t color='#FFB124'>PKW-Fuehrerschein:</t> 750$<br/>
<t color='#FFB124'>LKW-Fuehrerschein:</t> 25.000$<br/>
<t color='#FFB124'>Pilotenschein:</t> 75.000$<br/>
<t color='#FFB124'>Bootsschein:</t> 2.000$<br/>
<t color='#FFB124'>Taucherschein:</t> 2.000$<br/>
<t color='#FFB124'>Waffenschein:</t> 45.000$<br/>
<t color='#FFB124'>Eigentumsurkunde:</t> 1.000.000$<br/>
<t color='#FFB124'>Freddy's Lizens:</t> 250.000$<br/>
<t color='#FFB124'>Rebellen Lizens:</t> 1.000.000$<br/><br/>

Legale Farmlizensen<br/>
<t color='#FFB124'>Kokosfleisch:</t> 8.000$<br/>
<t color='#FFB124'>Kokosmilch:</t> 8.000$<br/>
<t color='#FFB124'>Zucker:</t> 12.500$<br/>
<t color='#FFB124'>Bambus:</t> 12.500$<br/>
<t color='#FFB124'>Wolle:</t> 12.500$<br/>
<t color='#FFB124'>Kaffee:</t> 12.500$<br/>
<t color='#FFB124'>Salz:</t> 25.000$<br/>
<t color='#FFB124'>Tabak:</t> 35.000$<br/>
<t color='#FFB124'>Solarplatten:</t> 100.000$<br/>
<t color='#FFB124'>Krabben:</t> 70.000$<br/>
<t color='#FFB124'>Brennstaebe:</t> 80.000$<br/>
<t color='#FFB124'>Jagdschein:</t> 150.000$<br/><br/>

Illegale Farmlizensen<br/>
<t color='#FFB124'>Hanf:</t> 45.000$<br/>
<t color='#FFB124'>Schlafmohn:</t> 55.000$<br/>
<t color='#FFB124'>Meth:</t> 65.000$<br/>
<t color='#FFB124'>Kokain:</t> 75.000$<br/>
<t color='#FFB124'>Palmol:</t> 75.000$<br/>
<t color='#FFB124'>Kristalle:</t> 80.000$<br/>
<t color='#FFB124'>Korallen:</t> 60.000$<br/>
<t color='#FFB124'>angereichertes Uran:</t> 100.000$<br/>
<t color='#FFB124'>Schildkroeten:</t> 50.000$";
};

if(_index isEqualTo 5) exitWith {
"Wenn ihr neu bei uns seid, dann empfehlen wir Kokosnuss zu farmen. Ihr koennt euch zwischen Kokosnussfleisch und Kokosnussmilch entscheiden. Bei Kokosnussmilch verdient ihr mehr, muesst aber auch weiter fahren. Eine Waffe braucht ihr im Regelfall nicht. Solltet ihr dennoch ausgeraubt werden, dann greift schnell zu eurem Smartphone und Ruft die Polizei. Dies macht ihr ueber das Spieler Menu(Z).";
};

if(_index isEqualTo 6) exitWith {
"<t size='1.2px' align='center' color='#FFB124'>Bugs bitte im Forum melden</t><br/>
<t align='center' color='#FFB124'>Das kostet nichts und verbessert euer Gameplay</t><br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 15</t><br/>
Fehlerbehebungen<br/>
Bankraub erst 30min Nach Restart moeglich!<br/>
HUD Restart Timer angepasst<br/>
Hawaii Offroad update<br/>
Cop Loadout fix<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 14</t><br/>
Fehlerbehebungen<br/>
6 neue Zamak Skins<br/>
1 neuer Strider Skin<br/>
1 neuer Hellcat Skin,<br/>
1 Hellcat Skin ersetzt<br/>
1 neuer Mohawk Skin<br/>
1 neuer Huron Skin<br/>
1 neuer Orca Skin<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 13</t><br/>
Fehlerbehebungen<br/>
Gang Abheben vorerst deaktiviert wegen Duping<br/>
Cop/THW Lichter deaktiviert (Braucht man am Tag nicht)<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 12</t><br/>
Fehlerbehebungen<br/>
Neues Logo integriert<br/>
Spawnmenu, Z-Menu, ATM, Garagen Design bearbeitet<br/>
Jail Time einstellbar<br/>
Hawaii Offroad update<br/>
DEA Implementiert<br/>
Polizei Bounty fix<br/>
kleinerer Essen, Trinken verbrauch<br/>
View Distance Settings nicht mehr mit F1<br/>
Haeuser sind in Save-Zones wieder ausraubbar<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 11</t><br/>
Fehlerbehebungen<br/>
Haus Verkaufspreis: Kaufpreis/2 + Security Level * 200k<br/>
Maskieren nur noch mit Augenbinde (Z > Benutzen)<br/>
Maskieren allgemeine ueberarbeitet<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 10</t><br/>
Fehlerbehebungen<br/>
Fahrzeug Inventar oeffnen bearbeitet<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 9</t><br/>
kleinere Bug fixes<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 8</t><br/>
Performance update<br/>
Neuer Civ Kleidungs Skin (Talk to the Hand)<br/>
Camo SUV Update: SUV Adler<br/>
Carbon SUV Update: SUV Sticker<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 7</t><br/>
Fehlerbehebungen<br/>
Kavala und Flughafen bearbeitet (MAP)<br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V6 Patch 6</t><br/>
Fehlerbehebungen<br/>
Map bearbeitet<br/>
ESC Menu bearbeitet
";
};

};

//Add Infos
((findDisplay 41500) displayCtrl 2304) ctrlSetStructuredText parseText ("<t size='0.8'>" + _infoText);
};
[] spawn life_fnc_InfoMenu;