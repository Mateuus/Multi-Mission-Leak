/*
	File: fn_removeBackpack.sqf
	Author: Michael Francis
	
	Description:
	Removes backpack from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeBackpack _unit;