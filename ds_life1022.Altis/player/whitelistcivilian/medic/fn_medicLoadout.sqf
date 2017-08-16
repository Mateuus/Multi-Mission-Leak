/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Loads the medics uniform
*/

removeAllContainers player;
removeAllWeapons player;
player addBackpack "B_Carryall_cbr";
player forceAddUniform "U_Rangemaster";
player addItem "Medikit";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};
player addItem "NVGoggles";
player addItem "ItemGPS";
player assignItem "NGGoggles";
player assignItem "ItemGPS";
[player,0,"extras\textures\clothing\wlciv\medic_uniform.jpg"] remoteExec ["DS_fnc_globalTextureClothes",0];
//player setObjectTextureGlobal [0,"extras\textures\clothing\wlciv\medic_uniform.jpg"];
DSL_car = true;
DSL_air = true;
DSL_truck = true;

DSL_security = false;

removeAllActions player;
[] call DS_fnc_setupPlayerActions;