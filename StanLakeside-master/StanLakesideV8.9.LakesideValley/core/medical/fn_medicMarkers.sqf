/*
	File: fn_medicMarkers.sqf
	
	
	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units"];
_markers = [];
_units = [];
_medmark = [];

uiSleep 0.25;
if(visibleMap) then {

	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		_pid = _x getVariable["steam64ID",""];
		if(side _x == independent) then {_medmark pushBack _x};
		if(!isNil "_name" && !_down && _pid != "" && (_x getVariable["mapVisible",FALSE])) then {
			_units pushBack _x;
		};
	} foreach PlayableUnits;

	{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			if(side _x == west) then {
				_marker setMarkerColorLocal "ColorBlue";
			} else {
				_marker setMarkerColorLocal "ColorGreen";
			};
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
			_markers pushBack [_marker,_x];
	} foreach _medmark;

	{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
		if(side _x == west) then {
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["%1 | Injury Priority: %2",(_x getVariable["name","Unknown Player"]), (_x getvariable "severity")];
		} else {
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["Wounded | Injury Priority: %1", (_x getvariable "severity")];
		};
		_markers pushBack [_marker,_x];
	} foreach _units;

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
					if ("ItemGPS" in assignedItems _unit) then
					{
						_marker setMarkerPosLocal (visiblePosition _unit);
					};
				};
			};
			
		} foreach _markers;
		if(!visibleMap) exitWith {};
		uiSleep 0.05;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
};