
/*
    Author: Blackd0g
    File: fn_sirenSoundEx.sqf

    Description:
    New version of vehicle siren sounds

    Parameters:

    Returns:
    Nothing
*/
private ["_vehicle","_time","_sound"];
_vehicle = param [0,objNull,[objNull]];
_time = param [1,1,[1]];
_sound = param [2,"",[""]];

if (isNull _vehicle || !(_vehicle getVariable "siren")) exitWith {};

[_vehicle,_time,_sound] call lhm_fsm_fnc_sirenSoundLoop;