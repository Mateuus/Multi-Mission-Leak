/*---------------------------------------------------------------------------
	File: fn_adacMarkers.sqf
	Author: Skrow & Skyfezzer
	
	Description:
	Marks adacs on the map for other adacs. Only initializes when the actual map is open.
---------------------------------------------------------------------------*/

private["_markers","_adacs"];
_markers = [];
_adacs = [];

sleep 0.5;
if(visibleMap) then {
	{if(side _x == east) then {_adacs set[count _adacs,_x];}} foreach playableUnits; //Fetch list of adacs / blufor
	
	//Create markers
	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];
	
		_markers set[count _markers,[_marker,_x]];
	} foreach _adacs;
		
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
	_markers = [];
	_adacs = [];
};