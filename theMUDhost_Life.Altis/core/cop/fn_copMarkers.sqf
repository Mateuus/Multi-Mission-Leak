/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_vMarkers","_victims","_vMarker"];
_markers = [];
_cops = [];
_victims = [];

sleep 0.5;
if(visibleMap) then {
	{if((side _x == west) && ("ItemGPS" in assignedItems _x))  then {_cops pushBack _x;}} forEach playableUnits; //Fetch list of cops / blufor
	{if(_x getVariable ["stolen",false]) then { _victims pushBack _x; };} forEach vehicles;
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
	
		_markers pushBack [_marker,_x];
	} foreach _cops;
	
	{
		_vMarker = createMarkerLocal [format["%1_vMarker",_x],visiblePosition _x];
		_vMarker setMarkerColorLocal "ColorRed";
		_vMarker setMarkerTextLocal "Potentially Stolen Vehicle";
		_vMarker setMarkerTypeLocal "Mil_dot";
	
		_markers pushBack [_vMarker,_x];
	} foreach _victims;
	
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
		sleep 0.5;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_cops = [];
	_victims = [];
};