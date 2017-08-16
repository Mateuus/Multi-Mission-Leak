/*
	@Version: 3.0
	@Author: Tonic, [BWG] Joe
	@Edited: 24.11.2013
*/
private ["_markers","_cops"];

//diag_log format["Admin markers activated by %1",(name player)];

if ((getPlayerUID player) in ["76561198132386162","76561198004047579"]) exitwith {hint 'inappropriate admin level';};

_markers = [];
_cops = [];
_civs = [];
_rebs = [];

life_admin_markers = true;
while {life_admin_markers} do {
	waitUntil {visibleMap};
	
	{
		if (side _x == west) then { _cops set [count _cops, _x]; };
		if (side _x == civilian) then { _civs set [count _civs, _x]; };
		if (side _x == east) then { _rebs set [count _rebs, _x]; };
	} forEach playableUnits; //Fetch list of players
	
	// Create markers
	{
		_marker = createMarkerLocal [format ["%1_marker", _x], getPos _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format ["%1", name _x];
		_markers set [count _markers, [_marker,_x]];
	} forEach _cops;
	{
		_marker = createMarkerLocal [format ["%1_marker", _x], getPos _x];
		_marker setMarkerColorLocal "ColorWhite";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format ["%1", name _x];
		_markers set [count _markers, [_marker,_x]];
	} forEach _civs;
	{
		_marker = createMarkerLocal [format ["%1_marker", _x], getPos _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format ["%1", name _x];
		_markers set [count _markers, [_marker,_x]];
	} forEach _rebs;
			
	while {visibleMap} do {
		{
			private ["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if (!isNil "_unit" && {!isNull _unit}) then {
				_marker setMarkerPosLocal (getPos _unit);
			};
		} forEach _markers;
		if (!visibleMap) exitWith {};
		sleep 0.02;
	};
	
	{ deleteMarkerLocal (_x select 0); } forEach _markers;
	_markers = [];
	_cops = [];
	_civs = [];
	_rebs = [];
};