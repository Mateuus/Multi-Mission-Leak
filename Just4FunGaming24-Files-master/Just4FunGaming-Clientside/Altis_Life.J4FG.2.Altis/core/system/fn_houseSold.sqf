// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_house","_uid","_action","_houseCfg","_housec"];

if( !params[
    
    [ "_house", ObjNull,  [ObjNull] ],
    [ "_uid",   0,        [0]       ],
    [ "_price", -1,       [0]       ]
    
] ) exitWith {
    format [ "<CERROR> %1 (%2) invalid call XY_fnc_houseSold: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
};

deleteMarkerLocal format["house_%1", _uid];

XY_CA = XY_CA + _price;
[0] call XY_fnc_updatePartial;

_index = XY_vehicles find _house;
if(_index != -1) then {
    XY_vehicles set[_index,-1];
    XY_vehicles = XY_vehicles - [-1];
};

_index = [str(getPosATL _house),XY_houses] call XY_fnc_index;
if(_index != -1) then {
    XY_houses set[_index,-1];
    XY_houses = XY_houses - [-1];
};

hint "Das Haus wurde verkauft!";