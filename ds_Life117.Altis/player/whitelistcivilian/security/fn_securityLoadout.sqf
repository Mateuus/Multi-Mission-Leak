/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Loads the security uniform
*/
removeAllContainers player;
removeAllWeapons player;
player addBackPack "B_Carryall_cbr";
player forceAddUniform "U_Rangemaster";
removeGoggles player;
removeHeadGear player;
if(hmd player != "") then {
	player unlinkItem (hmd player);
};
player addItem "NVGoggles";
player addItem "ItemGPS";
player assignItem "NGGoggles";
player assignItem "ItemGPS";
[[player,0,"extras\textures\clothing\wlciv\security_uniform.jpg"],"DS_fnc_globalTextureClothes",true,false] spawn BIS_fnc_MP;
DSL_car = true;
DSL_air = true;
DSL_truck = true;
DSL_security = true;

player setVariable ["stunAmmo",true,true];

player addAction["Pickup SpikeStrip",DS_cop_packSpikes,["Land_Razorwire_F","Spike Strip",west,"spikeStrip"],0,false,false,"",
		' _spikes = nearestObjects[getPos player,["Land_Razorwire_F"],8] select 0; !isNil "_spikes" && !isNil {(_spikes getVariable "item")}'];

if((DS_infoArray select 19) < 7)exitWith
	{
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addMagazine "16Rnd_9x21_Mag";
	player addWeapon "hgun_P07_snds_F";
	};

if(DS_WLLevel < 3)then
	{
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addmagazine "30Rnd_556x45_Stanag_Tracer_Yellow";
	player addweapon "arifle_TRG21_ARCO_pointer_F";
	if((DS_infoArray select 19) > 15)then
		{
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addmagazine "11Rnd_45ACP_Mag";
		player addweapon "hgun_Pistol_heavy_01_MRD_F";
		}
		else
		{
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		};
	player addweapon "Binocular";
	}
	else
	{
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addmagazine "30Rnd_65x39_caseless_mag_Tracer";
	player addweapon "arifle_MXC_Holo_pointer_snds_F";
	if((DS_infoArray select 19) > 15)then
		{
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addmagazine "6Rnd_45ACP_Cylinder";
		player addweapon "hgun_Pistol_heavy_02_Yorris_F";
		}
		else
		{
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addMagazine "16Rnd_9x21_Mag";
		player addWeapon "hgun_P07_snds_F";
		};
	player addweapon "Rangefinder";
	};

if((DS_infoArray select 19) > 20)then
	{
	player addItem "medikit";
	player addMagazine "SmokeShellGreen";
	player addMagazine "SmokeShellGreen";
	player addMagazine "SmokeShellGreen";
	};
	
if((DS_infoArray select 19) > 31)then
	{
	player addHeadGear "H_RacingHelmet_4_F";
	};
	
if((DS_infoArray select 19) > 32)then
	{
	player addVest "V_PlateCarrierSpec_blk";
	};
	
if((DS_infoArray select 19) > 33)then
	{
		{
			missionNamespace setVariable[_x,0];
		}forEach DS_itemArray;
		DS_currentWeight = 0;
		
		["doritos",true,5] call DS_fnc_handleInventory;//5
		["pepsi",true,5] call DS_fnc_handleInventory;//10
		["mediKit",true,5] call DS_fnc_handleInventory;//15
		["repairKit",true,15] call DS_fnc_handleInventory;//30
		["refuelKit",true,1] call DS_fnc_handleInventory;//33
		["chute",true,2] call DS_fnc_handleInventory;//35
		["buildingBox",true,1] call DS_fnc_handleInventory;//36
		["spikeStrip",true,2] call DS_fnc_handleInventory;//44
		["ammoTear",true,4] call DS_fnc_handleInventory;//48
		["armour",true,2] call DS_fnc_handleInventory;//50
	};	

if((DS_infoArray select 19) > 34)then
	{
	DS_armour = 10;
	[] call DS_fnc_updateHud;
	};
	
if((DS_infoArray select 19) > 37)then
	{
	["DS_item_gun3gl",true,1] call DS_fnc_handleInventory;
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	player addMagazine "3Rnd_SmokeOrange_Grenade_shell";
	};
	
[] call DS_fnc_setupPlayerActions;