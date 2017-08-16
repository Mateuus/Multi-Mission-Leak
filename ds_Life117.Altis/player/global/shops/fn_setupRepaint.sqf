/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the vehicle repaint shop
*/
disableSerialization;
private["_type","_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_maxSpeed","_armorRating","_shopArray"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,false];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = 
[
["Marijuana Leaves",24000,"0"],
["Black Chrome Stripes",24000,"1"],
["Black",10000,"2"]
];

lbClear _vehicleList;

{
	_className = (_x select 2);
	_name = (_x select 0);
	_price = (_x select 1);
	_vehicleList lbAdd format ["%1",_name];
	_vehicleList lbSetColor [(lbSize _vehicleList)-1, [0, 1, 0, 0.5]];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_className];
}forEach _shopArray;
