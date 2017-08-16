/*
	File: fn_setFace.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Changes a player's face
*/

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;
_face = [_this,1,"",[""]] call BIS_fnc_param;

if (isNull _unit || _face == "") exitWith {};
if (_face == face _unit) exitWith {};

_unit setFace _face;