/*
	File: fn_wantedAdd.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Adds or appends a unit to the wanted list.
*/
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;
_type = [_this,2,"",[""]] call BIS_fnc_param;
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param;
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed.

//What is the crime?
switch(_type) do
{
 case "187V": {_type = ["Überfahren mit Todesfolge",65000]};
 case "187": {_type = ["Mord",80000]};
 case "901": {_type = ["Gefängnisflucht",45000]};
 case "261": {_type = ["Raub",25000]};
 case "261A": {_type = ["Versuchter Raub",6000]};
 case "215": {_type = ["Versuchter Autodiebstahl",2000]};
 case "213": {_type = ["Verwenden illegaler Sprengstoff",10000]};
 case "211": {_type = ["Raub/Diebstahl",10000]};
 case "207": {_type = ["Entführung",35000]};
 case "207A": {_type = ["Versuchte Entführung",2000]};
 case "487": {_type = ["Autodiebstahl",15000]};
 case "488": {_type = ["Diebstahl",7000]};
 case "480": {_type = ["Fahrerflucht",130000]};
 case "481": {_type = ["Drogenbesitz",20000]};
 case "482": {_type = ["Versuchter Drogenhandel",5000]};
 case "483": {_type = ["Drogenhandel",9500]};
 case "503": {_type = ["Handel mit exotischen Gütern",25000]};
 
 case "1": {_type = ["Fahren ohne Führerschein",1500]};
 case "2": {_type = ["Versuchter Diebstahl Fahrzeugs",3500]};
 case "3": {_type = ["Diebstahl/Führen e.fremden Zivilfahrzeugs",5000]};
 case "4": {_type = ["Fahren ohne Licht",350]};
 case "5": {_type = ["Überhöhte Geschwindigkeit",3500]};
 case "6": {_type = ["Gefährliche Fahrweise",2500]};
 case "7": {_type = ["Versuchter Diebstahl e.Polizeifahrzeugs",7500]};
 case "8": {_type = ["Diebstahl von Polizeifahrzeugen",20000]};
 case "9": {_type = ["Landen in einer Flugverbotszone",2500]};
 case "10": {_type = ["Fahren von illegalen Fahrzeugen",10000]};
 case "11": {_type = ["Unfallverursacher/Fahrerflucht nach Unfall",5000]};
 case "12": {_type = ["Fahrerflucht vor der Polizei",7500]};
 case "13": {_type = ["Überfahren eines anderen Spielers",25000]};
 case "14": {_type = ["Illegale Strassensperren",5000]};
 case "15": {_type = ["Widerstand gegen die Staatsgewalt",15000]};
 case "16": {_type = ["Nicht befolgen e.pol.Anordnung",5000]};
 case "17": {_type = ["Beamtenbeleidigung",2000]};
 case "18": {_type = ["Belästigung eines Polizisten",8000]};
 case "19": {_type = ["Betreten der pol.Sperrzone",5000]};
 case "20": {_type = ["Töten eines Polizisten",25000]};
 case "21": {_type = ["Beschuss auf Polizei/Beamte/Eigentum",15000]};
 case "22": {_type = ["Zerstörung von Polizeieigentum",15000]};
 case "23": {_type = ["Drogendelikte",12000]};
 case "24": {_type = ["Waffenbesitz ohne Lizenz",5000]};
 case "25": {_type = ["Mit gez.Waffe durch Stadt",2500]};
 case "26": {_type = ["Besitz einer verbotenen Waffe",10000]};
 case "27": {_type = ["Schusswaffengebrauch innerhalb Stadt",10000]};
 case "28": {_type = ["Geiselnahme",30000]};
 case "29": {_type = ["Überfall auf Personen/Fahrzeuge",10000]};
 case "30": {_type = ["Bankraub",200000]};
 case "31": {_type = ["Mord",60000]};
 case "32": {_type = ["Aufstand",35000]};
 case "33": {_type = ["Angriff durch Rebellen",35000]};
 case "34": {_type = ["Angriff/Belagerung von Hauptstädten",25000]};
 case "35": {_type = ["Vers.Landung in einer Flugverbotszone",1500]};
 case "36": {_type = ["Fliegen/Schweben unterhalb 150m ü.Stadt",2000]};
 case "37": {_type = ["Ausbruch aus dem Gefaengnis",25000]};
 case "38": {_type = ["Fliegen ohne Fluglizenz",1200]};
 case "39": {_type = ["Dauerhaft störendes Hupen",1000]};
 case "40": {_type = ["Handel mit exotischen Gütern",25000]};
 case "120S": {_type = ["Überhöte Geschwindigkeit",1750]};
 case "120H": {_type = ["Gewohntes Fahren",3000]};
 case "120WL": {_type = ["Fahren ohne License",1000]};
 case "120FS": {_type = ["Gefährliche Fahrweise",3000]};
 default {_type = [];};
};

if(count _type == 0) exitWith {}; //Not our information being passed...
//Is there a custom bounty being sent? Set that as the pricing.
if(_customBounty != -1) then {_type set[1,_customBounty];};
//Search the wanted list to make sure they are not on it.
_index = [_uid,ES_wanted_list] call ES_fnc_index;

if(_index != -1) then {
	_data = ES_wanted_list select _index;
	_crimes = _data select 2;
	_crimes pushBack (_type select 0);
	_val = _data select 3;
	ES_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]];
} else {
	ES_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)];
};