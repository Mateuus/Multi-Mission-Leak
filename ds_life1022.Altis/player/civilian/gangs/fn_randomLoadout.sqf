/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Updates the gang members list
*/

private["_clanBalance","_base","_action","_loadoutCost"];

if(([] call DS_fnc_getNearestBase) getVariable ["baseClosed",false])exitwith{closeDialog 0;hint "This base has been shut down by the police. Bases remain closed for 1 hour";};

_loadoutCost = 300000;

if(!DSL_rebelAdv)exitwith{hint "You must have advanced rebel training to buy a random loadout"};

switch(DS_perkLevel)do
	{
	case 1:
		{
		_loadoutCost = 280000;
		};
	case 2:
		{
		_loadoutCost = 260000;
		};
	case 3:
		{
		_loadoutCost = 240000;
		};
	case 4:
		{
		_loadoutCost = 220000;
		};
	case 5:
		{
		_loadoutCost = 200000;
		};
	};

_action = [
	format ["A random loadout cost $%1 from your gangs bank balance, it includes (Weapons, Clothing, Y Inventory Items) - (Any items currently held will be wiped)",_loadoutCost],
	"Buy Random Loadout",
	"Buy",
	"No Thanks"
] call BIS_fnc_guiMessage;

if(!_action)exitwith{};
_clanBalance = 0;
_base = spawnIsland;

switch(true)do
	{
	case (player distance baseClan1 < 100):
		{
		_base = baseClan1;
		_clanBalance = DS_gangBank1;
		};
	case (player distance baseClan2 < 100):
		{
		_base = baseClan2;
		_clanBalance = DS_gangBank2;
		};
	case (player distance baseClan3 < 100):
		{
		_base = baseClan3;
		_clanBalance = DS_gangBank3;
		};
	case (player distance baseClan4 < 100):
		{
		_base = baseClan4;
		_clanBalance = DS_gangBank4;
		};
	case (player distance baseClan5 < 100):
		{
		_base = baseClan5;
		_clanBalance = DS_gangBank5;
		};
	case (player distance baseClan6 < 100):
		{
		_base = baseClan6;
		_clanBalance = DS_gangBank6;
		};
	case (player distance baseClan7 < 100):
		{
		_base = baseClan7;
		_clanBalance = DS_gangBank7;
		};
	case (player distance baseClan8 < 100):
		{
		_base = baseClan8;
		_clanBalance = DS_gangBank8;
		};
	case (player distance baseClan9 < 100):
		{
		_base = baseClan9;
		_clanBalance = DS_gangBank9;
		};
	case (player distance baseClan10 < 100):
		{
		_base = baseClan10;
		_clanBalance = DS_gangBank10;
		};
	case (player distance baseClan11 < 100):
		{
		_base = baseClan11;
		_clanBalance = DS_gangBank11;
		};
	case (player distance baseClan12 < 100):
		{
		_base = baseClan12;
		_clanBalance = DS_gangBank12;
		};
	};

sleep (random 3);

if(_clanBalance < _loadoutCost)exitWith
	{
	hint "There is not enough money in your gangs bank balance to purchase this loadout";
	};

sleep (random 3);

if(_clanBalance < _loadoutCost)exitWith
	{
	hint "There is not enough money in your gangs bank balance to purchase this loadout";
	};

[player,false,_loadoutCost,"Random Loadout",false] remoteExec ["HUNT_fnc_gangMoney",2];

//Begin the loadout
//Strip player
[] call DS_fnc_removeGear;
{
	[_x,false,50] call DS_fnc_handleInventory;
}forEach DS_itemArray;

//Backpack
_backpack = selectRandom ["B_Carryall_oucamo","B_Carryall_khk","B_Carryall_oli","B_Kitbag_cbr","B_Bergen_sgg","B_Bergen_tna_F","B_Bergen_mcamo_F","B_Bergen_hex_F","B_Bergen_dgtl_F","B_Carryall_ghex_F"];
player addBackpack _backpack;

//vest
_backpack = selectRandom ["V_PlateCarrierSpec_tna_F","V_PlateCarrierGL_tna_F","V_PlateCarrier2_tna_F","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrierIAGL_dgtl","V_PlateCarrierIAGL_oli","V_PlateCarrierGL_mtp","V_PlateCarrierGL_rgr"];
player addVest _backpack;

//uniform
_uniform = selectRandom ["U_I_C_Soldier_Bandit_3_F","U_I_C_Soldier_Bandit_5_F","U_B_T_Soldier_AR_F","U_I_C_Soldier_Para_2_F","U_I_C_Soldier_Para_1_F","U_O_SpecopsUniform_blk","U_I_C_Soldier_Para_5_F","U_O_CombatUniform_oucamo","U_O_PilotCoveralls","U_I_G_resistanceLeader_F","U_B_T_Soldier_AR_F","U_B_T_Sniper_F","U_B_T_Soldier_SL_F","U_I_C_Soldier_Para_3_F"];
player addUniform _uniform;

//headgear
_headGear = selectRandom ["H_PilotHelmetFighter_I","H_HelmetB_Enh_tna_F","H_HelmetSpecB_blk","H_MilCap_tna_F","H_StrawHat","H_Bandanna_camo","H_HelmetO_ocamo","H_Shemag_olive","H_ShemagOpen_khk","H_ShemagOpen_tan","H_Helmet_Skate","H_Booniehat_dgtl"];
player addHeadGear _headGear;

//Basics
player addWeapon "Rangefinder";
player addWeapon "NVGoggles_tna_F";
player addWeapon "ItemGPS";

//Y Inventory
_food = selectRandom ["tbacon","doritos","pie","chips"];
[_food,true,4] call DS_fnc_handleInventory;//4
_drink = selectRandom ["water","pepsi","pepsi"];
[_drink,true,3] call DS_fnc_handleInventory;//7
["mediKit",true,7] call DS_fnc_handleInventory;//14
["repairKit",true,10] call DS_fnc_handleInventory;//24
["refuelKit",true,2] call DS_fnc_handleInventory;//30
["chute",true,1] call DS_fnc_handleInventory;//31
["fire",true,1] call DS_fnc_handleInventory;//32
["C4",true,1] call DS_fnc_handleInventory;//37
["armour",true,2] call DS_fnc_handleInventory;//39
["lockpick",true,7] call DS_fnc_handleInventory;//53
["lighter",true,5] call DS_fnc_handleInventory;//58
["ziptie",true,4] call DS_fnc_handleInventory;//62
["goKart",true,1] call DS_fnc_handleInventory;//72 ONLY IF BIG BACKPACK


//Guns use random number to match with ammo
_weapons = ["arifle_AK12_F","arifle_AKM_F","srifle_DMR_04_Tan_F","arifle_CTARS_ghex_F","srifle_EBR_F","srifle_GM6_camo_F","srifle_LRR_camo_F","srifle_DMR_03_tan_F","srifle_DMR_06_camo_F","arifle_MXM_F",
"arifle_ARX_hex_F","LMG_Zafir_F","srifle_DMR_01_F","LMG_Mk200_F"];

_ammo = ["30Rnd_762x39_Mag_F","30Rnd_762x39_Mag_F","10Rnd_127x54_Mag","100Rnd_580x42_Mag_F","20Rnd_762x51_Mag","5Rnd_127x108_Mag","7Rnd_408_Mag","20Rnd_762x51_Mag","20Rnd_762x51_Mag","30Rnd_65x39_caseless_mag",
"30Rnd_65x39_caseless_green","150Rnd_762x54_Box","10Rnd_762x54_Mag","200Rnd_65x39_cased_Box"];

_attachmentsScopes = ["optic_MRCO","","optic_ERCO_blk_F","optic_Arco_ghex_F","optic_Hamr_khk_F","optic_LRPS_ghex_F","optic_LRPS_ghex_F","optic_Hamr_khk_F","optic_MRCO","optic_ERCO_khk_F",
"optic_Arco_ghex_F","optic_MRCO","optic_Holosight","optic_MRCO"];

_attachmentsScopes2 = ["optic_Arco_blk_F","","optic_MRCO","optic_MRCO","optic_ERCO_khk_F","optic_MRCO","optic_Arco_blk_F","optic_Arco_blk_F","optic_Holosight_khk_F","optic_LRPS_ghex_F",
"optic_MRCO","optic_ERCO_blk_F","optic_LRPS_ghex_F","optic_ERCO_khk_F"];

_attachmentsMuzzles = ["muzzle_snds_B","","acc_flashlight","muzzle_snds_58_wdm_F","muzzle_snds_H","","","muzzle_snds_B_khk_F","muzzle_snds_B_khk_F","muzzle_snds_H_khk_F",
"muzzle_snds_65_TI_ghex_F","acc_flashlight","muzzle_snds_B_snd_F","muzzle_snds_H_MG_blk_F"];

_rand = (round random 13);

_weapons = (_weapons select _rand);
_ammo = (_ammo select _rand);
_attachmentsScopes = (_attachmentsScopes select _rand);
_attachmentsScopes2 = (_attachmentsScopes2 select _rand);
_attachmentsMuzzles = (_attachmentsMuzzles select _rand);

if(_rand == 10)then
	{
	for "_i" from 1 to 8 do {player addItem "10Rnd_50BW_Mag_F"};
	};

player addItem _attachmentsScopes2;

for "_i" from 1 to 40 do {player addItem _ammo};

player addWeapon _weapons;
player addPrimaryWeaponItem _attachmentsScopes;
player addPrimaryWeaponItem _attachmentsMuzzles;

player linkItem "ItemMap";
player linkItem "ItemCompass";

DS_armour = 10;
//[] call DS_fnc_compileData;
[] call DS_fnc_updateHud;
hint "Random Loadout Kit Bought";