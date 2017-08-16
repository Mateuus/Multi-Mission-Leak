/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Update and fill the virtual shop menu.
*/
private["_item_list","_gear_list","_shopItems","_name","_price"];
disableSerialization;

_item_list = ((findDisplay 2400) displayCtrl 2401);
_gear_list = ((findDisplay 2400) displayCtrl 2402);
lbClear _item_list;
lbClear _gear_list;

if(!isClass(missionConfigFile >> "VirtualShops" >> life_shop_type)) exitWith {closeDialog 0; hintSilent "Config does not exist?";};
_shopItems = getArray (missionConfigFile >> "VirtualShops" >> life_shop_type >> "items");

{
	_displayName = getText (missionConfigFile >> "VirtualItems" >> _x >> "displayName");
	_price = getNumber (missionConfigFile >> "VirtualItems" >> _x >> "buyPrice");
	if !(_price isEqualTo -1) then 
	{
		_requirement = getText (missionConfigFile >> "VirtualItems" >> _x >> "requirement");
		if (_requirement isEqualTo "") then 
		{
			_requirement = compile "true";
		} 
		else 
		{
			_requirement = compile _requirement;
		};
		if (call _requirement) then 
		{
			private _index = _item_list lbAdd format["%1 ($%2)",(localize _displayName),[_price] call life_fnc_rupadudejat];
			_item_list lbSetData [_index,_x];
			_item_list lbSetValue [_index,_price];
			private _icon = getText (missionConfigFile >> "VirtualItems" >> _x >> "icon");
			if !(_icon isEqualTo "") then 
			{
				_item_list lbSetPicture [_index,_icon];
			};
		};
	};
} forEach _shopItems;

{
	private _name = _x select 0;
	private _val = _x select 1;
	if (_name in _shopItems) then 
	{
		private _index = _gear_list lbAdd format["%2 [x%1]",_val,localize getText (missionConfigFile >> "VirtualItems" >> _name >> "displayName")];
		_gear_list lbSetData [_index,_name];
		private _icon = getText (missionConfigFile >> "VirtualItems" >> _name >> "icon");
		if !(_icon isEqualTo "") then 
		{
			_gear_list lbSetPicture [_index,_icon];
		};
	};
} forEach AN_Inventory;
