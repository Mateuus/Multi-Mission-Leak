/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Switches the stance and shooting mode of a sharpshooter
*/

private["_airVehs","_civs","_wlCivs","_counter","_markers"];

_airVehs = [];
_civs = [];
_wlCivs = [];
_counter = 0;
_markers = [];

{
	if(((player getVariable ["policeSquad",""]) == "Coast Guard")&&((vehicle player) isKindOf "Air")&&((_x) != (vehicle player))&&((_x) isKindOf "Air")&&(player distance _x < 3000))then
		{
		_airVehs pushBack [_x,round((getPos _x) select 2)];
		};
}forEach vehicles;

{
	if(((player getVariable ["policeSquad",""]) == "Coast Guard")&&((vehicle player) isKindOf "Ship")&&((_x) != (vehicle player))&&(surfaceIsWater position _x)&&(player distance _x < 300)&&(_x isKindOf "Man")&&((side _x) isEqualTo civilian))then
		{
			_civs pushBack _x;
		};
}forEach playableUnits;

{
	if(((player getVariable ["policeSquad",""]) == "Coast Guard")&&((vehicle player) isKindOf "Ship")&&((_x) != (vehicle player))&&(surfaceIsWater position _x)&&(player distance _x < 300)&&(_x isKindOf "Man")&&((side _x) isEqualTo independent))then
		{
			_wlCivs pushBack _x;
		};
}forEach playableUnits;

{
	_marker = createMarkerLocal [format["%1_marker",(_x select 0)],visiblePosition (_x select 0)];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal format ["Unknown Air Vehicle (%1m)",(_x select 1)];
	_markers pushBack [_marker,(_x select 0)];
} foreach _airVehs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Civilian";
	_markers pushBack [_marker,_x];
} foreach _civs;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "WL Civilian";
	_markers pushBack [_marker,_x];
} foreach _wlCivs;

while{visibleMap}do
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
		sleep 1;
		_counter = _counter + 1;
		if(_counter > 30)exitwith{};
	};
{
	deleteMarkerLocal (_x select 0);
} foreach _markers;