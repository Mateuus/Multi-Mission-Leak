/*
	File: fn_removeUniform.sqf
	Author: Michael Francis
	
	Description:
	Removes uniform from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeUniform _unit;