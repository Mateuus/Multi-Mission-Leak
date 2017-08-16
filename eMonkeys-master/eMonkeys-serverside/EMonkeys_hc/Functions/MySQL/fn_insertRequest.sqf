/* 
 File: fn_insertRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Does something with inserting... Don't have time for 
 descriptions... Need to write it... 
*/ 
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias","_perms"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_money = [_this,2,0,[""]] call BIS_fnc_param; 
_bank = [_this,3,2500,[""]] call BIS_fnc_param; 
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
_text = format ["*** Neuer Spieler | Spieler ID: %1 | Spielername: %2 | Bargeld: %3 | Bankkonto: %4 | ReturntoSender: %5 |",_uid,_name,_money,_bank,_returnToSender]; 
[7,_text] call TON_fnc_log; 
 
//Error checks 
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction' 
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to! 
 
_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid]; 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
if(typeName _queryResult == "STRING") exitWith {[[],"SOCK_fnc_dataQuery",(_returnToSender),false] call EMonkeys_fnc_mp;}; //There was an entry! 
if(count _queryResult != 0) exitWith {[[],"SOCK_fnc_dataQuery",(_returnToSender),false] call EMonkeys_fnc_mp;}; 
 
//Clense and prepare some information. 
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars. 
_alias = [[_name]] call DB_fnc_mresArray; 
_money = [_money] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
 
//Prepare the query statement.. 
_query = format["INSERT INTO players (playerid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses, civ_gear, cop_gear, perms, bounties) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[]""','""[]""','[]','[]')", 
 _uid, 
 _name, 
 _money, 
 _bank, 
 _alias 
]; 
 
[_query,1] call DB_fnc_asyncCall; 
[[],"SOCK_fnc_dataQuery",(_returnToSender),false] call EMonkeys_fnc_mp;