
life_server_isReady = false;
life_mission_completed = false;
snowActive = false;
ahw_all = [];
publicVariable "ahw_all";
publicVariable "life_server_isReady";
publicVariable "snowActive";
PublicVariable "life_mission_completed";

[] execVM "\life_server\functions.sqf";
[] execVM "\life_server\eventhandlers.sqf";
[5,true,20] execFSM "\life_server\timeModule.fsm";

bank_obj hideobjectGlobal true;


private["_extDB2"];
_extDB2 = false;
"extDB2" callExtension "9:START_RCON:RCON";

if(isNil {uiNamespace getVariable "life_sql_id"}) then {
_life_sql_id = str(round(random(999999)));
uiNamespace setVariable ["life_sql_id", _life_sql_id];
life_sql_id = compileFinal _life_sql_id;

diag_log str life_sql_id;

_result = call compile ("extDB2" callExtension "9:ADD_DATABASE:AltisLife");
if!(_result isEqualTo [1]) exitWith {diag_log "extDB2: Fehler bei Verbindungsaufbau mit Datenbank!";};
_result = call compile ("extDB2" callExtension format["9:ADD_DATABASE_PROTOCOL:AltisLife:SQL_RAW:%1:ADD_QUOTES",_life_sql_id]);
if!(_result isEqualTo [1]) exitWith {diag_log "extDB2: Fehler bei Verbindungsaufbau mit Datenbank!";};
"extDB2" callExtension "9:LOCK";
_extDB2 = true;
diag_log "extDB2: Mit Datenbank verbunden.";
} else {
life_sql_id = uiNamespace getVariable "life_sql_id";
life_sql_id = compileFinal (if(typeName life_sql_id == "STRING") then {life_sql_id} else {str(life_sql_id)});
_extDB2 = true;
diag_log "extDB2: Verbindung zur Datenbank stabil.";
};

if (!_extDB2) exitWith {
life_server_extDB_notLoaded = true;
publicVariable "life_server_extDB_notLoaded";
};


["CALL resetLifeVehicles",1] call DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] call DB_fnc_asyncCall;
["CALL deleteOldHouses",1] call DB_fnc_asyncCall;
["CALL deleteOldGangs",1] call DB_fnc_asyncCall;

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;
life_adaclevel = 0;


JxMxE_PublishVehicle = compileFinal (if(typeName "No" == "STRING") then {"No"} else {str("No")});


life_radio_west = radioChannelCreate [[0, 0.5, 1, 0.8], "Polizeifunk", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 1, 1, 0.8], "Zivilfunk", "%UNIT_NAME", []]; PublicVariable "life_radio_civ";
life_radio_indep = radioChannelCreate [[1, 0.7, 0.1, 0.8], "Notdienst", "%UNIT_NAME", []];
life_radio_air = radioChannelCreate [[0.4, 0.85, 0.95, 0.8], "Flugfunk", "%UNIT_VEH_NAME",[]]; PublicVariable "life_radio_air";
life_radio_call1 = radioChannelCreate [[1, 1, 1, 0.8], "Anruf", "%UNIT_NAME", []]; PublicVariable "life_radio_call1";
life_radio_call2 = radioChannelCreate [[1, 1, 1, 0.8], "Anruf", "%UNIT_NAME", []]; PublicVariable "life_radio_call2";
life_radio_call4 = radioChannelCreate [[1, 1, 1, 0.8], "Anonymer Anruf", "Anonymer Anrufer", [], false]; PublicVariable "life_radio_call4";
life_radio_call5 = radioChannelCreate [[1, 1, 1, 0.8], "Anonymer Anruf", "Anonymer Anrufer", [], false]; PublicVariable "life_radio_call5";
life_radio_radio = radioChannelCreate [[1, 1, 1, 0.8], "Radio Altis 95.8", "Radio", [], false]; PublicVariable "life_radio_radio";

serv_sv_use = [];
fed_bank setVariable["safe",(count playableUnits),true];


addMissionEventHandler ["HandleDisconnect",{_this call SOA_fnc_clientDisconnect; false;}];
addMissionEventHandler ["EntityKilled",
{
if((_this select 0) isKindOf "Car" OR (_this select 0) isKindOf "Air" OR (_this select 0) isKindOf "Ship") then {
{deletevehicle _x} foreach attachedObjects (_this select 0);
};
}
];


life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\life_server\cleanup.fsm";
[] spawn SOA_fnc_federalUpdate;


[] spawn SOA_fnc_initHouses;

[] spawn HClient_fnc_hideobjects;

east setFriend [west, 1];
east setFriend [civilian, 1];
east setFriend [independent, 1];
west setFriend [east, 1];
independent setFriend [east, 1];
civilian setFriend [east, 1];

_whitelist = ((getMarkerPos "helisim") nearEntities [["Man","Air"], 60]);

{_x enableSimulation false} foreach allMissionObjects "";
{_x enableSimulation true} foreach _whitelist;

life_server_isReady = true;
publicVariable "life_server_isReady";