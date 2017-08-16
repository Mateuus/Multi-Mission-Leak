#include "..\..\macros.hpp"
/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks opfor on the map for other opfor. Only initializes when the actual map is open.
*/
private["_markers","_opfor"];
_markers = [];
_opfor = [];

sleep 0.5;
if(visibleMap || visibleGPS) then {
//	{if(side _x == east) then {_opfor pushBack _x;}} foreach playableUnits;
	
	//Create markers
	{
		if ( group _x == group player) then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", getPlayerDName(_x)];
			_markers pushBack [_marker,_x];
		};
		
		if ( _x getVariable["needOpfor",false] && player getVariable["playertype",""] == "WSC") then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorPink";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1 braucht Hilfe!", getPlayerDName(_x)];
			_markers pushBack [_marker,_x];
		};
		
	} foreach playableUnits;
		
	while {visibleMap || visibleGPS} do
	{
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then
			{
				if(!isNull _unit) then
				{
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!(visibleMap || visibleGPS)) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_opfor = [];
};