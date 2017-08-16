/*
	File: fn_copWoop.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];
if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "horn"}) exitWith {};
if(!(_vehicle getVariable "horn")) exitWith {};
if(count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["horn",false,true]};
if(!alive _vehicle) exitWith {};
_vehicle say3D "woopwoop";
