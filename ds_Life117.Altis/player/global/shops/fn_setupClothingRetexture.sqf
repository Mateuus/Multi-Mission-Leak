/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up bus stops
*/
disableSerialization;
private["_distance","_time","_cost","_items","_dialog","_vehicleListPrice","_vehicleListStr","_marker","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray","_locationsNew"];

disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_locationsNew = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_items = [["Uniform","0"],["Backpack","1"]];

lbClear _vehicleList;

{
	_string = (_x select 0);
	_vehicleList lbAdd format ["%1",_string];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,(_x select 1)];
} foreach _items;

