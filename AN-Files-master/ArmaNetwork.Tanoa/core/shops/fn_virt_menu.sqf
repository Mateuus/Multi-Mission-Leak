/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop isEqualTo "cop" && {playerSide != west}) exitWith {hintSilent "Don't have access to this!";};
if(_shop isEqualTo "rebel" && {playerSide != civilian}) exitWith {hintSilent "Don't have access to this!";};
if(_shop isEqualTo "rebel" && {!license_rebel}) exitWith {hintSilent "Don't have access to this!";};
createDialog "shops_menu";
call life_fnc_virt_update;
