/*
	File: fn_virt_buy.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buy a virtual item from the store.
*/
private["_type","_price","_amount","_diff","_name","_qty"];
_exit = false;
if((lbCurSel 2401) == -1) exitWith {hint "You need to select an item to buy."};
disableSerialization;
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
_qty = _type call life_fnc_getQuantity;
_price = [_type,_price,_qty] call life_fnc_calcPrice;
if (_qty == 0) then { _price = _price * 1.25; };
if(!([_amount] call life_fnc_isnumber)) exitWith {hint "You didn't enter an actual number";};
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if (_amount > 100) exitWith {hint "You cannot buy more than 100 at a time."};
if(_diff <= 0) exitWith {hint "You don't have enough space for that amount!"};
_amount = _diff;
_name = [([_type,0] call life_fnc_varHandle)] call life_fnc_varToStr;
if (life_shop_type == "rebel") then
{
	if (life_money < (_price * _amount)) exitWith { _exit = true; hint format["You do not have enough cash on you for this purchase.  Requires $%1.", (_price * _amount)] };
	["cash","take",(_price * _amount)] call life_fnc_uC;
};
if (_exit) exitWith {};

ctrlEnable [2406, false];

[_type,_price,_qty,_amount,_name] spawn
{
	disableSerialization;
	_type = _this select 0;
	_price = _this select 1;
	_qty = _this select 2;
	_amount = _this select 3;
	_name = _this select 4;
	_exit = false;
	
	if(([true,_type,_amount] call life_fnc_handleInv)) then
	{
		if (_qty > -1) then
		{
			life_approved = nil;
			life_stock_update = [_type, -1 * _amount, player];
			publicVariableServer "life_stock_update";
			waitUntil {!isNil {life_approved}};
		} else { life_approved = true };
		if (!life_approved) then { _price = _price * 1.25 };
		
		if (life_shop_type != "rebel") then
		{
			if(!([(_price * _amount)] call life_fnc_debitCard)) exitWith {_exit = true;};
		};
		if (_exit) exitWith {[false,_type,_amount] call life_fnc_handleInv; life_stock_update = [_type, _amount, player]; publicVariableServer "life_stock_update";};
		//[[92, player, format["Purchased %1 %2 for %3", _amount, _name, (_price * _amount)]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
		if (_qty > -1) then
		{
			_index = [_type, life_price_index] call life_fnc_index;
			if ((life_price_index select _index) select 1 > 0) then
			{
				life_price_index set [_index, [(life_price_index select _index) select 0,((life_price_index select _index) select 1) - _amount]];
			};
		};
		[] call life_fnc_virt_update;
		PlaySound "purchase";
		
		_cut = 0;
		_extra = ".";
		if (life_shop_type == "rebel" && ((life_capture_list select 3) select 2 == 1 && ((life_capture_list select 3) select 1 != life_gang || life_gang == "0"))) then
		{
			_cut = floor ((_price * _amount) * 0.08); // 8% added to cartel
			_var = capture_container_4 getVariable ["gangContainer", ["life_inv_dirty_money",0]];
			_newAmount = (_var select 1) + _cut;
			if (_newAmount > 100000) then { _newAmount = 100000; };
			_var set [1, _newAmount];
			capture_container_4 setVariable ["gangContainer", _var, true];
			_extra = format[", with $%1 going to the owner of the arms dealer.", [_cut] call life_fnc_numberText];
		};
		
		hint format["You bought %1 %2 for $%3%4",_amount,_name,[(_price * _amount)] call life_fnc_numberText,_extra];
	}
	else
	{
		hint format["You do not have room in your inventory for %1 %2",_amount,_name];
	};
	ctrlEnable [2406, true];
};