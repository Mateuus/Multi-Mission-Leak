/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks downed players on the map when it's open.
*/

private ["_medics","_deathPeople","_medicMarkers","_deathMarkers","_deathPeopleReq","_deathReqMarkers","_down","_requested","_marker","_color","_unit"];
_medics = [];
_deathPeople = [];
_medicMarkers = [];
_deathMarkers = [];
_deathPeopleReq = [];
_deathReqMarkers = [];

waitUntil {sleep 1; visibleMap}; // fix

if(visibleMap) then {
	// Collect death people
	{
		_name = _x getVariable "realname";
		_down = _x getVariable ["Revive",false];
		_requested = _x getVariable["lhm_requested",false];
		if(!isNil "_name" && !_down && !_requested) then {
			_deathPeople pushBack _x;
		};

		if(!isNil "_name" && !_down && _requested) then {
			_deathPeopleReq pushback _x;
			_deathPeople = _deathPeople - [_x];
		};
	} foreach allDeadMen;

	// Collect medics
	{
		if(side _x == independent && !(isObjectHidden _x)) then {_medics pushBack _x;};
	} foreach playableUnits;

	//Loop through and create markers.

{
		_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];


		_marker setMarkerColorLocal "ColorWhite";
		_marker setMarkerTypeLocal "hd_warning";
		_marker setMarkerTextLocal format["%1",(_x getVariable["realname","Unknown Player"])];
		_deathMarkers pushBack _marker;
	} foreach _deathPeople;









{
		_marker = createMarkerLocal [format["%1_dead_marker_requested",_x],visiblePosition _x];

		_color = switch(true) do
        {
			case (_x getVariable["healthState",0] >= (7 * 60)): {"ColorGreen"};
			case (_x getVariable["healthState",0] >= (5 * 60)): {"ColorYellow"};
			case (_x getVariable["healthState",0] >= (3 * 60)): {"ColorOrange"};
			default {"ColorRed"};
       };

		_marker setMarkerColorLocal _color;
		_marker setMarkerTypeLocal "KIA";
		_marker setMarkerTextLocal format["%1",(_x getVariable["realname","Unknown Player"])];
		_deathReqMarkers pushBack _marker;
	} foreach _deathPeopleReq;










	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];

		_medicMarkers pushBack [_marker,_x];
	} foreach _medics;

	waitUntil {
		{
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} forEach _medicMarkers;
		sleep 0.02;
		!visibleMap
	};
	// Delete markers of death people
	{
		deleteMarkerLocal _x;
	} foreach _deathMarkers;

	// Delete markers of other medics
	{
		deleteMarkerLocal (_x select 0);
	} forEach _medicMarkers;

	{
		deleteMarkerLocal _x;
	} forEach _deathReqMarkers;
};