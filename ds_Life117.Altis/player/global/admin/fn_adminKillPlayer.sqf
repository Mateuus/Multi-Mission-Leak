/*
	File: fn_adminFreeze.sqf
	Author: ColinM9991
 
	Description: Freezes selected player
	
	Edited by Huntah to script kill a player
*/
removeAllWeapons player;
player setDamage 1;
DS_headShot = true;
