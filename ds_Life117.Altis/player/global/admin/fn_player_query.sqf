/*
	Author Huntah
	Description:
	Querys a player, returns stuff
*/
private["_admin"];

_admin = _this select 0;
if(isNull _admin) exitWith {};
if(isNil "_admin") exitWith {};

[[DS_atmcoin,DS_coin,owner player,player,DS_nlr,DS_infoArray],"DS_fnc_queryReturn",_admin,false] spawn BIS_fnc_MP;