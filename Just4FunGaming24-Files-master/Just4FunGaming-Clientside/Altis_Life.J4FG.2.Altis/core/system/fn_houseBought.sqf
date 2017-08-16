// Written by Kupferkarpfen
// License: CC BY-NC-SA 4.0

private["_house","_uid","_action","_houseCfg","_housec"];

if( !params[
    
    [ "_house", ObjNull, [ObjNull] ],
    [ "_price", -1,      [0]       ]
    
] ) exitWith {
    format [ "<CERROR> %1 (%2) invalid call XY_fnc_houseBought: %3", profileName, getPlayerUID player, _this ] remoteExec ["XY_fnc_log", 2];
};

if( !([_price] call XY_fnc_pay) ) exitWith {
    hint "Bezahlung fehlgeschlagen";
    [_house, player, 0] remoteExec ["XY_fnc_removeHouse", 2];
};

_house setVariable["house_owner", [getPlayerUID player, profileName], true];
_house setVariable["locked", true, true];
_house setVariable["trunk", [[], 0], true];
_house setVariable["containers", [], true];
_house setVariable["uid", round(random 99999), true];

XY_vehicles pushBack _house;
XY_houses pushBack [ str(getPosATL _house), [] ];

_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");

_marker = createMarkerLocal [format["house_%1",(_house getVariable "uid")],getPosATL _house];
_marker setMarkerTextLocal _houseName;
_marker setMarkerColorLocal "ColorBlue";
_marker setMarkerTypeLocal "loc_Lighthouse";

_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _house) >> "numberOfDoors");
for "_i" from 1 to _numOfDoors do {
    _house setVariable[ format["bis_disabled_Door_%1", _i], 1, true];
};

hint "Das Haus gehört nun dir";