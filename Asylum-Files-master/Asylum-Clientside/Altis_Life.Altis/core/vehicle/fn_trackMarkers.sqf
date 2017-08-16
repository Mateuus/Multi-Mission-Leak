/*
	File: fn_trackMarkers.sqf
	Author: John "Paratus" VanderZwet

	Description:
	Track objects. Only initializes when the actual map is open.
*/
private["_markers","_vehicleName"];

while {true} do
{
	waitUntil {visibleMap || !isNull (findDisplay 39500)};
	_markers = [];
	_units = [];
	{
		if(!isNil "_x") then
		{
			if(!isNull _x) then
			{
				_vehicleName = getText(configFile >> "CfgVehicles" >> (typeOf _x) >> "displayName");
				_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
				_marker setMarkerColorLocal "ColorGreen";
				_marker setMarkerTypeLocal "Mil_destroy";
				_marker setMarkerTextLocal format["%1", _vehicleName];
				_markers set[count _markers,[_marker,_x]];
			};
		};
	} foreach life_tracked;
	if(playerSide == west && life_copRole in ["medic","all"]) then {
		{
			_name = _x getVariable "name";
			_down = _x getVariable ["Revive",false];
			if(!isNil "_name" && !_down) then {
				_units set[count _units,_x];
			};
		} foreach allDeadMen;
		{
			_marker = createMarkerLocal [format["%1_dead_marker",_x],visiblePosition _x];
			_marker setMarkerColorLocal "ColorRed";
			_marker setMarkerTypeLocal "loc_Hospital";
			_marker setMarkerTextLocal format["%1 Unconscious",(_x getVariable["name","Unknown Player"])];
			_markers set[count _markers,[_marker,_x]];
		} foreach _units;
	};
	{
		if (_x == player) then
		{
			_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
			_marker setMarkerColorLocal "ColorBlue";
			_marker setMarkerTypeLocal "mil_arrow2";
			_marker setMarkerTextLocal "YOU";
			_marker setMarkerDirLocal (getDir _x);
			_markers pushBack [_marker,_x];
		}
		else
		{
			if (playerSide == west && side _x == west && !(_x getVariable["blindfolded",false])) then {
				_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
				_marker setMarkerColorLocal "ColorBlue";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format["%1", name _x];
				_markers pushBack [_marker,_x];
			};
			if (playerSide == west && side _x == civilian && _x getVariable ["paroleViolated",false]) then {
				_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
				_marker setMarkerColorLocal "ColorRed";
				_marker setMarkerTypeLocal "Mil_dot";
				_marker setMarkerTextLocal format["PAROLE %1", name _x];
				_markers pushBack [_marker,_x];
			};
			if (playerSide != west && side _x != west && !(_x getVariable["blindfolded",false]) && !(_x getVariable["restrained",false])) then
			{
				if (!isNull (group player)) then
				{
					if (53 in life_talents) then
					{
						if (group player == group _x) then
						{
							_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
							_marker setMarkerColorLocal "ColorBlue";
							_marker setMarkerTypeLocal "Mil_dot";
							_marker setMarkerTextLocal format["%1", name _x];
							_markers pushBack [_marker,_x];
						};
					};
				};
				if (life_gang != "0") then
				{
					if (54 in life_talents) then
					{
						if (life_gang == (_x getVariable ["gang","0"])) then
						{
							_marker = createMarkerLocal [format["%1_marker",_x],getPos _x];
							_marker setMarkerColorLocal "ColorBlue";
							_marker setMarkerTypeLocal "Mil_dot";
							_marker setMarkerTextLocal format["%1", name _x];
							_markers pushBack [_marker,_x];
						};
					};
				};
			};
		};
	} foreach allPlayers;
	
	[] spawn
	{
		if (life_gang != "0") then
		{
			while {visibleMap} do
			{
				{
					_countLabel = "";
					_marker = format["turf_label_%1", _forEachIndex + 1];
					_markPos = getMarkerPos _marker;
					_count = 0;
					_enemy = 0;
					if (life_gang == (_x select 1)) then
					{
						_markerDist = 1000;
						if (worldName == "Stratis") then { _markerDist = 400; };
						{
							if ((_x distance _markPos) < _markerDist) then { _count = _count + 1; if ((_x getVariable ["gang","0"]) in life_gang_wars) then { _enemy = _enemy + 1; };};
						} forEach allPlayers;
						_countLabel = format[" (%1)", _count];
						if (_enemy > 0) then { _countLabel = _countLabel + format[" (%1 ENEMY)", _enemy]; };
					};
					if ((_x select 1) != "0") then
					{
						_marker setMarkerTextLocal format["Turf of %1%2", _x select 2, _countLabel];
						_markColor = "ColorUNKNOWN";
						if (_enemy > 0 || life_active_turf == _forEachIndex) then { _markColor = "ColorRed"; };
						_marker setMarkerColorLocal _markColor;
						(format["turf_area_%1", _forEachIndex + 1]) setMarkerColorLocal _markColor;
					}
					else { _marker setMarkerTextLocal "Contested gang turf"; };
				} forEach life_turf_list;
				
				if(!visibleMap) exitWith {};
				sleep 4;
			};
		};
	};
	
	while {visibleMap || !isNull (findDisplay 39500)} do
	{
		{
			private["_marker","_veh"];
			_marker = _x select 0;
			_veh = _x select 1;
			if(!isNil "_veh") then
			{
				if(!isNull _veh) then
				{
					_marker setMarkerPosLocal (getPos _veh);
					_marker setMarkerDirLocal (getDir _veh);
				};
			};
		} foreach _markers;
		
		if(!visibleMap && isNull (findDisplay 39500)) exitWith {};
		sleep 0.02;
	};
	
	{deleteMarkerLocal (_x select 0);} foreach _markers;
};