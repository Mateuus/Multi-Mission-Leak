private ["_start"];
_start = [_this,0,0,[0]] call BIS_fnc_param;

//InfoMenus
if(_start isEqualTo 0) exitWith {
disableSerialization;
createDialog "help";

_InfoMenus = ((findDisplay 41500) displayCtrl 2300);
lbClear _InfoMenus;

_InfoMenus lbAdd "Allgemeines";lbSetColor[2300,(lbSize _InfoMenus)-1,[0,0.5,0.9,1]];
_InfoMenus lbAdd "Wichtiges"; lbSetValue [2300, (lbSize _InfoMenus)-1, 1];
_InfoMenus lbAdd "Tipps"; lbSetValue [2300, (lbSize _InfoMenus)-1, 2];
_InfoMenus lbAdd "Steuerung"; lbSetValue [2300, (lbSize _InfoMenus)-1, 3];
_InfoMenus lbAdd "";
_InfoMenus lbAdd "Farmen";lbSetColor[2300,(lbSize _InfoMenus)-1,[0,0.5,0.9,1]];
_InfoMenus lbAdd "Lizenzpreise"; lbSetValue [2300, (lbSize _InfoMenus)-1, 4];
_InfoMenus lbAdd "Legale Berufe"; lbSetValue [2300, (lbSize _InfoMenus)-1, 5];
_InfoMenus lbAdd "Illegale Berufe"; lbSetValue [2300, (lbSize _InfoMenus)-1, 6];
_InfoMenus lbAdd "";
_InfoMenus lbAdd "Sonstiges";lbSetColor[2300,(lbSize _InfoMenus)-1,[0,0.5,0.9,1]];
_InfoMenus lbAdd "Fahrzeugpreise"; lbSetValue [2300, (lbSize _InfoMenus)-1, 7];
_InfoMenus lbAdd "Waffen Herstellung"; lbSetValue [2300, (lbSize _InfoMenus)-1, 8];


_InfoMenus lbSetCurSel 1;
};

//Infos
if(_start isEqualTo 1) exitWith {
private ["_index","_infoText"];
_index = ((findDisplay 41500) displayCtrl 2300) lbValue (lbCurSel 2300);
((findDisplay 41500) displayCtrl 2301) ctrlSetText lbText [2300, lbCurSel 2300];

if(_index isEqualTo 0) exitWith {};


_infoText = call {

if(_index isEqualTo 1) exitWith {
"<br/>
Willkommen auf dem Server von Neighbourhood-Life<br/>
<br/>
Wichtige Informationen sind folgende:<br/><br/>

<t color='#2472ff'>Server IP:</t> nhl.2-play.de<br/><br/>
<t color='#2472ff'>TS3-IP:</t><a href='http://invite.teamspeak.com/46.20.46.76:10111/'> 46.20.46.76:10111</a><br/><br/>
<t color='#2472ff'>Homepage:</t><a href='http://neighbourhood-life.enjin.com/'> neighbourhood-life.enjin.com</a><br/><br/>
<t color='#2472ff'>Regeln:</t><a href='http://neighbourhood-life.enjin.com/regelwerk'> Neighbourhood-life Regeln</a><br/><br/>
<t color='#2472ff'>Restarts:</t> 0 Uhr, 4 Uhr, 8 Uhr, 12 Uhr, 16 Uhr und 20 Uhr.
";
};
if(_index isEqualTo 2) exitWith {
"<br/>

<t color='#2472ff' size='0.9'>Wichtige Lizenzen:</t><br/>
<t color='#2472ff'>Aufenthaltsgenehmigung:</t> Ermöglicht das Spawnen in Athira, Agios und Sofia  <br/>
<t color='#2472ff'>Arbeitsgenehmigung:</t> Erlaubt das Arbeiten im Staate Altis<br/>
<t color='#2472ff'>Führerschein:</t> Erlaubt den kauf von PKWs<br/><br/>


<t color='#2472ff' size='0.9'>Berufe für Änfänger:</t><br/>
- Mülldepot<br/>
- Ausgrabungsstätte<br/>
- Kies<br/>
- Wein <br/><br/>


<t color='#2472ff' size='0.9'>Nebenverdienste:</t><br/>
<t color='#2472ff'>Kraftwerk:</t> Durch die Einnahme des Kraftwerks erhälts Du und deine Firma einen erhöhtes Gehalt. Das Gehalt durch die Verwaltung des Kraftwerks beträgt $10.500 alle 10 Minuten.<br/>
<t color='#2472ff'>Finanzamt:</t> VORSICHT ILLEGAL: Das hacken des Finanzamtes lässt Dir und deiner Gang Steuergelder zukommen. Wenn man den Rebellengruppierungen glauben darf, belaufen sich die Einnahme dadurch auf etwa $10.500 alle 10 Minuten. 
Natürlich ist das hacken kein legaler Nebenverdienst! <br/><br/>

<t color='#2472ff' size='0.9'>Schneller Abbauen:</t><br/>
<t color='#2472ff'>Bauschaufel:</t> Die Bauschaufel ersetzt die normale Schaufel und sammelt 6 Einheiten statt 3.<br/>
<t color='#2472ff'>Presslufthammer:</t> Der Presslufthammer ersetzt die normale Spitzhacke und sammelt 6 Einheiten statt 3.<br/>
<br/>


<br/>




";
};

if(_index isEqualTo 3) exitWith {"<br/>
		<t size='1'>Steuerung:</t><br/>
		<t color='#2472ff'>Windowstaste:</t> Interaktionsmenue<br/>
		<t color='#2472ff'>Windowstaste:</t> Sammeln<br/>
		<t color='#2472ff'>Windowstaste:</t> Geld Items und Schlüssel geben<br/>
		<t color='#2472ff'>Windowstaste:</t> Tanken<br/>
		<t color='#2472ff'>Z:</t> Spieler Menue öffnen<br/>
		<t color='#2472ff'>U:</t> Auto / Haus auf und abschließen<br/>
		<t color='#2472ff'>5:</t> Redgul Hotkey<br/>
		<t color='#2472ff'>Shift + P:</t> Ohrenstoepsel<br/>
		<t color='#2472ff'>Shift + G:</t> Niederschlagen<br/>
		<t color='#2472ff'>Shift + B:</t> Ergeben<br/>
		<t color='#2472ff'>Shift + H:</t> Waffe holstern<br/>
		<t color='#2472ff'>Shift + Numpad:</t> Animationen<br/>
		<t color='#2472ff'>Shift + R:</t> Festnehmen<br/><br/>

		<t size='1'>Cop Steuerung:</t><br/>
		<t color='#2472ff'>F:</t> Sirene<br/>
		<t color='#2472ff'>O:</t> Schranken öffnen<br/>
		<t color='#2472ff'>6:</t> Wanted öffnen<br/>
		<t color='#2472ff'>7:</t> Spikes platzieren<br/>
		<t color='#2472ff'>Shift + L:</t> Blaulicht<br/>
		<t color='#2472ff'>Shift + R:</t> Festnehmen</t><br/><br/>
"};


if(_index isEqualTo 4) exitWith {
"<br/>
Fahrzeugpapiere<br/>
<t color='#2472ff'>PKW-Fuehrerschein:</t> $5.000<br/>
<t color='#2472ff'>LKW-Fuehrerschein:</t> $35.000<br/>
<t color='#2472ff'>Pilotenschein:</t> $70.000<br/>
<t color='#2472ff'>Bootsschein:</t> $20.000<br/><br/>




Legale Lizenzen<br/>
<t color='#2472ff'>Wein:</t> $20.000<br/>
<t color='#2472ff'>Benzin:</t> $30.000<br/>
<t color='#2472ff'>Gold:</t> $30.000<br/>
<t color='#2472ff'>Silber:</t> $30.000<br/>
<t color='#2472ff'>Salz:</t> $30.000<br/>
<t color='#2472ff'>Kupfer:</t> $30.000<br/>
<t color='#2472ff'>Eisen:</t> $30.000<br/>
<t color='#2472ff'>Stahl:</t> $30.000<br/>
<t color='#2472ff'>Glas:</t> $30.000<br/>
<t color='#2472ff'>Diamanten:</t> $30.000<br/>
<t color='#2472ff'>Zigaretten:</t> $30.000<br/>
<t color='#2472ff'>Zement:</t> $30.000<br/>
<t color='#2472ff'>Goldschmuck:</t> $30.000<br/>
<t color='#2472ff'>Silberschmuck:</t> $30.000<br/><br/>

Illegale Ausbildungen<br/>
<t color='#2472ff'>Marihuana:</t> $150.000<br/>
<t color='#2472ff'>LSD:</t> $150.000<br/>
<t color='#2472ff'>Kokain:</t> $150.000<br/>
<t color='#2472ff'>Heroin:</t> $150.000<br/>
<t color='#2472ff'>Meth:</t> $150.000<br/>
<t color='#2472ff'>Zigarren:</t> $150.000<br/>
<t color='#2472ff'>Sprengstoff:</t> $170.000<br/><br/>
<t color='#2472ff'>7th Sense:</t> $250.000<br/><br/>

Sonstiges<br/>
<t color='#2472ff'>Arbeitsgenehmigung:</t> $500<br/>
<t color='#2472ff'>Aufenthaltsgenehmigung:</t> $500<br/>
<t color='#2472ff'>Taucherschein:</t> $3.500<br/>
<t color='#2472ff'>Fracht:</t> $25.000<br/>
<t color='#2472ff'>Duty Free:</t> $10.000<br/>
<t color='#2472ff'>Waffenschein (Perm):</t> $40.000<br/>
<t color='#2472ff'>Rebellenausbildung (Perm):</t> $800.000<br/>

";

};


if(_index isEqualTo 5) exitWith {
"<br/>	
<t size='1'>Legale Berufe</t><br/><br/>
Berufe mit Spitzhacke<br/>
<t color='#2472ff'>Eisen:</t> Eisen Mine -> Eisen Ver. -> Metall Händler<br/>
<t color='#2472ff'>Kupfer:</t> Kupfer Mine -> Kupfer Ver. -> Metall Händler<br/>
<t color='#2472ff'>Diamanten:</t> Diamanten Mine -> Diamanten Ver. -> Diamanten Händler<br/>
<t color='#2472ff'>Oel:</t> Oel Bohrloch -> Oel Raffn. -> Benzin Lager<br/>
<t color='#2472ff'>Salz:</t> Salz See -> Salz Ver. -> Salz Händler<br/>
<t color='#2472ff'>Zement:</t> Steinbruch -> Zementwerk -> Bauhof<br/>
<t color='#2472ff'>Silber:</t> Silber Mine -> Silber Ver. -> Edelmetall Händler<br/>
<t color='#2472ff'>Gold:</t> Gold Mine -> Gold Ver. -> Edelmetall Händler<br/>
<t color='#2472ff'>Kohle:</t> Kohle Mine -> Kohle Händler<br/><br/>

Berufe mit Schaufel<br/>
<t color='#2472ff'>Sand:</t> Sand Mine -> Glas Ver. -> Glas Händler<br/>
<t color='#2472ff'>Antiquitaeten:</t>Ausgrabungsstätte -> Antiquitaeten Händler<br/><br/>

Berufe ohne Bedingung<br/>
<t color='#2472ff'>Müll:</t> Müll Depot -> entsprechende Händler<br/>
<t color='#2472ff'>Wein:</t> Weinberg -> Kelterei. -> Wein Export<br/>
<t color='#2472ff'>Zigaretten:</t> Tabakplantage -> Zigaretten Fabrik -> Tabakladen<br/><br/>
<t color='#2472ff'>Kies:</t> Kies Fabrik -> Kies Händler<br/><br/>

Kombi Berufe<br/>
<t color='#2472ff'>Stahl:</t> Eisenbarren + Kohle -> Stahl Fabrik -> Metall Händler<br/>
<t color='#2472ff'>Plastik:</t> Rohöl + Kohle -> Plastik Fabrik -> Plastik Händler<br/>
<t color='#2472ff'>Goldschmuck:</t> Goldbarren + Diamanten -> Juwelier -> Schmuck Outlet Store<br/>
<t color='#2472ff'>Silberschmuck:</t> Silberbarren + Diamanten -> Juwelier -> Schmuck Outlet Store<br/><br/>


Der Presslufthammer und die Bauschaufel ersetzen die Spitzhacke und die Schaufel.<br/>
Sie bauen pro Farmvorgang die doppelte Menge ab und sind ueber das Z-Inventar craftbar<br/>	


";
};

if(_index isEqualTo 6) exitWith {
"

<br/>

<t size='1'>Illegale Berufe</t><br/><br/>
<t color='#2472ff'>Kokain:</t> Koka Plantage -> Kokain Ver. -> Drogen Dealer<br/>
<t color='#2472ff'>Heroin:</t> Mohn Feld -> Heroin Küche -> Drogen Dealer<br/>
<t color='#2472ff'>LSD:</t> Kröten Sumpf -> LSD Küche -> Drogen Dealer<br/>
<t color='#2472ff'>Marihuana:</t> Mari Plantage -> Mari Ver. -> Drogen Dealer<br/>
<t color='#2472ff'>Meth:</t> Chemie Lager -> Meth Küche -> Drogen Dealer<br/>
<t color='#2472ff'>Zigarren:</t> Tabak Plantage -> Zigarren Ver. -> Zigarren Schmuggler<br/>
<t color='#2472ff'>Liquid Ecstasy:</t> Alte Tankstelle -> Drogen Dealer<br/>
<t color='#2472ff'>Sprengstoff:</t> Schwarzpulver Depot -> Sprengmeister -> Rebellen Markt<br/>
<t color='#2472ff'>7th Sense:</t> ver. Kokain + ver. Meth -> 7th Sense Küche -> Drogen Dealer<br/><br/>
<br/><br/>
		
";
};
if(_index isEqualTo 7) exitWith {
"<br/>
<t size='0.9'>PKW HANDEL:</t><br/>
<t color='#2472ff' size='0.85'>Fahrzeug</t><t size='0.85'> Preis </t><t color='#2472ff' size='0.85'> Slots</t><br/>
<t color='#2472ff'>Quad Bike:</t> $5.000 <t color='#2472ff'> 25 Slots</t><br/>
<t color='#2472ff'>Hatchback:</t> $10.001 <t color='#2472ff'> 40 Slots</t><br/>
<t color='#2472ff'>Offroader:</t> $50.000 <t color='#2472ff'> 95 Slots</t><br/>
<t color='#2472ff'>SUV:</t> $75.000 <t color='#2472ff'> 50 Slots</t><br/>
<t color='#2472ff'>Hatchback Sport:</t> $350.000 <t color='#2472ff'>25 Slots</t><br/>
<t color='#2472ff'>Truck:</t> $100.001 <t color='#2472ff'>100 Slots</t><br/>
<t color='#2472ff'>Fuel Truck:</t> $150.000 <t color='#2472ff'>130 Slots</t><br/><br/>

<t  size='0.9'>LKW HANDEL:</t><br/>
<t color='#2472ff' size='0.85'>Fahrzeug</t><t size='0.85'> Preis </t><t color='#2472ff' size='0.85'> Slots</t><br/>
<t color='#2472ff'>Truck Boxer:</t> $150.000 <t color='#2472ff'>150 Slots</t><br/>
<t color='#2472ff'>Zamak Transport:</t> $300.000 <t color='#2472ff'>350 Slots</t><br/>
<t color='#2472ff'>Zamak Covered:</t> $400.001 <t color='#2472ff'>400 Slots</t><br/>
<t color='#2472ff'>HEMTT Transport:</t> $1.500.000 <t color='#2472ff'>475 Slots</t><br/>
<t color='#2472ff'>HEMMT Covered:</t> $2.500.000 <t color='#2472ff'>575 Slots</t><br/>
<t color='#2472ff'>HEMMT Ammo:</t> $3.400.001 <t color='#2472ff'>675 Slots</t><br/>
<t color='#2472ff'>HEMMT Box:</t> $4.500.000 <t color='#2472ff'>775 Slots</t><br/>
<t color='#2472ff'>HEMMT FUEL:</t> $2.000.000 <t color='#2472ff'>500 Slots</t><br/>
<t color='#2472ff'>Tempest Device:</t> $6.000.000 <t color='#2472ff'>400 Slots</t><br/>
<t color='#2472ff'>Tempest Transport:</t> $1.800.000 <t color='#2472ff'>475 Slots</t><br/>
<t color='#2472ff'>Tempest Covered:</t> $2.900.000 <t color='#2472ff'>575 Slots</t><br/>
<t color='#2472ff'>Tempest Ammo:</t> $5.000.000 <t color='#2472ff'>775 Slots</t><br/>
<t color='#2472ff'>Tempest Fuel:</t> $2.500.001 <t color='#2472ff'>550 Slots</t><br/><br/>

<t  size='0.9'>HELI HANDEL:</t><br/>
<t color='#2472ff' size='0.85'>Fahrzeug</t><t size='0.85'> Preis </t><t color='#2472ff' size='0.85'> Slots</t><br/>
<t color='#2472ff'>Hummingbird:</t> $900.000 <t color='#2472ff'>50 Slots</t><br/>
<t color='#2472ff'>Orca:</t> $1.500.000 <t color='#2472ff'>75 Slots</t><br/>
<t color='#2472ff'>Mohawk:</t> $1.800.000 <t color='#2472ff'>100 Slots</t><br/>


<br/>




";
};

if(_index isEqualTo 8) exitWith {
"<br/>
<t color='#2472ff'>Blueprints:</t><br/>
Blueprints werden grundlegend zur Herstellung von Waffen gebraucht. Einmal einen Blueprint gefunden, schon hat man das Wissen über
die Waffe (Rechtsklick auf den Blueprint). Mit diesem Wissen kann man von nun an die jeweilige Waffe herstellen. Denk dran, du brauchst natürlich
auch diverse Waffenteile wie einen Lauf, Mantel und und und...
Gerüchten zufolge liegen manchmal ein paar Blueprints im Müll, welche von den Rüstungsfirmen wegeschmissen wurden. Zu dem ist es auch von vorgekommen, 
dass Blueprints via DP-Post verschickt wurden.<br/><br/>

<t color='#2472ff'>Waffenteile:</t><br/>
Waffenteile sind für den Bau der Waffe sehr wichtig. Ohne Waffenteile keine Waffe.
Die Menge und die Art an Waffenteile variiert je nach Waffe.
<br/>
<br/>

<t color='#9f0303'>
PS: Die Waffen Vorschau dient wie der Name es schon sagt als Vorschau! Das Wissen bzw. die Freischaltung zum Craften bei 
WAFFEN erhaltet ihr, wenn ihr den Blueprint benutzt. Sobald ihr den Blueprint benutzt habt, könnt ihr die Waffe unter WAFFEN sehen und craften.</t>



";
};


};

((findDisplay 41500) displayCtrl 2304) ctrlSetStructuredText parseText ("<t size='0.8'>" + _infoText);
};
[] spawn life_fnc_help;