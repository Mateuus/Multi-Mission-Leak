#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
	Author: Shawn "Huntah" Macgillivray
	
	Description:
	Police Weapons Locker
*/
private ["_result","_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_indexx","_value","_newWeight"];

_vehicle = DS_locker;
disableSerialization;
_dialog = findDisplay 666668;
_list2 = _dialog displayCtrl 1500;
_storeItem = ctrlSelData(1500);
_storeAmount = ctrlText 1400; 
_indexx = -1;
_smallGuns = ["hgun_Rook40_F","hgun_Pistol_heavy_02_F","hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_ACO_F","arifle_SDAR_F","arifle_Mk20_MRCO_plain_F","arifle_TRG21_MRCO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F","SMG_02_ACO_F","SMG_01_Holo_pointer_snds_F","arifle_Katiba_ACO_pointer_F"];
_bigGuns = ["LMG_Mk200_F","arifle_MX_SW_Black_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_04_Tan_F","srifle_DMR_06_camo_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_01_F","LMG_Zafir_pointer_F","arifle_MXM_Black_F","arifle_MX_GL_F","RPG32_F"];
_largeGuns = ["srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_LRR_F","srifle_GM6_camo_F","launch_RPG32_F","srifle_GM6_LRPS_F","launch_B_Titan_short_F","MMG_02_camo_F","MMG_01_hex_F","srifle_DMR_05_hex_F"];
_result = 0;
_parsed = (parseNumber(_storeAmount));
_parsedTemp = _parsed;
if(_storeItem == "")exitwith{hint "No item selected"};
if(_parsed < 1)exitwith{hint "Select an amount you wish to store"};

switch(true)do
	{
	case (_storeItem in _smallGuns): {_itemWeight = (10*_parsed)};
	case (_storeItem in _bigGuns): {_itemWeight = (20*_parsed)};
	case (_storeItem in _largeGuns): {_itemWeight = (40*_parsed)};
	default {_itemWeight = _parsed};
	};
_vehInventory = _vehicle select 0;
_newWeight = _vehicle select 1;
_result = {_x == _storeItem} count _vehInventory;
if(_parsed > _result)exitwith{hint "You do not have this much of that item"};
{
	if((_x == _storeItem)&&(_parsedTemp > 0))then
		{
		_vehInventory set [_forEachIndex,-1];
		[_storeItem] call DS_fnc_equipItem;
		_parsedTemp = _parsedTemp - 1;
		};
}forEach _vehInventory;
_vehInventory = _vehInventory - [-1];


_newWeight = _newWeight - _itemWeight;

DS_locker = [_vehInventory,_newWeight];

closeDialog 0;
[]spawn DS_cop_vehLocker;
sleep 5;
if((_storeItem in _smallGuns)||(_storeItem in _bigGuns)||(_storeItem in _largeGuns))then
	{
	[] call DS_fnc_compileData;
	};
