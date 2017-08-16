/*
	File: fn_inspectLootCrate.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Displays information for selected loot crate
*/
private["_type","_items"];

_type = [_this,0,0,[0]] call BIS_fnc_param;
if(_type == 0) exitWith {};

if (!isNull (findDisplay 22200)) exitWith {}; //Already at the menu, block for abuse?

createDialog "lootcrate_menu";
disableSerialization;
waitUntil {!isNull (findDisplay 22200)};

_display = findDisplay 22200;
_countLabel = _display displayCtrl 22201;
_commonItems = _display displayCtrl 22202; // #1eff00
_rareItems = _display displayCtrl 22204; // #0070dd
_limitedItems = _display displayCtrl 22206; // #a335ee
_buyButton = _display displayCtrl 22212;
_openButton = _display displayCtrl 22214;

_countLabel ctrlSetText format["POSSIBLE CONTENTS OF LOOT CRATE (you have %1 keys)", life_lootKeys select (_type - 1)];
_openButton ctrlEnable ((life_lootKeys select (_type - 1)) > 0);

_items = [_type] call life_fnc_lootCrateItems;

_itemST = "";
{ _itemST = _itemST + (_x select 1) + "<br/>" } forEach (_items select 0);
_commonItems ctrlSetStructuredText parseText format["<t size='0.8' color='#1eff00'>%1</t>", _itemST];
_itemST = "";
{ _itemST = _itemST + (_x select 1) + "<br/>" } forEach (_items select 1);
_rareItems ctrlSetStructuredText parseText format["<t size='0.8' color='#0070dd'>%1</t>", _itemST];
_itemST = "";
{ _itemST = _itemST + (_x select 1) + "<br/>" } forEach (_items select 2);
_limitedItems ctrlSetStructuredText parseText format["<t size='0.8' color='#a335ee'>%1</t>", _itemST];