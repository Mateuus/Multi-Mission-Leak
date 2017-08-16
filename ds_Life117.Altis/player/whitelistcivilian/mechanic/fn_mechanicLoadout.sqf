/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Sets up a whitelisted civilian
*/
removeAllContainers player;
removeAllWeapons player;
player addBackPack "B_Carryall_cbr";
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
[[player,0,"extras\textures\clothing\wlciv\mechanic_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn BIS_fnc_MP;
DSL_car = true;
DSL_air = true;
DSL_truck = true;

//player addaction ["Make Repair Kit",DS_mech_makeRepair,[],1,false,true,"",""];
//player addaction ["Make Nitro Kit",DS_mech_makeNos,[],1,false,true,"",""];

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
	
[] call DS_fnc_setupPlayerActions;
DS_mechanic = true;