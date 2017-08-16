/*
	File: fn_achievementGrant.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Awards player with an achievement.
*/
private ["_index","_achievement"];
_index = [_this,0,-1,[-1]] call BIS_fnc_param;

_achievement = life_achievementInfo select _index; // side, title, condition, description, reward description, title

if (_index in life_achievementInfo) exitWith {};
if (!(playerSide in (_achievement select 0))) exitWith {};

life_achievements pushBack _index;
["Achievement",[format["Achievement Unlocked: %1", _achievement select 1]]] call bis_fnc_showNotification;