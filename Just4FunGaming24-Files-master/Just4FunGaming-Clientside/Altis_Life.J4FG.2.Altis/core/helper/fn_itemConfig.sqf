// itemConfig
// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0
//
// return item configuration
// supports both short name ("apple") or long name ("live_inv_apple")

private _name = param[ 0, "",  [""] ];
private _config = [];

if( _name isEqualTo "" ) then {
    format [ "<CERROR> %1 (%2) called itemConfig empty/wrong: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
} else {

    {
        if( ((_x select 6) isEqualTo _name) || { (_x select 0) isEqualTo _name } ) exitWith {
            _config = _x;
        };
    } forEach XY_virtItems;

    if( _config isEqualTo [] ) then {
        format [ "<CERROR> %1 (%2) called itemConfig for unknown item: %3", profileName, getPlayerUID player, _name ] remoteExec ["XY_fnc_log", 2];
    };
};
_config;