/* 
    File: fn_initGang 
    Author: Dirk Pitt 
    Zero-One Altis Life 
*/ 
private["_uid","_gangID","_owner","_query","_queryResult"]; 
_owner = param[0,-1,[-1]]; 
_gangID = param[1,"",[""]]; 
_uid = param[2,"",[""]]; 
 
if(_owner isEqualTo -1) exitWith {diag_log format ["initGang _owner %1", _owner]}; 
if(_gangID isEqualTo "" || _uid isEqualTo "") exitWith {diag_log format ["initGang _this %1", _this];}; 
 
_query = format["getGang:%1",_gangID]; 
_queryResult = [_query,2] call DB2_fnc_extdbcallHC; 
 
if(_queryResult isEqualTo []) exitWith { 
 diag_log format ["initGang _queryResult %1", _queryResult]; 
 IGC = _queryResult; 
 _owner publicVariableClient "IGC"; 
 IGC = nil; 
}; 
 
_queryResult set[4,[(_queryResult select 4)] call DB2_fnc_numberSafe]; 
_member = _queryResult select 2; 
_index = [_uid, _member] call zero_fnc_oKzQhZKu; 
if(_index isEqualTo -1) then { 
 _queryResult = []; 
}; 
IGC = _queryResult; 
_owner publicVariableClient "IGC"; 
IGC = nil; 
