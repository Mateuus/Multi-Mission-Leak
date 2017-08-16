/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren2"}) exitWith {};

while {true} do
{
	if(!(_vehicle getVariable "siren2")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren2",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "speech";
	sleep 7;
	if(!(_vehicle getVariable "siren2")) exitWith {};
};