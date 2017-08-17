/*
	File: fn_forceHolster.sqf
	Author: Ducky
	Description Forces Hoster On Get Out
*/

life_curWep_h = currentWeapon player;
player action ["SwitchWeapon", player, player, 100];
player switchCamera cameraView;