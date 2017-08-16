/*
	File: fn_copMarkers.sqf
	Author: Bryan "Tonic" Boardwine
	Modified by RafiQuak for PlayGermany
	
	Description:
	Marks the ASF people on the map for the others. Only initializes when the actual map is open and he has a GPS.
*/
private["_markers","_asfler"];
_markers = [];
_asfler = [];

if(!("ItemGPS" in assignedItems player)) exitWith {hint "Du siehst die Position deiner Kollegen leider nicht, da du kein GPS besitzt";};

sleep 0.5;
if(visibleMap) then {
	{if(side _x == east && ("ItemGPS" in assignedItems _x)) then {_asfler pushBack _x;}} foreach playableUnits; //Fetch list of the ASFler
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorYellow";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
	
		_markers pushBack [_marker,_x];
	} foreach _asfler;
		
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
		} foreach _markers;
		if(!visibleMap) exitWith {};
		sleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
};