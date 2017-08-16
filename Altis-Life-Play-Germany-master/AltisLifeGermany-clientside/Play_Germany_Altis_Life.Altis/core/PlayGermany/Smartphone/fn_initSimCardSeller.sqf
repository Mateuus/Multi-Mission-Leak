#include <macro.h>
/*
File: fn_initSimCardSeller.sqf
Author: Felix 'Ithron' C.

This file is written for Play Germany.
Do not remove this comment or use this system without my permission.

Description:
Helper script to simplify mission editing.
*/
private["_unit","_provName","_provBuyPrice","_text"];

_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

_unit SVAR["realname","Mobicom Debiltel"];
_unit addAction["Smartphones kaufen",life_fnc_weaponShopMenu,"radio"];

waitUntil { !(isNil "PGSERV_mobile_providers") };

{
    _provName = SEL(_x, 0);
    _provBuyPrice = SEL(_x, 2);

    _text = format["SIM Karte von " + _provName + " (%1€)", [_provBuyPrice] call life_fnc_numberText];
    _unit addAction[_text,PG_fnc_buySim,_provName,0,false,false,"",'playerSide != west && playerSide != independent'];

} forEach PGSERV_mobile_providers;