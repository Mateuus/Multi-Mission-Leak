// Persistent Wanted List - Load script 
// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_count", "_i", "_queryResult", "_uid", "_array"]; 
 
_count = (["SELECT COUNT(*) FROM wanted WHERE active = '1'", 2] call XYDB_fnc_asyncCall) select 0; 
 
for [ {_i = 0}, {_i <= _count}, {_i = _i + 10 } ] do { 
    _queryResult = [ format["SELECT playerid, message, value FROM wanted WHERE active = '1' LIMIT %1,10", _i], 2, true] call XYDB_fnc_asyncCall; 
 
    if( typeName _queryResult == "STRING" ) exitWith { 
        diag_log "DB ERROR WHILE LOADING WANTED LIST"; 
    }; 
 
    {        
        _uid = _x select 0; 
         
        _array = []; 
        { 
            if( (_x select 0) isEqualTo _uid ) exitWith { 
                _array = _x select 1; 
            }; 
        } forEach XY_wantedList; 
 
        if( _array isEqualTo [] ) then { 
            // First entry: 
            XY_wantedList pushBack [ _x select 0, _array ]; 
        }; 
 
        _array pushBack [ _x select 1, _x select 2 ]; 
 
    } forEach _queryResult; 
};