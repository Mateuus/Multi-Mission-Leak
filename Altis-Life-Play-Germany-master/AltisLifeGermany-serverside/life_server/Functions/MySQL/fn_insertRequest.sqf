#include "\life_server\script_macros.hpp" 
/* 
 File: fn_insertRequest.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Does something with inserting... Don't have time for 
 descriptions... Need to write it... 
*/ 
private["_uid","_name","_side","_money","_bank","_civCash","_civBank","_copCash","_copBank","_medCash","_medBank","_asfCash","_asfBank","_licenses","_handler","_thread","_queryResult","_query","_alias"]; 
_uid = [_this,0,"",[""]] call BIS_fnc_param; 
_name = [_this,1,"",[""]] call BIS_fnc_param; 
_money = [_this,2,0,[0]] call BIS_fnc_param; 
_bank = [_this,3,100000,[0]] call BIS_fnc_param; 
_returnToSender = [_this,4,ObjNull,[ObjNull]] call BIS_fnc_param; 
 
//Error checks 
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction' 
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to! 
 
_query = format["playerInfo:%1",_uid]; 
 
waitUntil{sleep (random 0.3); !DB_Async_Active}; 
_tickTime = diag_tickTime; 
_queryResult = [_query,2, true] call DB_fnc_asyncCall; 
 
if((EQUAL(EXTDB_SETTINGS("MySQL_Query"),1))) then { 
 ["diag_log",[ 
  "------------- Insert Query Request -------------", 
  format["QUERY: %1",_query], 
  format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)], 
  format["Result: %1",_queryResult], 
  "------------------------------------------------" 
 ]] call TON_fnc_logIt; 
}; 
 
//Double check to make sure the client isn't in the database... 
if(typeName _queryResult == "STRING") exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;}; //There was an entry! 
if(count _queryResult != 0) exitWith {[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;}; 
 
// extDB2: select first (and probably only) item from request 
_queryResult = _queryResult select 0; 
 
//Clense and prepare some information. 
_alias = [_name]; 
_money = [_money] call DB_fnc_numberSafe; 
_bank = [_bank] call DB_fnc_numberSafe; 
 
//Prepare the query statement.. 
switch (side _returnToSender) do { 
    case civilian: { 
        _civCash = _money; 
        _civBank = _bank; 
        _copCash = 0; 
        _copBank = 100000; 
        _medCash = 0; 
        _medBank = 100000; 
        _asfCash = 0; 
        _asfBank = 500000; 
    }; 
 
    case west: { 
        _civCash = 0; 
        _civBank = 100000; 
        _copCash = _money; 
        _copBank = _bank; 
        _medCash = 0; 
        _medBank = 100000; 
        _asfCash = 0; 
        _asfBank = 500000; 
    }; 
 
    case independent: { 
        _civCash = 0; 
        _civBank = 100000; 
        _copCash = 0; 
        _copBank = 100000; 
        _medCash = _money; 
        _medBank = _bank; 
        _asfCash = 0; 
        _asfBank = 500000; 
    }; 
 
    case east: { 
        _civCash = 0; 
        _civBank = 100000; 
        _copCash = 0; 
        _copBank = 100000; 
        _medCash = 0; 
        _medBank = 100000; 
        _asfCash = _money; 
        _asfBank = _bank; 
    }; 
}; 
 
_query = format["playerInfoInsert:%1:%2:%3:%4:%5:%6:%7:%8:%9:%10:%11:%12:%13:%14:%15:%16:%17:%18:%19", 
 _uid, 
 _name, 
 _alias, 
 _civCash, 
 _civBank, 
    [], // Civ Licenses 
    [], // Civ Gear 
    _copCash, 
    _copBank, 
    [], // Cop Licenses 
    [], // Cop Gear 
    _medCash, 
    _medBank, 
    [], // Med Licenses 
    [], // Med Gear 
    _asfCash, 
    _asfBank, 
    [], // Asf Licenses 
    []  // Asf Gear 
]; 
 
waitUntil {!DB_Async_Active}; 
[_query,1] call DB_fnc_asyncCall; 
[[],"SOCK_fnc_dataQuery",(owner _returnToSender),false] call life_fnc_MP;