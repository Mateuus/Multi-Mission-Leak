/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Loads the medics uniform
*/
removeAllContainers player;
removeAllWeapons player;
player addBackPack "B_Carryall_cbr";
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
[[player,0,"extras\textures\clothing\wlciv\medic_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn BIS_fnc_MP;
DSL_car = true;
DSL_air = true;
DSL_truck = true;

player addaction ["Make Medi Kit",DS_med_makeMedi,[],1,false,true,"",""];

DSL_security = false;

[] call DS_fnc_setupPlayerActions;