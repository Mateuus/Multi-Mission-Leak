/* 
Filename: fn_updatePos.sqf 
 
Description: sync the player position to the database. 
 
Usage : [[getPlayerUID player,playerSide,round (getDir player),getPos player],"lhm_fnc_updatePos",false,false] call lhm_fnc_mp; 
 
*/ 
if (isServer) then { 
private ["_pid","_worldspace","_query","_queryResult","_dir","_pos","_side","_debug","_distance"]; 
 
_pid = param [0,"",[""]]; 
_side = param [1,sideUnknown]; 
_dir = param [2,0]; 
_pos = param [3,[],[[]]]; 
 
// Error Checks 
if (_pid == "") exitWith {}; 
if (typeName _pos != "ARRAY") exitWith {}; 
if (_side == sideUnknown) exitWith {}; 
 
// don't save if position is in spawn zone 
_debug = getMarkerpos "Respawn_west"; 
_distance = _debug distance _pos; 
if (_distance < 1200) exitWith { 
 diag_log format["LHM_SAVEPOS: Cannot Sync Player [%2]. Position in debug! %3",_pid,_pos]; 
}; 
 
// don't save if position is in paintball area 
_debug = getMarkerpos "paintballarena"; 
_distance = _debug distance _pos; 
if (_distance < 50) exitWith { 
 diag_log format["LHM_SAVEPOS: Cannot Sync Player [%2]. Position in Paintball Arena! %3",_pid,_pos]; 
}; 
 
// build query for each side 
switch (_side) do 
{ 
 case west: 
 { 
  // create Position array 
  _worldspace = [_dir,_pos]; 
  _query = format["UPDATE lhm_savepos SET copPos='%1' WHERE PID='%2'",_worldspace,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 
 case independent: 
 { 
  // create Position array 
  _worldspace = [_dir,_pos]; 
  _query = format["UPDATE lhm_savepos SET medPos='%1' WHERE PID='%2'",_worldspace,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 
 case civilian: 
 { 
  // create Position array 
  _worldspace = [_dir,_pos]; 
  _query = format["UPDATE lhm_savepos SET civPos='%1' WHERE PID='%2'",_worldspace,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
 
 case east: 
 { 
  // create Position array 
  _worldspace = [_dir,_pos]; 
  _query = format["UPDATE lhm_savepos SET secPos='%1' WHERE PID='%2'",_worldspace,_pid]; 
   
  _queryResult = [_query,1] call DB_fnc_asyncCall; 
 }; 
}; 
 
//diag_log format ["LHM_SAVEPOS: Update Position - PID: %1 | POS: %2 ",_pid, _worldspace]; 
};