/* 
Filename: fn_insertObjects.sqf 
 
Description: if player is not in the DB then add it and force  
player to select a spawning position. 
*/ 
if (isServer) then { 
private ["_pid","_player","_side","_alive","_query","_queryResult","_failSafeCiv","_failSafeCop","_failSafeMedic","_failSafeSec"]; 
_pid = param [0,"",[""]]; 
_player = param [1,ObjNull]; 
_side =  side _player; // returns players Side String 
 
// Error Checks 
if (_player == objNull) exitWith {Diag_log "LHM_SAVEPOS: Error Player = ObjNull!"}; 
if (_pid == "") exitWith {Diag_log "LHM_SAVEPOS: Error Player ID empty!"}; 
 
diag_log ("LHM_SAVEPOS: Attempt " + str(_player)); 
 
// in case of position errors or bugs get some marker positions for it 
_alive = 1;  
_failSafeCiv = getMarkerPos "civ_spawn_1"; 
_failSafeCop = getMarkerPos "cop_spawn_1"; 
_failSafeMedic = getMarkerPos "medic_spawn_1"; 
_failSafeSec = getMarkerPos "sec_spawn_1"; 
 
//Insert Player Position 
_query = format["INSERT INTO lhm_savepos (PID, AliveCop, AliveMed, AliveCiv, AliveSec, CopPos, MedPos, CivPos, SecPos) VALUES('%1', '%2', '%3', '%4', '%5', '[0,%6]', '[0,%7]', '[0,%8]', '[0,%9]')", 
_pid, 
_alive, 
_alive, 
_alive, 
_alive, 
_failSafeCiv, 
_failSafeCop, 
_failSafeMedic, 
_failSafeSec 
]; 
 
 
[_query,1] call DB_fnc_asyncCall; 
 
diag_log format ["LHM_SAVEPOS: INSERTED %1 PLAYER %2",_pid,_player]; 
 
// Send empty array back to the client (client can now choose a location) 
[[[]],"lhm_fnc_setPlayerPos",_player,false,true] call lhm_fnc_mp; 
};