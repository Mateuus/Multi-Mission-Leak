/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up the list in the car shops
*/
disableSerialization;
private["_shop","_dialog","_vehicleListPrice","_vehicleListStr","_className","_price","_weight","_img","_toolTip","_index","_value","_shopArray","_short"];

_shop = _this select 0;
disableSerialization;
_dialog = findDisplay 666667;
_vehicleList = _dialog displayCtrl 1501;
_dialog = findDisplay 666667;
_btn2 = _dialog displayCtrl 778;
_shopArray = [];

ctrlShow[66653,false];
ctrlShow[778,true];
ctrlShow[777,false];
ctrlShow[66654,false];

_shopArray = [_shop] call DS_fnc_lawyerConfig;

_btn2 ctrlEnable true;
_btn2 ctrlSetText format ["Hire for $%1",[DS_price] call DS_fnc_numberText];
_btn2 buttonSetAction "[] spawn DS_fnc_hireLawyer;";

lbClear _vehicleList;

{
	_name = [_x select 0] call DS_fnc_itemStringConfig;
	_toolTip = [_x select 1] call DS_fnc_itemTooltipConfig;
	_vehicleList lbAdd format ["$%2 - $%1",_name,[(_x select 2)] call DS_fnc_numberText];
	_vehicleList lbSetTooltip [(lbSize _vehicleList)-1, _toolTip];
	_vehicleList lbSetData [(lbSize _vehicleList)-1,_x select 3];
} foreach _shopArray;

