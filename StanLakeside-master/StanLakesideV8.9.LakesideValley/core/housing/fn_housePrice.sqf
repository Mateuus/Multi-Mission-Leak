#include <macro.h>
/*
	
	
	Description:
	Buys the house?
*/
private["_house","_uid","_action","_houseCfg"];
_house = param [0,ObjNull,[ObjNull]];
_uid = getPlayerUID player;

if(isNull _house) exitWith {};
if(!(_house isKindOf "House_F")) exitWith {};
_houseCfg = [(typeOf _house)] call life_fnc_houseConfig;
if(count _houseCfg == 0) exitWith {};



_costs = (_houseCfg select 0);
_storage = (_houseCfg select 1);
_costs = _costs / 1000000;

[format ["Cost: %1 Million ---- Storage: %2 Crates", _costs, _storage], false] spawn domsg;



