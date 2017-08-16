/*
	Function by TeamElan
	Dialog and content by HawaiiLife
*/
private ["_start","_musik","_CurSel"];
_start = [_this,0,0,[0]] call BIS_fnc_param;
_musik = [_this,1,false,[false]] call BIS_fnc_param;

_CurSel = 1;
if(_musik) then {_CurSel = 12;};

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
_InfoMenus lbAdd "Changelog"; lbSetValue [2300, (lbSize _InfoMenus)-1, 6];lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0,0.082,1]];
_InfoMenus lbAdd "";
_InfoMenus lbAdd "Features";lbSetColor[2300,(lbSize _InfoMenus)-1,[1,0.694,0.141,1]];
_InfoMenus lbAdd "EXP System"; lbSetValue [2300, (lbSize _InfoMenus)-1, 7];
_InfoMenus lbAdd "Reparieren"; lbSetValue [2300, (lbSize _InfoMenus)-1, 8];
_InfoMenus lbAdd "Farming"; lbSetValue [2300, (lbSize _InfoMenus)-1, 9];
_InfoMenus lbAdd "Radio"; lbSetValue [2300, (lbSize _InfoMenus)-1, 10];

_InfoMenus lbSetCurSel _CurSel;
};

//Infos
if(_start isEqualTo 1) exitWith {
private ["_index","_infoText"];
_index = ((findDisplay 41500) displayCtrl 2300) lbValue (lbCurSel 2300);

if(_index isEqualTo 0) exitWith {};


_infoText = call {
//Server
if(_index isEqualTo 1) exitWith {
"Tanoa Life Server<br/>
<t color='#FFB124'>Name:</t> [GER] Hawaii Life RPG<br/>
<t color='#FFB124'>IP:</t> s.hawaii-life.net<br/>
<t color='#FFB124'>Port:</t> 2302<br/><br/>
<t color='#FFB124'>Direktlinks:</t><br/>
<a href='http://invite.teamspeak.com/ts.hawaii-life.net/'>Teamspeak: ts.hawaii-life.net</a><br/>
<a href='http://www.hawaii-life.net/'>Homepage: hawaii-life.net</a><br/><br/>
Restart<br/>
<t color='#FFB124'>0:00, 6:00, 12:00, 16:00, 24:00</t>
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
<t color='#FFB124'>4-7</t> Gesten (ohne Waffe)<br/>
<t color='#FFB124'>8-9,0</t> Gesten (mit Waffe)<br/>
<t color='#FFB124'>F1</t> Zyankalikapsel benutzen<br/>
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
<t color='#FFB124'>Heli Pilotenschein:</t> 75.000$<br/>
<t color='#FFB124'>Flugzeug Pilotenschein:</t> 100.000$<br/>
<t color='#FFB124'>Bootsschein:</t> 2.000$<br/>
<t color='#FFB124'>Taucherschein:</t> 2.000$<br/>
<t color='#FFB124'>Waffenschein:</t> 45.000$<br/>
<t color='#FFB124'>Eigentumsurkunde:</t> 1.000.000$<br/>
<t color='#FFB124'>Rebellen Lizens:</t> 1.000.000$<br/><br/>

Legale Farmlizensen<br/>
<t color='#FFB124'>Kokosfleisch:</t> 8.000$<br/>
<t color='#FFB124'>Kokosmilch:</t> 8.000$<br/>
<t color='#FFB124'>Zucker:</t> 12.500$<br/>
<t color='#FFB124'>Kaffee:</t> 12.500$<br/>
<t color='#FFB124'>Kupfer:</t> 25.000$<br/>
<t color='#FFB124'>Tabak:</t> 35.000$<br/>
<t color='#FFB124'>Cocktail:</t> 50.000$<br/>
<t color='#FFB124'>Stahl:</t> 75.000$<br/>
<t color='#FFB124'>Krabben:</t> 70.000$<br/>
<t color='#FFB124'>Jagdschein:</t> 150.000$<br/><br/>

Illegale Farmlizensen<br/>
<t color='#FFB124'>Hanf:</t> 45.000$<br/>
<t color='#FFB124'>Meth:</t> 65.000$<br/>
<t color='#FFB124'>Palmol:</t> 75.000$<br/>
<t color='#FFB124'>Kristalle:</t> 80.000$<br/>
<t color='#FFB124'>Korallen:</t> 60.000$<br/>
<t color='#FFB124'>angereichertes Uran:</t> 100.000$";
};

if(_index isEqualTo 5) exitWith {
"Am Anfang solltest du dich zu aller Erst beim Einwohnermeldeamt melden.<br/>
Dort kannst du einen Antrag auf die Staatsbuergerschaft von Hawaii stellen.<br/>
Danach solltest entweder Pfirsiche/Ananas sammeln oder direkt mit Kokosnuss anfangen.<br/>
Sobald du genug Geld hast um dir entweder ein Flugzeug oder ein Boot zu kaufen kannst du damit zb. nach Georgetown fahren/fliegen.<br/>
Dort, und in anderen grossen Staedten findest du Checkpoints.<br/>
Bei jedem Checkpoint sind Aktionen, die du machen musst. (Scroll Menu)<br/>
Hast du eine Aktion abgeschlossen bekommst du einen Spawnpunkt an diesem Ort.<br/>
Alles danach solltest du auf dich zukommen lassen.";
};

if(_index isEqualTo 6) exitWith {
"<t size='1.2px' align='center' color='#FFB124'>Bugs bitte im Forum melden</t><br/>
<t align='center' color='#FFB124'>Das kostet nichts und verbessert euer Gameplay</t><br/><br/>

<t align='center' color='#FF0000'>Wenn zu einem Update nichts im Changelog steht, dann wurden nur Bugfixes und/oder Performance Sachen gemacht.</t><br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 21</t><br/>
SGT Stuff billiger gemacht<br/>
SGT Sapwn fixed<br/>
THW Katkoula Heli Shop und Garage<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 19</t><br/>
Neues SGT HQ<br/>
THW Skin fixed<br/>
THW Loadout beim Respawn angepasst<br/>
THW Item Loadout angepasst<br/>
THW RHIB ab Rang 4<br/>
THW Hunter ab Rang 6<br/>
THW Rangaufteilung angepasst<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 18</t><br/>
SGT implementiert<br/>
Boot garagen von allen benutzbar<br/>
THW RHIB implementiert<br/>
THW Jetski Skin<br/>
Nacht implementiert<br/>
AK-12 und AK-12-GL Preis angehoben<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 17</t><br/>
Waffen despawn bei Tod fixed<br/>
Car lock/unlock Sound<br/>
EXP Level bearbeitet<br/>
Respawnzeit bei Request + 10min<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 16</t><br/>
neuer Intro-Track<br/>
Leichen wieder lootbar<br/>
Nagelbänder fixed<br/>
Busgeldkatalog bearbeitet<br/>
Kaution bug fixed<br/>
THW Jetski (im Car Shop)<br/>
THW Anfrage fixed<br/>
THW Kopfbedeckungen<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 15</t><br/>
<t color='#FFB124'>4-7</t> Gesten (ohne Waffe)<br/>
<t color='#FFB124'>8-9,0</t> Gesten (mit Waffe)<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 13</t><br/>
Bugfixes<br/>
Map angepasst<br/>
Neue Bank<br/>
Banktimer auf 20min<br/>
Cop Stuff update<br/>
Leichen nicht mehr lootbar<br/>
Texturen komprimiert<br/>
Wanted-Menu update<br/>
APEX Fahrzeuge aufladbar<br/><br/>

<t align='center'><t size='1.7px' align='center' color='#FF0000'>V7 Patch 10</t><br/>
Bugfixes<br/>
TWH: Item Loadout<br/>
Cop: Item Loadout billiger<br/>
Cop: Festnehmen ohne Handschellen<br/>
Gangversteck vom Gang-Konto zahlen<br/><br/>

<t align='center'><t size='2px' align='center' color='#FF0000'>TANOA</t><br/><br/>
Script an Tanoa angepasst<br/>
Level System bearbeitet<br/>
Reparatur System bearbeitet<br/>
Gang Versteck bearbeitet<br/>
Reparatur bug teilweise behoben<br/>
Neue Farmrouten
";
};

if(_index isEqualTo 7) exitWith {"
<t size='1px'>EXP bekommt ihr wenn ihr:</t><br/>
<t color='#22d811'>+</t><t color='#FFB124'> 005 EXP:</t> Pro Legalem Sammeln<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 007 EXP:</t> Pro Illegalem Sammeln<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 007 EXP:</t> Pro Legalem Verarbeiten<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 010 EXP:</t> Pro Illegalem Verarbeiten<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 050 EXP:</t> Pro Autoschieber Verkauf<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 300 EXP:</t> Pro DP Mission<br/>
<t color='#22d811'>+</t><t color='#FFB124'> 100 EXP:</t> Pro Spieler Kill<br/>
<t color='#FF0000'>-</t><t color='#FFB124'> 100 EXP:</t> Pro eigenem Tod<br/><br/>

<t size='1px'>Vorteile generell:</t><br/>
<t color='#FFB124'>Mit jedem Aufstieg</t> sammelst du 0.02 Sek schneller<br/><br/>

<t size='1px'>Vorteile ab:</t><br/>
<t color='#FFB124'>Level 02:</t> Du kannst 1 Gebaeude erwerben<br/>
<t color='#FFB124'>Level 10:</t> Du kannst 2 Gebaeude erwerben<br/>
<t color='#FFB124'>Level 18:</t> Du kannst 3 Gebaeude erwerben<br/>
<t color='#FFB124'>Level 25:</t> Du kannst 4 Gebaeude erwerben
";
};

if(_index isEqualTo 8) exitWith {
"<t size='1px'>Um ein fahrzeug zu reparieren brauchst du verschiedene Dinge:</t><br/><br/>
<t size='1px' color='#FFB124'>PKW:</t><br/>
<t color='#FFB124'>-</t> 4 Reifen<br/>
<t color='#FFB124'>-</t> 1 Motor<br/>
<t color='#FFB124'>-</t> 1 Treibstofftank<br/>
<t color='#FFB124'>-</t> 1 Fahrzeugteil<br/><br/>

<t size='1px' color='#FFB124'>LKW:</t><br/>
<t color='#FFB124'>-</t> 8 Reifen<br/>
<t color='#FFB124'>-</t> 1 Motor<br/>
<t color='#FFB124'>-</t> 1 Treibstofftank<br/>
<t color='#FFB124'>-</t> 1 Fahrzeugteil<br/><br/>

<t size='1px' color='#FFB124'>Heli:</t><br/>
<t color='#FFB124'>-</t> 1 Motor<br/>
<t color='#FFB124'>-</t> 1 Instrumente<br/>
<t color='#FFB124'>-</t> 1 Fahrzeugteil<br/>
<t color='#FFB124'>-</t> 1 Hauptrotor<br/>
<t color='#FFB124'>-</t> 1 Heckrotor<br/><br/>

<t size='1px' color='#FFB124'>Boot:</t><br/>
<t color='#FFB124'>-</t> 1 Motor<br/>
<t color='#FFB124'>-</t> 1 Fahrzeugteil<br/><br/>

Um auf das Reparatur-Menu zugreifen zu koennen brauchst du einen Reparaturkasten.<br/>
Diesen kannst du dir bei einem Hornbach kaufen.<br/>
Die restlichen Teile kannst du bei einer Werkstatt erwerben.<br/><br/>

Es kann ab und zu passieren, dass ein Teil bei dem Einbau kaputt geht.<br/>
Nehme also immer mehr mit als du brauchst.<br/><br/>

Ausserdem kannst du dein Fahrzeug von einem Mechaniker reparieren lassen.<br/>
Dazu musst du zu einer Tankstellen-Werkstatt gehen(die Gebeude in denen 90% der Werkstatt-Shops stehen).<br/>
Dort kannst du dann mit der Windowstaste einen Mechaniker beauftragen.";
};

if(_index isEqualTo 9) exitWith {
"<t size='1.3px' color='#FF0000'>Farmwege:</t><br/><br/>
<t color='#FFB124'>Stahl:</t> Eisen + Kohle --> Stahl<br/>
<t color='#FFB124'>Cocktail:</t> Bananen + Drachenfruechte --> Drachen Cocktail<br/><br/>

Die restlichen Rohstoffe sollten klar sein, da man dabei jeweils einen Rohstoff zu einem Produkt verarbeiten muss.";
};

if(_index isEqualTo 10) exitWith {
"Das Radio findest du, wenn du die Musik-App auf deinem Smartphone anklickst.<br/>
Unser offizieller Radiosender ist dort bereits eingespeichert.<br/>
Dort laufen aktuelle Tracks.<br/>
Ebenfalls werden dort aktuelle Meldungen durchgegeben(zb. Kampfzonen/Events)<br/><br/>
Weitere Sender kannst du manuel in die Liste eintragen.<br/>
Dazu musst du die Stream-URL und den Namen des Senders angeben.<br/>
Der Name muss aber nicht mit dem richtigen Namen uebereinstimmen.<br/><br/>

Um die App zu nutzen brauchst du einen MOD<br/>
Diesen kannst du dir <t color='#FFB124'><a href='http://www.hawaii-life.net/download/radio.zip'>HIER</a></t> laden.";
};

};

//Add Infos
((findDisplay 41500) displayCtrl 2304) ctrlSetStructuredText parseText ("<t size='0.8'>" + _infoText);
};
[] spawn life_fnc_InfoMenu;