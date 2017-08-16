/*
	File: fn_inviteAcceptGang.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Yes! Oh please, yes!
*/

if ((time - life_gang_invited) > 30) exitWith {};

[life_gang_invite, 3, life_gang_invite_name, true] spawn life_fnc_addToGang;

hint format["You have joined %1!",life_gang_invite_name];

life_gang_invite = "0";
life_gang_invite_name = "";
life_gang_invited = -100;
