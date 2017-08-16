/*
	File: fn_ropeLength.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Increases or decreases the length of a tow rope
*/
if (true) exitWith { hint "This feature is disabled until Bohemia fixes a related memory leak!" };
_increase = [_this,3,false,[false]] call BIS_fnc_param;

if ((vehicle player) == player) exitWith {};
if (driver (vehicle player) != player) exitWith {hint "Only the driver/pilot can adjust rope length."};
if (count (ropes (vehicle player)) < 1) exitWith {hint "There are no ropes on this vehicle."};
if (!(ropeUnwound ((ropes (vehicle player)) select 0))) exitWith {hint "Your ropes are already adjusting. Patience!"};

{
	_length = ropeLength _x;
	if (_increase) then { _length = _length + 2; }
	else { _length = _length - 2; };
	if (_length < 2) then { _length = 2; };
	if (_length > 12) then { _length = 12; };
	ropeUnwind [ _x, 2, _length ];
} forEach (ropes (vehicle player));