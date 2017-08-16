if (isServer) then { 
 
[] spawn { 
 waitUntil {!isNil "lhm_fnc_setupActions"}; 
 lhm_fnc_setupActions = lhm_fnc_setupActions; // Custom LHM Actions - need to rebuild soon !!!! 
}; 
 
[ 
 "lhm_fnc_setupActions", 
 "lhm_fnc_changeLHM_Cash", 
 "lhm_fnc_changeLHM_ATMCash", 
 "lhm_fnc_Radio", 
 "lhm_fnc_setUniformTexture", 
 "lhm_fnc_whoDunnit", 
 "lhm_fnc_littleBoy", 
 "lhm_fnc_broadcastMessage", 
 "lhm_fnc_smoke" 
] spawn lhm_fnc_streamFunction; 
 
[] call lhm_fnc_eventhandlers; 
 
[] call lhm_fnc_don_spawnShops; 
 
[] spawn lhm_fnc_spawnClub; 
 
[] spawn lhm_fnc_miyagi_store; 
 
if (isNil "LHM_VAR_PAINTBALL_INIT_DONE") then { 
 [] call compile PreprocessFileLineNumbers "\lhm_stuff\Functions\Server\fn_init_Paintball_Arena.sqf"; 
 
 LHM_VAR_PAINTBALL_INIT_DONE = true; 
 diag_log format["Paintball Arena: Serverside initialization complete"]; 
}; 
 
};