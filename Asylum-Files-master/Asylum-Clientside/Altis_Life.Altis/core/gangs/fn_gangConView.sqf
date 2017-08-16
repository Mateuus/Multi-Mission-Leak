/*
	File: fn_gangConView.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Returns the contents inside a capture container
*/

private ["_container"];
_container = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_contents = _container getVariable ["gangContainer", []];
if (count _contents < 1) exitWith { hint "Contents of this container are not valid." };

titleText[format["This object contains %1 %2.", [_contents select 1] call life_fnc_numberText, [_contents select 0] call life_fnc_varToStr],"PLAIN"];