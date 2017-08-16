/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Sets up a whitelisted civilian
*/

removeAllContainers player;
removeAllWeapons player;
player addBackpack "B_Carryall_cbr";
player forceAddUniform "U_Rangemaster";
removeGoggles player;
removeHeadGear player;
player addItem "NVGoggles";
player addItem "ItemGPS";

if(hmd player != "") then {
	player unlinkItem (hmd player);
};

player assignItem "NGGoggles";
player assignItem "ItemGPS";
[player,0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
//player setObjectTextureGlobal [0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"];

DSL_car = true;
DSL_air = true;
DSL_truck = true;

DSL_security = false;

if((DS_infoArray select 23) > 16)then
	{
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addMagazine "30Rnd_9x21_Mag";
	player addWeapon "hgun_PDW2000_F";
	DSL_weapons = true;
	};

removeAllActions player;
[] call DS_fnc_setupPlayerActions;
DS_mechanic = true;