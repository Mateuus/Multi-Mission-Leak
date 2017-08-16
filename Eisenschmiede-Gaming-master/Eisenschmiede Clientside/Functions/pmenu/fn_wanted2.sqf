private["_unit","_amount","_info"];

ctrlShow[2001,false];
if((lbCurSel 9902) == -1) exitWith {hint "Niemand wurde ausgewaehlt!";ctrlShow[2001,true];};
_unit = lbData [9902,lbCurSel 9902];
_unit = call compile format["%1",_unit];
_amount = lbData [9991,lbCurSel 9991];
if(isNil "_unit") exitWith {ctrlShow[2001,true];};
//if(_unit == player) exitWith {ctrlShow[2001,true];};
if(isNull _unit) exitWith {ctrlShow[2001,true];};

if(!DarfWanted) exitWith {hint localize "STR_NOTF_Give_Wanted"; closeDialog 0;};
if(DarfWanted) then {
	DarfWanted = false;
	[] spawn {
		sleep 20;
		DarfWanted = true;
	};
};


switch(_amount) do
{
 case "187V": {_info = ["Überfahren mit Todesfolge",65000]};
 case "187": {_info = ["Mord",80000]};
 case "901": {_info = ["Gefängnisflucht",45000]};
 case "261": {_info = ["Raub",25000]};
 case "261A": {_info = ["Versuchter Raub",6000]};
 case "215": {_info = ["Versuchter Autodiebstahl",2000]};
 case "213": {_info = ["Verwenden illegaler Sprengstoff",10000]};
 case "211": {_info = ["Raub/Diebstahl",10000]};
 case "207": {_info = ["Entführung",35000]};
 case "207A": {_info = ["Versuchte Entführung",2000]};
 case "487": {_info = ["Autodiebstahl",15000]};
 case "488": {_info = ["Diebstahl",7000]};
 case "480": {_info = ["Fahrerflucht",130000]};
 case "481": {_info = ["Drogenbesitz",20000]};
 case "482": {_info = ["Versuchter Drogenhandel",5000]};
 case "483": {_info = ["Drogenhandel",9500]};
 case "503": {_info = ["Handel mit exotischen Gütern",25000]};
 
 case "1": {_info = ["Fahren ohne Führerschein",1500]};
 case "2": {_info = ["Versuchter Diebstahl Fahrzeugs",3500]};
 case "3": {_info = ["Diebstahl/Führen e.fremden Zivilfahrzeugs",5000]};
 case "4": {_info = ["Fahren ohne Licht",350]};
 case "5": {_info = ["Überhöhte Geschwindigkeit",3500]};
 case "6": {_info = ["Gefährliche Fahrweise",2500]};
 case "7": {_info = ["Versuchter Diebstahl e.Polizeifahrzeugs",7500]};
 case "8": {_info = ["Diebstahl von Polizeifahrzeugen",20000]};
 case "9": {_info = ["Landen in einer Flugverbotszone",2500]};
 case "10": {_info = ["Fahren von illegalen Fahrzeugen",10000]};
 case "11": {_info = ["Unfallverursacher/Fahrerflucht nach Unfall",5000]};
 case "12": {_info = ["Fahrerflucht vor der Polizei",7500]};
 case "13": {_info = ["Überfahren eines anderen Spielers",25000]};
 case "14": {_info = ["Illegale Strassensperren",5000]};
 case "15": {_info = ["Widerstand gegen die Staatsgewalt",15000]};
 case "16": {_info = ["Nicht befolgen e.pol.Anordnung",5000]};
 case "17": {_info = ["Beamtenbeleidigung",2000]};
 case "18": {_info = ["Belästigung eines Polizisten",8000]};
 case "19": {_info = ["Betreten der pol.Sperrzone",5000]};
 case "20": {_info = ["Töten eines Polizisten",25000]};
 case "21": {_info = ["Beschuss auf Polizei/Beamte/Eigentum",15000]};
 case "22": {_info = ["Zerstörung von Polizeieigentum",15000]};
 case "23": {_info = ["Drogendelikte",12000]};
 case "24": {_info = ["Waffenbesitz ohne Lizenz",5000]};
 case "25": {_info = ["Mit gez.Waffe durch Stadt",2500]};
 case "26": {_info = ["Besitz einer verbotenen Waffe",10000]};
 case "27": {_info = ["Schusswaffengebrauch innerhalb Stadt",10000]};
 case "28": {_info = ["Geiselnahme",30000]};
 case "29": {_info = ["Überfall auf Personen/Fahrzeuge",10000]};
 case "30": {_info = ["Bankraub",200000]};
 case "31": {_info = ["Mord",60000]};
 case "32": {_info = ["Aufstand",35000]};
 case "33": {_info = ["Angriff durch Rebellen",35000]};
 case "34": {_info = ["Angriff/Belagerung von Hauptstädten",25000]};
 case "35": {_info = ["Vers.Landung in einer Flugverbotszone",1500]};
 case "36": {_info = ["Fliegen/Schweben unterhalb 150m ü.Stadt",2000]};
 case "37": {_info = ["Ausbruch aus dem Gefaengnis",25000]};
 case "38": {_info = ["Fliegen ohne Fluglizenz",1200]};
 case "39": {_info = ["Dauerhaft störendes Hupen",1000]};
 case "40": {_info = ["Handel mit exotischen Gütern",25000]};
 case "120S": {_info = ["Überhöte Geschwindigkeit",1750]};
 case "120H": {_info = ["Gewohntes Fahren",3000]};
 case "120WL": {_info = ["Fahren ohne License",1000]};
 case "120FS": {_info = ["Gefährliche Fahrweise",3000]};
 default {_info = ["Fehler",0];};
};

[[1,format["Nach %1 wird nun gefahndet.",name _unit,_amount,getPlayerUID _unit]],"ES_fnc_broadcast",west,false] spawn ES_fnc_MP;

[[getPlayerUID _unit,name _unit,_amount],"ES_fnc_wantedAdd",false,false] spawn ES_fnc_MP;

_toLog = format ["Name: %1 (%2) || hat %3 (%4) || auf %5 (%6 $) gesetzt", player getVariable["realname",name player], getPlayerUID player, _unit getVariable["realname",name _unit], getPlayerUID _unit,(_info select 0),[(_info select 1)] call ES_fnc_numberText];
["COP_LOG",_toLog] remoteExecCall ["ES_fnc_logIt",2];

["WantedAdd"] call ES_fnc_xp_add;