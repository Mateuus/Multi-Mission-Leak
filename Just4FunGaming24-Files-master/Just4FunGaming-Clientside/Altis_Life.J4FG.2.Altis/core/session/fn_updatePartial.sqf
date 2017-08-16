// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private _mode = param[0, -1, [0]];

if( _mode < 0 ) exitWith {
    format [ "<CERROR> %1 (%2) invalid call XY_fnc_updatePartial: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
};

private _packet = switch(_mode) do {
    case 0: {
        [XY_CC, XY_CA];
    };
    case 1: {
        // Prevent saving gear when dead (#KK)
        if( !(alive player) || { !(isNil "XY_corpse") } ) then {
            [];
        } else {
            call XY_fnc_saveGear;
        };
    };
    case 2: {
        [XY_isArrested];
    };
    default { _mode = -1; [] };
};

if( _mode < 0 ) exitWith {};

[ player, playerSide, _mode, _packet ] remoteExec ["XYDB_fnc_updatePartial", XYDB];