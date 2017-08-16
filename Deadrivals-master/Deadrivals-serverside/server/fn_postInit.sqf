 
 
 
 
 
 
 
 
 
 
DB_Async_Active = false; 
DB_Async_ExtraLock = false; 
life_server_isReady = false; 
life_server_extDB_notLoaded = ""; 
publicVariable "life_server_isReady"; 
 
 
Amyf_phoneCosts = 1000; 
Amyf_phoneLines = 5; 
Amyf_currentPhoneLines = []; 
 
if (isNil {uiNamespace getVariable "life_sql_id"}) then { 
life_sql_id = round(random(9999)); 
life_sql_id = compileFinal (if (life_sql_id isEqualType "") then {life_sql_id} else {str(life_sql_id)}); 
uiNamespace setVariable ["life_sql_id",life_sql_id]; 
try { 
_result = "extDB2" callExtension format["9:ADD_DATABASE:%1",getText(missionConfigFile >> "CfgServer" >> "DatabaseName")]; 
if (!(_result isEqualTo "[1]")) then {throw "extDB2: Error with Database Connection"}; 
_result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",(call life_sql_id),getText(missionConfigFile >> "CfgServer" >> "DatabaseName")]; 
if (!(_result isEqualTo "[1]")) then {throw "extDB2: Error with Database Connection"}; 
} catch { 
diag_log _exception; 
life_server_extDB_notLoaded = [true, _exception]; 
}; 
publicVariable "life_server_extDB_notLoaded"; 
if (life_server_extDB_notLoaded isEqualType []) exitWith {}; 
"extDB2" callExtension "9:LOCK"; 
diag_log "extDB2: Connected to Database"; 
} else { 
life_sql_id = uiNamespace getVariable "life_sql_id"; 
life_sql_id = compileFinal (if (life_sql_id isEqualType "") then {life_sql_id} else {str(life_sql_id)}); 
diag_log "extDB2: Still Connected to Database"; 
}; 
 
if (life_server_extDB_notLoaded isEqualType []) exitWith {}; 
 
ServerRestartMode = false; 
call RCON_fnc_rcon_event_ready; 
 
NOCRIS_attachment_point = "Land_HelipadEmpty_F" createVehicle [0,0,0]; 
NOCRIS_attachment_point setPosASL [0,0,0]; 
NOCRIS_attachment_point setVectorDirAndUp [[0,1,0], [0,0,1]]; 
publicVariable "NOCRIS_attachment_point"; 
 
["CALL resetLifeVehicles",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL deleteDeadVehicles",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL resetalivezivilist",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL resetaliveindependent",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL resetalivewest",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL deleteOldGangs",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL resetmullabfuhr",1] call SERVERDATABASE_fnc_asyncCall; 
["CALL setlogactive",1] call SERVERDATABASE_fnc_asyncCall; 
 
NOCRIS_radio_independent = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
NOCRIS_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
NOCRIS_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
NOCRIS_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
 
NOCRIS_GangEvent_Ready = false; 
 
NOCRIS_EVENT_TIMEUP = 0; 
publicVariable "NOCRIS_EVENT_TIMEUP"; 
NOCRIS_EVENT_TIMENEXT = 0; 
publicVariable "NOCRIS_EVENT_TIMENEXT"; 
NOCRIS_DIAMONDJOB_SELECT = ""; 
publicVariable "NOCRIS_DIAMONDJOB_SELECT"; 
NOCRIS_EVENT_RUNING = false; 
publicVariable "NOCRIS_EVENT_RUNING"; 
NOCRIS_EVENT_TIME = 0; 
publicVariable "NOCRIS_EVENT_TIME"; 
NOCRIS_EVENT_INFONPC = ObjNull; 
publicVariable "NOCRIS_EVENT_INFONPC"; 
NOCRIS_EVENT_CONTAINER = ObjNull; 
publicVariable "NOCRIS_EVENT_CONTAINER"; 
NOCRIS_EVENT_CONTAINER_MARKER = []; 
publicVariable "NOCRIS_EVENT_CONTAINER_MARKER"; 
NOCRIS_EVENT_INFONPC_MARKER = []; 
publicVariable "NOCRIS_EVENT_INFONPC_MARKER"; 
NOCRIS_DIAMONDJOB_PLAYERID = []; 
publicVariable "NOCRIS_DIAMONDJOB_PLAYERID"; 
NOCRIS_ATAC_MESSAGE = ""; 
publicVariable "NOCRIS_ATAC_MESSAGE"; 
 
addMissionEventHandler ["HandleDisconnect",{_this call SERVER_fnc_clientDisconnect; false;}]; 
 
cleanupFSM = [] execFSM "\server\FSM\cleanup.fsm"; 
 
[8,true,24] execFSM "\server\FSM\timeModule.fsm"; 
 
cleanup = [] spawn SERVER_fnc_cleanup; 
 
aiSpawn = [] spawn SERVER_fnc_TurtleZone; 
 
 
 
[] spawn SERVER_fnc_fetchganggebiet; 
 
[] spawn SERVER_fnc_checkauktion; 
 
[] spawn SERVER_fnc_initHouses; 
 
[] spawn SERVER_fnc_syncPrices; 
 
[] spawn SERVER_fnc_select_event; 
 
[] spawn SERVER_fnc_sendmessage; 
 
[] spawn SERVER_fnc_serverstatistik; 
 
[] call SERVER_fnc_setUpPhone; 
 
[] spawn SERVER_fnc_objektweg; 
 
private["_dome","_rsb"]; 
 
 
 
_rsb = nearestObject [[8125.73,9520.79,0],"Land_BackAlley_01_l_gate_F"]; 
_rsb1 = nearestObject [[8156.97,9515.3,0],"Land_BackAlley_01_l_gate_F"]; 
 
 
 
 
 
_rsb setVariable["bis_disabled_Door_1",1,true]; 
_rsb1 setVariable["bis_disabled_Door_1",1,true]; 
 
 
 
 
_rsb allowDamage false; 
_rsb1 allowDamage false; 
 
 
[] spawn { 
while{true} do { 
[] spawn SERVER_fnc_fetchmullabfuhringame; 
sleep 60; 
}; 
}; 
 
 
 
 
