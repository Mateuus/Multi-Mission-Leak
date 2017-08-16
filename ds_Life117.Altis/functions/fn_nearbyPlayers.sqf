/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Checks for nearby players
*/

private["_side","_pos","_distance","_return"];

_return = false;
_pos = [_this,0,(getPos player),[[]]] call BIS_fnc_param;
_distance = [_this,1,100,[0]] call BIS_fnc_param;
_side = [_this,2,sideUnknown,[sideUnknown]] call BIS_fnc_param;

{if((side _x == _side)&&(_pos distance _x < _distance)&&(alive _x)&&(_x != player))then{_return = true};}forEach playableUnits;

_return;