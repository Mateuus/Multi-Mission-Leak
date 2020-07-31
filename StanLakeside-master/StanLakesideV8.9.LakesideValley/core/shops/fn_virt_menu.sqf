/*
	File: fn_virt_menu.sqf
	
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};
life_shop_type = _shop;
life_shop_npc = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {[localize "STR_NOTF_NotACop", false] spawn domsg;};
if(_shop == "ems" && playerSide != independent) exitWith {["Nie jestes medykiem!", false] spawn domsg;};
createDialog "shops_menu";

[] call life_fnc_virt_update;