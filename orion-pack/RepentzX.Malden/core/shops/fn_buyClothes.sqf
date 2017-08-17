#include "..\..\script_macros.hpp"
/*
    File: fn_buyClothes.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Buys the current set of clothes and closes out of the shop interface.
*/
private ["_price"];
if ((lbCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

if (_price > civRDM) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
civRDM = civRDM - _price;
[player,"buy"] remoteexeccall ["say3D",0];
[0] call SOCK_fnc_updatePartial;

life_clothesPurchased = true;
[] call life_fnc_playerSkins;
closeDialog 0;