// Written by Kupferkarpfen 
// License: CC BY-NC-SA 4.0 
 
private _vehicle = param[ 0, objNull, [objNull] ]; 
private _impound = param[ 1, false,   [false]   ]; 
private _unit =    param[ 2, objNull, [objNull] ]; 
private _lock =    param[ 3, false,   [false]   ]; 
 
if( isNull _vehicle || isNull _unit ) exitWith {}; 
 
_fncImpound = { 
 
    private _vehicle = _this select 0; 
    private _lock = _this select 1; 
 
    private _vid = _vehicle getVariable["dbInfo", -1]; 
 
    if( _vid >= 0 ) then { 
        _vehicle setVariable["trunk", [[], 0], true]; 
        [_vehicle] call XYDB_fnc_updateVehicle; 
        [ format[ "UPDATE vehicles SET active = '0', locked = '%1', damage = '""[]""', fuel = '1', ts_modified = CURRENT_TIMESTAMP WHERE id = '%2'", [0, 1] select _lock, _vid ], 1 ] call XYDB_fnc_asyncCall; 
    }; 
    deleteVehicle _vehicle; 
}; 
 
if( !(isNull _vehicle) ) then { 
 
    private _vid = _vehicle getVariable["dbInfo", -1]; 
    private _owner = _vehicle getVariable["owner", ""]; 
    if( _vehicle getVariable["unusable", false] ) then { 
        _impound = true; 
    }; 
 
    if( _impound ) then { 
 
        [_vehicle, _lock] call _fncImpound; 
 
    } else { 
        private _message = ""; 
        if( _vid >= 0 ) then { 
            if( _owner == getPlayerUID _unit ) then { 
                [_vehicle, _lock] call _fncImpound; 
                _message = "Das Fahrzeug wurde in der Garage geparkt"; 
            } else { 
                _message = "Das Fahrzeug gehört nicht dir und kann deshalb nicht in der Garage geparkt werden"; 
            }; 
        } else { 
            _message = "Mietwagen können nicht in der Garage geparkt werden"; 
        }; 
        [1, _message] remoteExec ["XY_fnc_broadcast", _unit]; 
    }; 
}; 
 
[] remoteExec ["XY_fnc_resetImpoundVars", _unit];