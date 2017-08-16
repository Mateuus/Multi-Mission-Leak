/*
	File: fn_market.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Opens player inventory
*/
private["_display","_list","_str","_qty","_price","_shrt"];

disableSerialization;
waitUntil {!isNull findDisplay 5300};

[] call life_fnc_p_updateMenu;

_display = findDisplay 5300;
_list = _display displayCtrl 5305;
_details = _display displayCtrl 5310;

lbClear _list;
{
	_index = -1;
	
	// Virtual item
	_shrt = _x select 0;
	{ if (_shrt == (_x select 0)) then { _index = _forEachIndex;} } forEach buy_array;
	if (_index > -1) then
	{
		_price = (buy_array select _index) select 1;
		_qty = _shrt call life_fnc_getQuantity;
		_price = [_shrt,_price,_qty,false] call life_fnc_calcPrice;
		if ((life_configuration select 3) > 0) then
		{
			_price = round (_price + (_price * ((life_configuration select 3) / 100)));
		};
		_price = floor _price;
		
		_var = [_shrt,0] call life_fnc_varHandle;
		_str = [_var] call life_fnc_varToStr;
		_list lbAdd format["%1x %2 ($%3)",_qty,_str,_price];
		_list lbSetPicture [(lbSize _list)-1,format["icons\%1.paa",_shrt]];
		_list lbSetdata [(lbSize _list)-1,_shrt];
	};
} foreach life_price_index;