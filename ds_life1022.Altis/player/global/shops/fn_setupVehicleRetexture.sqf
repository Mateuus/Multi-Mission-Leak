/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up bus stops
*/

private ["_dialog","_list","_items"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_items = [["Custom 1","0"]];

lbClear _list;

{
	_index = _list lbAdd format ["%1",(_x select 0)];
	_list lbSetData [_index,(_x select 1)];
} forEach _items;