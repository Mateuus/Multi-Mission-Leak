/*
	File: fn_raceWon.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	A player has won the race!
*/
_raceId = [_this,0,0,[0]] call BIS_fnc_param;
_vehicle = [_this,1,objNull,[objNull]] call BIS_fnc_param;
_ticks = [_this,2,0,[0]] call BIS_fnc_param;

life_race = 0;
if (_ticks > 0) then
{
	hint format["The race has been won by the vehicle driven by %1 with a time of %2 minutes.", name (driver _vehicle), [(_ticks / 60)] call life_fnc_numberText];
}
else
{
	hint format["The race has been won by the vehicle driven by %1.", name (driver _vehicle)];
};

if ((vehicle player) getVariable ["temporary", false]) then
{
	(vehicle player) setFuel 0;
	(vehicle player) setHit ["wheel_1_1_steering", 1];
	(vehicle player) setHit ["wheel_1_2_steering", 1];
	(vehicle player) setHit ["wheel_2_1_steering", 1];
	(vehicle player) setHit ["wheel_2_2_steering", 1];
};