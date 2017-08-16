/*
	File: fn_sellOil.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Sells the oil to the oil trader.
	Will be revised.
*/
private["_index","_price","_val"];
_index = ["oilp",buy_array] call life_fnc_index;
_price = floor (((buy_array select _index) select 1));
_val = life_inv_oilp;
_price = _price * _val;

if(([false,"oilp",_val] call life_fnc_handleInv)) then
{
	titleText[format["You have sold %1 barrels of oil for $%2",_val,[_price] call life_fnc_numberText],"PLAIN"];
	["cash","add",_price] call life_fnc_uC;
	//[[44, player, format["Sold %1 barrels of oil for %2", _val, _price]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
};