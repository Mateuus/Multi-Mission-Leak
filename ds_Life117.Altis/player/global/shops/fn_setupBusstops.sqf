/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up bus stops
*/
disableSerialization;
private["_distance","_time","_cost","_locations","_dialog","_vehicleListPrice","_vehicleListStr","_marker","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray","_locationsNew"];

disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_locationsNew = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_locations = [["Kavala Markets","busKav"],["Kavala Truck Shop","busKavTruck"],["Zaros City","busZaros"],["Neochori","busNeo"],["Athira Air Field","busAir"],["Athira Garage","busAthiraGarage"],
["Athira City","busAthira"],["Pyrgos City","busPyrgos"],["Pyrgos Truck Shop","busPyrgosTruck"],["Kalithea Boat Shop","busKalithea"],["Paros City","busParos"],["Sofia City","busSofia"],
["Molos City","busMolos"],["Molos Air Field","busMolosAir"]];

{
	if(player distance (getMarkerPos (_x select 1)) < 10000)then
		{
		_tempArray = _x;
		_distance = round(player distance (getMarkerPos (_x select 1)));
		switch(true)do
			{
			case (_distance < 5000):{_time = 30;_cost = 400;};
			case (_distance  < 10000):{_time = 60;_cost = 800;};
			case (_distance < 20000):{_time = 90;_cost = 1600;};
			default {_time = 120;_cost = 2000;};
			};
		_tempArray pushBack _distance;
		_tempArray pushBack _time;
		_tempArray pushBack _cost;
		_locationsNew pushBack _tempArray;
		};
}forEach _locations;

lbClear _vehicleList;

{
	_marker = (_x select 1);
	_string = (_x select 0);
	_toolTip = format ["Distance %1km's || Travel Time %2 seconds || Fare $%3",(round((_x select 2)/1000)),(_x select 3),(_x select 4)];
	_vehicleList lbAdd format ["%1",_string];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_marker];
} foreach _locationsNew;

