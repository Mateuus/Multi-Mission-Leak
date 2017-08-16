 
 
 
 
 
 
 
 
 
 
 
 
 
private["_queryStmt","_queryResult","_key","_mode","_return"]; 
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param; 
_mode = [_this,1,1,[0]] call BIS_fnc_param; 
_multiarr = [_this,2,false,[false]] call BIS_fnc_param; 
 
if(_queryStmt == "") exitWith {"_INVALID_SQL_STMT"}; 
_return = false; 
 
_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call life_sql_id),_queryStmt]; 
if(_mode == 1) exitWith {true}; 
_key = call compile format["%1",_key]; _key = _key select 1; 
 
 
_queryResult = ""; 
 
_loop = true; 
while{_loop} do { 
_queryResult = "extDB2" callExtension format["4:%1", _key];  
if (_queryResult == "[5]") then { 
 
_queryResult = "";  
while{true} do { 
_pipe = "extDB2" callExtension format["5:%1",_key];   
if(_pipe == "") exitWith {_loop = false}; 
_queryResult = _queryResult + _pipe; 
}; 
} else {   
 
if (_queryResult == "[3]") then {} else {  
_loop = false; 
};  
}; 
}; 
 
if(typeName _queryResult == "STRING") then {_queryResult = call compile _queryResult}; 
 
_return = (_queryResult select 1); 
 
if(!_multiarr) then {_return = _return select 0;} else { 
if((count (_return select 0)) == 0) then {_return = []}; 
}; 
 
_return;