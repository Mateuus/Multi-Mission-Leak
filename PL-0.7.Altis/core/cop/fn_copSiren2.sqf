#include "..\..\script_macros.hpp"
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the cop siren2 sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle GVAR "siren2"}) exitWith {};

while {true} do {
	if(!(_vehicle GVAR "siren2")) exitWith {};
	if(EQUAL(count crew _vehicle,0)) then {_vehicle SVAR ["siren2",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "Siren_Long_2";//Class/name specified in description.ext
	sleep 5.870;//Exactly matches the length of the audio file.
	if(!(_vehicle GVAR "siren2")) exitWith {};
};