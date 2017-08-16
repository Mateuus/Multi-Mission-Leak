/*
	File: fn_freezePlayer.sqf
	Author: ColinM9991,Barney
 
	Description: Freezes selected player
*/

if(lhm_frozen) then {
	hint "An Admin has unfreezed you";
	disableUserInput false;
	lhm_frozen = false;
} else {
	hint "An Admin has freezed you";
	disableUserInput true;
	lhm_frozen = true;
};