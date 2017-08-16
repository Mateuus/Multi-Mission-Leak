/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up medic transport options
*/

private ["_dialog","_list","_locations","_index"];

disableSerialization;

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_locations = [
	["Kavala Hospital","medic_spawn1"],
	["Sofia Hospital","medic_spawn2"],
	["Telos Hospital","medic_spawn3"]
];

lbClear _list;

{
	_index = _list lbAdd format ["%1",(_x select 0)];
	_list lbSetData [_index,(_x select 1)];
} foreach _locations;