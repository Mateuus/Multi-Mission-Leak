/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

    Description:
    Runs the spike effect on an affected vehicle
*/

private ["_targets"];

params [["_vehicle",objNull,[objNull]]];

if(isNull _vehicle)exitWith{};

_targets = allPlayers select {(_x distance player) < 300};
[_vehicle,"tyrePop",true] remoteExecCall ["DS_fnc_playSounds",_targets];

_vehicle setHitPointDamage ["HitLFWheel",1];
_vehicle setHitPointDamage ["HitLF2Wheel",1];
_vehicle setHitPointDamage ["HitRFWheel",1];