// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
// Retrieve all locked vehicles from database 
 
private[ "_unit", "_queryResult" ]; 
 
_unit = [ _this, 0, objNull, [objNull] ] call BIS_fnc_param; 
 
if( isNull _unit ) exitWith {}; 
 
_queryResult = [format["SELECT id, classname, name, color FROM lockedvehicles ORDER BY classname"], 2, true] call XYDB_fnc_asyncCall; 
 
if( typeName _queryResult == "STRING" ) then { 
    _queryResult = []; 
}; 
 
[_queryResult] remoteExec ["XY_fnc_unlockMenu", _unit];