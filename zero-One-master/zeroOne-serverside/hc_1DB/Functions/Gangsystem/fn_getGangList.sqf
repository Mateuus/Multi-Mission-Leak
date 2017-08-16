private["_uid","_owner","_query","_queryResult"]; 
diag_log str(_this); 
_owner = param[0,-1,[-1]]; 
if(_owner isEqualTo -1) exitWith {diag_log format ["getGangList _owner %1", _owner]}; 
 
_query = format["getGangList"]; 
_queryResult = [_query,2,true] call DB2_fnc_extdbcallHC; 
 
diag_log format ["getGangList %1", _queryResult]; 
 
IGC = _queryResult; 
_owner publicVariableClient "IGC"; 
IGC = nil; 
