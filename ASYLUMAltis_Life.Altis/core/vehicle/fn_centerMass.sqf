/*
	File: fn_centerMass.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets center of mass of given vehicle.
*/

private ["_veh", "_center"];

_veh = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_center = [_this,1,[0,0,0],[[0,0,0]]] call BIS_fnc_param;

_veh setCenterOfMass _center;