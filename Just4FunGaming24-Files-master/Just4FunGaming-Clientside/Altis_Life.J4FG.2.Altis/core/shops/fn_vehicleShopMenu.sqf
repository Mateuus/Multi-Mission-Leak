// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _shop = (_this select 3) param[0, "", [""] ];
private _sideCheck = (_this select 3) param [1, sideUnknown,  [civilian] ];
private _spawnMarkers = (_this select 3) param [2, "", ["", []] ];

disableSerialization;

if( dialog || _shop isEqualTo "" || _spawnMarkers isEqualTo [] ) exitWith {};

if( _sideCheck != sideUnknown && playerSide != _sideCheck ) exitWith {
    hint localize "STR_Shop_Veh_NotAllowed"
};

private _heading = _shop;

if( !(switch (_shop) do {
    case "civ_car": { _heading = "Autohändler"; license_civ_driver };
    case "civ_ship": { _heading = "Bootshändler"; license_civ_boat };
    case "civ_truck": { _heading = "LKW-Händler"; license_civ_truck };
    case "civ_air": { _heading = "Helikopter-Händler"; license_civ_air };
    case "jet_shop": { _heading = "Jet-Shop"; license_civ_air };
    case "civ_reb": { _heading = "Rebellenausrüster"; license_civ_rebel };

    case "cop_car": { _heading = "Polizei-Fahrzeuge"; true };
    case "cop_air": { _heading = "Polizei-Helikopter"; license_cop_air || license_cop_air_small };
    case "cop_ship": { _heading = "Polizei-Boote"; license_cop_cg };

    case "med": { _heading = "Sanitäterfahrzeuge"; true };
    case "thw": { _heading = "THW-Fahrzeuge"; true };

    default { true };

}) ) exitWith {
    hint "Dir fehlt die passende Lizenz um hier einzukaufen";
};

if( !(createDialog "XY_dialog_vehicleShop") ) exitWith {};

if( (typeName _spawnMarkers) isEqualTo "STRING" ) then {
    _spawnMarkers = [_spawnMarkers];
};

// Convert markers to [position, direction]
private _spawnPositions = [];
{
    _spawnPositions pushBack [ getMarkerPos _x, markerDir _x ];
} forEach _spawnMarkers;

XY_currentVehicleShop = [_shop, _spawnPositions];

ctrlSetText [ 2301, _heading ];

private _vehicleList = [];
{
    if( _shop in (_x select 8) && { call (_x select 9) } ) then {
        _vehicleList pushBack _x;
    };
} forEach XY_vehicleList;

private _control = (findDisplay 2300) displayCtrl 2302;
lbClear _control;
ctrlShow [2330, false];
ctrlShow [2304, false];

{
    _vehicleInfo = [_x select 1] call XY_fnc_fetchVehInfo;
    _control lbAdd (_vehicleInfo select 3);
    _control lbSetPicture [(lbSize _control) - 1, _vehicleInfo select 2];
    _control lbSetData [(lbSize _control) - 1, _x select 1];
    _control lbSetValue [(lbSize _control) - 1, _forEachIndex];
} forEach _vehicleList;