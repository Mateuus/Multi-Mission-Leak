#include <macro.h>
/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_points","_marketprice","_icon"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2440;
_item_list = _display displayCtrl 2445;
_gear_list = _display displayCtrl 2447;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = [life_shop_type] call life_fnc_virt_shops;
//ctrlSetText[2443,format["%1", _shop_data select 0]];

{
	_name = [([_x,0] call life_fnc_varHandle)] call life_fnc_vartostr;
	_icon = [([_x,0] call life_fnc_varHandle)] call life_fnc_itemIcon;
	//_index = [_x,__GETC__(buy_array)] call SOA_fnc_index;
	_points = [_x,"points"] call life_fnc_classPrices;
	_color = [_x] call life_fnc_classColors;
	_tooltip = [_x] call life_fnc_tooltips;
	if(_points != -1) then
	{
		//_points = (__GETC__(buy_array) select _index) select 2;
		
		_item_list lbAdd format["%1  (%2 Punkte)",_name,[_points] call life_fnc_numberText];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_points];
		_item_list lbSetPicture [(lbSize _item_list)-1,_icon];
		_item_list lbSetColor [(lbSize _item_list)-1,(_color select 1)];
		_item_list lbSetTooltip [(lbSize _item_list)-1,_tooltip];
	};
} foreach (_shop_data select 1);

{
	_var = [_x,0] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	_name = [_var] call life_fnc_vartostr;
	_icon = [_var] call life_fnc_itemIcon;
	_color = [_x] call life_fnc_classColors;
	_tooltip = [_x] call life_fnc_tooltips;
	
	if(_val > 0) then
	{
		_gear_list lbAdd format["%1x %2",_val,_name];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,_icon];
		_gear_list lbSetColor [(lbSize _gear_list)-1,(_color select 1)];
		_gear_list lbSetTooltip [(lbSize _gear_list)-1,_tooltip];
	};
} foreach (_shop_data select 1);