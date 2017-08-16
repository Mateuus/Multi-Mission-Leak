/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up bus stops
*/

private ["_dialog","_list","_locationsNew","_locations","_tempArray","_distance","_time","_cost","_tooltip","_index"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_locationsNew = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_locations = [
	["Kavala Markets","busKavTruck"],
	["Kavala Jobs Depot","busKav"],
	["Zaros City","busZaros"],
	["AAC Airfield","busMolosAir"],
	["North Airfield","busKavTruck_1"],
	["Kalithea Boat Shop","busNeo"],
	["Athira Airfield","busParos"],
	["Athira Garage","busAthira"],
	["Athira City","busAthiraGarage"],
	["Telos City","busMolos"],
	["Pyrgos City","busPyrgos"],
	["Paros City","busPyrgosTruck"],
	["Sofia City","busSofia"],
	["Selakano Airfield","busAir"],
	["Molos Airfield","busAir_1"]
];

{
	if((player distance (getMarkerPos (_x select 1)) < 19000)&&(player distance (getMarkerPos (_x select 1)) > 100))then {
		_tempArray = _x;
		_distance = round(player distance (getMarkerPos (_x select 1)));
		switch(true)do {
			case (_distance < 5000): {_time = 30;_cost = 400;};
			case (_distance  < 10000): {_time = 60;_cost = 800;};
			case (_distance < 20000): {_time = 90;_cost = 1600;};
			default {_time = 120;_cost = 2000;};
		};
		_tempArray pushBack _distance;
		_tempArray pushBack _time;
		_tempArray pushBack _cost;
		_locationsNew pushBack _tempArray;
	};
} forEach _locations;

lbClear _list;

{
	_tooltip = format ["Distance %1km's || Travel Time %2 seconds || Fare $%3",(round((_x select 2)/1000)),(_x select 3),(_x select 4)];
	_index = _list lbAdd format ["%1",(_x select 0)];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetData [_index,(_x select 1)];
} forEach _locationsNew;