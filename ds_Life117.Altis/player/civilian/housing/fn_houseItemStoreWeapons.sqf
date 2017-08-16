#define ctrlSelData(ctrl) (lbData[##ctrl,(lbCurSel ##ctrl)])
/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Store weapons and items items into houses
*/

private ["_end","_index","_itemArray","_completed","_vehicle","_dialog","_storeAmount","_list2","_vehWeight","_itemWeight","_storeItem","_held","_parsed","_multiple","_indexx","_value","_newWeight"];

_vehicle = DS_bootVeh;
disableSerialization;
_dialog = findDisplay 666668;
_storeAmount = ctrlText 1401; 
_list2 = _dialog displayCtrl 1501;
_storeItem = ctrlSelData(1501);
_indexx = -1;
_completed = 0;
_heavyStuff = ["RPG32_HE_F","RPG32_F"];
_smallGuns = ["hgun_Rook40_F","hgun_Pistol_heavy_02_F","hgun_ACPC2_F","hgun_PDW2000_F","SMG_02_F","SMG_01_ACO_F","arifle_SDAR_F","arifle_Mk20_MRCO_plain_F","arifle_TRG21_MRCO_F","hgun_Pistol_heavy_01_MRD_F","hgun_Pistol_heavy_02_Yorris_F","SMG_02_ACO_F","SMG_01_Holo_pointer_snds_F","arifle_Katiba_ACO_pointer_F"];
_bigGuns = ["LMG_Mk200_F","arifle_MX_SW_Black_F","srifle_EBR_F","srifle_DMR_01_F","srifle_DMR_04_Tan_F","srifle_DMR_06_camo_F","srifle_DMR_03_khaki_F","srifle_DMR_03_multicam_F","srifle_DMR_01_F","LMG_Zafir_pointer_F","arifle_MXM_Black_F","arifle_MX_GL_F"];
_largeGuns = ["srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_LRR_F","srifle_GM6_camo_F","launch_RPG32_F","srifle_GM6_LRPS_F","launch_B_Titan_short_F","MMG_02_camo_F","MMG_01_hex_F","srifle_DMR_05_hex_F"];
_itemArray = [];
_parsed = (parseNumber(_storeAmount));
_parsedTemp = _parsed;
_index = 0;
_end = false;
if(_storeItem == "")exitwith{hint "No item selected"};
if(_parsed < 1)exitwith{hint "Select an amount you wish to store"};
_vehMaxWeight = _vehicle getVariable ["storage",0];
_vehMaxWeight = (_vehMaxWeight*100)+100;
	

switch(true)do
	{
	case (_storeItem in _heavyStuff): {_itemWeight = 2};
	case (_storeItem in _smallGuns): {_itemWeight = 10};
	case (_storeItem in _bigGuns): {_itemWeight = 20};
	case (_storeItem in _largeGuns): {_itemWeight = 40};
	default {_itemWeight = 1};
	};

_vehData = _vehicle getVariable ["items",[[],0]];
_vehInventory = _vehData select 0;
if(((_vehData select 1) + (_itemWeight*_parsed)) > _vehMaxWeight)exitwith{hint "The vehicle can not hold this much of that item"};
_newWeight = _vehData select 1;
while{_parsedTemp > 0}do
	{
	_stored = [_storeItem] call DS_fnc_removeWeapon;
	if(_stored)then{_completed = _completed + 1};
	_parsedTemp = _parsedTemp - 1;
	};
//systemchat format ["Veh Inv = %1",_vehInventory];
if(count(_vehInventory) == 0)then
	{
	_vehInventory pushBack [_storeItem,_completed];
	_newWeight = (_newWeight + (_itemWeight*_parsed));
	}
	else
	{
	while{_completed > 0}do
		{	
			_end = false;
			{
				//systemchat format ["Item = %1 || select 0 = %2",_storeItem,(_x select 0)];
				if(_storeItem == (_x select 0))then
				{
				_index = (_x select 1);
				_index = _index + 1;
				_vehInventory set [_forEachIndex,[_storeItem,_index]];
				_completed = _completed - 1;
				_newWeight = (_newWeight + _itemWeight);
				_end = true;
				};
			if(_end)exitwith{};
			}forEach _vehInventory;
		if(!_end)then
			{
			_vehInventory pushBack [_storeItem,1];
			_newWeight = (_newWeight + _itemWeight);
			_completed = _completed - 1;
			};
		};
	};
//systemchat format ["%1 || %2",_vehInventory,_completed];		
DS_bootVeh setVariable["items",[_vehInventory,_newWeight],true];

closeDialog 0;
[]spawn DS_civ_houseItemStorage;




