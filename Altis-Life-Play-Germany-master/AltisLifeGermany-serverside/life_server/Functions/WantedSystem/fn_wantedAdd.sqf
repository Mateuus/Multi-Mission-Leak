/* 
 File: fn_wantedAdd.sqf 
 Author: Bryan "Tonic" Boardwine" 
 Database Persistence By: ColinM 
 Assistance by: Paronity 
 Stress Tests by: Midgetgrimm 
 
 Description: 
 Adds or appends a unit to the wanted list. 
*/ 
private["_uid","_type","_index","_data","_crimes","_val","_customBounty","_name","_pastCrimes","_query","_queryResult"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_type = [_this,2,"",[""]] call BIS_fnc_param; 
_customBounty = [_this,3,-1,[0]] call BIS_fnc_param; 
if(_uid == "" OR _type == "" OR _name == "") exitWith {}; //Bad data passed. 
 
//What is the crime? 
switch(_type) do 
{ 
 case "187V": {_type = ["187V",6500]}; 
 case "187": {_type = ["187",20000]}; 
 case "901": {_type = ["901",4500]}; 
 case "215": {_type = ["215",2000]}; 
 case "213": {_type = ["213",10000]}; 
 case "211": {_type = ["211",1000]}; 
 case "207": {_type = ["207",3500]}; 
 case "207A": {_type = ["207A",2000]}; 
 case "390": {_type = ["390",15000]}; 
 case "487": {_type = ["487",1500]}; 
 case "488": {_type = ["488",700]}; 
 case "480": {_type = ["480",1300]}; 
 case "481": {_type = ["481",1000]}; 
 case "482": {_type = ["482",5000]}; 
 case "483": {_type = ["483",9500]}; 
 case "459": {_type = ["459",6500]}; 
 case "666": {_type = ["666",2000]}; 
 case "667": {_type = ["667",45000]}; 
 case "668": {_type = ["668",15000]}; 
 
 case "1": {_type = ["1",2500]}; 
    case "2": {_type = ["2",10000]}; 
    case "3": {_type = ["3",50000]}; 
     case "4": {_type = ["4",25000]}; 
     case "5": {_type = ["5",20000]}; 
    case "6": {_type = ["6",50000]}; 
 case "7": {_type = ["7",500000]}; 
 case "8": {_type = ["8",500000]}; 
 case "9": {_type = ["9",1000000]}; 
 case "10": {_type = ["10",200000]}; 
 case "11": {_type = ["11",250000]}; 
 case "12": {_type = ["12",100000]}; 
 case "13": {_type = ["13",500000]}; 
 case "14": {_type = ["14",250000]}; 
 case "15": {_type = ["15",200000]}; 
 case "16": {_type = ["16",200000]}; 
 case "17": {_type = ["17",500000]}; 
 case "18": {_type = ["18",250000]}; 
 case "19": {_type = ["19",150000]}; 
 case "20": {_type = ["20",750000]}; 
 case "21": {_type = ["21",750000]}; 
 case "22": {_type = ["22",150000]}; 
 case "23": {_type = ["23",25000]}; 
 case "24": {_type = ["24",45000]}; 
 case "25": {_type = ["25",200000]}; 
 case "26": {_type = ["26",50000]}; 
 case "27": {_type = ["27",100000]}; 
 case "28": {_type = ["28",10000]}; 
 case "29": {_type = ["29",50000]}; 
 case "30": {_type = ["30",100000]}; 
 case "31": {_type = ["31",250000]}; 
 case "32": {_type = ["32",125000]}; 
 case "33": {_type = ["33",50000]}; 
 case "34": {_type = ["34",50000]}; 
 case "35": {_type = ["35",100000]}; 
 case "36": {_type = ["36",100000]}; 
 case "37": {_type = ["37",200000]}; 
 case "38": {_type = ["38",100000]}; 
 case "39": {_type = ["39",100000]}; 
 case "40": {_type = ["40",100000]}; 
 case "41": {_type = ["41",50000]}; 
 case "42": {_type = ["42",100000]}; 
 case "43": {_type = ["43",50000]}; 
 case "44": {_type = ["44",10000]}; 
 case "45": {_type = ["45",20000]}; 
 case "46": {_type = ["46",250000]}; 
 case "47": {_type = ["47",50000]}; 
 case "48": {_type = ["48",10000]}; 
 case "49": {_type = ["49",100000]}; 
 case "50": {_type = ["50",50000]}; 
 case "51": {_type = ["51",50000]}; 
 case "52": {_type = ["52",10000]}; 
 case "53": {_type = ["53",100000]}; 
 case "54": {_type = ["54",200000]}; 
 case "55": {_type = ["55",10000]}; 
 default {_type = [];}; 
}; 
 
if(count _type == 0) exitWith {}; //Not our information being passed... 
//Is there a custom bounty being sent? Set that as the pricing. 
if(_customBounty != -1) then {_type set[1,_customBounty];}; 
//Search the wanted list to make sure they are not on it. 
 
_result = format["wantedGetCrimes:%1",_uid]; 
waitUntil{!DB_Async_Active}; 
_queryResult = [_result,2,true] call DB_fnc_asyncCall; 
 
_val = [(_type select 1)] call DB_fnc_numberSafe; 
 
if(count _queryResult != 0) then 
{ 
 // extDB2: select first (and probably only) item from request 
 _queryResult = _queryResult select 0; 
 
 _pastCrimes = _queryResult select 1; 
 _pastCrimes pushBack (_type select 0); 
 _query = format["wantedUpdateCrimes:%1:%2:%3",_pastCrimes,_val,_uid]; 
} else { 
 _crimes = [(_type select 0)]; 
 _query = format["wantedInsertCrimes:%1:%2:%3:%4:1",_uid,_name,_crimes,_val]; 
}; 
 
if(!isNil "_query") then { 
 waitUntil{!DB_Async_Active}; 
 [_query,1] call DB_fnc_asyncCall; 
};