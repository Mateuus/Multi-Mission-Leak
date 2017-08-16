/* 
 File: fn_insertRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Does something with inserting... Don't have time for 
 descriptions... Need to write it... 
*/ 
private["_uid","_name","_side","_money","_bank","_licenses","_handler","_thread","_queryResult","_query","_alias","_survival"]; 
_uid = param [0,"",[""]]; 
_name = param [1,"",[""]]; 
_money = param [2,0,[0]]; 
_bank = param [3,2500,[0]]; 
_returnToSender = param [4,ObjNull,[ObjNull]]; 
 
//Error checks 
if((_uid == "") OR (_name == "")) exitWith {diag_log "Bad UID or name";}; //Let the client be 'lost' in 'transaction' 
if(isNull _returnToSender) exitWith {diag_log "ReturnToSender is Null!";}; //No one to send this to! 
 
_query = format["SELECT playerid, name FROM players WHERE playerid='%1'",_uid]; 
 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
 
diag_log "------------- Insert Query Request -------------"; 
diag_log format["QUERY: %1",_query]; 
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)]; 
diag_log format["Result: %1",_queryResult]; 
diag_log "------------------------------------------------"; 
 
//Double check to make sure the client isn't in the database... 
if(typeName _queryResult == "STRING") exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call lhm_fnc_mp;}; //There was an entry! 
if(count _queryResult != 0) exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call lhm_fnc_mp;}; 
 
//Block New player 
if (isNil "LHM_VAR_BLOCK_NEW_PLAYERS") then { 
 LHM_VAR_BLOCK_NEW_PLAYERS = false; 
}; 
if (LHM_VAR_BLOCK_NEW_PLAYERS) exitWith { 
 diag_log format["DEBUG: New Player blocked: _this = %1",_this]; 
 [["NotWhitelisted",false,true],"LHM_fnc_endMission",(owner _returnToSender),false] call lhm_fnc_mp; 
}; 
 
//Clense and prepare some information. 
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars. 
_alias = [[_name]] call DB_fnc_mresArray; 
_money = [_money] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
_survival = [100,100,100,1]; // lhm_hunger, lhm_thirst, lhm_health, LHM_disease 
 
[_uid,_returnToSender] spawn lhm_fnc_insertPos; 
 
//Prepare the query statement.. 
_query = format["INSERT INTO players (playerid, name, cash, bankacc, aliases, cop_licenses, med_licenses, civ_licenses ,sec_licenses, civ_gear, cop_gear, med_gear, sec_gear, civ_survival, cop_survival, med_survival, sec_survival) VALUES('%1', '%2', '%3', '%4', '%5','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','""[]""','%6','%6','%6','%6')", 
 _uid, 
 _name, 
 _money, 
 _bank, 
 _alias, 
 _survival 
]; 
 
 
[_query,1] call DB_fnc_asyncCall; 
[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call lhm_fnc_mp;