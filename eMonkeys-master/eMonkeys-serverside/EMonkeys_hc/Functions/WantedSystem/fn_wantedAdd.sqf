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
 
 
 
 case "1": {_type = ["Fehlende Fahrlizenz",10000]}; //name and price 
 case "2": {_type = ["Fehlende LKW-Lizenz",20000]}; 
 case "3": {_type = ["Fehlender Pilotenschein",40000]}; 
 case "4": {_type = ["Fehlende Bootslizenz",10000]}; 
 case "5": {_type = ["Führen eines illegalen Fahrzeugs",25000]}; 
 case "6": {_type = ["Führen eines Polizeifahrzeugs",30000]}; 
 case "7": {_type = ["Überhöhte Geschwindigkeit < 20km/h",500]}; 
 case "8": {_type = ["Punktekonto voll",25000]}; 
 case "9": {_type = ["Drogenkonsum",10000]}; 
 case "10": {_type = ["Fahren ohne Licht",1000]}; 
 case "11": {_type = ["Falsch parken",500]}; 
 case "12": {_type = ["Gefährdende Fahrweise",5000]}; 
 case "13": {_type = ["Unfallverursachung",10000]}; 
 case "14": {_type = ["Mitnahme vonn Fhrz. ohne LL",5000]}; 
 case "15": {_type = ["Person auf Ladung",15000]}; 
 case "16": {_type = ["Fliegen ohne Kollisionsl",5000]}; 
 case "17": {_type = ["Tiefflug über Städten",15000]}; 
 case "18": {_type = ["Fehlende Landerlaubnis",20000]}; 
 case "19": {_type = ["Drogenbesitz < 12k €",15500]}; 
 case "20": {_type = ["Drogenbesitz >12k €",27500]}; 
 case "21": {_type = ["Drogenbesitz >24k €",52500]}; 
 case "22": {_type = ["Drogenbesitz >48k €",60000]}; 
 case "23": {_type = ["leg. Waffe in Stadt",15000]}; 
 case "24": {_type = ["leg. Waffe ohne Lizenz",10000]};  
 case "25": {_type = ["ill. Waffe führen",40000]};  
 case "26": {_type = ["ill. Waffe besitzen",25000]};  
 case "27": {_type = ["Lärmbelästigung",1000]}; 
 case "28": {_type = ["Raub",25000]}; 
 case "29": {_type = ["versuchter Mord",100000]}; 
 case "30": {_type = ["Diebstahl von Staatseigentum",35000]}; 
 case "31": {_type = ["Bankraub",75000]}; 
 case "32": {_type = ["Bankraub Komplize",75000]}; 
 case "33": {_type = ["Beamtenbeleidigung",5000]}; 
 case "34": {_type = ["Behind. der Polizeiarbeit",10000]}; 
 case "35": {_type = ["Widerstand gg die Staatsgw.",15000]}; 
 case "36": {_type = ["bewaffn. Widerstand gg die Staatsgw.",25000]}; 
 case "37": {_type = ["Missbrauch des Notrufs",10000]}; 
 case "38": {_type = ["Versuchte Beamtenbestechung",10000]}; 
 case "39": {_type = ["Vermummung",500]}; 
 case "40": {_type = ["Hehlerei von Goldbarren",50000]}; 
 case "41": {_type = ["Beihilfe zum Gefängnisausbr.",30000]}; 
 case "42": {_type = ["Körperverletzung",20000]}; 
 case "43": {_type = ["Freiheitsberaubung",50000]}; 
 case "44": {_type = ["Hehlerei von Fahrzg.",10000]}; 
 case "45": {_type = ["Betrug",10000]}; 
 case "46": {_type = ["Plündern",15000]}; 
 case "187V": {_type = ["Versuchte fahrlässige Tötung mit Fahrzeug",25000]}; 
 case "187": {_type = ["Versuchte fahrlässige Tötung",50000]}; 
 case "901": {_type = ["Gefängnisausbruch",50000]}; 
 case "261": {_type = ["Rape",5000]}; 
 case "262": {_type = ["ill. Glückspiel",2000]}; 
 case "1337": {_type = ["ill. Glückspiel",2000]}; 
 case "261A": {_type = ["Attempted Rape",3000]}; 
 case "215": {_type = ["Versuchter Fahrzeugdiebstahl",5000]}; 
 case "213": {_type = ["Use of illegal explosives",10000]}; 
 case "211": {_type = ["Raub",25000]}; 
 case "212": {_type = ["versuchter Raub",5000]}; 
 case "207": {_type = ["Kidnapping",3500]}; 
 case "207A": {_type = ["Attempted Kidnapping",2000]}; 
 case "487": {_type = ["Fahrzeugdiebstahl",10000]}; 
 case "488": {_type = ["Klein-Diebstahl",700]}; 
 case "480": {_type = ["Fahrerflucht",1300]}; 
 case "481": {_type = ["Besitz Illegaler Güter",15500]}; 
 case "482": {_type = ["Drogenhandel",15500]}; 
 case "483": {_type = ["Fahren unter Drogeneinfluss",15500]}; 
 case "459": {_type = ["Burglary",6500]}; 
 case "390": {_type = ["Public Intoxication",15000]}; 
 default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {}; //Not our information being passed... 
//Is there a custom bounty being sent? Set that as the pricing. 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
//Search the wanted list to make sure they are not on it. 
_index = [_uid,EMonkeys_wanted_list] call TON_fnc_index; 
 
if(_index != -1) then 
{ 
 _data = EMonkeys_wanted_list select _index; 
 _crimes = _data select 2; 
 _crimes pushBack (_type select 0); 
 _val = _data select 3; 
 EMonkeys_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]]; 
 [[_name,_uid,_crimes,(_type select 1) + _val],_uid] call TON_fnc_saveBounties; 
} 
 else 
{ 
 EMonkeys_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)]; 
 [[_name,_uid,[(_type select 0)],(_type select 1)],_uid] call TON_fnc_saveBounties; 
}; 
 
