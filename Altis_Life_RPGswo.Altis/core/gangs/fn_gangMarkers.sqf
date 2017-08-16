#include "..\..\macros.hpp"
/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_members"];
_markers = [];
_members = [];
if (isNil "disableGroupMarkers") then {disableGroupMarkers = false;};

//_group = DWEV_my_gang;
//if(isNull _group) exitWith {};
//_gang = [_group,DWEV_gang_list] call DWF_fnc_index;
//_gang = DWEV_gang_list select _gang;


//_myGang = player getVariable["DWEV_my_gang"];
//_myGang1 = DWEV_my_gang;



//systemChat "gangMarkers wurde ausgeführt";
//systemChat "Name der Gang 1" + str(_gang);
//systemChat "Name der Gang 2" + _myGang1 ;

sleep 0.5;
if((visibleMap || visibleGPS) && !disableGroupMarkers/*&& !isNull _group */) then {
//	systemChat "gangMarkers Firstcheck";
	{if(side _x != west) then {_members pushBack _x;}} foreach playableUnits; //Fetch list of gangmembers	
	//Create markers
	{
		
		if ( group _x == group player) then
		{
//		systemChat "gangMarkers Set Marker";
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
//		_marker setMarkerTextLocal format["%1", getPlayerName(_x)];
		_marker setMarkerTextLocal format["%1", getPlayerName(_x)];
	
		_markers pushBack [_marker,_x];
		};
		
	} foreach _members;
		
	while {(visibleMap || visibleGPS) && !disableGroupMarkers } do
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
	_members = [];
};