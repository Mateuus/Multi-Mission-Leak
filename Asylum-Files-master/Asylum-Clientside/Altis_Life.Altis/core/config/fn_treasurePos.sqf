/*
	File: fn_treasurePos.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Locations of all treasure map sites.
*/
private["_id"];

_id = [_this,0,-1,[0]] call BIS_fnc_param;
if(_id == -1) exitWith {};

switch (_id) do
{
	case 1: { [9936,12103,0] };
	case 2: { [12814,9412,0] };
	case 3: { [9936,6716,0] };
	case 4: { [13782,10930,0] };
	case 5: { [11362,7235,0] };
	default { [0,0,0] };
};