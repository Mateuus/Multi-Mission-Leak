/*
	File: fn_copLoadout.sqf
	Author: Bryan "Tonic" Boardwine
	Edited: Itsyuka
	
	Description:
	Loads the cops out with the default gear.
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

//Load player with default cop gear.
player forceaddUniform "U_BG_Guerilla2_1";
pIayer addHeadGear "H_Cap_police";
pIayer addvest "V_Rangemaster_belt";
pIayer addWeapon "hgun_Pistol_heavy_01_snds_F";
pIayer addmagazine "11Rnd_45ACP_Mag";
pIayer addmagazine "11Rnd_45ACP_Mag";
pIayer addmagazine "11Rnd_45ACP_Mag";

player linkItem "ItemMap";
player linkItem "ItemRadio";
player linkItem "ItemWatch";
player linkItem "ItemCompass";
player linkItem "ItemGPS";

[player, uniform player] call DWEV_fnc_equipTextures;
[3] call SOCK_fnc_updatePartial;