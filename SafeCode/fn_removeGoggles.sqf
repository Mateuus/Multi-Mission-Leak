/*
	File: fn_removeGoggles.sqf
	Author: Michael Francis
	
	Description:
	Removes goggles from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeGoggles _unit;