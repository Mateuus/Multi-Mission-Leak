private["_uid","_data","_owner","_exit","_gangID","_gangName","_gangOwner","_gangMember","_query","_queryResult","_gangTag"]; 
 
_owner = param[0,-1,[-1]]; 
_mode = param[1,0,[0]]; 
_data = param[2,[],[[]]]; 
 
if(_owner isEqualTo -1) exitWith {diag_log format ["newGang _owner %1", _owner]}; 
 
_exit = { 
 params['_owner']; 
 IGC = [-1]; 
 _owner publicVariableClient "IGC"; 
 IGC = nil; 
 diag_log format ["newGang exit %1", _owner]; 
}; 
 
if(_data isEqualTo []) exitWith {diag_log format ["newGang _this %1", _this]; [_owner] call _exit}; 
 
if(_mode isEqualTo 0) then { 
 if(count _data < 5) exitWith {diag_log format ["newGang new _data %1", _data]; _error = true;}; 
 _gangID = _data select 0; 
 _gangName = _data select 1; 
 _gangOwner = _data select 2; 
 _gangMember = _data select 3; 
 _gangTag = _data select 4; 
 _query = format["newGang:%1:%2:%3:%4:%5",_gangID,_gangName,_gangOwner,_gangMember,_gangTag]; 
}else{ 
 if(count _data < 2) exitWith {diag_log format ["newGang delete _data %1", _data]; _error = true;}; 
 _gangID = _data select 0; 
 _gangName = _data select 1; 
 _query = format["deleteGang:%1:%2",_gangID,_gangName]; 
}; 
if(!isNil "_error") exitWith {[_owner] call _exit}; 
 
[_query,1] call DB2_fnc_extdbcallHC; 
 
uiSleep 2.5; 
 
_query = format["checkGangname:%1",_gangName]; 
_queryResult = [_query,2] call DB2_fnc_extdbcallHC; 
 
IGC = _queryResult; 
_owner publicVariableClient "IGC"; 
IGC = nil; 
