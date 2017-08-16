/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];

if((lbCurSel 3101) == -1) exitWith {["Oh nein!",localize "STR_Shop_NoClothes","#ff1000","#ffffff",4] call life_fnc_texttiles;};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach life_clothing_purchase;

if(_price > life_beatgeld) exitWith {["Oh nein!",localize "STR_Shop_NotEnoughClothes","#ff1000","#ffffff",4] call life_fnc_texttiles;};
life_beatgeld = life_beatgeld - _price;

life_clothesPurchased = true;
closeDialog 0;

[] call life_fnc_updateClothing;