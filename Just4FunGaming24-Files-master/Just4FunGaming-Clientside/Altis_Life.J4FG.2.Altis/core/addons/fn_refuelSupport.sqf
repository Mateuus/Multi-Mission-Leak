// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

{
    if( ([_x, 5] call KRON_StrLeft) isEqualTo "fuel_" ) then {
        diag_log format["<FUEL> actions to sourrounding fuel stations @ %1", _x];

        {
            _x setFuelCargo 0;
            _x addAction[ "Tanken", XY_fnc_refuel, "", 10, false, true, "", "(vehicle player) isEqualTo player", 3 ];
        } forEach nearestObjects[ getMarkerPos _x, ["Land_fs_feed_F", "Land_FuelStation_Feed_F"], 50 ];

    };
} forEach allMapMarkers;