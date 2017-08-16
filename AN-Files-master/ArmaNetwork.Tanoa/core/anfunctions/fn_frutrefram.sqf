/*
	File: fn_dixie.sqf
	Author: Bryan "Tonic" Boardwine
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "dixie"}) exitWith {};
if(!(_vehicle getVariable "dixie")) exitWith {};
if(count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["dixie",false,true]};
if(!alive _vehicle) exitWith {};
_vehicle say3D "dixie";
_vehicle setVariable ["dixie",false,true];
