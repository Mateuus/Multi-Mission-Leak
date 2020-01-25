/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Searches through array looking for price

	Parameter(s):
	_this select 0: STRING - Virtual item name
	
	Returns:
	SCALAR - price of a item, if it is not located in market array it will check sell price in general config
*/

_name = _this select 0;
_ret = -1;
if(isNil "_name") exitWith {};
if(typename _name != "STRING") exitWith {}; //Checking if _type is string
{
	if( (_x select 0) == _name) exitWith {_ret = _x select 1;};
} foreach life_marketItems;
if(_ret == -1) then {_ret = getNumber(missionConfigFile >> "VirtualItems" >> _name >> "sellPrice");};
_ret;