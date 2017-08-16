/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units"];
_markers = [];
_units = [];
_medics = [];
_medicMarkers = [];

while {true} do
{
	waitUntil {visibleMap};

	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			_units set[count _units,_x];
		};
	} foreach allDeadMen;

	//Loop through and create markers.
	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "loc_Hospital";
		_marker setMarkerTextLocal format["%1 Unconscious",(_x getVariable["name","Unknown Player"])];
		_markers set[count _markers,_marker];
	} foreach _units;

	if (123 in life_talents) then
	{
		{if(side _x == independent) then {_medics set[count _medics,_x];}} foreach allPlayers;
	};
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
		_medicMarkers set[count _medicMarkers,[_marker,_x]];
	} foreach _medics;

	while {visibleMap} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (getPos _unit);
				};
			};
		} foreach _medicMarkers;
	};

	{deleteMarkerLocal _x;} foreach _markers;
	{deleteMarkerLocal (_x select 0);} foreach _medicMarkers;
	_markers = [];
	_units = [];
	_medics = [];
	_medicMarkers = [];
};