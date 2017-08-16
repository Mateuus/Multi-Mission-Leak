#include "..\..\macros.hpp"
/*
	File: fn_medMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks meds on the map for other med. Only initializes when the actual map is open.
*/
private["_markers","_med"];
_markers = [];
_med = [];

sleep 0.5;
if(visibleMap || visibleGPS) then {
	//{if(side _x == independent) then {pushBack _x;}} foreach playableUnits; //Fetch list of med
	
	//Create markers
	{
		if ( group _x == group player) then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorGreen";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", getPlayerName(_x)];
			_markers pushBack [_marker,_x];
		};
		
		if ( _x getVariable["needMedic",false] && player getVariable["playertype",""] == "MED") then
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
	_med = [];
};