 
 
 
 
 
 
 
 
private ["_query","_result","_candidate","_currentTimeStr","_currentTime"]; 
 
 
_result = "Arma2Net.Unmanaged" callExtension "Arma2NETMySQLCommand ['arma3life', 'SELECT UNIX_TIMESTAMP()']"; 
_result = call compile format["%1", _result]; 
_currentTimeStr = ((_result select 0) select 0) select 0; 
_currentTime = parseNumber _currentTimeStr; 
 
 
if (_currentTime - (parseNumber (life_configuration select 1)) < 432000) exitWith { diag_log "Not yet time for a new governor." }; 
 
_query = format["SELECT COUNT(*) as `count`, `votes`.`candidate`, `%2`.`name` FROM `votes`,`arma3life`.`%2` WHERE `%2`.`playerid` != '%1' AND `votes`.`candidate`=`%2`.`playerid` GROUP BY `votes`.`candidate` ORDER BY `count` DESC LIMIT 1", life_configuration select 0, srv_table_players]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", _query, life_server_instance]; 
_result = call compile format["%1", _result]; 
if(isNil {((_result select 0) select 0)}) exitWith { diag_log "No candidates found for the new office!" }; 
_candidate = (_result select 0) select 0; 
if (count _candidate < 1) exitWith {}; 
 
 
 
 
 
life_configuration set [4, life_configuration select 0]; 
life_configuration set [0, _candidate select 1]; 
life_configuration set [1, _currentTimeStr]; 
 
publicVariable "life_configuration"; 
[] spawn DB_fnc_updateConfig; 
 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", "DELETE FROM `candidates`", life_server_instance]; 
_result = "Arma2Net.Unmanaged" callExtension format ["Arma2NETMySQLCommand ['asylumlife%2', '%1']", "DELETE FROM `votes`", life_server_instance]; 
 
diag_log format["The new governor has been set to %1!", _candidate select 2]; 
[] spawn { sleep 300;  [[[0,2], format["A new governor, %1, has been elected into office!", _candidate select 2]],"life_fnc_broadcast",nil,false] spawn life_fnc_MP; };