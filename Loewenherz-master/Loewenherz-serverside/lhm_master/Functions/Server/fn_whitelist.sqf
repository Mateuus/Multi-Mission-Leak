/* 
 File: fn_whitelist.sqf 
 
 Description: 
 Whitelist Functions 
 
 Author: Blackd0g 
 
*/ 
private ["_player","_type","_query","_queryResult","_result","_value"]; 
_player = param [0,ObjNull,[ObjNull]]; 
 
If (_player == ObjNull) exitWith {}; 
 
// Check Whitelist Status 
_type = "LHM_VAR_BLOCK_NEW_PLAYERS"; 
_query = format["SELECT varvalue FROM lhm_settings WHERE varname='%1'",_type]; 
 
_queryResult = [_query,2] call DB_fnc_asyncCall; 
_result = call compile format["%1", _queryResult]; 
_value = (_result select 0); 
diag_log format ["LHM_WHITELIST: Checking Status - LHM_VAR_BLOCK_NEW_PLAYERS = %1",_value]; 
 
if(_value) then { // Deactivate Whitelist 
 
 _value = false; 
 _type = "LHM_VAR_BLOCK_NEW_PLAYERS"; 
 _query = format["UPDATE lhm_settings SET varvalue='%1' WHERE varname='%2'",_value,_type]; 
  
 _queryResult = [_query,1] call DB_fnc_asyncCall; 
 LHM_VAR_BLOCK_NEW_PLAYERS = _value; 
 diag_log format ["LHM_WHITELIST: UPDATE - LHM_VAR_BLOCK_NEW_PLAYERS = %1",_value]; 
 ["admin",(format["LHM_WHITELIST: Block new Players is %1 - changed by %2 | UID: %3",_value,name _player,getPlayerUID _player])] call TON_fnc_externLog; 
 [{hint "Server: WHITELIST - OFF - 
 All players can join!";},"BIS_fnc_Spawn",_player,false] call lhm_fnc_mp; 
 
} else { // Activate Whitelist 
 
 _value = true; 
 _type = "LHM_VAR_BLOCK_NEW_PLAYERS"; 
 _query = format["UPDATE lhm_settings SET varvalue='%1' WHERE varname='%2'",_value,_type]; 
  
 _queryResult = [_query,1] call DB_fnc_asyncCall; 
 LHM_VAR_BLOCK_NEW_PLAYERS = _value; 
 diag_log format ["LHM_WHITELIST: UPDATE - LHM_VAR_BLOCK_NEW_PLAYERS = %1",_value]; 
 ["admin",(format["LHM_WHITELIST: Block new Players is %1 - changed by %2 | UID: %3",_value,name _player,getPlayerUID _player])] call TON_fnc_externLog; 
 
 [{hint "Server: WHITELIST - ON - 
 Only known players can join!";},"BIS_fnc_Spawn",_player,false] call lhm_fnc_mp; 
 
}; 
 
