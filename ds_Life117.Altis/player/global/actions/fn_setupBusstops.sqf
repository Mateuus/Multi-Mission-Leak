/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Sets up bus stops
*/
disableSerialization;
private["_locations","_dialog","_vehicleListPrice","_vehicleListStr","_marker","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_locations = [["Kavala HQ","cop_spawn_1"],["Athira HQ","cop_spawn_3"],["Pyrgos HQ","cop_spawn_2"],["Air HQ","cop_spawn_4"],["Sofia HQ","cop_spawn_5"]];

lbClear _vehicleList;

{
	_marker = (_x select 1);
	_string = (_x select 0);
	_vehicleList lbAdd format ["%1",_string];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_marker];
} foreach _locations;

