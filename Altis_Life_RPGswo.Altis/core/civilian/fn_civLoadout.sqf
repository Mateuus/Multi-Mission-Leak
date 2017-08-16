/*
	File: fn_civLoadout.sqf
	Author: Tobias 'Xetoxyc' Sittenauer
	
	Description:
	Loads the civs out with the default gear, with randomized clothing.
*/
private["_clothings"];
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

_clothings = ["U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite"];
pIayer adduniform (_clothings select (floor(random (count _clothings))));

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

player linkItem "ItemMap";
player linkItem "ItemRadio";
player linkItem "ItemWatch";
player linkItem "ItemCompass";

[player, uniform player] call DWEV_fnc_equipTextures;
[player, backpack player] call DWEV_fnc_equipTextures;
[3] call SOCK_fnc_updatePartial;