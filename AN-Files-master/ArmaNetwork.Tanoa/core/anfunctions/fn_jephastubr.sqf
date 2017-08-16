/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
_markers = [];
_cops = [];
sleep 0.5;
if(visibleMap OR visibleGPS) then {
	{if(("ItemGPS" in assignedItems _x OR "B_UavTerminal" in assignedItems _x) && {alive _x} && {side _x isEqualTo west} && {!(isObjectHidden _x)}) then {_cops pushBack _x;}} forEach (allPlayers - entities "HeadlessClient_F");
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
		_markers pushBack [_marker,_x];
	} forEach _cops;

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
		} forEach _markers;
		if(!visibleMap) exitWith {};
		sleep 2;
	};

	while {visibleGPS} do
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
		} forEach _markers;
		if(!visibleGPS) exitWith {};
		sleep 2;
	};

	{deleteMarkerLocal (_x select 0);} forEach _markers;
	_markers = [];
	_cops = [];
};
