// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _vehicle = objNull;

// Possible bug: the sort order seems only to be correctly nearest-to-farest per vehicle category
private _nearVehicles = nearestObjects[ player, ["Car", "Air", "Ship"], 50];
{
    private _owner = _x getVariable["owner", ""];
    if( (getPlayerUID player) isEqualTo _owner && ( _vehicle isEqualTo objNull || { player distance _x < player distance _vehicle } ) ) exitWith {
        _vehicle = _x;
    };
} forEach _nearVehicles;

if( isNull _vehicle ) exitWith {
    hint localize "STR_Garage_NoNPC"
};

hint localize "STR_Garage_Store_Server";
XY_garageStore = true;

[_vehicle, false, player, false] remoteExec ["XYDB_fnc_vehicleStore", XYDB];