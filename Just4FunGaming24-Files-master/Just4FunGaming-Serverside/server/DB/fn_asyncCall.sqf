// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _tickTime = diag_tickTime; 
private _query = param[0, "", [""]]; 
private _mode = param[1, -1, [0]]; 
private _multiArray = param[2, false, [false]]; 
 
if( _query isEqualTo "" || _mode < 1 || _mode > 2 ) exitWith { 
    diag_log format["invalid asyncCall(%1)", _this]; 
    "_INVALID_SQL_STMT"; 
}; 
 
diag_log format ["QUERY %1", _this]; 
 
MUTEX_DB call enterCriticalSection; 
 
private _key = "extDB" callExtension format["%1:%2:%3", 2, XY_sqlID, _query]; 
_key = (call compile _key) select 1; 
 
uisleep 0.05; 
 
private _result = ""; 
private _pipe = ""; 
while { true } do { 
    _pipe = "extDB" callExtension format["5:%1", _key]; 
    if( _pipe isEqualTo "" ) exitWith {}; 
    if( _pipe isEqualTo "[3]" ) then { 
        diag_log "waiting for extension..."; 
        uisleep 0.1; 
    } else { 
        _result = format["%1%2", _result, _pipe]; 
    }; 
}; 
 
MUTEX_DB call leaveCriticalSection; 
 
// Detect database bottlenecks 
if( (diag_tickTime - _tickTime) > 2 ) then { 
    diag_log format["Duration: %1s | Query: %2", (diag_tickTime - _tickTime), _query]; 
}; 
 
if( _mode isEqualTo 1 ) exitWith { true }; 
 
_result = ((call compile _result) select 1) select 1; 
 
if( !(_multiArray) && { !(_result isEqualTo []) } ) exitWith { 
    _result select 0; 
}; 
 
_result;