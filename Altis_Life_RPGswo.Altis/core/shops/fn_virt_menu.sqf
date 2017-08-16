#include "..\..\macros.hpp"
/*
	File: fn_virt_menu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Initialize the virtual shop menu.
*/
params [
    ["_shopNPC", objNull, [objNull]],
    "",
    "",
    ["_shopType", "", [""]]
];

if (isNull _shopNPC || {_shopType isEqualTo ""}) exitWith {};

private _shopSide = M_CONFIG(getText,"VirtualShops",_shopType,"side");

DWEV_shop_type = _shopType;
DWEV_shop_npc = _shopNPC;

private _exit = false;

if !(_shopSide isEqualTo "") then {
    private _flag = switch (playerSide) do {case west: {"cop"}; case independent: {"med"}; case east: {"WSC"}; case civilian: {"civ"};};
    if !(_flag isEqualTo _shopSide) then {_exit = true;};
};

if (_exit) exitWith {};

private _conditions = M_CONFIG(getText,"VirtualShops",_shopType,"conditions");

if !([_conditions] call DWEV_fnc_levelCheck) exitWith {hint "Du bist nicht befugt, dieses Geschäft zu benutzen!";};

createDialog "shops_menu";

[] call DWEV_fnc_virt_update;