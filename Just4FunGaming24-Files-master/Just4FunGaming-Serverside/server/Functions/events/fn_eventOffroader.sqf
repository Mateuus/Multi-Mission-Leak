// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
diag_log "<EVENT> eventOffroader"; 
XY_allowPVPEvents = false; 
 
private _locations = []; 
_locations pushBack [18800, 7500, 0]; 
_locations pushBack [19300, 6600, 0]; 
_locations pushBack [20600, 6700, 0]; 
_locations pushBack [21900, 7500, 0]; 
 
private _pos = []; 
private _vehicle = objNull; 
 
while { _pos isEqualTo [] } do { 
 
    _pos = [ selectRandom _locations, random 800, random 360, 0, [0, 0], [300, "I_G_Offroad_01_armed_F"] ] call SHK_pos; 
    // Check if there are players nearby... 
    diag_log format["<EVENT> Checking random position: %1", _pos]; 
 
    private _valid = true; 
    { 
        if( _pos distance (getMarkerPos _x) < 200 ) exitWith { 
            diag_log format["<EVENT> Position too near to marker: %1", _x]; 
            _valid = false; 
        }; 
    } forEach allMapMarkers; 
 
    { 
        if( _pos distance _x < 2000 ) exitWith { 
            diag_log format["<EVENT> Position too near to player: %1", _x]; 
            _valid = false; 
        }; 
    } forEach allPlayers; 
 
    if( !(_valid) ) then { 
        _pos = []; 
        uisleep 20; 
    } else { 
        diag_log "<EVENT> Found valid position for offroader, testing spawn..."; 
 
        // Spawn offroader 
        _vehicle = "I_G_Offroad_01_armed_F" createVehicle _pos; 
        _vehicle setVariable[ "lockpick.hardened", true, true]; 
        _vehicle setVariable[ "rope.allow", false, true]; 
        _vehicle setHitPointDamage [ "HitEngine", 1 ]; 
        _vehicle setHitPointDamage [ "HitLFWheel", [1, random 1] select ((random 100) > 30) ]; 
        _vehicle setHitPointDamage [ "HitLF2Wheel", [1, random 1] select ((random 100) > 30) ]; 
        _vehicle setHitPointDamage [ "HitRFWheel", [1, random 1] select ((random 100) > 30) ]; 
        _vehicle setHitPointDamage [ "HitRF2Wheel", [1, random 1] select ((random 100) > 30) ]; 
        _vehicle setDamage (0.5 + (random 0.3)); 
        _vehicle setDir (random 360); 
        _vehicle setFuel 0; 
        _vehicle lock 2; 
 
        uisleep 30; 
 
        if( !(alive _vehicle) ) then { 
            diag_log "<EVENT> Offroader didn't survive the spawn..."; 
            deleteVehicle _vehicle; 
            _pos = []; 
        }; 
    }; 
}; 
 
_vehicle setVariable[ "despawn", false, true]; 
 
// Create global marker for offroader position 
private _marker = createMarker [ "poi_PVPOffroaderMarker", _pos ]; 
_marker setMarkerColor "ColorYellow"; 
_marker setMarkerType "mil_marker"; 
 
["update"] remoteExec [ "XY_fnc_markerManager", -2 ]; 
 
_vehicle spawn { 
    uisleep 60; 
    for[ {_i = 1}, {_i <= 3}, {_i = _i + 1} ] do { 
        if( alive _this && !(_this getVariable[ "despawn", false]) )then { 
            [3, "Bewaffneter Finanz-Terror-Offroader entdeckt", "Im Fahrzeug befindet sich ein Laptop, mit dem die Konten der Zentralbank angezapft werden +++ Die Crew des Fahrzeugs erhält regelmäßig Geld"] remoteExec ["XY_fnc_broadcast", civilian]; 
            uisleep 420; 
        }; 
    }; 
}; 
 
private _nextUpdate = time; 
private _nextAward = time; 
private _lastKnownPos = _pos; 
 
private _destructionTimer = 5; 
 
// Keep track of the offroader and award the vehicle owner 
while { alive _vehicle && (playersNumber civilian) >= 40 } do { 
 
    uisleep 10; 
 
    // Check if they are driving outside the PvP-Zone... 
    if( (_vehicle distance (getMarkerPos "poi_pvp_zone")) > 2150 || ((getPosATL _vehicle) select 2) > 75 ) then { 
        if( _destructionTimer <= 0 ) then { 
            _vehicle setDamage ((damage _vehicle) + 0.1); 
        }; 
 
        { 
            diag_log format[ "<EVENT> Notifying %1 (%2) that he is moving outside the zone: %3m OR ATL: %4m", name _x, getPlayerUID _x, _vehicle distance (getMarkerPos "poi_pvp_zone"), ((getPosATL _vehicle) select 2) ]; 
            if( (_x distance _vehicle) < 25 ) then { 
                [ 1, "<t color='#FF0000' size ='3' align='center'>ACHTUNG</t><br/><t size='1'>Das Fahrzeug ist zu weit vom Boden oder dem Zentrum der PvP-Zone entfernt und wird zerstört wenn es nicht umgehend zurückkehrt" ] remoteExec ["XY_fnc_broadcast", _x]; 
            }; 
        } forEach allPlayers; 
 
        _destructionTimer = _destructionTimer - 1; 
 
    } else { 
        _destructionTimer = 5; 
 
        if( time >= _nextAward ) then { 
            _nextAward = time + 45 + (random 45); 
            { 
                if( alive _x ) then { 
                    _cash = round(17500 + (random 32500)); 
                    diag_log format["<EVENT> Awarding KOTV: %1 (%2) with %3", name _x, getPlayerUID _x, _cash]; 
 
                    [ 0, format["%1 erhält als 'King Of The Vehicle' %2€ Belohnung", name _x, [_cash] call XY_fnc_numberText ]] remoteExec ["XY_fnc_broadcast", civilian]; 
                    [ _cash, false, 2] remoteExec [ "XY_fnc_addCash", _x ]; 
                }; 
            } forEach (crew _vehicle); 
        }; 
    }; 
 
    if( time >= _nextUpdate ) then { 
 
        _markerTitle = "Letzte bekannte Position (King Of The Vehicle)"; 
        { 
            if( alive _x ) exitWith { 
                _markerTitle = format[ "King Of The Vehicle (%1)", name _x ]; 
            }; 
        } forEach (crew _vehicle); 
 
        _marker setMarkerText _markerTitle; 
        _marker setMarkerPos _lastKnownPos; 
        _lastKnownPos = getPos _vehicle; 
        _nextUpdate = time + 30; 
    }; 
}; 
_vehicle setVariable[ "despawn", true, true]; 
 
deleteMarker _marker; 
if( !(alive _vehicle ) ) exitWith { 
    diag_log "<EVENT> Offroader destroyed"; 
}; 
 
// Announce event ending 
for[ {_i = 1}, {_i <= 3}, {_i = _i + 1} ] do { 
    { 
        if( (_x distance _vehicle) < 500 ) then { 
            [ 1, "<t color='#FF0000' size ='3' align='center'>EVENT ENDE</t><br/><t size='1'>Das PvP-Event endet, bitte verlasst den Offroader und entfernt euch umgehend aus seiner Nähe, da er in Kürze zerstört wird" ] remoteExec ["XY_fnc_broadcast", _x]; 
        }; 
    } forEach allPlayers; 
    uisleep 30; 
}; 
 
_vehicle setDamage 1;