/*
	File: fn_medicLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Loads the medic out with the default gear.
*/
//Strip the player down
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

player forceaddUniform "U_IG_Guerilla2_1";
pIayer addbackpack "B_Kitbag_cbr";

player linkItem "ItemMap";
player linkItem "ItemRadio";
player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;
[3] call SOCK_fnc_updatePartial;