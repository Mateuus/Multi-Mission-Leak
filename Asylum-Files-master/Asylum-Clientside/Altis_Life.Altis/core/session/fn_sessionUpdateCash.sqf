/*
	File: fn_sessionUpdateCash.sqf
	Author: Kyle "Skalicon" O'Flynn
	
	Description:
	Only handles updating the players cash to the DB - OBSOLETE!!
*/
private["_packet"];

if ((player distance (getMarkerPos "Respawn_west")) < 750) exitWith {};

if ((life_moneyCache != (life_money / 2) + 5) || (life_atmmoneyCache != (life_atmmoney / 2) + 3)) then
{
	[] spawn 
	{
		[[911, player, "Money MEMORY HACK! Ban!"],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
	};
};
_packet = [getPlayerUID player,life_money,life_atmmoney];

[_packet,"ASY_fnc_uC",false,false] spawn life_fnc_MP;