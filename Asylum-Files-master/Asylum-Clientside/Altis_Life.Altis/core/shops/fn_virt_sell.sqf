/*
	File: fn_virt_sell.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sell a virtual item to the store / shop
*/
private["_type","_index","_price","_var","_amount","_name"];
if((lbCurSel 2402) == -1) exitWith {};
_type = lbData[2402,(lbCurSel 2402)];
_index = [_type,buy_array] call life_fnc_index;
if(_index == -1) exitWith {};
_price = (buy_array select _index) select 1;
_qty = _type call life_fnc_getQuantity;
_price = [_type,_price,_qty,false] call life_fnc_calcPrice;
_price = round _price;
_var = [_type,0] call life_fnc_varHandle;

if (_type in ["goldbar","dirty_money"] && player distance (getMarkerPos "Rebelop_1") > 200 && player distance (getMarkerPos "Rebelop_2") > 200 && player distance (getMarkerPos "Rebelop_3") > 200 && player distance (getMarkerPos "Rebelop_4") > 200 && player distance (getMarkerPos "Rebelop_5") > 200) exitWith {hint "You cannot sell this here!"};

_amount = ctrlText 2405;
if(!([_amount] call life_fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_amount = parseNumber (_amount);
if(_amount > (missionNameSpace getVariable _var)) exitWith {hint "You don't have that many items to sell!"};

_price = (_price * _amount);
_name = [_var] call life_fnc_vartostr;
if(([false,_type,_amount] call life_fnc_handleInv)) then
{
	// Wong item sale
	_extra = ".";
	if (life_shop_type == "wongs") then
	{
		_cut = 0;
		if ((life_capture_list select 3) select 2 != 1 || ((life_capture_list select 3) select 1 != life_gang || life_gang == "0")) then
		{
			_cut = floor (_price * 0.08); // 8% cut to Wong
			_var = capture_container_4 getVariable ["gangContainer", ["life_inv_dirty_money",0]];
			_newAmount = (_var select 1) + _cut;
			if (_newAmount > 100000) then { _newAmount = 100000; };
			_var set [1, _newAmount];
			capture_container_4 setVariable ["gangContainer", _var, true];
			_extra = format[", after a $%1 cut by the Wong triad.", [_cut] call life_fnc_numberText];
			_price = _price - _cut;
		};
	};
	
	if (life_shop_type in ["wongs","heroin"]) then
	{
		if (4 in life_gangtalents) then { _price = _price * 1.05 };
		if (life_shop_type == "heroin" && 5 in life_gangtalents) then { _price = _price * 1.05 };
		if (life_shop_type == "wongs" && 6 in life_gangtalents) then { _price = _price * 1.05 };
	};
	
	hint format["You sold %1 %2 for $%3%4",_amount,_name,[_price] call life_fnc_numberText,_extra];
	["cash","add",_price] call life_fnc_uC;
	//[[93, player, format["Sold %1 %2 for %3", _amount, _name, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	if (_qty > -1) then
	{
		_index = [_type, life_price_index] call life_fnc_index;
		life_price_index set [_index, [(life_price_index select _index) select 0,((life_price_index select _index) select 1) + _amount]];
		life_stock_update = [_type, _amount, player];
		publicVariableServer "life_stock_update";
	};
	[] call life_fnc_virt_update;
	
	
};