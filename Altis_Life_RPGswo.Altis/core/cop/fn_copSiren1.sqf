/*
	File: fn_copSiren.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Starts the cop siren sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "siren1"}) exitWith {};

//while {true} do{
	if(!(_vehicle getVariable "siren1")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["siren1",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};
	_vehicle say3D "Polizeiheulen";
	sleep 2;
	_vehicle setVariable["siren1",false,true];
//};