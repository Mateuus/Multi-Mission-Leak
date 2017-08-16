// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
if( !isServer ) exitWith {}; 
 
diag_log "INIT SERVER"; 
 
XY_isServerReady = false; 
publicVariable "XY_isServerReady"; 
 
east setFriend [west, 1]; 
east setFriend [civilian, 1]; 
east setFriend [independent, 1]; 
 
west setFriend [east, 1]; 
west setFriend [civilian, 1]; 
west setFriend [independent, 1]; 
 
independent setFriend [east, 1]; 
independent setFriend [civilian, 1]; 
independent setFriend [west, 1]; 
 
civilian setFriend [east, 1]; 
civilian setFriend [independent, 1]; 
civilian setFriend [west, 1]; 
 
call XY_fnc_initDB; 
// -- 
 
call compile preprocessfile "config\configuration.sqf"; 
call compile preprocessfile "\server\shk_pos\shk_pos_init.sqf"; 
 
//Run procedures for SQL cleanup on mission start. 
["CALL resetLifeVehicles",      1] call XYDB_fnc_asyncCall; 
["CALL deleteDeadVehicles",     1] call XYDB_fnc_asyncCall; 
["CALL deleteOldHouses",        1] call XYDB_fnc_asyncCall; 
["CALL deleteOldGangs",         1] call XYDB_fnc_asyncCall; 
["CALL createStatistics",       1] call XYDB_fnc_asyncCall; 
["CALL deleteOldWantedEntries", 1] call XYDB_fnc_asyncCall; 
 
XYDB = 2; 
publicVariable "XYDB"; 
 
["update"] call XY_fnc_ssv; 
["loop"] call XY_fnc_ssv; 
 
life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
life_radio_east = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []]; 
 
// Init safe #KK (Grows later with playercount) 
fed_bank setVariable["safe", 0, true]; 
 
//General cleanup for clients disconnecting 
addMissionEventHandler ["HandleDisconnect",{_this call XY_fnc_clientDisconnect; false;}]; 
 
onPlayerConnected { 
    diag_log format["<PNAME> Player %1 connected: %2 (%3)", _owner, _name, _uid]; 
    if( count(_uid) isEqualTo 17 )then { 
 
        private _validName = true; 
        private _validCharacters = "abcdefghijklmnopqrstuvwxyzäöüABCDEFGHIJKLMNOPQRSTUVWXYZÄÖÜ. "; 
 
        // Check if name is valid rp name 
        private _hasClan = (_name find "[") >= 0 || (_name find "]") >= 0; 
        private _splittedName = _name splitString " "; 
 
        // Check if clantag is valid 
        if( _hasClan )then { 
            private _clanName = (_splittedName select 0); 
            _validName = count(_clanName) > 2 && (_clanName find "[") == 0 && (_clanName find "]") == (count(_clanName) - 1); 
            { 
                if( _validCharacters find _x < 0 && _forEachIndex > 0 && _forEachIndex < ((count _clanName) - 1) ) exitWith { 
                    diag_log format["<PNAME> Invalid clanname: %1 -> %2, %3", _name, _clanName, _x]; 
                    _validName = false; 
                }; 
            } forEach( _clanName splitString "" ); 
        }; 
        // Check if playername contains valid characters 
        if( _validName )then { 
            { 
                if( !_hasClan || (_hasClan && _forEachIndex > 0) )then { 
                    { 
                        if( _validCharacters find _x < 0 ) exitWith { 
                            diag_log format["<PNAME> Invalid playername: %1 -> %2", _name, _x]; 
                            _validName = false; 
                        }; 
                    } forEach( _x splitString "" ); 
                }; 
 
            } forEach _splittedName; 
        }; 
        // Check if it matches the pattern "[CLAN] Name Surname" or "Name Surname" 
        if( _validName )then { 
            _validName = (_hasClan && (count _splittedName) >= 3) || (!_hasClan && (count _splittedName) >= 2); 
        }; 
        // Check if all name parts are long enough 
        if( _validName )then { 
            { 
                if( (count _x) < 2 ) exitWith { 
                    _validName = false; 
                }; 
            } forEach _splittedName; 
        }; 
        // Check if it has double spaces 
        if( (_name find "  ") >= 0 ) then { 
            diag_log format["<PNAME> (%1) has double spaces", _name]; 
            _validName = false; 
        }; 
 
        if( !_validName ) exitWith { 
            diag_log format["<PNAME> Invalid playername (%1), disconnecting", _name]; 
            ["InvalidName", false, true] remoteExec ["BIS_fnc_endMission", _owner]; 
        }; 
 
        [ format["INSERT INTO player_alias (playerid, name) VALUES ('%1', '%2')", _uid, _name], 1 ] remoteExec ["XYDB_fnc_asyncCall", XYDB]; 
        [ format["UPDATE players SET name = '%1' WHERE playerid = '%2'", _name, _uid], 1 ] remoteExec ["XYDB_fnc_asyncCall", XYDB]; 
 
        private _varName = format["ALLOW_%1", _uid]; 
        missionNamespace setVariable[ _varName, true ]; 
        _owner publicVariableClient _varName; 
 
    } else { 
        if( (_uid find "HC") != 0 ) then { 
            diag_log format["<ERROR> Suspicious player id: %1", _uid]; 
            ["NotWhitelisted", false, true] remoteExec ["BIS_fnc_endMission", _owner]; 
        }; 
    }; 
}; 
 
//Lockup the dome 
fed_bank setVariable["door.open.1", false, true]; 
fed_bank setVariable["door.open.2", false, true]; 
fed_bank setVariable["door.open.3", false, true]; 
 
private _dome = nearestObject [[20894, 19228, 0], "Land_Dome_Big_F"]; 
_dome setVariable["bis_disabled_Door_1", 1, true]; 
_dome setVariable["bis_disabled_Door_2", 1, true]; 
_dome setVariable["bis_disabled_Door_3", 1, true]; 
_dome allowDamage false; 
XY_FED_DOME = _dome; 
publicVariable "XY_FED_DOME"; 
 
private _rsb = nearestObject [[20888, 19240, 0], "Land_Research_house_V1_F"]; 
_rsb setVariable["bis_disabled_Door_1", 1, true]; 
_rsb allowDamage false; 
XY_FED_RSB = _rsb; 
publicVariable "XY_FED_RSB"; 
 
//Lockup the jail 
private _jail = nearestObject [[11611, 11937, 0], "Land_Dome_Small_F"]; 
_jail setVariable["bis_disabled_Door_1", 1, true]; 
_jail setVariable["bis_disabled_Door_2", 1, true]; 
_jail allowDamage false; 
XY_JAIL = _jail; 
publicVariable "XY_JAIL"; 
 
XY_HIDEOUT_1 = (nearestObjects[getMarkerPos "poi_gang_area_1", ["Land_u_Barracks_V2_F", "Land_i_Barracks_V2_F"], 25]) select 0; 
if( isNil "XY_HIDEOUT_1" ) exitWith { diag_log "<ERROR> SERVER LOAD ERROR: CANNOT FIND GANGHIDEOUT 1!"; }; 
publicVariable "XY_HIDEOUT_1"; 
 
XY_HIDEOUT_2 = (nearestObjects[getMarkerPos "poi_gang_area_2", ["Land_u_Barracks_V2_F", "Land_i_Barracks_V2_F"], 25]) select 0; 
if( isNil "XY_HIDEOUT_2" ) exitWith { diag_log "<ERROR> SERVER LOAD ERROR: CANNOT FIND GANGHIDEOUT 2!"; }; 
publicVariable "XY_HIDEOUT_2"; 
 
XY_HIDEOUT_3 = (nearestObjects[getMarkerPos "poi_gang_area_3", ["Land_u_Barracks_V2_F", "Land_i_Barracks_V2_F"], 25]) select 0; 
if( isNil "XY_HIDEOUT_3" ) exitWith { diag_log "<ERROR> SERVER LOAD ERROR: CANNOT FIND GANGHIDEOUT 3!"; }; 
publicVariable "XY_HIDEOUT_3"; 
 
XY_wantedList = []; 
XY_ctfActive = false; 
XY_allowEvents = true; 
 
{ 
    _x setVariable ["BIS_noCoreConversations", true, true]; 
} forEach allUnits; 
 
diag_log "Init RTC..."; 
[] call XY_fnc_realtimeClock; 
 
diag_log "Init houses..."; 
[] call XY_fnc_initHouses; 
 
diag_log "Load wanted list..."; 
[] call XY_fnc_wantedLoad; 
 
diag_log "Init market..."; 
[] call XY_fnc_marketConfiguration; 
diag_log "Load prices..."; 
[] call XY_fnc_marketLoad; 
diag_log "Market initialized, adding dynamics..."; 
[] spawn XY_fnc_marketChange; 
diag_log "Init time accelerator..."; 
[] spawn XY_fnc_timeAccelerator; 
diag_log "Init weather..."; 
[] spawn XY_fnc_randomWeather; 
diag_log "Init federal update..."; 
[] spawn XY_fnc_federalUpdate; 
diag_log "Init pvp events..."; 
[] spawn XY_fnc_pvpEvents; 
diag_log "Init cleanup..."; 
[] spawn XY_fnc_serverCleanup; 
diag_log "Init client functions..."; 
[] spawn XY_fnc_clientFunctions; 
diag_log "Init refueling..."; 
[] call XY_fnc_fuelstations; 
diag_log "Init activity monitor..."; 
[] spawn XY_fnc_activityMonitor; 
diag_log "Init bounty announce..."; 
[] spawn XY_fnc_wantedAnnounce; 
 
"HCDetect" spawn { scriptName _this; 
    while { true } do { 
        private _target = XYDB; 
        if( isNil "HC1" ) then { 
            _target = 2; 
        } else { 
            if( HC1 getVariable ["hc.ready", false] ) then { 
                _target = (owner HC1); 
            }; 
        }; 
        if( _target != XYDB ) then { 
            diag_log format["<HC> Updating XYDB = %1", _target]; 
            XYDB = _target; 
            publicVariable "XYDB"; 
        }; 
        sleep 1; 
    }; 
}; 
 
"FPSDiagnose" spawn { scriptName _this; 
 
    private _samples = 5; 
 
    private _allOccurences = []; 
 
    // Diagnose... 
    while { true } do { 
 
        private _avg = 0; 
        private _min = 100; 
        private _max = 0; 
 
        for "_i" from 1 to _samples do { 
            _fps = diag_fps; 
            _avg = _avg + _fps; 
            _min = _fps min _min; 
            _max = _fps max _max; 
 
            uisleep 1; 
        }; 
        _min = round(_min); 
        _avg = round(_avg / _samples); 
        _max = round(_max); 
 
        diag_log format["<PERFORMANCE> ACTIVE SQF: %1, FPS (MIN/AVG/MAX): %2/%3/%4, PLAYERS: %5, VEHICLES: %6", count diag_activeSQFScripts, _min, _avg, _max, count allPlayers, count vehicles]; 
        { 
            diag_log format["<PERFORMANCE> %1", _x]; 
        } forEach diag_activeSQFScripts; 
 
        uisleep 600; 
    }; 
}; 
 
 
 
/* 
"VehicleLogger" spawn { scriptName _this; 
 
    while { true } do { 
        private _vehicles = vehicles; 
        private _vehiclesSimulated = 0; 
 
        { 
            if( !(simulationEnabled _x) )then { 
                diag_log format[ "<VEHICLE> %1, %2, %3", typeOf _x, getPos _x, simulationEnabled _x ]; 
            }; 
        } forEach _vehicles; 
        { 
            if( simulationEnabled _x )then { 
                _vehiclesSimulated = _vehiclesSimulated + 1; 
                diag_log format[ "<VEHICLE> %1, %2, %3", typeOf _x, getPos _x, simulationEnabled _x ]; 
            }; 
        } forEach _vehicles; 
 
        diag_log format["<VEHICLE> count %1 simulated %2", count _vehicles, _vehiclesSimulated]; 
 
        sleep 900; 
    }; 
}; 
*/ 
XY_isServerReady = true; 
publicVariable "XY_isServerReady";