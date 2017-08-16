 
Private ["_addonFunctionList","_clientFunctions","_serverFunctions","_initsettings"]; 
 
If (!isNil "LHM_VAR_MASTER_SERVER_INIT") exitWith {}; 
 
LHM_VAR_MASTER_SERVER_INIT = true; 
//diag_log format["DEBUG: Running Master Server Init: _this = %1",_this]; 
diag_log "#################### Running LHM Master Server Init ####################"; 
publicVariable "lhm_fnc_callFunctions"; 
 
_addonFunctionList = call compile ("lhm" callExtension ""); 
_serverFunctions = _addonFunctionList select 0; 
_clientFunctions = _addonFunctionList select 1; 
 
[_serverFunctions,_this] call lhm_fnc_callFunctions; 
 
LHM_VAR_MASTER_CLIENT_FUNCTIONS = []; 
{ 
 if ((typename _x) == "STRING") then { 
  if ((!(_x == "")) && (!(_x == "lhm_fnc_master_client"))) then { 
   if ((typename (call compile (_x))) == "CODE") then { 
    diag_log format["Master Server Init: Sending Public Function: %1",_x]; 
    publicVariable _x; 
    LHM_VAR_MASTER_CLIENT_FUNCTIONS pushBack _x; 
   }; 
  }; 
 }; 
} foreach _clientFunctions; 
publicVariable "LHM_VAR_MASTER_CLIENT_FUNCTIONS"; 
 
diag_log format["DEBUG: Master Server Init: _addonFunctionList = %1",_addonFunctionList]; 
[] spawn { 
 sleep 3; 
 _initsettings = [] spawn lhm_fnc_getLHMsettings; 
 waitUntil {ScriptDone _initsettings}; 
 LHM_VAR_MASTER_SERVER_INIT_READY = true; 
 diag_log format["#################### Master Server Init: LHM_VAR_MASTER_SERVER_INIT_READY = %1 ####################",LHM_VAR_MASTER_SERVER_INIT_READY]; 
}; 
 
