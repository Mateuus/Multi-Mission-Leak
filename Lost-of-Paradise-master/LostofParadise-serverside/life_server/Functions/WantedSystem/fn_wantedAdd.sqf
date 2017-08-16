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
 case "187V":{_type =  ["Fahrlaessige Toetung",100000]}; 
    case "187": {_type =  ["Mord",500000]}; 
    case "901": {_type =  ["Gefaengnisflucht",0]}; 
    case "261": {_type =  ["Raubueberfall",200000]}; 
    case "261A":{_type =  ["Versuchter Raubueberfall",100000]}; 
    case "215": {_type =  ["Versuchter Fahrzeugdiebstahl",25000]}; 
    case "213": {_type =  ["Verwenden illegaler Sprengstoff",100000]}; 
    case "211": {_type =  ["Raubueberfall",200000]}; 
    case "207": {_type =  ["Geiselnahme / Entfuehrung",400000]}; 
    case "207A":{_type =  ["Versuchte Geiselnahme/Entfuehrung",200000]}; 
    case "487": {_type =  ["Fahrzeugdiebstahl",50000]}; 
    case "488": {_type =  ["Raubueberfall",200000]}; 
    case "480": {_type =  ["Fahrerflucht",50000]}; 
    case "481": {_type =  ["Drogenbesitz",100000]}; 
    case "482": {_type =  ["Versuchter Drogenhandel",50000]}; 
    case "483": {_type =  ["Drogenhandel",200000]}; 
    case "503": {_type =  ["Handel mit exotischen Guetern",100000]}; 
 case "250": {_type =  ["Tankstellen Raub",25000]}; 
 case "459": {_type =  ["Einbruch",500000]}; 
    case "1":  {_type =  ["Fahren auf der falschen Fahrbahn",100000]}; 
    case "2":  {_type =  ["Fahren abseits der Fahrbahn",25000]}; 
    case "3":  {_type =  ["Falschparken",10000]}; 
    case "4":  {_type =  ["Fahren mit Illegalen Fahrzeugen",50000]}; 
    case "5":  {_type =  ["Fahren ohne PKW Fuehrerschein",25000]}; 
    case "6":  {_type =  ["Fahren ohne LKW Fuehrerschein",50000]}; 
    case "7":  {_type =  ["Fahren eines gestohlenen Fahrzeuges",50000]}; 
    case "8":  {_type =  ["Fahren ohne Licht",25000]}; 
    case "9":  {_type =  ["Umfahren von Checkpoints",100000]}; 
    case "10": {_type =  ["Geschwindigkeitsuebertretung 10 - 20 km/h",10000]}; 
    case "11": {_type =  ["Geschwindigkeitsuebertretung 20 - 30km/h",25000]}; 
    case "12": {_type =  ["Geschwindigkeitsuebertretung in Extremfaellen",100000]}; 
    case "13": {_type =  ["Gefaehrliche Fahrweise",20000]}; 
    case "14": {_type =  ["Unfallverursacher + Fahrerflucht",50000]}; 
    case "15": {_type =  ["Missachtung der Vorfahrt",10000]}; 
    case "16": {_type =  ["Fliegen ohne Pilotenschein",50000]}; 
    case "17": {_type =  ["Fliegen ohne Kollisionslichter",25000]}; 
    case "18": {_type =  ["Fliegen unter der Mindesthoehe",50000]}; 
    case "19": {_type =  ["Landen in Flugverbotszonen",100000]}; 
    case "20": {_type =  ["Fliegen mit illegalen Flugobjekten",50000]}; 
    case "21": {_type =  ["Mitfuehren illegaler Gegenstaende / Substanzen",100000]}; 
    case "22": {_type =  ["Pauschale durch Befragung des Haendlers",200000]}; 
    case "23": {_type =  ["Drogenkonsum",50000]}; 
    case "24": {_type =  ["Handel mit exotischen Guetern",100000]}; 
    case "25": {_type =  ["Fahrzeugdiebstahl",50000]}; 
    case "26": {_type =  ["Versuchter Fahrzeugdiebstahl",25000]}; 
    case "27": {_type =  ["Verkauf eines fremden Fahrzeuges",100000]}; 
    case "28": {_type =  ["Versuchter Diebstahl eines Einsatzfahrzeuges",75000]}; 
    case "29": {_type =  ["Diebstahl eines Einsatzfahrzeuges",100000]}; 
    case "30": {_type =  ["Anstiftung zum Mord",100000]}; 
    case "31": {_type =  ["Mord",500000]}; 
    case "32": {_type =  ["Fahrlaessige Toetung",100000]}; 
 case "33": {_type =  ["Raubueberfall",200000]}; 
    case "34": {_type =  ["Bankueberfall",500000]}; 
 case "35": {_type =  ["Nieren Diebstahl",250000]}; 
    case "36": {_type =  ["Widerstand gegen die Staatsgewalt",50000]}; 
    case "37": {_type =  ["Behinderung von Ermittlungen ",25000]}; 
    case "38": {_type =  ["Missachtung polizeilicher Anweisungen",25000]}; 
    case "39": {_type =  ["Amtsanma�ung",50000]}; 
    case "40": {_type =  ["Missbrauch des Notrufes",25000]}; 
 case "41": {_type =  ["Besitz eines illegalen Gegenstandes",75000]}; 
 case "42": {_type =  ["Beamtenbeleidigung",50000]}; 
 case "43": {_type =  ["Beleidigung",25000]}; 
 case "44": {_type =  ["Gefaengnisflucht",0]}; 
 case "45": {_type =  ["Beihilfe zur Gefaengnisflucht",250000]}; 
 case "46": {_type =  ["Betreten einer Sperrzone",100000]}; 
 case "47": {_type =  ["Geiselnahme/Entfuehrung",400000]}; 
 case "48": {_type =  ["Vermumung am Kavala-Markt",10000]}; 
 case "49": {_type =  ["Freizuegigkeit in der Oeffentlichkeit",10000]}; 
 case "50": {_type =  ["Laermbelaestigung",10000]}; 
 case "51": {_type =  ["Aufstand",5000]}; 
 case "52": {_type =  ["Illegale Stra�ensperren",100000]}; 
 case "53": {_type =  ["Illegales Stra�enrennen",100000]}; 
 case "54": {_type =  ["Angriff / Belagerung von Hauptstaedten",500000]}; 
 case "55": {_type =  ["Einnahme von Polizeiquartieren",300000]}; 
 case "56": {_type =  ["Besetzen fremder Gebiete",200000]}; 
 case "57": {_type =  ["Erpressung",50000]}; 
 case "58": {_type =  ["Bedrohung",50000]}; 
 case "59": {_type =  ["Waffenbesitz ohne Lizenz",25000]}; 
 case "60": {_type =  ["Besitz einer illegalen Waffe / Polizeiwaffe",50000]}; 
 case "61": {_type =  ["Besitz von illegalen Attachments",25000]}; 
 case "62": {_type =  ["Schusswaffengebrauch innerhalb von Staedten",50000]}; 
 case "63": {_type =  ["Beschuss auf Polizei/ARS/Einsatzfahrzeuge",200000]}; 
 case "64": {_type =  ["Das oeffentliche tragen von Waffen an Marktplaetzen",25000]}; 
 case "65": {_type =  ["Verwendung von Rauchgranaten",25000]}; 
 case "919":{_type =  ["Organ Deal",250000]}; 
 case "920":{_type =  ["Geldautomat aufgebrochen",200000]}; 
 case "999":{_type =  ["---------------------------------------------",0]}; 
    default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {}; //Not our information being passed... 
//Is there a custom bounty being sent? Set that as the pricing. 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
//Search the wanted list to make sure they are not on it. 
_index = [_uid,life_wanted_list] call TON_fnc_index; 
 
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