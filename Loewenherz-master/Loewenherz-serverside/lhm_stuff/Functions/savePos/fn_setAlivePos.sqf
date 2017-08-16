/* 
Filename: fn_setalivePos.sqf 
 
Description: 
send alive status from player to database. 
 
Usage: [[getPlayerUID player,side player,alive player],"lhm_fnc_setAlivePos",false,false] call lhm_fnc_mp; 
*/ 
private ["_pid","_alive","_query","_queryResult","_side","_bool"]; 
_pid = param [0,"",[""]]; 
_side = param [1,sideUnknown,[sideUnknown]]; 
_alive = param [2,false,[false]]; 
 
_bool = [_alive] call DB_fnc_bool; // convert bool to int 
waitUntil {!isNil "_bool"}; 
 
switch (_side) do  
{ 
 case west: 
 { 
  _query = format["UPDATE lhm_savepos SET AliveCop='%1' WHERE PID='%2'",_bool,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 case independent: 
 { 
  _query = format["UPDATE lhm_savepos SET AliveMed='%1' WHERE PID='%2'",_bool,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 case civilian: 
 { 
  _query = format["UPDATE lhm_savepos SET AliveCiv='%1' WHERE PID='%2'",_bool,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 case east: 
 { 
  _query = format["UPDATE lhm_savepos SET AliveSec='%1' WHERE PID='%2'",_bool,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
}; 
 
//diag_log format ["LHM_SAVEPOS: UPDATE ALIVE STATUS - ALIVE %1 | PID %2 | Side %3",_bool,_pid,_side]; 
 
_alive