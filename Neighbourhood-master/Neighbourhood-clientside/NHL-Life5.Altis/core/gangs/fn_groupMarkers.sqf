/*
    File: fn_groupMarkers.sqf
    Author: Bryan "Tonic" Boardwine
    
    Description:
    Marks group units on the map. Only initializes when the actual map is open.
*/
private["_markers","_members"];
_markers = [];
_members = [];
_gangMembersGps = [];

while {true} do
{
	sleep 0.5;
	if(visibleMap) then
	{
			
		
		_members = units (group player);
		{if("ItemGPS" in assignedItems _x) then {_gangMembersGps pushBack _x;}} foreach _members;
		{
			
				_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
				_marker setMarkerColorLocal "ColorCivilian";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
				_markers pushBack [_marker,_x];
			
		} foreach _gangMembersGps;

		while {visibleMap} do
		{
			{
				private["_marker","_unit"];
				_marker = _x select 0;
				_unit = _x select 1;
				if(!isNil "_unit" && !isNull _unit) then {
					  _marker setMarkerPosLocal (visiblePosition _unit);
				};
			} foreach _markers;
			if(!visibleMap) exitWith {};
			sleep 0.02;
		};

		{deleteMarkerLocal (_x select 0);} foreach _markers;
		_markers = [];
		_members = [];
		_gangMembersGps = [];
	};
};