/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the insurance shop
*/

private ["_shop","_dialog","_list","_shopArray","_className","_price","_img","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_insuranceShopConfig;

lbClear _list;

{
	_name = _x select 0;
	_tooltip = _x select 2;

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetColor [_index,[0,1,0,0.5]];
	_list lbSetData [_index,(_x select 1)];
} foreach _shopArray;