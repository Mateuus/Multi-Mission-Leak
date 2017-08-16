/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Takes weapons and items from houses
*/

private ["_index","_result","_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_indexx","_value","_newWeight"];

params [["_check",false,[false]]];

disableSerialization;

_vehicle = DS_bootVeh;
_dialog = findDisplay 666668;
_list2 = _dialog displayCtrl 1500;
_storeItem = lbData [1500,lbCurSel 1500];
_storeAmount = ctrlText 1400;
_indexx = -1;
_heavyStuff = [
	"RPG32_HE_F","RPG32_F","RPG7_F"
];
_smallGuns = [
	"hgun_Rook40_F","hgun_P07_F","hgun_Pistol_heavy_02_F","hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_ACO_F","arifle_SDAR_F","arifle_AKS_F","arifle_Mk20_F","arifle_Mk20_MRCO_plain_F",
	"arifle_TRG21_F","arifle_TRG21_MRCO_F","arifle_TRG21_ARCO_pointer_F","hgun_Pistol_heavy_01_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F","hgun_Pistol_01_F","SMG_02_ACO_F",
	"SMG_01_Holo_pointer_snds_F","SMG_05_F","arifle_MXC_F","arifle_MXC_Black_F","arifle_Katiba_C_F","arifle_Katiba_ACO_pointer_F"
];
_bigGuns = [
	"LMG_Mk200_F","arifle_MX_SW_F","arifle_MX_SW_Black_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_03_F","srifle_DMR_03_woodland_F","srifle_DMR_04_F","srifle_DMR_04_Tan_F",
	"srifle_DMR_06_camo_F","srifle_DMR_03_tan_F","srifle_DMR_03_multicam_F","srifle_DMR_01_F","srifle_DMR_07_hex_F","srifle_DMR_07_blk_F","LMG_Zafir_F","LMG_Zafir_pointer_F","LMG_03_F",
	"arifle_MXM_F","arifle_MXM_Black_F","arifle_MX_GL_F","arifle_AK12_F","arifle_AK12_GL_F","arifle_AKM_F","arifle_ARX_hex_F","arifle_ARX_blk_F","arifle_CTAR_blk_F","arifle_CTAR_hex_F",
	"arifle_CTARS_hex_F","arifle_SPAR_01_blk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_03_snd_F","arifle_SPAR_03_blk_F"
];
_largeGuns = [
	"launch_RPG32_F","launch_RPG32_ghex_F","launch_RPG7_F","srifle_DMR_02_camo_F","srifle_DMR_02_F","srifle_DMR_02_sniper_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_GM6_F",
	"srifle_GM6_LRPS_F","srifle_GM6_camo_F","srifle_GM6_LRPS_F","launch_B_Titan_short_F","MMG_02_camo_F","MMG_02_black_F","MMG_01_hex_F","srifle_DMR_05_hex_F","srifle_DMR_05_blk_F"
];
_result = 0;
_parsed = (parseNumber(_storeAmount));
_parsedTemp = _parsed;

if(_storeItem isEqualTo "")exitWith{hint "No item selected"};
if(_parsed < 1)exitWith{hint "Select an amount you wish to store"};

switch(true)do {
	case (_storeItem in _heavyStuff): {_itemWeight = 2};
	case (_storeItem in _smallGuns): {_itemWeight = 10};
	case (_storeItem in _bigGuns): {_itemWeight = 20};
	case (_storeItem in _largeGuns): {_itemWeight = 40};
	default {_itemWeight = 1};
};

_vehData = _vehicle getVariable ["items",[[],0]];
_vehInventory = _vehData select 0;
_newWeight = _vehData select 1;

{
	if((_x select 0) isEqualTo _storeItem)then {
		_result = (_x select 1);
	};
} forEach _vehInventory;

_nearbyPlayers = {(alive _x)&&(!(_x isEqualTo player))&&(_x distance player < 20)} count allPlayers;
if(_parsed > _result)exitWith{hint "You do not have this much of that item"};

if((_nearbyPlayers > 0)&&(!_check))exitWith {
	_sleepTimer = (random(3));
	sleep _sleepTimer;
	[true] spawn DS_civ_houseItemTakeWeapons;
};

{
	if(((_x select 0) isEqualTo _storeItem)&&(_parsedTemp > 0))then {
		_index = (_x select 1);
		_index = _index - _parsed;
		if(_index < 1)then{_index = -1};

		_vehInventory set [_forEachIndex,[_storeItem,_index]];

		while{_parsedTemp > 0}do {
			[_storeItem] call DS_fnc_equipItem;
			_parsedTemp = _parsedTemp - 1;
		};
	};
} forEach _vehInventory;
_vehInventory = _vehInventory - [[_storeItem,-1]];

_itemWeight = (_itemWeight*_parsed);
_newWeight = _newWeight - _itemWeight;
if(_newWeight < 1)then{_newWeight = 0};

DS_bootVeh setVariable["items",[_vehInventory,_newWeight],true];

closeDialog 0;
[] spawn DS_civ_houseItemStorage;