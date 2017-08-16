/*
	File: fn_EMSMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other EMS. Only initializes when the actual map is open.
*/
_medics = [];
_deadPeople = [];
_deadpeepsMarkers = [];
_medicMarkers = [];
_doa = false;
sleep 0.5;
if(visibleMap) then {
	{
		_down = _x getVariable ["Revive",false];
		_didHeAsk = _x getVariable ["medicRequested",false];
		_doa = _x getVariable "DeclaredDead";
		if(!_down && {_didHeAsk} && isNil "_doa") then {
			_deadPeople pushBack _x;
		};
	} forEach allDeadMen;

	{
		if(side _x isEqualTo independent && {alive _x} && {!(isObjectHidden _x)} && {"ItemGPS" in assignedItems _x}) then {
			_medics pushBack _x;
		};
	} forEach (allPlayers - entities "HeadlessClient_F");

	{
		_marker = createMarkerLocal [format["%1_dead_person",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorRed";
		_marker setMarkerTypeLocal "KIA";
		_marker setMarkerTextLocal format["%1",(_x getVariable["realname","Injured Patient"])];
		_deadpeepsMarkers pushBack _marker;
	} forEach _deadPeople;

	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorGreen";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", _x getVariable["realname",name _x]];
		_medicMarkers pushBack [_marker,_x];
	} forEach _medics;

	while {visibleMap} do {
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} forEach _medicMarkers;
		if(!visibleMap) exitWith {};
		sleep 2;
	};
/*
	while {visibleGPS} do {
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} forEach _medicMarkers;
		if(!visibleGPS) exitWith {};
		sleep 2;
	};
*/
	{
		deleteMarkerLocal _x;
	} forEach _deadpeepsMarkers;
	{
		deleteMarkerLocal (_x select 0);
	} forEach _medicMarkers;
	_medics = nil;
	_deadPeople = nil;
	_deadpeepsMarkers = nil;
	_medicMarkers = nil;
};
