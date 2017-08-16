/* 
    File: fn_getGangname 
    Author: Dirk Pitt 
    Zero-One Altis Life 
*/ 
private ["_owner","_gangID","_query","_queryResult"]; 
_owner = param[0,-1,[-1]]; 
_gangID = param[1,[],[[]]]; 
if(_owner isEqualTo -1) exitWith {}; 
if(_gangID isEqualTo []) exitWith { 
 diag_log format["getGangname %1 %2",_owner,_gangID]; 
 IGC = []; 
 _owner publicVariableClient "IGC"; 
 IGC = nil; 
}; 
 
_query = format["queryGangname:%1:%2",(_gangID select 0) select 0,(_gangID select 1) select 0]; 
_queryResult = [_query,2,true] call DB2_fnc_extdbcallHC; 
 
IGC = _queryResult; 
_owner publicVariableClient "IGC"; 
IGC = nil; 
