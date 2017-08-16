/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
private["_shop"];
_shop = _this select 3;
if(isNil {_shop}) exitWith {};

if( vehicle player != player ) exitWith {
    hint "Steig' erstmal aus dem Auto aus";
};

XY_shopType = _shop;
XY_shopNPC = _this select 0;
if(_shop == "cop" && playerSide != west) exitWith {hint localize "STR_NOTF_NotACop"};
if(_shop == "thw" && playerSide != east) exitWith {hint "Du bist nicht im THW"};
if(_shop == "medic" && playerSide != independent) exitWith {hint "Du bist kein Sanitäter"};
createDialog "XY_dialog_items";

[] call XY_fnc_virtualShopUpdate;