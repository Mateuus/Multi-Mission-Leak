#include "..\..\script_macros.hpp"
/*
 File: fn_copSiren2.sqf
 Author: Bryan "Tonic" Boardwine / ammorosh
 Description:
 Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "admins"}) exitWith {};
for "_i" from 0 to 1 step 0 do {
 if (!(_vehicle getVariable "admins")) exitWith {};
 if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["admins",false,true]};
 if (!alive _vehicle) exitWith {};
 if (isNull _vehicle) exitWith {};
 _vehicle say3D "admins";//Class/name specified in description.ext
 sleep 14.0;//Exactly matches the length of the audio file.
 if (!(_vehicle getVariable "admins")) exitWith {};
};