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

_shop_data = [life_shop_type] call life_fnc_virt_shops;
ctrlSetText[2403,format["%1", _shop_data select 0]];

{
	_name = [([_x,0] call life_fnc_varHandle)] call life_fnc_vartostr;
	_index = [_x,buy_array] call life_fnc_index;
	if(_index != -1) then
	{
		_price = (buy_array select _index) select 1;
		_qty = _x call life_fnc_getQuantity;
		_price = [_x,_price,_qty] call life_fnc_calcPrice;
		if ((life_configuration select 3) > 0) then
		{
			_price = round (_price + (_price * ((life_configuration select 3) / 100)));
		};
		//_price = _price - (((life_donator * 4) / 100) * _price);
		if (_qty == 0) then { _price = _price * 1.25; };
		_price = floor _price;
		if (_x == "vammo" && 7 in life_achievements) then { _price = 0 };
		if (life_shop_type == "rebel" && 1 in life_gangtalents) then { _price = _price - (_price * 0.10); };
		_qtyStr = if (_qty < 0) then { "" } else { format["%1x ", _qty] };
		_item_list lbAdd format["%3%1 ($%2)",_name,[_price] call life_fnc_numberText, _qtyStr];
		_item_list lbSetData [(lbSize _item_list)-1,_x];
		_item_list lbSetValue [(lbSize _item_list)-1,_price];
		_item_list lbSetPicture [(lbSize _item_list)-1,format["icons\%1.paa",_x]];
	};
} foreach (_shop_data select 1);

{
	_var = [_x,0] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _var;
	_name = [_var] call life_fnc_vartostr;
	
	if(_val > 0) then
	{
		_gear_list lbAdd format["%1x %2",_val,_name];
		_gear_list lbSetData [(lbSize _gear_list)-1,_x];
		_gear_list lbSetPicture [(lbSize _gear_list)-1,format["icons\%1.paa",_x]];
	};
} foreach (_shop_data select 2);