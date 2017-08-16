private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param; 
if(_uid == "" OR _type == "" OR _name == "") exitWith {};  
 
 
switch(_type) do 
{ 
case "1": {_type = ["----StVO - Fahren ohne Erlaubnis----",10]}; 
case "2": {_type = ["Fahren ohne PKW-Führerschein",7500]}; 
case "3": {_type = ["Fahren ohne LKW-Führerschein",7500]}; 
case "4": {_type = ["Fahren ohne Boots-Führerschein",7500]}; 
case "5": {_type = ["----StVO-Vergehen----",10]}; 
case "6": {_type = ["Falschen parken",1000]}; 
case "7": {_type = ["Zuparken der Garagenausfahrt",10000]}; 
case "8": {_type = ["Fahren ohne Licht",5000]}; 
case "9": {_type = ["Offroad fahren",5000]}; 
case "10": {_type = ["Gefährliche Fahrweise",35000]}; 
case "11": {_type = ["Lärmbelästigung durch Hupen",10000]}; 
case "12": {_type = ["Permanentes Rückwärtsfahren",5000]}; 
case "13": {_type = ["Fahren unter Btm o. Alkohol",10000]}; 
case "14": {_type = ["Fehlender Erstehilfe- u. Werkzeugkasten",2500]}; 
case "15": {_type = ["Fahrerflucht",10000]}; 
case "187V": {_type = ["Überfahren mit Todesfolge",50000]}; 
case "17": {_type = ["----StVO - Geschwindigkeitsvergehen----",10]}; 
case "18": {_type = ["5-15 Km/H zu schnell",15000]}; 
case "19": {_type = ["15-25 Km/H zu schnell",30000]}; 
case "20": {_type = ["25+ Km/H zu schnell",40000]}; 
case "21": {_type = ["50+ Km/H zu schnell",50000]}; 
case "22": {_type = ["---LVO - Luftverkehr---",0]}; 
case "23": {_type = ["Fliegen ohne Pilotenschein",15000]}; 
case "24": {_type = ["Landen an nicht erlaubten Orten",35000]}; 
case "25": {_type = ["Fliegen ohne Kollisionslicht",20000]}; 
case "26": {_type = ["----StVO - Sonderfahrzeuge----",10]}; 
case "27": {_type = ["Fahren mit einem Kart außerhalt der Rennstrecke",5000]}; 
case "28": {_type = ["Fahren eines Karts in der Nacht",5000]}; 
case "29": {_type = ["Fahren eines Illegalen Fahrzeuges",50000]}; 
case "30": {_type = ["----BtmG- Besitz von Drogen----",10]}; 
case "503": {_type = ["Drogen im LWK / Helikopter",25000]}; 
case "32": {_type = ["Drogen im PKW",20000]}; 
case "33": {_type = ["Drogen im Boot / Wasserfahrzeug",20000]}; 
case "481": {_type = ["Drogen im Rucksack / an der Person",25000]}; 
case "483": {_type = ["Drogenhandel - Verkauf beim Dealer",75000]}; 
case "36": {_type = ["---Raub u. Diebstahl---",10]}; 
case "261A": {_type = ["Vers. Diebstahl",2500]}; 
case "38": {_type = ["Diebstahl",5000]}; 
case "215": {_type = ["Vers. Diebstahl - Fahrzeug",5000]}; 
case "488": {_type = ["Diebstahl - Fahrzeug",15000]}; 
case "261": {_type = ["Raub",35000]}; 
case "42": {_type = ["Bankfiliale ausgeraubt",50000]}; 
case "43": {_type = ["Bestechung",20000]}; 
case "44": {_type = ["Staatsbank - Platinbank",175000]}; 
case "45": {_type = ["Bundesbank raub",125000]}; 
case "46": {_type = ["---Waffendelikte---",10]}; 
case "47": {_type = ["Kein Waffenschein",20000]}; 
case "48": {_type = ["Gezogene Waffe in der Stadt",15000]}; 
case "49": {_type = ["Illegale Waffe",100000]}; 
case "50": {_type = ["Schusswaffenmissbrauch",60000]}; 
case "51": {_type = ["Waffenhandel",150000]}; 
case "52": {_type = ["---Körperliche Intergrität---",10]}; 
case "53": {_type = ["Vers. Körperverletzung",2000]}; 
case "54": {_type = ["Leichte Körperverletzung",4000]}; 
case "55": {_type = ["Gefährliche Körperverletzung",8000]}; 
case "56": {_type = ["Freiheitsberaubung",40000]}; 
case "57": {_type = ["Belästigung",3000]}; 
case "58": {_type = ["Vers. Mord",55000]}; 
case "187": {_type = ["Mord",100000]}; 
case "60": {_type = ["Tötung eines Beamten",100000]}; 
case "61": {_type = ["---Umgang mit Beamten---",10]}; 
case "62": {_type = ["Widerstand gg. d. Polizei",30000]}; 
case "63": {_type = ["Behinderung d. Polizeiarbeit",5000]}; 
case "64": {_type = ["----Sonstiges----",10]}; 
case "65": {_type = ["Beihilfe zur Flucht",50000]}; 
case "66": {_type = ["Finanzamt hacken",50000]}; 
case "901": {_type = ["Gefängnisflucht",50000]}; 
default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {};  
 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
 
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
 
diag_log format["WANTED_LIST = %1", life_wanted_list]; 
_gesuchter = [life_wanted_list] call DB_fnc_mresArray; 
_query = format["UPDATE wanted set list = '%1'", _gesuchter]; 
waitUntil {sleep (random 0.3); !DB_Async_Active}; 
_queryResult = [_query,1] call DB_fnc_asyncCall;