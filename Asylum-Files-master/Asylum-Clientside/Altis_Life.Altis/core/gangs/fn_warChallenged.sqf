/*
	File: fn_warChallenged.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Received a gang war challenge
*/

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_gang = [_this,1,"",[""]] call BIS_fnc_param;
_gangName = [_this,2,"",[""]] call BIS_fnc_param;

if (life_gang == "0") exitWith {};

if (!(_gang in life_gang_challenges)) then
{
	life_gang_challenges pushBack _gang;
	hint parseText format ["<t color='#FF0000'><t size='2'>War Challenge!</t></t><br/><t color='#FFFFFF'>You have received a challenge of war from %1 of <t color='#FF0000'>%2</t>!", name _unit, _gangName];
};
if (!isNull (findDisplay 9580)) then { [] spawn life_fnc_gangWars; };