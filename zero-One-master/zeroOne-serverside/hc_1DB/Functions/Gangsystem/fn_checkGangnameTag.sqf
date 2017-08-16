private["_uid","_gangName","_owner","_query","_queryResult"]; 
_owner = param[0,-1,[-1]]; 
_mode = param[1,0,[0]]; 
_gangName = param[2,"",[""]]; 
 
if(_owner isEqualTo -1) exitWith {diag_log format ["checkGangname _owner %1", _owner];}; 
 
if(_gangName isEqualTo "") exitWith { 
 diag_log format ["checkGangname _this %1", _this]; 
 IGC = [-1]; 
 _owner publicVariableClient "IGC"; 
 IGC = nil; 
}; 
 
_query = ""; 
if(_mode isEqualTo 0) then { 
 _query = format["checkGangname:%1",_gangName]; 
}else{ 
 _query = format["checkGangtag:%1",_gangName]; 
}; 
 
_queryResult = [_query,2] call DB2_fnc_extdbcallHC; 
 
IGC = _queryResult; 
_owner publicVariableClient "IGC"; 
IGC = nil; 
