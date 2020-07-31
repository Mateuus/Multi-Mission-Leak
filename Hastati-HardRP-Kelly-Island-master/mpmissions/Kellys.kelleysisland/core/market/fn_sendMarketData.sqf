/*
	Author: Kajetan "Kruk" Mruk
	
	Description:
	Send execution to server

	Parameter(s):
	_this select 0: STRING - Virtual item name
	_this select 1: Buy or Sell - true for buy, false for sell
	_this select 2: Quantity of goods bought or sold
	
	Returns:
	BOOL - true if function was executed successfully
*/
_type = _this select 0;
_buy = _this select 1;
_quantity = _this select 2;
_ret = false;
if(typeName _type != "STRING") exitWith {_ret}; //Checking if _type is string
if(typeName _buy != "BOOL") exitWith {_ret};
if(typeName _quantity != "SCALAR") exitWith {_ret};
if(_quantity < 1) exitWith {_ret};
[_type, _buy, player, _quantity] remoteExec ["life_fnc_reciveMarketData",2];
_ret = true;
_ret;