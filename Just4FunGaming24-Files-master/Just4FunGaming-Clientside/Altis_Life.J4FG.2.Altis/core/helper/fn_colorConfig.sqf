// colorConfig
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
//
// return vehicle color configuration
// param 0 = vehicle class
// param 1 (optional)
//       -1 (default) = return all colors
//     <index> = return specific color

private _class = param[0, "", [""] ];
private _index = param[1, -1, [0] ];

if( _class isEqualTo "" ) exitWith {
    format [ "<CERROR> %1 (%2) called colorConfig empty/wrong: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
    []
};

private _config = [];

{
    if( (_x select 0) == _class ) exitWith {
        _config = _x select 1;
    };
} forEach XY_vehicle_skins;

if( _config isEqualTo [] ) then {
    // format [ "<CERROR> %1 (%2) called colorConfig for unknown vehicle: %3", profileName, getPlayerUID player, _class ] remoteExec ["XY_fnc_log", 2];
} else {
    if( _index >= 0 ) then {
        _config = _config select _index;
    };
};

_config;