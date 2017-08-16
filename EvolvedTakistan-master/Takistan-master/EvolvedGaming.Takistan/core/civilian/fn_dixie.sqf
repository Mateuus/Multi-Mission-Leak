#include <macro.h>
/*
	File: fn_dixie.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle GVAR "dixie"}) exitWith {};
if(!(_vehicle GVAR "dixie")) exitWith {};
if(EQUAL(count crew _vehicle,0)) then {_vehicle SVAR ["dixie",false,true]};
if(!alive _vehicle) exitWith {};
	
_vehicle say3D "dixie";