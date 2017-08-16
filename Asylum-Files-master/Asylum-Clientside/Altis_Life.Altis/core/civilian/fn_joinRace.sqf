/*
	File: fn_joinRace.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Adds player to the race queue
*/
private["_robber"];
_raceId = {if(player distance getMarkerPos format["race_%1_start",_x] < 15) exitWith {_x}} forEach [1,2,3,4,5];
if (life_race > 0) exitWith{hint "You are already entered in a race."};
if (_raceId < 1) exitWith {};
_startPos = getMarkerPos format["race_%1_start", _raceId];
if (player distance _startPos > 15) exitWith {};
if (vehicle player == player) exitWith {};
_start = call compile (format ["life_race%1", _raceId]);

if (_start > 0) exitWith {hint "A race is in progress at this location.  Try again in a couple of minutes."};

titleText[format["The race will begin shortly. GET READY!"],"PLAIN"];
life_race = _raceId;
[[vehicle player, _raceId],"ASY_fnc_joinRace",false,false] spawn life_fnc_MP;

if ((vehicle player) getVariable ["temporary", false]) then
{
	(vehicle player) setDamage 0;
	(vehicle player) setFuel 1;
};