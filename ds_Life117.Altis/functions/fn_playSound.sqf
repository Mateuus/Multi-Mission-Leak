/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Just plays a sound to all those nearby
*/

private ["_long"];

_long = [_this,2,false,[false]] call BIS_fnc_param;

if(_long)then
	{
	(_this select 0) say3D [(_this select 1),500,1];
	}
	else
	{
	(_this select 0) say3D (_this select 1);
	};


