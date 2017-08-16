/*
	File: fn_SKsirene.sqf
	Author: Eisenschmiede
*/
private _vehicle = param[0,objNull,[objNull]];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "SKsirene"}) exitWith {};

while {true} do
{
	if(!(_vehicle getVariable "SKsirene")) exitWith {};
	if(count (crew (_vehicle)) == 0) then {_vehicle setVariable["SKsirene",false,true]};
	if(!alive _vehicle) exitWith {};
	if(isNull _vehicle) exitWith {};

	_vehicle say3D "bank";
	sleep 16.2;

	if(!(_vehicle getVariable "SKsirene")) exitWith {};
};