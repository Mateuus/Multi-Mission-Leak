/* 
 
Filename: fn_dbtest.sqf 
 
Author: Blackd0g 
 
Description: Only for DEBUGGING! 
test database with a query and return a hint and diag_log message 
*/ 
private["_query","_player","_queryResult"]; 
 
_query = _this select 0; 
_player = _this select 1; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil{sleep 1; !isNil "_queryResult"}; 
 
diag_log "*****************************************************************************************************************************"; 
diag_log str _queryResult; 
diag_log "*****************************************************************************************************************************"; 
 
// fix for hint output 
_queryResult = [_queryResult]; 
[_queryResult, "lhm_fnc_showHint", _player, false] call lhm_fnc_mp; 
 
["admin",(format["%1 with UID %2 used the DBTEST Function | Query = %3",name _player,getPlayerUID _player,_query])] call TON_fnc_externLog;