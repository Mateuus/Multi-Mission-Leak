// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
private["_unit", "_time", "_result" ]; 
 
params [ 
    [ "_unit",   objNull, [objNull] ], 
    [ "_time",   -1,      [0]       ] 
]; 
 
if( isNull _unit ) exitWith {}; 
 
if( _time < 0 ) then { 
 _result = [ format["SELECT jail_time FROM players WHERE playerid = '%1'", getPlayerUID _unit], 2 ] call XYDB_fnc_asyncCall; 
    if( _result isEqualTo [] ) then { 
        _time = 15; 
    } else { 
        _time = _result select 0; 
    }; 
} else { 
    [ _unit, _time ] call XYDB_fnc_updateJailTime; 
}; 
[ _time ] remoteExec ["XY_fnc_jailMe", _unit];