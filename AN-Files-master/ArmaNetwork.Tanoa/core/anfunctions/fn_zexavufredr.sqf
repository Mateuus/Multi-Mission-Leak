/*
	File: fn_nearUnits.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Checks for units near (human units)

	Returns:
	TRUE - Units are near
	FALSE - No units near
*/
private["_faction","_position","_radius","_ret"];
_faction = param [0,sideUnknown,[sideUnknown]];
_position = param [1,(getPos player),[[]]];
_radius = param [2,30,[0]];
_ret = false;

//Error check
if(_faction isEqualTo sideUnknown) exitWith {_ret};
_ret = {_x != player && side _x isEqualTo _faction && alive _x && _position distance _x < _radius} count playableUnits > 0;
_ret;
