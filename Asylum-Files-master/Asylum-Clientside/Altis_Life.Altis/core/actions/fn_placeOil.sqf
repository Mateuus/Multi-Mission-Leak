/*
	File: fn_placeOil.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Place an oil barrel in a boat.
*/

_vehicle = cursorTarget;

if (isNull life_holding_barrel) exitWith {};
if (!((typeOf _vehicle) in IL_Supported_Vehicles_BOAT)) exitWith {};
if (count(nearestObjects [player, ["Land_MetalBarrel_F"], 5]) > 1) exitWith {hint "Too many barrels nearby; you can only store 1 barrel in your boat at a time."};

_barrel = life_holding_barrel;
[] call life_fnc_dropOil;

_pos = if (typeOf _vehicle == "C_Boat_Transport_02_F") then { [0,1,-0.4] } else { [0,-1,-0.4] };
_barrel setPos [0,0,0];
_barrel attachTo [_vehicle, _pos];
_vehicle setVariable ['oil_barrel', _barrel, true];
