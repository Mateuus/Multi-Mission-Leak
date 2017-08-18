/*
	File: fn_placeObject.sqf
	Author: John "Paratus" VanderZwet
	compatibility edits for STS by Kevin
	
	Description:
	Places an object in the world.
*/
private ["_item","_index","_object"];

_item = [_this,0,"",[""]] call BIS_fnc_param;
if (_item == "") exitWith {hint "Null Item!"};

closeDialog 0;

if (!isNull life_placing) exitWith {hint "You are already placing another object.";};

_index = [_item,life_placeable] call TON_fnc_index;
if (_index < 0) exitWith {hint "Index is Less than 0"};

_object = ((life_placeable select _index) select 1) createVehicle [0,0,0];
_object attachTo[player,[0,5.5,((life_placeable select _index) select 3)]];
_object setDir 0;
_object setVariable["owner",true,true];
_object allowDamage false;
life_placing = _object;

//Clear ammo from HMG
[_object] call life_fnc_clearVehicleAmmo;
