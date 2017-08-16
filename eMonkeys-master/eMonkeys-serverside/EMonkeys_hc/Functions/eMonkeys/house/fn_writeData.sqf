/* 
* Execs write to DB and calls dst function passing arguments 
* RETURNS RESULT IF COND IS MET 
*/ 
private["_cmd", "_house", "_args", "_player", "_result", "_result_2", "_query","_query_update", "_cond", "_setarr", "__col", "__val", "__first"]; 
 
_cmd = _this select 0; 
_house = _this select 1; 
_args = _this select 2; 
_player = _this select 3; 
_setarr = _this select 4; 
_cond = _this select 5; 
 
 
 
 
//GENERATE QUERY USING SETARR 
_query_update = ""; 
__first = true; 
 
{ 
 __col = _x select 0; 
 __val = _x select 1; 
  
 if (!__first) then { _query_update = _query_update + ", "; }; 
  
 _query_update = format [ "%1 %2=%3", _query_update, __col, __val ]; 
  
 __first = false; 
} 
foreach _setarr; 
 
_query = format ["SELECT IF( %1, TRUE, FALSE ) FROM homes WHERE name='%2'", _cond, _house]; 
 
_result_2 = [_query,2,true] call DB_fnc_asyncCall; 
_rows = call compile format["%1",_result_2]; //compile data 
 
 
_result_2 = _result_2 select 0 select 0; 
_result_2 = format ["%1",_result_2]; 
 
 
//////////// 
 
//Compile Cond here 
 
_result_2 = (_result_2) == "1"; 
 
 
 
//////////// 
 
 
_query = format ["UPDATE homes SET %1 WHERE name='%2' AND %3", _query_update, _house,_cond]; 
 
waitUntil{sleep (random 0.3); !HC_Async_Active}; 
[_query,1] call DB_fnc_asyncCall; 
 
 
 
[ [_cmd, _house, _args, _result_2] ,"EMonkeys_fnc_houseExecCommand",_player,false] call EMonkeys_fnc_mp;