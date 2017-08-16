// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _unlock = param[ 0, false, [false] ];

disableSerialization;

if(lbCurSel 2802 == -1) exitWith {
    hint localize "STR_Global_NoSelection"
};
if( typeName XY_garageSpawnPoints == "STRING" ) then {
    XY_garageSpawnPoints = [XY_garageSpawnPoints];
};

private _spawnPositions = [];

// Convert markers to [position, direction]
if( XY_spawnVehicleOnPosition ) then {
    _spawnPositions = XY_garageSpawnPoints;
    XY_spawnVehicleOnPosition = false;
} else {
    {
        _spawnPositions pushBack [ getMarkerPos _x, markerDir _x ];
    } forEach XY_garageSpawnPoints;
};

private _vehicle = lbData[2802, lbCurSel 2802];
_vehicle = (call compile format["%1", _vehicle]) select 0;

private _vid = lbValue[2802, lbCurSel 2802];

if( isNil "_vehicle" ) exitWith {
    hint localize "STR_Garage_Selection_Error"
};

private _price = -1;

if( _unlock ) then {
    _price = 0;
} else {
    private _config = [ _vehicle ] call XY_fnc_vehicleConfig;
    if( !(_config isEqualTo []) ) then {
        _price = _config select 6;
    };
};

if( _price < 0 ) exitWith {
    hint "Dieses Fahrzeug kann nicht ausgeparkt werden";
};

if( XY_CA < _price ) exitWith {
    hint format[(localize "STR_Garage_CashError"), [_price] call XY_fnc_numberText];
};

// Send request to server, to checkout the vehicle from the database...
[_vid, _price, _spawnPositions, player, [playerSide, civilian] select _unlock ] remoteExec ["XYDB_fnc_retrieveVehicle", XYDB];

hint localize "STR_Garage_SpawningVeh";