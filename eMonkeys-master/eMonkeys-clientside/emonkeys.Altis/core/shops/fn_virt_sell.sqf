/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name","_marketprice"];
if((lbCurSel 2402) == -1) exitWith {};
_state = [_this,0,false] call bis_fnc_param;
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,(call sell_array)] call TON_fnc_index;
if(_index == -1) exitWith {};
_price = ((call sell_array) select _index) select 1;
_var = [_type,0] call EMonkeys_fnc_varHandle;


////Marktsystem Anfang////
_marketprice = [_type] call EMonkeys_fnc_marketGetPrice;
if(_marketprice != -1) then
{
	_price = _marketprice;
};
////Marktsystem Ende////

_amount = ctrlText 2405;
if(!([_amount] call fnc_isnumber)) exitWith {hint "eine aktuelle Nummer eingeben";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "Sie haben nicht so viele Einzelteile zu verkaufen!"};
_amount2 = (missionNameSpace getVariable _var);
_amount2 = format["%1",_amount2];
_amount2 = parseNumber (_amount2);

if(_state) then 
{
	_price = (_price * _amount2);
	_name = [_var] call EMonkeys_fnc_vartostr;
	if(EMonkeys_shop_type == "AaM") exitWith
	{
		if(([false,_type,_amount2] call EMonkeys_fnc_handleInv)) then
		{
			hint format["Du verkaufst %1 %2",_amount2,_name];
			_text = format ["*** Z-Item verkaufen | SpielerID: %1 | Name: %2 | Item: %3 | Anzahl: %4 |",getPlayerUID player,name player,_name,_amount2];
			[[2,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
		};
	};
	
	if(([false,_type,_amount2] call EMonkeys_fnc_handleInv)) then
	{
		hint format["Du verkaufst %1 %2 für %3€",_amount2,_name,[_price] call EMonkeys_fnc_numberText];
		EMonkeys_c164 = EMonkeys_c164 + _price;
		[] call EMonkeys_fnc_virt_update; 
			
		_marketprice = [_type] call EMonkeys_fnc_marketGetPrice;
		if(_marketprice != -1) then
		{
			[[_type,_amount2],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp;
		};
	};
}
else
{ 
	_price = (_price * _amount);
	_name = [_var] call EMonkeys_fnc_vartostr;
	if(EMonkeys_shop_type == "AaM") exitWith
	{
		if(([false,_type,_amount] call EMonkeys_fnc_handleInv)) then
		{
			hint format["Du verkaufst %1 %2",_amount,_name];
			_text = format["<<<<SELL ITEM Special>>>>|%1||%2|>>hat %3 %4 verkauft",getPlayerUID player,name player,_amount,_name];
			[[5,_text],"TON_fnc_log",false,false] call EMonkeys_fnc_mp;
		};
	};
	
	if(([false,_type,_amount] call EMonkeys_fnc_handleInv)) then
	{
		hint format["Du verkaufst %1 %2 für %3€",_amount,_name,[_price] call EMonkeys_fnc_numberText];
		EMonkeys_c164 = EMonkeys_c164 + _price;
		[] call EMonkeys_fnc_virt_update; 
	
		_marketprice = [_type] call EMonkeys_fnc_marketGetPrice;
		if(_marketprice != -1) then
		{
			[[_type,_amount],"EMonkeys_fnc_updateEconomy",false,false] call EMonkeys_fnc_mp;
		};
	};
};