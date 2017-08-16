// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_unit", "_query", "_result", "_time"]; 
 
if( !params [ 
    [ "_unit",   objNull, [objNull] ], 
    [ "_time",   -1,      [0]       ] 
] ) exitWith {}; 
 
if( _time > 60 || _time < 0 ) exitWith { 
    diag_log format[ "<ERROR> jail time for %1 (%2) out of range: %3", name _unit, getPlayerUID _unit, _time ]; 
}; 
 
[ format["UPDATE players SET jail_time = '%1' WHERE playerid = '%2'", _time, getPlayerUID _unit], 1 ] call XYDB_fnc_asyncCall;