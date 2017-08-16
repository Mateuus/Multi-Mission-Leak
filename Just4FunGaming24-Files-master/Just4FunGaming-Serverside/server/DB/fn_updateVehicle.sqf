// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _vehicle = param[ 0, objNull, [objNull]]; 
if( isNull _vehicle ) exitWith {}; 
 
private _trunk = _vehicle getVariable[ "trunk", [[], 0] ]; 
private _vid = _vehicle getVariable["dbInfo", -1]; 
 
if( _vid < 0 ) exitWith {}; 
 
// Update trunk to remove sensitive stuff 
private _removedSomething = false; 
{ 
    if( (_x select 0) isEqualTo "goldbar" || ([_x select 0, 4] call KRON_StrLeft) isEqualTo "uran" ) then { 
        _removedSomething = true; 
        (_trunk select 0) set [ _forEachIndex, -1 ]; 
    }; 
} forEach (_trunk select 0); 
 
if( _removedSomething ) then { 
    _trunk set [0, ((_trunk select 0) - [-1]) ]; 
    _trunk set [1, [_trunk select 0] call XY_fnc_calculateWeight]; 
}; 
 
private _chip = 0; 
if( _vehicle getVariable["chip.enabled", false] ) then { 
    _chip = _vehicle getVariable["chip.type", 0]; 
}; 
 
private _hps = getAllHitPointsDamage _vehicle; 
private _damage = []; 
{ 
    if( _x > 0 ) then { 
        _damage pushBack[ _forEachIndex, _x ]; 
    }; 
} forEach (_hps select 2); 
 
[ format["UPDATE vehicles SET inventory = '%1', chip = '%2', damage = '%3', fuel = '%4' WHERE id = '%5'", 
    [ _trunk ] call XYDB_fnc_mresArray, 
    _chip, 
    [ _damage ] call XYDB_fnc_mresArray, 
    fuel _vehicle, 
    _vid 
], 1 ] call XYDB_fnc_asyncCall;