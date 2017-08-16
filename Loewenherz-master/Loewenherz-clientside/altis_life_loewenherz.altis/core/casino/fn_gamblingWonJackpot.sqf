#include <macro.h>
/*
	File: fn_gamblingWonJackpot.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	Gambling Gambling Gambling!!!
*/

private["_jackpot"];

_jackpot = param [0,0,[0]];
if(_jackpot <= 0) exitWith {};


lhm_cash = lhm_cash + _jackpot;

//save data to db
[1] call SOCK_fnc_updatePartial;

hint format[localize "STR_CASINO_WONVALUE",[_jackpot]];