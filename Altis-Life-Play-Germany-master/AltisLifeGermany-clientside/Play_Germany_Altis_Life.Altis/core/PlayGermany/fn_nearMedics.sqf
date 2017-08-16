/*
	File: fn_nearMedics.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by PlayGermany
	
	Description:
	Checks for medics nearby
	
	Returns:
	TRUE - medics are near
	FALSE - No medics near
*/
private["_position","_radius","_ret"];
_position = [_this,0,(getPos player),[[]]] call BIS_fnc_param;
_radius = [_this,1,30,[0]] call BIS_fnc_param;
_ret = false;

_ret = {_x != player && side _x == independent && ((_x getVariable ["hsd",""]) in ["med","thw"]) && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;