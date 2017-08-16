// calculateWeight
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
//
// can be called to calculate weight of a [itemname, itemcount] array

private _items = param[ 0, [], [[]] ];

private _error = false;
private _weight = 0;
{
    if( (typeName _x) isEqualTo "ARRAY" && count _x >= 2 ) then {
        _weight = _weight + ((([_x select 0] call XY_fnc_itemConfig) select 1) * (_x select 1));
    } else {
        _error = true;
    };
} forEach _items;

if( _error ) then {
    format [ "<CERROR> %1 (%2) called calculateWeight incorrectly: %3", profileName, getPlayerUID player, _items ] remoteExec ["XY_fnc_log", 2];
};

_weight;