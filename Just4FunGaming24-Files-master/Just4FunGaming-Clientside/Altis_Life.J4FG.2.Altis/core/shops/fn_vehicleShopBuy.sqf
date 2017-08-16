// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _mode;

if( !params[ ["_mode", false, [false]] ]) exitWith {};

if((lbCurSel 2302) == -1) exitWith {
    hint localize "STR_Shop_Veh_DidntPick"
};

private _className = lbData[2302, lbCurSel 2302];
private _colorIndex = lbValue[2304, lbCurSel 2304];

private _config = [ _className ] call XY_fnc_vehicleConfig;
if( _config isEqualTo [] ) exitWith {};

private _price = _config select ([ 4, 3 ] select _mode);
if( _price < 1 ) exitWith {
    hint format["Das Fahrzeug kann nicht %1 werden", ["gemietet", "gekauft"] select _mode];
};
if( _price > XY_CA + XY_CC ) exitWith {
    hint "Du hast nicht genügend Geld";
};

private _spawnPoints = XY_currentVehicleShop select 1;

// Use common spawn mechanism with temporary database id, the correct db id will be set by the server inside vehicleCreate:
private _vehicle = [ _className, _spawnPoints, _price, _colorIndex, -1, [[], 0], playerSide ] call XY_fnc_spawnVehicle;

if( !isNil("_vehicle") ) then {
    [ getPlayerUID player, 10, format ["Kauft Fahrzeug %1 für %2€ / Leihwagen: %3", getText(configFile >> "CfgVehicles" >> (_className) >> "displayName"), [_price] call XY_fnc_numberText, [ "JA", "NEIN" ] select _mode ] ] remoteExec ["XYDB_fnc_log", XYDB];

    // Add database entry for vehicle
    if( _mode ) then {
        [ getPlayerUID player, playerSide, _vehicle, _colorIndex] remoteExec ["XYDB_fnc_vehicleCreate", XYDB];
    };
};