/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up the list in the car shops
*/

private ["_shop","_dialog","_list","_btn2","_shopArray","_name","_tooltip","_index"];

disableSerialization;

_shop = _this select 0;
_dialog = findDisplay 666667;
_list = _dialog displayCtrl 1501;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];

ctrlShow [66653,false];
ctrlShow [778,true];
ctrlShow [777,false];
ctrlShow [66654,false];

_shopArray = [_shop] call DS_fnc_lawyerConfig;

_btn2 ctrlEnable true;
_btn2 ctrlSetText format ["Hire for $%1",[DS_price] call DS_fnc_numberText];
_btn2 buttonSetAction "[] spawn DS_fnc_hireLawyer;";

lbClear _list;

{
	_name = [_x select 0] call DS_fnc_itemStringConfig;
	_tooltip = [_x select 1] call DS_fnc_itemTooltipConfig;

	_index = _list lbAdd format ["$%2 - $%1",_name,[(_x select 2)] call DS_fnc_numberText];
	_list lbSetTooltip [_index,_tooltip];
	_list lbSetData [_index,_x select 3];
} forEach _shopArray;