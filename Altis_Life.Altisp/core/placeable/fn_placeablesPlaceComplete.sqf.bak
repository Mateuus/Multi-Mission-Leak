/*
	File: fn_placeablesPlaceComplete.sqf

	Author: Maximum
	Description: Placeables for the cop\medic sides.
*/
disableSerialization;
if (!life_barrier_active) exitWith {};
if (life_barrier_activeObj == ObjNull) exitWith {};
_uid = getPlayerUID player;

_currentPos = getPosATL life_barrier_activeObj;
detach life_barrier_activeObj;

life_barrier_activeObj setPos[(getPos life_barrier_activeObj select 0), (getPos life_barrier_activeObj select 1), 0];
life_barrier_activeObj enableSimulationGlobal true;
life_barrier_activeObj setVariable ["owner", _uid, true];
life_bar_placey pushBack life_barrier_activeObj;
life_barrier_active = false;
life_barrier_activeObj = ObjNull;