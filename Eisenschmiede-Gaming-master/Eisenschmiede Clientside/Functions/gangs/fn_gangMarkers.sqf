private["_markers","_text","_crew","_inVehicle","_count"];
_markers = [];
_text = "";
_inVehicle = [];
_crew = "";
uisleep 0.3;
if(visibleMap) then {
	{
		if(!(_x getVariable["restrained",false]) && (alive _x) && !(_x in _inVehicle)) then {
			_vehicle = vehicle _x;
			if(_vehicle != _x) then {
				_count = count(crew _vehicle);
				{
					if(alive _x && _x != driver _vehicle && _x in units(group player)) then {
						_crew = _crew + format ["%1%2", _x getVariable["realname",name _x], if(_forEachIndex == _count-1) then {""} else {", "}];
						_inVehicle pushBack _x;
					};
				} forEach (crew _vehicle);
				_text = format["[%1]%2 %3",getText(configFile>>"CfgVehicles">>typeOf _vehicle>>"DisplayName"),
					if(!isNull (driver _vehicle) && {(driver _vehicle in units(group player))}) then {
						_inVehicle pushBack (driver _vehicle);
						if(_count == 1) then {
							format["%1",(driver _vehicle) getVariable["realname",name _x]]
						}else{
							format["%1%2",(driver _vehicle) getVariable["realname",name _x], ","]
						};
					}else{""}, _crew];
				_crew = "";
			}else{
				_text = format["%1",_x getVariable["realname",name _x]];
			};
			_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorOrange";
			_marker setMarkerTypeLocal "Mil_dot";
			_marker setMarkerTextLocal format["%1", _text];
			_markers pushBack [_marker,_x];
			_text = "";
		};
	} foreach units(group player);

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
		uisleep 0.02;
	};

	{deleteMarkerLocal (_x select 0);} foreach _markers;
	_markers = [];
	_inVehicle = [];
};