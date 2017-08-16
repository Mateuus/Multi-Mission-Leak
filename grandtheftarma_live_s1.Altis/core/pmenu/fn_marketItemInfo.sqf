/*
	File: fn_marketItemInfo.sqf
	Author: stuffz - CheapSuit Inc.
	
	Description:
	Pulls back information about the selected item in the market.
*/

private["_display","_itemInfo","_itemInfoText","_name","_buyprice","_sellprice","_data","_groupList","_group","_sellpricee","_extraSell"];

disableSerialization;

_display = findDisplay 39000;
_itemInfo = _display displayCtrl 39004;
_data = lbData[39002,(lbCurSel 39002)];
_data = call compile format["%1", _data];

if(isNil "_data") exitWith { _itemInfo ctrlSetText ""; };
if(typeName _data != "ARRAY") exitWith { _itemInfo ctrlSetText ""; };
if(count _data == 0) exitWith { _itemInfo ctrlSetText ""; };

_groupList = ["", "Food Market", "Legal Market", "Fish Market", "Illegal Market"];

_name = [([(_data select 0),0] call life_fnc_varHandle)] call life_fnc_vartostr;
_buyprice = _data select 1;
_sellprice = _data select 2;
_group = (_groupList select (_data select 3));

_sellpricee = 0;

if(_group in ["Food Market", "Legal Market", "Fish Market"]) then
{
	switch true do
	{
		case ("Trader III" in life_talent_talents) : { _sellpricee = (_sellprice * 0.15); };
		case ("Trader II" in life_talent_talents) : { _sellpricee = (_sellprice * 0.10); };
		case ("Trader I" in life_talent_talents) : { _sellpricee = (_sellprice * 0.05); };
		default { _sellpricee = _sellpricee; };
	};
};

if(_group in ["Illegal Market"]) then
{
	switch true do
	{
		case ("Connections III" in life_talent_talents) : { _sellpricee = (_sellprice * 0.15); };
		case ("Connections II" in life_talent_talents) : { _sellpricee = (_sellprice * 0.10); };
		case ("Connections I" in life_talent_talents) : { _sellpricee = (_sellprice * 0.05); };
		default { _sellpricee = _sellpricee; };
	};
};

_extraSell = "";

if(_sellpricee > 0) then
{
	_sellpricee = [_sellpricee] call life_fnc_numberText;
	_extraSell = format[" + %1£",_sellpricee];
};

_itemInfoText = format["<t shadow='1' size='2'>%1</t><br/>%4<br/><br/>Buy price: %2£<br/>Sell price: %3£%5",
	_name,
	[_buyprice] call life_fnc_numberText,
	[_sellprice] call life_fnc_numberText,
	_group,
	_extraSell
];

_itemInfo ctrlSetStructuredText parseText _itemInfoText;