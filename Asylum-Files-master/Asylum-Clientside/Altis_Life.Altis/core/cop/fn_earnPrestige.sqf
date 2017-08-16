/*
	File: fn_earnPrestige.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Player earned prestige.  Distribute!
*/

private ["_amount"];

_amount = [_this,0,0,[0]] call BIS_fnc_param;

if (playerSide != west) exitWith {};

[[player, _amount],"life_fnc_addPrestige",west,false] spawn life_fnc_MP;

if (!life_precinct && life_coplevel < 6) exitWith {};
life_prestige = life_prestige + (_amount * 0.4);

systemChat format["You've earned %1 prestige.", (_amount * 0.4)];