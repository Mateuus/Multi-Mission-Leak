/*
	File: fn_removeHeadgear.sqf
	Author: Michael Francis
	
	Description:
	Removes headgear from restrained player
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
removeHeadgear _unit;