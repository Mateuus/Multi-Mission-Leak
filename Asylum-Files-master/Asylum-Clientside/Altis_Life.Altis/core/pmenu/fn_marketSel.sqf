/*
	File: fn_marketSel.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Selected market item for information
*/
private["_display","_list","_text","_data","_basePrice"];

disableSerialization;
_display = findDisplay 5300;
_text = _display displayCtrl 5310;
_list = _display displayCtrl 5305;
_data = lbData[5305,lbCurSel 5305];

_index = -1;
{ if (_data == (_x select 0)) then { _index = _forEachIndex;} } forEach buy_array;
if (_index == -1) exitWith {};

_price = (buy_array select _index) select 1;
_qty = _data call life_fnc_getQuantity;
_basePrice = [_data,_price,0,false] call life_fnc_calcPrice;
_price = [_data,_price,_qty,false] call life_fnc_calcPrice;
if ((life_configuration select 3) > 0) then
{
	_price = round (_price + (_price * ((life_configuration select 3) / 100)));
};
//_price = _price - (((life_donator * 4) / 100) * _price);
_price = floor _price;

_text ctrlSetStructuredText parseText format["Base: <t color='#00ccaa'>$%1</t> Current: <t color='#00ccaa'>$%2</t>", [_basePrice] call life_fnc_numberText, [_price] call life_fnc_numberText];