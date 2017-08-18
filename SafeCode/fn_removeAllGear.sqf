/*
	File: fn_removeAllGear.sqf
	Author: Michael Francis
	
	Description:
	Removes all gear from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeUniform _unit;
removeVest _unit;
removeBackpack _unit;
removeGoggles _unit;
removeHeadGear _unit;