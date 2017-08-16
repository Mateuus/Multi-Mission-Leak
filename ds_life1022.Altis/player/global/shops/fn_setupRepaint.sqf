/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the vehicle repaint shop
*/

private ["_shop","_dialog","_list","_shopArray","_className","_name","_price","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [
	["Marijuana Leaves",24000,"0"],
	["Black Chrome Stripes",24000,"1"],
	["Black",10000,"2"]
];

lbClear _list;

{
	_className = (_x select 2);
	_name = (_x select 0);
	_price = (_x select 1);

	_index = _list lbAdd format ["%1",_name];
	_list lbSetColor [_index, [0,1,0,0.5]];
	_list lbSetData [_index,_className];
} forEach _shopArray;