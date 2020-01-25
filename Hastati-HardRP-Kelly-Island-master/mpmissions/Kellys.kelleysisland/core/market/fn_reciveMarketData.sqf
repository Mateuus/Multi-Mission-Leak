/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Virtual item name
	_this select 1: Buy or Sell - true for buy, false for sell
	_this select 2: object which send execution
	_this select 3: quantity of items sold or bought
	
	Returns:
	Nothing
*/
_type = _this select 0;
_buy = _this select 1;
_object = _this select 2;
_quantity = _this select 3;


if(_quantity < 1) exitWith {}; //Dafuq?
if(!isDedicated) exitWith {}; //Don't let players execute this script
if(typename _type != "STRING") exitWith {}; //Checking if _type is string
if(isNull _object) exitWith {}; // anonymous sender?

{
	if((_x select 0) == _type) then {
		if(_buy) then {
			if((_x select 5) > 0) then {
				_x set [5, ((_x select 5) - _quantity)];
				_x set [1, ((_x select 1) + ((_x select 7) * _quantity))];
			} else {
				//if not enough to buy set quantity to 0 and set maximum price
				_x set [5, 0];
				_x set [1, (_x select 2)];
			};
		} else {
			if((_x select 5) < (_x select 6)) then {
				_x set [5, (_x select 5) + _quantity];
				_x set [1, ((_x select 1) - ((_x select 7) * _quantity))];
			} else {
				//if there is too much on market set maximum and minimal price
				_x set [5, (_x select 6)];
				_x set [1, (_x select 3)];
			};	
		};
	};
} foreach life_marketItems;
[] spawn life_fnc_syncMarketData;
