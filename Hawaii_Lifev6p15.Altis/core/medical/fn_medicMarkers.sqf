/*
	File: fn_medicMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks downed players on the map when it's open.
*/
private["_markers","_units","_myName","_unitName","_medics","_VEHmarker"];

_markers = [];
_markersMedecin = [];
_VEHmarker = [];
_units = [];
_medics = [];
_myName = player getVariable["realname",name player];

sleep 0.25;
if(visibleMap) then {
	{
		if(_x getVariable "calledTHW") then {
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorWhite";
		_marker setMarkerTypeLocal "o_maint";
		_marker setMarkerTextLocal format["%1",(_x getVariable["vehicleown","Unknown Player"])];
		_VEHmarker pushBack _marker;
		};
	} forEach vehicles;

	{if(side _x == independent) then {_medics pushBack _x;}} foreach playableUnits;
	{
		_name = _x getVariable "name";
		_down = _x getVariable ["Revive",false];
		if(!isNil "_name") then {
			if(!_down) then {
				_units pushBack _x;
			};
		};
	} foreach allDeadMen;

	{
		_markerss = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_markerss setMarkerColorLocal "ColorCivilian";
		_markerss setMarkerTypeLocal "Mil_dot";
		_unitName = _x getVariable["realname",name _x];
		if(_unitName == _myName) then {_unitName = "Ich";};
		_markerss setMarkerTextLocal _unitName;
		_markersMedecin pushBack [_markerss,_x];
	} foreach _medics;

	//Loop through and create markers.
	{
		if(_x getVariable "medicRequested") then {
			_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["%1",(_x getVariable["name","Unknown Player"])];
			_markers pushBack _marker;
		};
	} foreach _units;

	while {visibleMap} do {
		{
			private["_markersss","_unit"];
			_markersss = _x select 0;
			_unit = _x select 1;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_markersss setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markersMedecin;
		if(!visibleMap) exitWith {};
		if(!(alive player)) exitWith {};
		sleep 0.05;
	};
	waitUntil {!visibleMap};
	{deleteMarkerLocal (_x select 0);} foreach _markersMedecin;
	{deleteMarkerLocal _x;} foreach _VEHmarker;
	{deleteMarkerLocal _x;} foreach _markers;
	_markersMedecin = [];
	_VEHmarker = [];
	_markers = [];
	_units = [];
	_medics = [];
};
