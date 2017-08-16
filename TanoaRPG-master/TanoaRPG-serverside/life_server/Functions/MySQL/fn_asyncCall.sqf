/* 
 File: fn_asyncCall.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Commits an asynchronous call to ExtDB2 
 
 Parameters: 
  0: STRING (Query to be ran). 
  1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's). 
  3: BOOL (True to return a single array, false to return multiple entries mainly for garage). 
*/ 
/* 
//OLD ALTISLIFE 
waitUntil {!DB_Async_Active}; 
private["_queryStmt","_queryResult","_key","_mode","_return"]; 
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param; 
_mode = [_this,1,1,[0]] call BIS_fnc_param; 
_multiarr = [_this,2,false,[false]] call BIS_fnc_param; 
 
if(_queryStmt == "") exitWith {"_INVALID_SQL_STMT"}; 
_return = false; 
DB_Async_Active = true; 
 
_queryResult = ""; 
_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call life_sql_id),_queryStmt]; 
if(_mode == 1) exitWith {DB_Async_Active = false; true}; 
_key = call compile format["%1",_key]; _key = _key select 1; 
 
waitUntil{sleep (random .03); !DB_Async_ExtraLock}; 
DB_Async_ExtraLock = true; 
while{true} do { 
 _pipe = "extDB2" callExtension format["5:%1",_key]; 
 if(_pipe == "") exitWith {}; 
 if(_pipe != "[3]") then { 
  _queryResult = _queryResult + _pipe; 
 } else { 
  sleep 0.35; 
 }; 
}; 
 
DB_Async_ExtraLock = false; 
DB_Async_Active = false; 
//Get the Array of information blah blah 
_queryResult = call compile _queryResult; 
 
//Make everything possible for DB_RAW_V2 
_queryResult = (_queryResult select 1); 
 
if(count (_queryResult select 1) == 0) exitWith {[]}; 
_return = (_queryResult select 1) select 0; 
if(_multiarr) then { 
 _return = (_queryResult select 1); 
}; 
 
_return; 
*/ 
 
//NEW ALTISLIFERPG FORUM 
/*  
 File: asyncCall.sqf 
 Author: Bryan "Tonic" Boardwine 
  
 Description: 
 Commits an asynchronous call to extDB 
 Gets result via extDB  4:x + uses 5:x if message is Multi-Part 
 
 Parameters: 
  0: STRING (Query to be ran). 
  1: INTEGER (1 = ASYNC + not return for update/insert, 
  2 = ASYNC + return for query's). 
  3: BOOL (False to return a single array, True to return multiple entries mainly for garage). 
*/ 
 
private["_queryStmt","_queryResult","_key","_mode","_return","_loop"]; 
 
_queryStmt = [_this,0,"",[""]] call BIS_fnc_param; 
_mode = [_this,1,1,[0]] call BIS_fnc_param; 
_multiarr = [_this,2,false,[false]] call BIS_fnc_param; 
 
_key = "extDB2" callExtension format["%1:%2:%3",_mode,(call life_sql_id), _queryStmt]; 
if(_mode isEqualTo 1) exitWith {true}; 
_key = call compile format["%1",_key]; 
_key = _key select 1; 
uiSleep (random .03); 
_queryResult = ""; 
 
_loop = true; 
while {_loop} do 
{ 
 _queryResult = "extDB2" callExtension format["4:%1", _key]; 
 if (_queryResult isEqualTo "[5]") then 
 { 
  _queryResult = ""; 
  while{true} do 
  { 
   _pipe = "extDB2" callExtension format["5:%1", _key]; 
   if(_pipe isEqualTo "") exitWith {_loop = false}; 
   _queryResult = _queryResult + _pipe; 
  }; 
 } else { 
  if (_queryResult isEqualTo "[3]") then 
  { 
   uisleep 0.1; 
  } else { 
   _loop = false; 
  }; 
 }; 
}; 
 
if(typeName _queryResult == "STRING") then {_queryResult = call compile _queryResult}; 
_return = (_queryResult select 1); 
 
if(!_multiarr) then 
{ 
 if(format["|%1|", (_return select 0)] == "|<null>|") then  
 { 
  _return = []; 
 } else { 
  _return = (_return select 0); 
 }; 
} else { 
 if((count (_return select 0)) == 0) then {_return = []}; 
}; 
 
_return;