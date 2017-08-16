/*
file name: fn_say3D.sqf

Author: Blackd0g
Description : plays a local sound on each client with lhm_fnc_mp
*/
private ["_unit","_sound","_distance"];
_unit = param [0,ObjNull,[ObjNull]];
_sound = param [1,"",[""]];

if(isNull _unit OR _sound == "") exitWith {}; //Bad thingies?
if(player distance _unit > 2500) exitWith {}; //Don't run it... They're to far out..

_unit say3D _sound;