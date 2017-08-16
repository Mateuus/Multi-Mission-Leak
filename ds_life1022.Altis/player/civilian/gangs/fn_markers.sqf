/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Map markers for gang members
*/

private ["_members","_markers","_invaders","_counter","_marker","_base","_baseList"];

sleep 0.5;
((findDisplay 12) displayCtrl 51) mapCenterOnCamera false;

_members = [];
_markers = [];
_invaders = [];
_counter = 0;

if(visibleMap)then {
	{
		_members pushBack _x;
	} forEach (units (group player));
};

{
	_marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format ["%1",_x getVariable ["name",name _x]];
	_markers pushBack [_marker,_x];
} forEach _members;

_base = [] call DS_fnc_getPlayerBase;
_baseList = [_base] call DS_fnc_getPlayerBaseList;
if(((getPlayerUID player) in _baseList)&&(_base getVariable ["baseMarkers",false]))then {
	{
		if((((side _x) in [west,independent])||(!((getPlayerUID _x) in _baseList)))&&(_x distance _base < 300))then {
			_invaders pushBack _x;
		};
	} forEach playableUnits;
};

{
	_marker = createMarkerLocal [format ["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Unknown Person";
	_markers pushBack [_marker,_x];
} forEach _invaders;

while{visibleMap}do {
	{
		private ["_marker","_unit"];

		_marker = _x select 0;
		_unit = _x select 1;

		if((!isNil "_unit")&&(!isNull _unit))then {
			_marker setMarkerPosLocal (visiblePosition _unit);
		};
	} forEach _markers;

	if(!visibleMap)exitWith{};
	sleep 1;
	_counter = _counter + 1;
	if(_counter > 30)exitWith{};
};

{
	deleteMarkerLocal (_x select 0);
} forEach _markers;