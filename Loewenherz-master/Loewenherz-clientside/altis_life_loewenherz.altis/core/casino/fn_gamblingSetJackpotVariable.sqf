#include <macro.h>
/*
	File: fn_gamblingSetBlockerVariable.sqf
	Author: Wolfgang Bahmüller
	
	Description:
	Gambling Gambling Gambling!!!
*/

private["_jackpot_legal","_jackpot_illegal"];

//check if the player init is already done
if(isnil ("king_gamble_jackpot")) exitWith {};

_jackpot_legal   = param [0,0,[0]];
_jackpot_illegal = param [1,0,[0]];

king_gamble_jackpot set [0, _jackpot_legal];
king_gamble_jackpot set [1, _jackpot_illegal];

//hint format["Received new Jackpots legal=%1 illegal=%2", _jackpot_legal, _jackpot_illegal];