/*
    Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Unlocks a player's keys, disables their global chats or fixes a bugged boot
*/

if(_this select 0)exitWith {
	7 enableChannel [false, false];
	8 enableChannel [false, false];
	9 enableChannel [false, false];
};

DS_doingStuff = false;
DS_mining = false;

cursorTarget setVariable["boot_open",false,true];