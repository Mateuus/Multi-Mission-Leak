/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the craft menu
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_civ_craftConfigMain;

lbClear _vehicleList;

{
	_className = (_x select 6);
	_name = (_x select 0);
	_toolTip = (_x select 1);
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
} foreach _shopArray;

