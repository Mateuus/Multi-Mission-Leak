/*
	File: fn_getNlrLocktime.sqf
	Author: MarkusSR1984
	
	Description:
	Gibt die verbleibende Sperrzeit für eine NLR Zone Zurück
	
*/

private ["_posToCheck","_dist","_return"];

_posToCheck = param [0,[0,0,0],[[]]];
_dist = param [1,3000,[0]];
_return = "";
_nlrTime = (15 * 60);

if (isNil "DWEV_nlrZones") then {DWEV_nlrZones = [];};

{
	_pos = (_x select 0);
	_timestamp = (_x select 1);
	
	if ((_posToCheck distance _pos) <= _dist) exitWith 
	{
		_time = ((_timestamp + _nlrTime) - serverTime);
		_return = ([_time] call DWEV_fnc_formatTime);
	};
} count DWEV_nlrZones;

_return;