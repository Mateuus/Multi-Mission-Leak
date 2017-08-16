// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _vid = param[0, -1, [0] ]; 
private _price = param[1, -1, [0] ]; 
private _spawnPositions = param[2, [], [[]] ]; 
private _unit = param[3, objNull,     [objNull] ]; 
private _side = param[4, sideUnknown, [sideUnknown]]; 
 
if( _vid < 0 || _price < 0 || _spawnPositions isEqualTo [] || _unit isEqualTo objNull || _side isEqualTo sideUnknown ) exitWith {}; 
 
// Validate spawnpoints 
private _spawn = []; 
{ 
    private _objects = nearestObjects[(_x select 0), ["Car", "Ship", "Air"], 8]; 
    if( _objects isEqualTo [] ) exitWith { 
        _spawn = _x 
    }; 
} forEach _spawnPositions; 
 
// Lock section for single thread access: 
MUTEX_GARAGE call enterCriticalSection; 
 
private _queryResult = [ format["SELECT classname, color, inventory, chip FROM vehicles WHERE id = '%1' AND alive = '1' AND active = '0' AND sold = '0';", _vid], 2 ] call XYDB_fnc_asyncCall; 
 
// Check for possible errors 
private _error = switch(true) do { 
    case( (typeName _queryResult) isEqualTo "STRING" ): { 
        true 
    }; 
    case( _queryResult isEqualTo [] ): { 
        [1, "Fehler beim Ausparken: Fahrzeug nicht gefunden"] remoteExec ["XY_fnc_broadcast", _unit]; 
        true; 
    }; 
    case( _spawn isEqualTo [] ): { 
        [1, "Fehler beim Ausparken: Spawnpunkt blockiert"] remoteExec ["XY_fnc_broadcast", _unit]; 
        true 
    }; 
    default { false }; 
}; 
 
if( !_error ) then { 
 
    // Update database and set vehicle active 
    [format[ "UPDATE vehicles SET active = '1', locked = '0', ts_modified = CURRENT_TIMESTAMP WHERE id = '%1'", _vid ], 1 ] call XYDB_fnc_asyncCall; 
 
    private _trunk = [_queryResult select 2] call XYDB_fnc_mresToArray; 
    if( (typeName _trunk) isEqualTo "STRING" ) then { 
        _trunk = call compile format["%1", _trunk]; 
    }; 
    if( _trunk isEqualTo [] ) then { 
        _trunk = [[], 0]; 
    }; 
 
    // Spawn vehicle on client 
    [ _queryResult select 0, _spawnPositions, _price, _queryResult select 1, _vid, _trunk, _side, _queryResult select 3 ] remoteExec ["XY_fnc_spawnVehicle", _unit]; 
}; 
 
// Unlock single-threaded section 
MUTEX_GARAGE call leaveCriticalSection;