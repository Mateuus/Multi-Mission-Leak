 
 
 
 
 
 
 
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param; 
if(_uid == "" OR _type == "" OR _name == "") exitWith {};  
 
 
switch(_type) do 
{ 
case "187V": {_type = ["Überfahren mit Todesfolge",95000]}; 
case "187": {_type = ["Mord",100000]}; 
case "901": {_type = ["Gefängnisflucht",45000]}; 
case "261": {_type = ["Raub",20000]}; 
case "261A": {_type = ["Versuchter Raub",10000]}; 
case "215": {_type = ["Versuchter Autodiebstahl",5000]}; 
case "213": {_type = ["Verwenden illegaler Sprengstoffe",40000]}; 
case "211": {_type = ["Raub/Diebstahl",25000]}; 
case "207": {_type = ["Entführung",35000]}; 
case "207A": {_type = ["Versuchte Entführung",20000]}; 
case "459": {_type = ["Einbruch",30000]}; 
case "487": {_type = ["Autodiebstahl",25000]}; 
case "488": {_type = ["Diebstahl",20000]}; 
case "480": {_type = ["Fahrerflucht",13000]}; 
case "481": {_type = ["Transport illegaler Besitztümer",100000]}; 
case "482": {_type = ["Versuchter Drogenhandel",50000]}; 
case "483": {_type = ["Drogenhandel",95000]}; 
case "484": {_type = ["Handel mit exotischen Gütern",97500]}; 
 
case "1": {_type = ["Fahren ohne Führerschein",8000]}; 
case "2": {_type = ["Versuchter Diebstahl Fahrzeugs",5000]}; 
case "3": {_type = ["Diebstahl/Führen e.fremden Zivilfahrzeugs",25000]}; 
case "4": {_type = ["Fahren ohne Licht",2500]}; 
case "5": {_type = ["Überhöhte Geschwindigkeit",1000]}; 
case "6": {_type = ["Gefährliche Fahrweise",2500]}; 
case "7": {_type = ["Versuchter Diebstahl e.Polizeifahrzeugs",10000]}; 
case "8": {_type = ["Diebstahl von Polizeifahrzeugen",35000]}; 
case "9": {_type = ["Landen in einer Flugverbotszone",25000]}; 
case "10": {_type = ["Fahren von illegalen Fahrzeugen",50000]}; 
case "11": {_type = ["Unfallverursacher/Fahrerflucht nach Unfall",10000]}; 
case "12": {_type = ["Fahrerflucht vor der Polizei",17500]}; 
case "13": {_type = ["Überfahren eines anderen Spielers",95000]}; 
case "14": {_type = ["Illegale Straßensperren",25000]}; 
case "15": {_type = ["Widerstand gegen die Staatsgewalt",15000]}; 
case "16": {_type = ["Nicht befolgen e.pol.Anordnung",10000]}; 
case "17": {_type = ["Beleidigung",5000]}; 
case "18": {_type = ["Belästigung eines Polizisten",10000]}; 
case "19": {_type = ["Betreten der pol.Sperrzone",5000]}; 
case "20": {_type = ["Töten eines Polizisten",100000]}; 
case "21": {_type = ["Beschuss auf Polizei/Beamte/Eigentum",30000]}; 
case "22": {_type = ["Zerstörung von Polizeieigentum",15000]}; 
case "23": {_type = ["Drogendelikte",50000]}; 
case "24": {_type = ["Waffenbesitz ohne Lizenz",25000]}; 
case "25": {_type = ["Mit gez.Waffe durch Stadt",5000]}; 
case "26": {_type = ["Besitz einer verbotenen Waffe",45000]}; 
case "27": {_type = ["Schusswaffengebrauch innerhalb Stadt",35000]}; 
case "28": {_type = ["Geiselnahme",75000]}; 
case "29": {_type = ["Überfall auf Personen/Fahrzeuge",25000]}; 
case "30": {_type = ["Bankraub",100000]}; 
case "31": {_type = ["Mord",100000]}; 
case "32": {_type = ["Aufstand",3500]}; 
case "33": {_type = ["Angriff durch Rebellen",75000]}; 
case "34": {_type = ["Angriff/Belagerung von Hauptstädten",125000]}; 
case "35": {_type = ["Vers.Landung in einer Flugverbotszone",15000]}; 
case "36": {_type = ["Fliegen/Schweben unterhalb 150m ü.Stadt",5000]}; 
case "37": {_type = ["Ausbruch aus dem Gefaengnis",65000]}; 
case "38": {_type = ["Fliegen ohne Fluglizenz",45000]}; 
case "39": {_type = ["Dauerhaft störendes Hupen",2500]}; 
case "40": {_type = ["Handel mit exotischen Gütern",97500]}; 
case "41": {_type = ["Hacking",25000]}; 
case "120S": {_type = ["Über Limit gefahren",5000]}; 
case "120H": {_type = ["Kontinuierlich geblitzt",8000]}; 
case "120FS": {_type = ["Zu oft geblitzt (Gefängnis)",8000]}; 
case "208": {_type = ["Folter",25000]}; 
case "211": {_type = ["Raub/Diebstahl",25000]}; 
case "390": {_type = ["Öffentliches Betrinken",15000]}; 
case "919": {_type = ["Organhandel",100000]}; 
default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {};  
 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
 
_index = [_uid,life_wanted_list] call SOA_fnc_index; 
 
if(_index != -1) then 
{ 
_data = life_wanted_list select _index; 
_crimes = _data select 2; 
_crimes pushBack (_type select 0); 
_val = _data select 3; 
life_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]]; 
} 
else 
{ 
life_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)]; 
};