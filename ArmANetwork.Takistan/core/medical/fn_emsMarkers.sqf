/*
	File: fn_EMSMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other EMS. Only initializes when the actual map is open.
*/
private["_markers","_ems"];
_markers = [];
_ems = [];

uiSleep 0.5;
if(visibleMap) then {
	{if(side _x == independent) then {_ems pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor
	//Create markers
	{
		if ("ItemGPS" in assignedItems _x) then {
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
			_markers pushBack [_marker,_x];
		} else {
		};
	} foreach _ems;

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
					if (("ItemGPS" in assignedItems _unit) OR ("B_UavTerminal" in assignedItems _unit)) then
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
	_markers = [];
	_ems = [];
};
