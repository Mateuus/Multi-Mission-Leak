/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the craft menu
*/

private ["_shop","_dialog","_list","_shopArray","_className","_name","_toolTip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_civ_craftConfigMain;

lbClear _list;

{
	_className = (_x select 6);
	_name = (_x select 0);
	_toolTip = (_x select 1);
	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_toolTip];
	_list lbSetData [_index,_className];
} forEach _shopArray;