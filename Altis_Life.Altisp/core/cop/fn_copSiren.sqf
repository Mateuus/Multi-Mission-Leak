#include "..\..\script_macros.hpp"
/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle GVAR "siren"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
	if(!(_vehicle GVAR "siren")) exitWith {};
	if(EQUAL(count crew _vehicle,0)) then {_vehicle SVAR ["siren",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "SirenLong";//Class/name specified in description.ext
	sleep 5.000;//Exactly matches the length of the audio file.
	if(!(_vehicle GVAR "siren")) exitWith {};
};