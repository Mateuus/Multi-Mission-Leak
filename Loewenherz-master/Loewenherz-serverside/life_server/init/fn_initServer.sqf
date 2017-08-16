#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) 
/* 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Initialize the server and required systems. 
*/ 
private ["_tickTime","_extDB"]; 
_tickTime = time; 
 
diag_log "------------------------------------------------------------------------------------------------------"; 
diag_log "-------------------------------- Starting Loewenherz Life Server Init --------------------------------"; 
diag_log "------------------------------------------------------------------------------------------------------"; 
 
"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call lhm_fnc_MPexec}; 
 
// Hotfix prevent shitty Map drawing... 
addMissionEventHandler["Draw3D",{{if(markerShape _x=="POLYLINE")then{deleteMarker _x}}forEach allMapMarkers}]; 
 
// loading variables 
_handle =[] execVM "\life_server\vars.sqf"; 
waitUntil {ScriptDone _handle}; 
diag_log "Server Variables loaded"; 
//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally. 
 
_extDB = false; 
diag_log "Initializing extDB Extension..."; 
/* 
 Prepare extDB before starting the initialization process 
 for the server. 
*/ 
if(isNil {uiNamespace getVariable "lhm_sql_id"}) then { 
 if (isNil "lhm_sql_id") then { 
  lhm_sql_id = round(random(9999)); 
 }; 
 __CONST__(lhm_sql_id,lhm_sql_id); 
 uiNamespace setVariable ["lhm_sql_id",lhm_sql_id]; 
 
 //Retrieve extDB version 
 _result = "extDB2" callExtension "9:VERSION"; 
 diag_log format ["extDB2: Version: %1", _result]; 
 diag_log format ["extDB2: SQL ID: %1", (call lhm_sql_id)]; 
 if(_result == "") exitWith {}; 
 if ((parseNumber _result) < 40) exitWith {diag_log "Error: extDB2 version 40 or Higher Required";}; 
 
 //Initialize Logging options from extDB 
 _result = [] call ton_fnc_LogInit; 
 waitUntil {_result}; 
 
 //Initialize the database 
 _result = "extDB2" callExtension "9:ADD_DATABASE:altis-life-rpg"; 
 if(_result != "[1]") exitWith {diag_log format["extDB2: Error with Database Connection (ADD_DATABASE) (_result != [1]) _result = %1",_result];}; 
 _result = "extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:altis-life-rpg:SQL_RAW_v2:%1:ADD_QUOTES",(call lhm_sql_id)]; // ab v64 
 if(_result != "[1]") exitWith {diag_log format["extDB2: Error with Database Connection (ADD_DATABASE_PROTOCOL) (_result != [1]) _result = %1",_result];}; 
 
 //Initialize RCON options from extDB 
 if(isNil {uiNamespace getVariable "RCON_ID"}) then { 
  RCON_ID = round(random(9999)); 
  __CONST__(RCON_ID,RCON_ID); 
  uiNamespace setVariable ["RCON_ID",RCON_ID]; 
  _result = "extDB2" callExtension "9:START_RCON:Rcon"; 
  _result = "extDB2" callExtension format["9:ADD:RCON:%1",(call RCON_ID)]; 
  diag_log "extDB2: RCON is enabled"; 
 }; 
 //Initialize VAC options from extDB 
 if(isNil {uiNamespace getVariable "VAC_ID"}) then { 
  VAC_ID = round(random(9999)); 
  __CONST__(VAC_ID,VAC_ID); 
  uiNamespace setVariable ["VAC_ID",VAC_ID]; 
 
  _result = "extDB2" callExtension "9:START_VAC"; 
  _result = "extDB2" callExtension format["9:ADD:VAC:%1",(call VAC_ID)]; 
  diag_log "extDB2: VAC is enabled"; 
 }; 
 //Initialize MISC options from extDB 
 if(isNil {uiNamespace getVariable "MISC_ID"}) then { 
  MISC_ID = round(random(9999)); 
  __CONST__(MISC_ID,MISC_ID); 
  uiNamespace setVariable ["MISC_ID",MISC_ID]; 
 
  _result = "extDB2" callExtension format["9:ADD_PROTOCOL:MISC:%1",(call MISC_ID)]; 
  _result = "extDB2" callExtension format["9:ADD:MISC:%1",(call MISC_ID)]; 
  diag_log "extDB2: MISC is enabled"; 
 }; 
 
  _result = "extDB2" callExtension format ["0:%1:TIME:2", (call MISC_ID)]; 
 diag_log format ["extDB2: current Time: %1",_result]; 
 
 _result = "extDB2" callExtension "9:LOCK"; 
 _result = "extDB2" callExtension "9:LOCK_STATUS"; 
 diag_log format ["extDB2: Locked Status: %1",_result]; 
 
 _extDB = true; 
 diag_log "extDB2: Connected to Database"; 
 
} else { 
 lhm_sql_id = uiNamespace getVariable "lhm_sql_id"; 
 __CONST__(lhm_sql_id,lhm_sql_id); 
 _extDB = true; 
 diag_log "extDB2: Still Connected to Database"; 
 
 if(isNil {uiNamespace getVariable "RCON_ID"}) then { 
  RCON_ID = uiNamespace getVariable "RCON_ID"; 
  __CONST__(RCON_ID,RCON_ID); 
  diag_log "extDB2: RCON still enabled"; 
 }; 
 if(isNil {uiNamespace getVariable "VAC_ID"}) then { 
  VAC_ID = uiNamespace getVariable "VAC_ID"; 
  __CONST__(VAC_ID,VAC_ID); 
  diag_log "extDB2: VAC still enabled"; 
 }; 
 if(isNil {uiNamespace getVariable "MISC_ID"}) then { 
  MISC_ID = uiNamespace getVariable "MISC_ID"; 
  __CONST__(MISC_ID,MISC_ID); 
  diag_log "extDB2: MISC still enabled"; 
 }; 
}; 
 
//Broadbase PV to Clients, to warn about extDB2 Error. 
// exitWith to stop trying to run rest of Server Code 
if (!_extDB) exitWith { 
 lhm_server_extDB2_notLoaded = true; 
 publicVariable "lhm_server_extDB2_notLoaded"; 
 diag_log "extDB2: Error checked extDB2/logs for more info"; 
}; 
 
// inform that extDB is successfully loaded 
lhm_server_extDB2_Loaded = true; 
publicVariable "lhm_server_extDB2_Loaded"; 
 
// Log New Player 
onPlayerConnected { 
 diag_log format [">>>> New Player: %3 (%2) - OwnerID: %1 - JIP: %4  connected! <<<<", _owner,_uid,_name,_jip]; 
}; 
 
_looptimeout = 0; 
waitUntil { 
 uiSleep 1; 
 _looptimeout = _looptimeout + 1; 
 diag_log format ["waiting for LHM_MASTER to complete... %1",_looptimeout]; 
 !isNil "LHM_VAR_MASTER_SERVER_INIT_READY"; 
}; 
 
/* Run stored procedures for SQL side cleanup */ 
diag_log "calling SQL Functions..."; 
["CALL resetLifeVehicles",1] call DB_fnc_asyncCall; 
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall; 
["CALL deleteOldHouses",1] call DB_fnc_asyncCall; 
["CALL deleteOldGangs",1] call DB_fnc_asyncCall; //Maybe delete old gangs 
diag_log "calling SQL Functions done"; 
 
//[] spawn ton_fnc_realTimeClock; 
[] execFSM "\life_server\FSM\realTimeClock.fsm"; 
diag_log "RealTime Clock activated"; 
/* initalize Headless Client */ 
//[] call compile PreProcessFileLineNumbers "\life_server\fn_initHC.sqf"; 
 
/* Map-based server side initialization. */ 
diag_log "Map-based server side initialization..."; 
master_group attachTo[bank_obj,[0,0,0]]; 
//onMapSingleClick "if(_alt) then {vehicle player setPos _pos};"; //Local debug for myself 
 
// Safezone invicible 
_obj = nearestTerrainObjects [getMarkerPos "safezone_kavala", [], 110]; 
{ 
 _x allowDamage false; 
}forEach _obj; 
 
// Hide some Objects with ID Input 
if(count hidedMapObjects > 0) then { 
 { 
  _obj = ([0,0,0] nearestObject _x); 
  _obj hideObjectGlobal true; 
  _obj allowDamage false; 
 } forEach hidedMapObjects; 
}; 
 
//Strip NPC's of weapons 
{ 
 if(!isPlayer _x) then { 
  _npc = _x; 
  { 
   if(_x != "") then { 
    _npc removeWeapon _x; 
   }; 
  } foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc]; 
 }; 
} foreach allUnits; 
 
[8,true,12] execFSM "\life_server\FSM\timeModule.fsm"; 
[] execFSM "\life_server\FSM\weatherModule.fsm"; 
 
diag_log "Map-based server side initialization done"; 
 
lhm_adminlevel = 0; 
lhm_medicLevel = 0; 
lhm_coplevel = 0; 
lhm_seclevel = 0; 
__CONST__(JxMxE_PublishVehicle,"No"); 
 
diag_log "Creating Radio Channels..."; 
lhm_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
lhm_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
lhm_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
lhm_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
diag_log "Creating Radio Channels done"; 
 
/* Set the amount of gold in the federal reserve at mission start */ 
_queryResult = ["SELECT amount FROM lhm_bank WHERE banktype='FED'",2] call DB_fnc_asyncCall; 
waitUntil {!isNil "_queryResult"}; 
if ((_queryResult select 0) <= 0 || typename (_queryResult select 0) != "SCALAR") then 
{ 
 _queryResult = [0]; 
}; 
diag_log format ["Federal Reserve Gold amount value is: %1",(_queryResult select 0)]; 
fed_bank setVariable["safe",round((_queryResult select 0)+((count playableUnits)/2)),true]; 
 
//fed_bank setVariable["safe",(count playableUnits),true]; 
 
//[] spawn TON_fnc_federalUpdate; 
[] execFSM "\life_server\FSM\federalUpdate.fsm"; 
diag_log "Federal Reserve Update initialized"; 
/* Event handler for disconnecting players */ 
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way. 
[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf"; 
[] call compile PreProcessFileLineNumbers "\life_server\eventhandlers.sqf"; 
 
 
/* Economic Market System */ 
diag_log "starting Economic-System..."; 
[] call ton_fnc_marketconfiguration; 
waitUntil {!isNil "lhm_market_prices"}; 
diag_log "Market prices generated!"; 
"lhm_market_prices" addPublicVariableEventHandler{diag_log format["ECO SERVER: Market prices updated! %1", _this select 1];}; 
[] execFSM "\life_server\FSM\ecoServer.fsm"; 
diag_log "ECO FSM executed"; 
 
/* Miscellaneous mission-required stuff */ 
[] spawn TON_fnc_cleanup; 
lhm_gang_list = []; 
publicVariable "lhm_gang_list"; 
lhm_wanted_list = []; 
client_session_list = []; 
diag_log "Execute Server-Side Cleanup Function"; 
[] execFSM "\life_server\FSM\cleanup.fsm"; 
 
diag_log "Execute Dealer Logic"; 
[] execFSM "\life_server\FSM\dealerLogic.fsm"; 
 
_handle = [] spawn TON_fnc_initHouses; 
waitUntil {ScriptDone _handle}; 
 
/* Basebuilding Gang TAX */ 
_handle = [] spawn build_fnc_ObjectTax; 
waitUntil {ScriptDone _handle}; 
 
/* Setup the federal reserve building(s) */ 
diag_log "Setup the federal reserve buildings(s)..."; 
private["_bank","_fedMarker"]; 
_bank = [dome1,dome2,dome3,rsb1,rsb2,rsb3]; 
{ 
 for "_i" from 1 to 3 do { 
  _x setVariable[format["bis_disabled_Door_%1",_i],1,true]; _x animateSource [format["Door_%1_source",_i],0]; 
 }; 
 _x allowDamage false; 
 sleep 0.2; 
} forEach _bank; 
_fedMarker = createMarker ["fedAreaMarker", getPos fedTextTrigger]; 
_fedMarker setMarkerShape "ELLIPSE"; 
_fedMarker setMarkerSize [500,500]; 
_fedMarker setMarkerColor "Color3_FD_F"; 
_fedMarker setMarkerType "Empty"; 
_fedMarker setMarkerBrush "DIAGGRID"; 
waitUntil {!isNil"_fedMarker"}; 
 
diag_log "getting Fuelstation List..."; 
lhm_fuelstation_stationlist = (nearestObjects [getArray(configFile >> "CfgWorlds" >> worldName >> "centerPosition"), ["Land_fs_feed_F","Land_CarService_F"], WorldSize]); 
waitUntil {!isNil "lhm_fuelstation_stationlist"}; 
diag_log format ["Found %1 Fuel-Stations",count lhm_fuelstation_stationlist]; 
_var = 0; 
{ 
 _nearPump = nearestObjects [getPos _x, ["Land_fs_feed_F"], 45]; 
 sleep 0.1; 
 if (_x isKindOf "Land_CarService_F" && count _nearPump > 0) then { 
  _var = _var + 1; 
  _markername = format ["%1",_var]; 
  _marker = createMarker ["GasMarker_"+_markername, getPos _x]; 
  _marker setMarkerColor "ColorGreen"; 
  _marker setMarkerText "Tankstelle"; 
  _marker setMarkerType "loc_Fuelstation"; 
 }; 
 _x setFuelCargo 0; 
 sleep 0.2; 
} forEach lhm_fuelstation_stationlist; 
diag_log "Fuel-Station Setup complete. Publishing Station List"; 
publicVariable "lhm_fuelstation_stationlist"; 
 
 
 
[evidencebox] call lhm_fnc_init_clearCargo; // Clear the Evidence Box 
 
Louisbox setPos [getPos Louisbox select 0, getPos Louisbox select 1, -100]; 
 
0 call lhm_fnc_serverHospital; 
 
/* Tell clients that the server is ready and is accepting queries */ 
lhm_server_isReady = true; 
diag_log "waiting for Basebuilding to be done..."; 
WaitUntil {base_Build}; /* wait till base build exection is complete */ 
 
diag_log "running DiagFPS Monitor..."; 
[60] execFSM "\life_server\FSM\ServerFPS.fsm"; // int parameter refresh time 
 
publicVariable "lhm_server_isReady"; 
 
/* Initialize hunting zone(s) muss aus */ 
//["hunting_zone",30] spawn TON_fnc_huntingZone; 
 
diag_log format["###### Life Server is ready - Total Execution Time %1 in seconds ######",(time) - _tickTime]; 
diag_log "------------------------------------------------------------------------------------------------------"; 
diag_log "-------------------------------- End of Loewenherz Life Server Init ----------------------------------"; 
diag_log "------------------------------------------------------------------------------------------------------"; 
 
