/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	Edited by Timothy "TimmaE" Hladky

	
	Description:
	Shows fellow Medics and Dead players that can be revived on the map when it's open.
	
	Change Color of Markers --> _marker setMarkerColorLocal "COLOR"; (ColorRed,ColorGreen,ColorBlue,ColorYellow, etc.) // for more get in 2D Editor
	Change Icon for Markers --> _marker setMarkerTypeLocal "MARKERICON"; (loc_Hospital, Mil_dot, etc) // for more get in 2D Editor
		
*/
private["_markers2","_units"];
_markers2 = [];
_units = [];
{deleteMarkerLocal _x;} foreach _markers2;

sleep 0.25;
if(visibleMap) 
	then 
	
{
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
		_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
		_markers2 set[count _markers2,_marker];
	} foreach _units;
};		
private["_markers","_medics"];
_markers = [];
_medics = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == independent) then {_medics set[count _medics,_x];}} foreach playableUnits; //Fetch list of cops / blufor

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];

		_markers set[count _markers,[_marker,_x]];
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
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	{deleteMarkerLocal _x;} foreach _markers2;
	_markers = [];
	_medics = [];
}; 