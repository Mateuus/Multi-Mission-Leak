/*
	File: fn_setUniform.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Sets given uniform texture to a unit, should be done LOCAL
*/

private ["_unit","_texture"];
_unit = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_tarray = [_this, 1, ["",""], [[]]] call BIS_fnc_param;
_isBackpack = [_this, 2, false, [false]] call BIS_fnc_param;

if (count _tarray < 2) exitWith {};

_base = _tarray select 0;
_texture = _tarray select 1;

if (isNull _unit || _texture == "") exitWith {};
if (!_isBackpack && _base != uniform _unit) exitWith {};
if (_isBackpack && _base != backpack _unit) exitWith {};

if (_isBackpack) then { (backpackContainer _unit) setObjectTexture [0, _texture]; }
else { _unit setObjectTexture [0, _texture]; };