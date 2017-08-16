#include <macro.h>

/*
	File: fn_medicPhaser.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the medic phaser sound for other players
*/
private["_vehicle"];
_vehicle = param [0,ObjNull,[ObjNull]];

if(isNull _vehicle) exitWith {};
if(isNil {_vehicle getVariable "phaser"}) exitWith {};
if(!(_vehicle getVariable "phaser")) exitWith {};
if(count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["phaser",false,true]};
if(!alive _vehicle) exitWith {};
_vehicle say3D "dual_phaser";
