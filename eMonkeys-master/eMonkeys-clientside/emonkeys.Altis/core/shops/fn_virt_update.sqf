/*
	File: fn_virt_update.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Update and fill the virtual shop menu.
*/
private["_display","_item_list","_gear_list","_shop_data","_name","_price"];
disableSerialization;

//Setup control vars.
_display = findDisplay 2400;
_item_list = _display displayCtrl 2401;
_gear_list = _display displayCtrl 2402;

//Purge list
lbClear _item_list;
lbClear _gear_list;

_shop_data = [EMonkeys_shop_type] call EMonkeys_fnc_virt_shops;
ctrlSetText[2403,format["%1", _shop_data select 0]];

{
	_name = [([_x,0] call EMonkeys_fnc_varHandle)] call EMonkeys_fnc_vartostr;
	_index = [_x,(call buy_array)] call TON_fnc_index;
	if(_index != -1) then
	{
		_price = ((call buy_array) select _index) select 1;
		
		////Marktsystem Anfang////
		_marketprice = [_x] call EMonkeys_fnc_marketGetPrice;
		if(_marketprice != -1) then
		{
			_price = _marketprice  + 2000;
		};
		////Marktsystem Ende////
		
		_item_list lbAdd format["%1  (%2 €)",_name,[_price] call EMonkeys_fnc_numberText];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
	};
} foreach (_shop_data select 1);

{

	_var = [_x,0] call EMonkeys_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	_name = [_var] call EMonkeys_fnc_vartostr;
	_index = [_x,(call sell_array)] call TON_fnc_index;
	_price = ((call sell_array) select _index) select 1;

		_marketprice = [_x] call EMonkeys_fnc_marketGetPrice;
		if(_marketprice != -1) then
		{
			_price = _marketprice;
		};
		if(_val > 0) then
		{
		_gear_list lbAdd format["%1x %2 %3€",_val,_name,_price];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		};
		
} foreach (_shop_data select 1);

	

