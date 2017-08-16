/*

	Get market price, otherwise returns -1
	
	INT getPrice [SHORTNAME]

*/

private["_shortname","_ret","_arr_resource"];

_shortname = _this select 0;
_ret = -1;
_arr_resource = [_shortname] call tanoarpg_fnc_marketGetRow;

{
	if( (_x select 0) == _shortname) then
	{
		_ret = _x select 1;
		_ret = _ret * 2;
		if((_arr_resource select 3) < _ret) then { _ret = (_arr_resource select 3); };
	};
} foreach life_market_prices;

_ret;