// vehicleConfig
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

// returns vehicle configuration

private _class = param[0, "", [""]];
private _side = param[1, playerSide, [sideUnknown]];

if( _class isEqualTo "" || _side isEqualTo sideUnknown ) exitWith {
    format [ "<CERROR> %1 (%2) called vehicleConfig empty/wrong: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
    []
};

private _config = [];
{
    if( ((_x select 0) isEqualTo _side || (_x select 0) isEqualTo sideUnknown) && { (_x select 1) isEqualTo _class } ) exitWith {
        _config = _x;
    };
} forEach XY_vehicleList;

if( _config isEqualTo [] ) then {
    format [ "<CERROR> %1 (%2) called vehicleConfig for unknown vehicle: %3 (side: %4)", profileName, getPlayerUID player, _class ] remoteExec ["XY_fnc_log", 2];
};

_config;