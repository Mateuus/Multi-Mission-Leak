/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Messages the driver of a vehicle you are targeted on
*/

private ["_bones","_roadCars","_counter","_markers"];

_roadCars = [];
_bones = [];
_counter = 0;
_markers = [];

{
	if((isOnRoad _x)&&((player getVariable ["policeSquad",""]) == "Highway Patrol"))then
		{
		_bones pushBack _x;
		};
} foreach allMissionObjects "Land_HumanSkeleton_F";

{
	if((!(_x getVariable ["convoyCargo",false]))&&(!(_x getVariable ["policeVehicle",false]))&&((count crew _x) == 0)&&(isOnRoad _x)&&((player getVariable ["policeSquad",""]) == "Highway Patrol")&&(_x isKindOf "LandVehicle"))then
		{
		_roadCars pushBack _x;
		};
}forEach vehicles;


{
	_marker = createMarkerLocal [format["%1_deaderer_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "ColorOrange";
	_marker setMarkerTypeLocal "hd_warning";
	_marker setMarkerTextLocal "Human Remains";
	_markers pushBack [_marker,_x];
} foreach _bones;

{
	_marker = createMarkerLocal [format["%1_marker",_x],visiblePosition _x];
	_marker setMarkerColorLocal "Colorred";
	_marker setMarkerTypeLocal "Mil_dot";
	_marker setMarkerTextLocal "Abandoned Vehicle";
	_markers pushBack [_marker,_x];
} foreach _roadCars;

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