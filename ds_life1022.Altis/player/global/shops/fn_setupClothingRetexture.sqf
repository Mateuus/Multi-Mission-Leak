/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up clothing retexture
*/

private ["_dialog","_list","_items","_index"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_items = [["Uniform","0"],["Backpack","1"]];

lbClear _list;

{
	_index = _list lbAdd format ["%1",(_x select 0)];
	_list lbSetData [_index,(_x select 1)];
} forEach _items;