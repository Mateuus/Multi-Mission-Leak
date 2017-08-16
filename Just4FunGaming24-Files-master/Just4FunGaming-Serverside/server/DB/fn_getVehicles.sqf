// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private["_uid","_side","_type","_unit","_ret","_tickTime","_queryResult"]; 
 
if( !params[ 
    ["_uid",  "",          [""]          ], 
    ["_side", sideUnknown, [sideUnknown] ], 
    ["_type", "",          [""]          ], 
    ["_unit", objNull,     [objNull]     ] 
]) exitWith { 
    if( !(isNull _unit) ) then { 
        [[]] remoteExec ["XY_fnc_impoundMenu", _unit]; 
    }; 
}; 
 
_side = switch(_side) do { 
 case west:{"cop"}; 
 case civilian: {"civ"}; 
 case independent: {"med"}; 
 case east: {"thw"}; 
 default {""}; 
}; 
 
if( _side isEqualTo "" ) exitWith { 
 [[]] remoteExec ["XY_fnc_impoundMenu", _unit]; 
}; 
 
_queryResult = [format["SELECT id, classname, type, color, locked, chip FROM vehicles WHERE pid = '%1' AND alive = '1' AND sold = '0' AND active = '0' AND side = '%2' AND type = '%3' ORDER BY classname", _uid, _side, _type], 2, true] call XYDB_fnc_asyncCall; 
 
if( (typeName _queryResult) isEqualTo "STRING" ) then { 
    _queryResult = []; 
}; 
 
[_queryResult] remoteExec ["XY_fnc_impoundMenu", _unit];