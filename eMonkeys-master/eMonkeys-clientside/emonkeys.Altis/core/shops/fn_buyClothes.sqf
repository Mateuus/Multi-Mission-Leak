/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if((lbCurSel 3101) == -1) exitWith {titleText["Du hast nichts zum Kauf ausgewählt.","PLAIN"];};

_price = 0;
{
	if(_x != -1) then
	{
		_price = _price + _x;
	};
} foreach EMonkeys_clothing_purchase;

if(_price > EMonkeys_c164) exitWith {titleText["Entschuldige, aber du hast nicht genug Geld dafür.","PLAIN"];};
EMonkeys_c164 = EMonkeys_c164 - _price;

EMonkeys_clothesPurchased = true;
closeDialog 0;