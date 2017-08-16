private _player = param[0, objNull, [objNull]]; 
private _side = param[1, sideUnknown, [sideUnknown]]; 
private _pos = param[2, [], [[]]]; 
 
if( _player isEqualTo objNull ) exitWith {}; 
 
private _uid = getPlayerUID _player; 
private _damage = damage _player; 
 
// Special treatment for players in air vehicles 
if( !(_pos isEqualTo []) && (vehicle _player) isKindOf "Air" )then { 
    // Over water? Disable position saving 
    if( surfaceIsWater _pos ) then { 
        _pos = []; 
    } else { 
        // Set position on ground 
        _pos set [2, 0]; 
    }; 
}; 
 
private _found = false; 
{ 
    if( (_x select 0) isEqualTo _uid && (_x select 1) isEqualTo _side )exitWith { 
        _x set[2, [_pos, _damage]]; 
    }; 
} forEach XY_lastKnownPositions; 
 
if( !_found )then { 
    XY_lastKnownPositions pushBack [ _uid, _side, [_pos, _damage]]; 
}; 
