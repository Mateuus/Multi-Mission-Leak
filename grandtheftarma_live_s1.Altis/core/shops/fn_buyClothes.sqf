/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(playerSide == west) then { _price = 0; };

if(_price > GTA_money_cash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
GTA_money_cash = GTA_money_cash - _price;

life_clothesPurchased = true;
closeDialog 0;

[ [ player, uniform player, uniformContainer player ], "GTA_fnc_setUnitTextures" ] call GTA_fnc_remoteExec;