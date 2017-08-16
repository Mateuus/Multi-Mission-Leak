/*
    File: fn_updateRequest.sqf
    Author: Tonic
*/

if( !(alive player) || !(isNil "XY_corpse") ) exitWith {};

private _packet = [ player, profileName, playerSide, XY_CC, XY_CA ];

private _array = [];
private _flag = switch(playerSide) do {case west: {"cop"}; case civilian: {"civ"}; case independent: {"med"}; case east: {"thw"};};
{
    if( (_x select 1) isEqualTo _flag) then {
        _array pushBack [_x select 0, (missionNamespace getVariable (_x select 0))];
    };
} forEach (XY_licenses + XY_training);
_packet pushBack _array;

_packet pushBack (call XY_fnc_saveGear);
switch (playerSide) do {
    case civilian: {
        _packet pushBack XY_isArrested;
    };
};
_packet remoteExec ["XYDB_fnc_updateRequest", XYDB];