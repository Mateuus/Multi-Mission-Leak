/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the insurance shop
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_name","_value","_shopArray","_short"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_fnc_insuranceShopConfig;

lbClear _vehicleList;

{
	_name = _x select 0;
	_toolTip = _x select 2;
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,(_x select 1)];
} foreach _shopArray;

