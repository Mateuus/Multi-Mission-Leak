/*
	File: fn_isInNlrRange.sqf
	Author: MarkusSR1984
	
	Description:
	Prüft ob eine Koordinate in einem Durch die NLR gesperrten Bereich liegt
	
*/

private ["_posToCheck","_dist","_return"];

_posToCheck = param [0,[0,0,0],[[]]];
_dist = param [1,3000,[0]];
_return = false;

if (isNil "DWEV_nlrZones") then {DWEV_nlrZones = [];};

{
	_pos = (_x select 0);
	if ((_posToCheck distance _pos) <= _dist) exitWith {_return = true;};
} count DWEV_nlrZones;

_return;