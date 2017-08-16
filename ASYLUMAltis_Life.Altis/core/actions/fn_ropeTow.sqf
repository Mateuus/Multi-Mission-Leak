/*
	File: fn_ropeTow.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Increases or decreases the length of a tow rope
*/

if (true) exitWith { hint "This feature is disabled until Bohemia fixes a related memory leak!" };

private ["_vehicle","_rope","_rope2"];

_vehicle = cursorTarget;

if (isNull life_target_towRope) exitWith {};
if (player distance life_target_towRope > 15) exitWith {};
if ((vehicle player) != player) exitWith {hint "You can't do this from within a vehicle!"};
if (life_target_towRope in (ropeAttachedObjects _vehicle)) exitWith {hint "These vehicles are already connected."};

if(!([false,"towRope",1] call life_fnc_handleInv)) exitWith {};

if (!(_vehicle isKindOf "Air") && !(_vehicle isKindOf "Car")) exitWith {};
if (locked _vehicle > 1) exitWith { hint "This vehicle cannot be towed while locked." };

_rope = ropeCreate [life_target_towRope, "doplnovani", _vehicle, "Stopa PLL", 5];
_rope2 = ropeCreate [life_target_towRope, "doplnovani", _vehicle, "Stopa PPP", 5];

life_target_towRope = objNull;