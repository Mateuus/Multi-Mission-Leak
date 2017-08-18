/*
	File: fn_removeVest.sqf
	Author: Michael Francis
	
	Description:
	Removes vest from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeVest _unit;