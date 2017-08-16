/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Marks cops on the map for other cops. Only initializes when the actual map is open.
*/
private["_markers","_cops","_myName","_unitName"];
_markers = [];
_cops = [];
_myName = player getVariable["realname",name player];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == west) then {_cops pushBack _x;}} foreach playableUnits; //Fetch list of cops / blufor

	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBLUFOR";
		_marker setMarkerTypeLocal "Mil_dot";
		_unitName = _x getVariable["realname",name _x];
		if(_unitName == _myName) then {_unitName = "Ich";};
		_marker setMarkerTextLocal _unitName;
		_markers pushBack [_marker,_x];
	} foreach _cops;

	while {visibleMap} do 
	{
		_vehicleList = [];
		{
			private["_marker","_unit"];
			_marker = _x select 0;
			_unit = _x select 1;
			_vehicle = vehicle _unit;
			if(!isNil "_unit") then {
				if(!isNull _unit) then {
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		if(!(alive player)) exitWith {};
		sleep 0.05;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_cops = [];
};
