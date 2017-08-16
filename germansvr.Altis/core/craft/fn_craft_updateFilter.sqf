#include "..\..\script_macros.hpp"
/*
	File: fn_craft_updateFilter.sqf
	Description: Crafting System
	Author: EdgeKiller
	Edit: Max "Maxos" Seßler
*/
disableSerialization;
private["_list","_filter","_dialog","_inv","_mats","_filterBox","_item","_itemFilter"];
_dialog = findDisplay 666; //find the craft dialog/window
_inv = _dialog displayCtrl 669; //find the listbox of items can be created
_mats = _dialog displayCtrl 672;
_filterBox = _dialog displayCtrl 673;
_itemFilter = lbData[673,(lbCurSel 673)];
lbClear _inv;
_struct = "";
_klb = "";
_config = [_itemFilter] call life_fnc_craftCfg;
{
	if((_itemFilter == "auto") or (_itemFilter == "eat") or (_itemFilter == "metal") or (_itemFilter == "technik")) then{
		_str = M_CONFIG(getText,"VirtualItems",SEL(_x,0),"displayName");
		_inv lbAdd format["%1",localize _str]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_x select 0]; //set the data of the gun
	} else {
		_itemInfo = [_x select 0] call life_fnc_fetchCfgDetails;
		_inv lbAdd format["%1",_itemInfo select 1]; //add a gun to the listbox
		_inv lbSetData[(lbSize _inv)-1,_itemInfo select 0]; //set the data of the gun
		_inv lbSetPicture[(lbSize _inv)-1,_itemInfo select 2];
	};
} foreach (_config);
_inv lbSetCurSel 0;
_item = lbData[669,(lbCurSel 669)];
_config = [_itemFilter] call life_fnc_craftCfg;
{
	if(_item == _x select 0)then
	{
		_klbroh = _x select 1;
		if (!(_klbroh == "")) then {
			_str2 = M_CONFIG(getText,"Licenses",_klbroh,"displayName");
			_klb = localize _str2;
		} else {
			_klb = "Nicht notwendig";
		};
		_matsNeed = _x select 2;
		_invSize = count _matsNeed;
		for [{_i = 0},{_i < _invSize - 1},{_i = _i + 2}] do {
			_name = _matsNeed select _i;
			_str = M_CONFIG(getText,"VirtualItems",_name,"displayName");
			_matsNum = _matsNeed select _i+1;
			_struct = _struct + format["%1x %2<br/>",_matsNum,localize _str];
		};
	};
} foreach (_config);
if(_struct == "") then
{
	_struct = "No material needed";
};
_mats ctrlSetStructuredText parseText format["<t size='0.8px'>%2<br/>Material:<br/>%1</t>",_struct,_klb];