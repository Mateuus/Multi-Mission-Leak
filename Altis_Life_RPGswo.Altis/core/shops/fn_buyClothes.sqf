#include "..\..\macros.hpp"
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if ((lbCurSel 3101) isEqualTo -1) exitWith {titleText["Was möchtest du kaufen?","PLAIN"];};

_price = 0;
{
    if (!(_x isEqualTo -1)) then
	{
        _price = _price + _x;
    };
} forEach DWEV_clothing_purchase;

if (actionSpendenziel1) then {_price = (_price*0.9);};
if(_price > dwf_cash) exitWith {titleText["Du hast nicht genug Geld, um diese Kleidung zu erwerben.","PLAIN"];};
dwf_cash = dwf_cash - _price;

[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;

DWEV_clothesPurchased = true;
closeDialog 0;

[] spawn
{
	sleep 2;
	[player, uniform player] call DWEV_fnc_equipTextures;
	[player, backpack player] call DWEV_fnc_equipTextures;
};

