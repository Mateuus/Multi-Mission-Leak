diag_log "INIT DB"; 
 
// Kupferkarpfens pseudo-mutex... 
 
createCriticalSection = { 
    [true, true]; 
}; 
 
enterCriticalSection = { 
    private _mutex = _this; 
 
    waitUntil { _mutex select 0; }; 
    _mutex set [0, false]; 
 
    waitUntil { _mutex select 1; }; 
    _mutex set [1, false]; 
    _mutex set [0, false]; 
}; 
 
leaveCriticalSection = { 
    private _mutex = _this; 
    _mutex set [1, true]; 
    _mutex set [0, true]; 
}; 
 
MUTEX_DB = call createCriticalSection; 
MUTEX_GARAGE = call createCriticalSection; 
MUTEX_VEHICLECREATION = call createCriticalSection; 
MUTEX_CTF = call createCriticalSection; 
MUTEX_MARKET = call createCriticalSection; 
MUTEX_RACING = call createCriticalSection; 
MUTEX_UIDRESOLVER = call createCriticalSection; 
MUTEX_GANGBANK = call createCriticalSection; 
 
XY_lastKnownPositions = []; 
 
//Only need to setup extDB once 
if( uiNamespace getVariable ["XY_sqlID", -1] >= 0 ) exitWith { 
    // This is an unsupported state and should not happen!! 
    diag_log "extDB: Still connected to database, infinite loop to prevent harm"; 
    waitUntil { false }; 
}; 
 
XY_sqlID = round(random(9999)); 
uiNamespace setVariable ["XY_sqlID", XY_sqlID]; 
 
//extDB Version 
_result = "extDB" callExtension "9:VERSION"; 
diag_log format ["extDB: Version: %1", _result]; 
if(_result == "") exitWith {}; 
if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or higher required";}; 
 
//Initialize the database 
_result = "extDB" callExtension "9:DATABASE:Database2"; 
if(_result != "[1]") exitWith {diag_log "extDB: Error with database connection";}; 
_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1", XY_sqlID]; 
if(_result != "[1]") exitWith {diag_log "extDB: Error with database connection";}; 
"extDB" callExtension "9:LOCK"; 
diag_log "extDB: Connected to database";