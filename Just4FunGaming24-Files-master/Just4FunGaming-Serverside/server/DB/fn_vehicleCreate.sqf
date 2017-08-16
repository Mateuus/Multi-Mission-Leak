// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _uid     = param[ 0, "",          [""]      ]; 
private _side    = param[ 1, sideUnknown, [west]    ]; 
private _vehicle = param[ 2, objNull,     [objNull] ]; 
private _color   = param[ 3, -1,          [0]       ]; 
 
//Error checks 
if(_uid isEqualTo "" || _side isEqualTo sideUnknown || isNull _vehicle || _color < 0) exitWith {}; 
 
// Vehicle already destroyed 
if( !(alive _vehicle) ) exitWith {}; 
 
private _class = typeOf _vehicle; 
 
private _type = switch(true) do { 
    case (_vehicle isKindOf "Car"): { "Car" }; 
    case (_vehicle isKindOf "Air"): { ["Air", "Jet"] select ((toLower _class) find "plane" >= 0 ) }; 
    case (_vehicle isKindOf "Ship"): { "Ship" }; 
}; 
 
private _side = switch(_side) do { 
    case west: { "cop" }; 
    case civilian: { "civ" }; 
    case independent: { "med" }; 
    case east: { "thw" }; 
    default { "Error" }; 
}; 
 
MUTEX_VEHICLECREATION call enterCriticalSection; 
 
[ format[ "INSERT INTO vehicles (side, classname, type, pid, inventory, color, damage) VALUES ('%1', '%2', '%3', '%4', '""[]""', '%5', '""[]""')", _side, _class, _type, _uid, _color ], 1 ] call XYDB_fnc_asyncCall; 
 
private _vid = ([ format[ "SELECT id FROM vehicles WHERE side = '%1' AND classname = '%2' AND type = '%3' AND pid = '%4' AND alive = '1' AND active = '1' AND color = '%5' ORDER BY id DESC LIMIT 1", _side, _class, _type, _uid, _color ], 2 ] call XYDB_fnc_asyncCall) select 0; 
 
MUTEX_VEHICLECREATION call leaveCriticalSection; 
 
// Wait until spawnVehicle is executed on client-side... 
waitUntil { sleep 2; _vehicle getVariable ["dbInfo", -10] > -10 }; 
 
_vehicle setVariable ["dbInfo", _vid, true];