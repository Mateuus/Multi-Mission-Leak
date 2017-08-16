/*
    Darkside Life

    Author: Shawn "Huntah" Macgillivray

	Description:
	Querys a player, returns stuff
*/

private ["_admin"];

_admin = _this select 0;
if(isNil "_admin"||isNull _admin)exitWith{};

[player,DS_atmCoin,DS_coin,DS_nlr,DS_infoArray] remoteExecCall ["DS_fnc_queryReturn",_admin];