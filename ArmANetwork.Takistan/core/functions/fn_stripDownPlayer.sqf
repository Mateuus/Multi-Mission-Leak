/*
	File: fn_stripDownPlayer.sqf
	Author: Tobias 'Xetoxyc' Sittenauer

	Description: Strip the player down
*/
player_stripped = false;
RemoveAllWeapons player;
{player removeMagazine _x;} foreach (magazines player);
removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadGear player;

{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

player_stripped = true;
