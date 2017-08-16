/*
	File: fn_stripDownPlayer.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Strip the player down
*/
removeUniform player;
removeVest player;
removeBackpackGlobal player;
removeHeadGear player;
removeAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeAllAssignedItems player;
removeGoggles player;

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

if(hmd player != "") then {
	player unlinkItem (hmd player);
};