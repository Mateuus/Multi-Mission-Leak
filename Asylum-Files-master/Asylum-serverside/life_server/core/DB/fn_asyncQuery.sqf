 
 
 
 
 
 
 
 
 
 
 
waitUntil {!DB_Async_Active}; 
private["_queryStmt","_queryResult","_key","_mode","_return"]; 
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param; 
_mode = [_this,1,1,[0]] call BIS_fnc_param; 
_multiarr = [_this,2,false,[false]] call BIS_fnc_param; 
 
if(_queryStmt == "") exitWith {"_INVALID_SQL_STMT"}; 
diag_log format["SQL Query: %1", _queryStmt]; 
_return = false; 
DB_Async_Active = true; 
 
_queryResult = ""; 
_key = "extDB" callExtension format["%1:%2:%3",_mode,life_sql_id,_queryStmt]; 
if(_mode == 1) exitWith {DB_Async_Active = false; true}; 
_key = call compile format["%1",_key]; _key = _key select 1; 
 
 
 
while{true} do { 
_pipe = "extDB" callExtension format["5:%1",_key]; 
if(_pipe == "") exitWith {}; 
if(_pipe != "[3]") then { 
_queryResult = _queryResult + _pipe; 
} else { 
sleep 0.35; 
}; 
}; 
 
 
DB_Async_Active = false; 
 
_queryResult = call compile _queryResult; 
 
_queryResult = (_queryResult select 1); 
 
if(count (_queryResult select 1) == 0) exitWith {[]}; 
_return = (_queryResult select 1) select 0; 
if(_multiarr) then { 
_return = (_queryResult select 1); 
}; 
 
_return; 
