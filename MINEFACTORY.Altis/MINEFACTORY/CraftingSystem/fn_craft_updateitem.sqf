#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: PierreAmyf
*/

private["_dialog","_inv","_mats","_item","_struct","_str","_invSize","_matsNeed","_matsNum","_config","_itemFilter"]; //Declare all private variables
disableSerialization;
_dialog = findDisplay 766;
_inv = _dialog displayCtrl 769;
_mats = _dialog displayCtrl 772;
_struct = "";
if((lbCurSel 769) == -1) exitWith {hint  "Du musst zuerst einen Gegenstand auswählen!";};
_item = lbData[769,(lbCurSel 769)];
_itemFilter = lbData[773,(lbCurSel 773)];
_config = [_itemFilter] call life_fnc_MineFactory_CraftitemConfig;
{
	if(_item == _x select 0)then
	{
		_matsNeed = _x select 1;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
			_name = _matsNeed select _i;
			_str = M_CONFIG(getText,"VirtualItems",_name,"displayName");
			_matsNum = _matsNeed select _i+1;
			_struct = _struct + format["%1x %2<br/>",_matsNum, _str];
		};
	};
} foreach (_config);
if(_struct == "") then
{
	_struct = "No material needed";
};
_mats ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];