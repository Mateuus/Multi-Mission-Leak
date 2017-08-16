/*
	File: fn_seizePlayerWeaponAction.sqf
	Author: Skalicon
	Modified by: cat24max and Daniel Larusso
	
	Description:
	Removes the players weapons client side
*/
private["_blacklist", "_itemArray","_primary","_handgun","_magazines","_uniform","_vest","_backpack","_items","_primitems","_secitems","_handgunitems","_uitems","_vitems","_bitems","_handle"];

_blacklist = [] call life_fnc_seizeCfg;

[] call life_fnc_saveGear;

_itemArray = life_gear;

_uniform = [_itemArray,0,"",[""]] call BIS_fnc_param;
_vest = [_itemArray,1,"",[""]] call BIS_fnc_param;
_backpack = [_itemArray,2,"",[""]] call BIS_fnc_param;
_goggles = [_itemArray,3,"",[""]] call BIS_fnc_param;
_headgear = [_itemArray,4,"",[""]] call BIS_fnc_param;
_items = [_itemArray,5,[],[[]]] call BIS_fnc_param;
_prim = [_itemArray,6,"",[""]] call BIS_fnc_param;
_seco = [_itemArray,7,"",[""]] call BIS_fnc_param;
_uItems = [_itemArray,8,[],[[]]] call BIS_fnc_param;
_uMags = [_itemArray,9,[],[[]]] call BIS_fnc_param;
_bItems = [_itemArray,10,[],[[]]] call BIS_fnc_param;
_bMags = [_itemArray,11,[],[[]]] call BIS_fnc_param;
_vItems = [_itemArray,12,[],[[]]] call BIS_fnc_param;
_vMags = [_itemArray,13,[],[[]]] call BIS_fnc_param;
_pItems = [_itemArray,14,[],[[]]] call BIS_fnc_param;
_hItems = [_itemArray,15,[],[[]]] call BIS_fnc_param;
_yItems = [_itemArray,16,[],[[]]] call BIS_fnc_param;

if(_prim in _blacklist) then { _prim = ""; };
if(_seco in _blacklist) then { _seco = ""; };
{if(_x in _blacklist) then { _uMags = _uMags - [_x]; }; } foreach _uMags;
{if(_x in _blacklist) then { _vMags = _vMags - [_x]; }; } foreach _vMags;
{if(_x in _blacklist) then { _bMags = _bMags - [_x]; }; } foreach _bMags;

life_gear = [_uniform,_vest,_backpack,_goggles,_headgear,_items,_prim,_seco,_uItems,_uMags,_bItems,_bMags,_vItems,_vMags,_pItems,_hItems,_yItems];

[] call life_fnc_loadGear;
titleText["Ihre Waffen und Magazine wurden beschlagnahmt.","PLAIN"];