#include "..\..\script_macros.hpp"
/*
	File: fn_vehicleRepair.sqf
	Author: Larry
	License: Repairs the Vehicle
*/
private ["_veh","_mode"];
_mode = param [0,0,[0]];
_veh = param [1,ObjNull,[ObjNull]];

if (EQUAL(_mode,0)) then {
	_veh setHitPointDamage ["HitEngine",0];
	_veh setHitPointDamage ["HitEngine1",0];
	_veh setHitPointDamage ["HitEngine2",0];
	_veh setHitPointDamage ["HitEngine3",0];
	_veh setHitPointDamage ["HitEngine4",0];
};

if (EQUAL(_mode,1)) then {
	_repPart = param [2,"",[""]];
	_veh setHitPointDamage [_repPart,0];
};