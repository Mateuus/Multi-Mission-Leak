/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
Loads a players gear after he dies and is revived
*/
private ["_handGun","_dataArray","_clothes","_dataArray","_vest","_backpack","_glasses","_hat","_items","_primary","_primaryItems","_handgunItems","_uniformItems","_vestItems","_vestMags","_backpackMags","_backpackItems"];
_dataArray = [_this,0,[],[[]]] call BIS_fnc_param;
if(count _dataArray == 0) exitWith{};
//Lets get nakkie
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

_clothes = [_dataArray,0,"",[""]] call BIS_fnc_param;
_vest = [_dataArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_dataArray,2,"",[""]] call BIS_fnc_param;
_glasses = [_dataArray,3,"",[""]] call BIS_fnc_param;
_hat = [_dataArray,4,"",[""]] call BIS_fnc_param;
_items = [_dataArray,5,[],[[]]] call BIS_fnc_param;
_uniformItems = [_dataArray,6,[],[[]]] call BIS_fnc_param;
_uniformMags = [_dataArray,7,[],[[]]] call BIS_fnc_param;
_backpackItems = [_dataArray,8,[],[[]]] call BIS_fnc_param;
_backpackMags = [_dataArray,9,[],[[]]] call BIS_fnc_param;
_vestItems = [_dataArray,10,[],[[]]] call BIS_fnc_param;
_vestMags = [_dataArray,11,[],[[]]] call BIS_fnc_param;
//_handGun = [_dataArray,12,"",[""]] call BIS_fnc_param;
//if(!(_handGun isEqualTo "")) then {_handle = [_handGun] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_clothes isEqualTo "")) then {_handle = [_clothes] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_glasses isEqualTo "")) then {_handle = [_glasses] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_hat isEqualTo "")) then {_handle = [_hat] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_vest isEqualTo "")) then {_handle = [_vest] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
if(!(_backpack isEqualTo "")) then {_handle = [_backpack] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};};
{_handle = [_x] spawn DS_fnc_equipItem; waitUntil {scriptDone _handle};} foreach _items;
{player addItemToUniform _x;} foreach (_uniformItems);
{(uniformContainer player) addItemCargoGlobal [_x,1];} foreach (_uniformMags);
{player addItemToVest _x;} foreach (_vestItems);
{(vestContainer player) addItemCargoGlobal [_x,1];} foreach (_vestMags);
{player addItemToBackpack _x;} foreach (_backpackItems);
{(backpackContainer player) addItemCargoGlobal [_x,1];} foreach (_backpackMags);

[] spawn
{
	private["_bp","_load","_cfg"];
		while{true} do
		{
			waitUntil {backpack player != ""};
			_bp = backpack player;
			_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
			_load = round(_cfg / 8);
			DS_maxWeight = (24 + _load);
			if(playerSide != civilian) then {(unitBackpack player) setObjectTextureGlobal [0,""];};
			if(playerside == west)then
				{
				if(DS_copLevel == 7)then{DS_maxWeight = DS_maxWeight + 20};
				};
			waitUntil {backpack player != _bp};
			if(backpack player == "") then 
			{
				DS_maxWeight = 24;
			};
		};
};

[] spawn DS_fnc_copuniform;