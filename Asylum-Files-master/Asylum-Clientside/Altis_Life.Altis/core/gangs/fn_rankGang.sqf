/*
	File: fn_rankGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Update rank of player
*/

private ["_id","_rank","_name"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_rank = [_this,1,2,[2]] call BIS_fnc_param;

if (_rank < 0) exitWith {};

life_gang_rank = _rank;

hint format["Your gang rank was changed to %1 by %2.", _rank, name _unit];

[] spawn life_fnc_sessionUpdate;