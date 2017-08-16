/*

	[] fnc [SHORTNAME, [PRICEROW], (send?)];

*/

private["_shortname","_price","_send"];

_shortname = _this select 0;
_price = _this select 1;
_send = param [2,true];

{
	if((_x select 0) == _shortname) exitWith
	{
		lhm_market_prices set [_forEachIndex, _price];
	};
}
foreach lhm_market_prices;

if(_send) then {publicVariable "lhm_market_prices";};