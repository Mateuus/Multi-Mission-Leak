/* 
 File: fn_wantedAdd.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Adds or appends a unit to the wanted list. 
*/ 
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name"]; 
_uid = param [0,"",[""]]; 
_name = param [1,"",[""]]; 
_type = param [2,"",[""]]; 
_customBounty = param [3,-1,[0]]; 
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed. 
 
//What is the crime? 
switch(_type) do 
{ 
 case "390": {_type = ["Trunkenheit",15000]}; 
 case "187V": {_type = ["Mord mit Fahrzeug",6500]}; 
 case "187": {_type = ["Mord / Todschlag",8500]}; 
 case "901": {_type = ["Gefaengnisausbruch",4500]}; 
 case "261": {_type = ["Vergewaltigung",5000]}; //What type of sick bastard would add this? 
 case "261A": {_type = ["Vers. Vergewaltigung",3000]}; 
 case "215": {_type = ["Vers. Autodiebstahl",2000]}; 
 case "213": {_type = ["Sprengstoffmissbrauch",10000]}; 
 case "211": {_type = ["Diebstahl",1000]}; 
 case "207": {_type = ["Kidnapping",3500]}; 
 case "207A": {_type = ["Versuchtes Kidnapping",2000]}; 
 case "487": {_type = ["Autodiebstahl",1500]}; 
 case "488": {_type = ["Bagatelldiebstahl",700]}; 
 case "480": {_type = ["Unfallflucht",1300]}; 
 case "481": {_type = ["Drogenbesitz",1000]}; 
 case "482": {_type = ["betruegerischer Absicht",5000]}; 
 case "483": {_type = ["Drogenhandel",9500]}; 
 case "459": {_type = ["Einbruch",6500]}; 
 case "500": {_type = ["Zu schnelles fahren",1000]}; 
 case "42": {_type = ["unerlaubtes Gluecksspiel",4000]}; 
 case "666": {_type = ["Illegale Zonenkontrolle",7000]}; 
 case "777": {_type = ["Bankraub",25000]}; 
 case "599": {_type = ["Tankstellen-Einnahme",5432]}; 
 case "1337": {_type = ["Illegales Auto Tuning",2500]}; 
 case "2577": {_type = ["Bankeinbruch",7500]}; 
 default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {}; //Not our information being passed... 
//Is there a custom bounty being sent? Set that as the pricing. 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
//Search the wanted list to make sure they are not on it. 
_index = [_uid,lhm_wanted_list] call TON_fnc_index; 
 
if(_index != -1) then 
{ 
 _data = lhm_wanted_list select _index; 
 _crimes = _data select 2; 
 _crimes pushBack (_type select 0); 
 _val = _data select 3; 
 lhm_wanted_list set[_index,[_name,_uid,_crimes,(_type select 1) + _val]]; 
 If (!isNil "lhm_fnc_UpdatePlayerWanted") then { 
  [_name,_uid,_crimes,(_type select 1) + _val] call lhm_fnc_UpdatePlayerWanted; 
 }; 
} else { 
 lhm_wanted_list pushBack [_name,_uid,[(_type select 0)],(_type select 1)]; 
 If (!isNil "lhm_fnc_UpdatePlayerWanted") then { 
  [_name,_uid,[(_type select 0)],(_type select 1)] call lhm_fnc_UpdatePlayerWanted; 
 }; 
};