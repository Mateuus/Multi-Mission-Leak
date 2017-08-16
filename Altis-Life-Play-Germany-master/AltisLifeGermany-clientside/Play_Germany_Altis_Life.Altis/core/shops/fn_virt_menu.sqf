/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "evidence" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
life_shop_type = _shop;
life_shop_npc = _this select 0;
createDialog "shops_menu";

[] call life_fnc_virt_update;

waitUntil{!isNull (findDisplay 2400)};
waitUntil {sleep 1; isNull (findDisplay 2400)};

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;