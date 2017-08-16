#include <macro.h>
private["_markers","_units"];
_markers = [];
_units = [];
uiSleep 0.5;
if(visibleMap) then {
	{
		if((side _x == civilian) && (player != _x)) then {
			_units pushBack _x;
		}
	} forEach (units(grpPlayer));

	{
		_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
		_marker setMarkerColorLocal "ColorBlue";
		_marker setMarkerTypeLocal "Mil_dot";
		_marker setMarkerTextLocal format["%1", name _x];	
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
					_marker setMarkerPosLocal (visiblePosition _unit);
				};
			};
		} foreach _markers;
		if(!visibleMap) exitWith {};
		uiSleep 0.02;
	};
	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_units = [];
};