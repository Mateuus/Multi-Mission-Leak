//["LHM_VAR_BLOCK_NEW_PLAYERS","LHM_VAR_LEOTEST1"] spawn lhm_fnc_getLHMsettings; 
Private ["_query","_tickTime","_pid","_varnames","_varlist"]; 
_varnames = _this; 
_varlist = ""; 
if (count _varnames > 0) then { 
 { 
  if (_varlist == "") then { 
   _varlist = format['"%1"',_x]; 
  } else { 
   _varlist = _varlist + format[',"%1"',_x]; 
  }; 
 } foreach _varnames; 
 _query = format['SELECT lhm_settings.varname, lhm_settings.varvalue, lhm_settings.public FROM lhm_settings WHERE lhm_settings.varname IN (%1)',_varlist]; 
} else { 
 _query = format['SELECT lhm_settings.varname, lhm_settings.varvalue, lhm_settings.public FROM lhm_settings']; 
}; 
 
waitUntil {!isNil "lhm_server_extDB2_Loaded"}; 
waitUntil {lhm_server_extDB2_Loaded}; 
 
 
_tickTime = diag_tickTime; 
_queryResult = [_query,2,true] call DB_fnc_asyncCall; 
waitUntil{!isNil"_queryResult"}; 
 
diag_log "------------- Get LHM Settings -------------"; 
diag_log format["QUERY: %1",_query]; 
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)]; 
diag_log format["Result: %1",_queryResult]; 
diag_log "--------------------------------------------"; 
 
if(typeName _queryResult == "STRING") exitWith {}; 
 
{ 
 diag_log format["Result: _queryResult[%2] = %1",_x,_foreachindex]; 
 _code =format['%1 = %2; if (%3) then {publicVariable "%1";};',_x select 0, _x select 1, _x select 2]; 
 diag_log format["Creating New Var: %1",_code]; 
 call compile _code; 
} foreach _queryResult;