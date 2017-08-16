/*
	File: fn_civMarkers.sqf

	Description:
	Add markers for civilians in groups.
*/
private["_markers","_members","_myName","_unitName"];
_markers = [];
_members = [];
_myName = player getVariable["realname",name player];

while {true} do
{
	sleep 0.5;
	if(visibleMap) then
	{
		_members = units (group player);
		{
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorCivilian";
			_marker setMarkerTypeLocal "Mil_dot";
			_unitName = _x getVariable["realname",name _x];
			if(_unitName isEqualTo _myName) then {_unitName = "Ich";};
			_marker setMarkerTextLocal _unitName;
			_markers pushBack [_marker,_x];
		} foreach _members;

		while {visibleMap} do
		{
			_vehicleList = [];
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
			if(!(alive player)) exitWith {};
			sleep 0.05;
		};

		{deleteMarkerLocal (_x select 0);} foreach _markers;
		_markers = [];
		_members = [];
	};
};
