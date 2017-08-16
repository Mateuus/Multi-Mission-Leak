/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the buildings shop
*/

private ["_shop","_highway","_dialog","_list","_shopArray","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_highway = [_this,3,[],[[]]] call BIS_fnc_param;
if(!(_highway isEqualTo []))then{_shop = 115};

_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,false];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_buildingShopConfig;

lbClear _list;

{
	_name = _x select 0;
	_tooltip = format ["$%1",[_x select 2] call DS_fnc_numberText];

	_index = _list lbAdd format ["%1",_name];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetColor [_index,[0,1,0,0.5]];
	_list lbSetData [_index,(_x select 1)];
} forEach _shopArray;