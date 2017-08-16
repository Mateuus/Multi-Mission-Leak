/* 
Filename: fn_queryPos.sqf 
 
Description: gets player positions from database 
*/ 
if (isServer) then { 
private ["_pid","_player","_side","_queryResult","_allPositions","_dir","_pos","_worldspace","_copPos","_medPos","_civPos","_secPos","_alivePlayer"]; 
 
_pid = param [0,"",[""]]; 
_player = param [1,ObjNull]; 
_side = side _player; 
 
// Error Checks 
if(isNull _player) exitWith {}; 
//if (typeName _pid != "STRING") exitWith{}; 
 
_query = format["SELECT CopPos,MedPos,CivPos,SecPos,AliveCop,AliveMed,AliveCiv,AliveSec FROM lhm_savepos WHERE PID='%1'",_pid]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
 
// if result was 0 insert it now 
if(count _queryResult == 0) exitWith { 
diag_log format ["LHM_SAVEPOS: Adding %1 as new player",_pid]; 
[_pid,_player] spawn lhm_fnc_insertPos; 
}; 
 
//diag_log format ["LHM_SAVEPOS DEBUG: PID: %1 | Side %2 | Obj %3",_pid,_side,_player]; 
 
// get alive or dead status 
switch (_side) do 
{ 
 case west: 
 { 
 _alivePlayer = _queryResult select 4; // Cop Alive 
 }; 
 case independent: 
 { 
 _alivePlayer = _queryResult select 5; // Med Alive 
 }; 
 case civilian: 
 { 
 _alivePlayer = _queryResult select 6; // Civ Alive 
 }; 
 case east: 
 { 
 _alivePlayer = _queryResult select 7; // Sec Alive 
 }; 
 
}; 
//diag_log format["LHM_SAVEPOS: Player is alive: %1",_alivePlayer]; 
//if (typeName _alivePlayer != "SCALAR") exitWith {diag_log "LHM_SAVEPOS: Error get Alive Status!"}; 
 
// player is alive select spawnpoint 
if (_alivePlayer == 1) then { 
 
 // if player is in the table and still alive then cut down the array 
 
 // Check Side of player 
 switch (_side) do 
 { 
  case west: 
  { 
   _copPos = _queryResult select 0; 
   _copPos = (call compile (_copPos)); 
   _dir = _copPos select 0; 
   _pos = _copPos select 1; 
 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
   _pos = [_pos select 0,_pos select 1,0]; 
   }; 
 
   // create Position array 
   _worldspace = [_dir,_pos]; 
   [[_worldspace],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; 
  }; 
 
  case independent: 
  { 
   _medPos = _queryResult select 1; 
   _medPos = (call compile (_medPos)); 
   _dir = _medPos select 0; 
   _pos = _medPos select 1; 
 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
   _pos = [_pos select 0,_pos select 1,0]; 
   }; 
 
   // create Position array 
   _worldspace = [_dir,_pos]; 
   [[_worldspace],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; 
  }; 
 
  case civilian: 
  { 
   _civPos = _queryResult select 2; 
   _civPos = (call compile (_civPos)); 
   _dir = _civPos select 0; 
   _pos = _civPos select 1; 
 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
   _pos = [_pos select 0,_pos select 1,0]; 
   }; 
 
   // create Position array 
   _worldspace = [_dir,_pos]; 
   [[_worldspace],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; 
  }; 
 
  case east: 
  { 
   _secPos = _queryResult select 3; 
   _secPos = (call compile (_secPos)); 
   _dir = _secPos select 0; 
   _pos = _secPos select 1; 
 
   // if player is in air or underwater 
   if (_pos select 2 > 25 || _pos select 2 < -1) then { 
   _pos = [_pos select 0,_pos select 1,0]; 
   }; 
 
   // create Position array 
   _worldspace = [_dir,_pos]; 
   [[_worldspace],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; 
  }; 
 
 }; 
 
// player is dead - return an empty array 
} else { 
 [[[]],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; // Note: empty array will force the player to open the spawn menu 
 [_pid,_side,true] call lhm_fnc_setalivePos; // set it back to alive 
}; 
 
};