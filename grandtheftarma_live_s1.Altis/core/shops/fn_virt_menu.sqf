/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine, stuffz - CheapSuit Inc
	
	Description:
	Initialize the virtual shop menu.
	Modified for dynamic market system.
*/
private["_shop"];

_shop = _this select 3;
if(isNil {_shop}) exitWith {};

life_shop_type = _shop;
life_shop_npc = _this select 0;

if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};

createDialog "shops_menu";
[true] call life_fnc_virt_update;