#include "..\..\script_macros.hpp"
/*
	File: fn_craftAction.sqf
	Author: EdgeKiller
	Edit: PierreAmyf
*/

disableSerialization;
private["_list","_filter","_dialog","_inv","_mats","_filterBox","_item","_itemFilter"];
_dialog = findDisplay 766; //find the craft dialog/window
_inv = _dialog displayCtrl 769; //find the listbox of items can be created
_mats = _dialog displayCtrl 772;
_filterBox = _dialog displayCtrl 773;
_itemFilter = lbData[773,(lbCurSel 773)];
lbClear _inv;
_struct = "";
_config = [_itemFilter] call life_fnc_MineFactory_CraftitemConfig;
{
	if(_itemFilter == "material") then{
		_str = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
		_inv lbAdd format["%1", _str]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_x select 0]; //set the data of the gun
	} else {
		_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
		_inv lbAdd format["%1",_itemInfo select 1]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_itemInfo select 0]; //set the data of the gun
		_inv lbSetPicture[(lbSize _inv)-1,_itemInfo select 2];
	};
} foreach (_config);
_inv lbSetCurSel 0;
_item = lbData[769,(lbCurSel 769)];
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
_mats ctrlSetStructuredText parseText format["
<t size='0.8px'>
%1
</t>
",_struct];