#include "..\..\script_macros.hpp"
/*
	File: fn_teleportPlayer.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
*/
private["_admin"];
_admin = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_newPos = GetPosATL player;

if(vehicle _admin == _admin) then {
	_admin setPos _newPos;
} else { 
	(vehicle _admin) setPos _newPos;
};