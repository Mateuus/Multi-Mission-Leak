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
	if(_x != -1) then {
		_price = _price + _x;
	};
} forEach XY_clothingPurchase;

if( !([_price] call XY_fnc_pay) ) exitWith {
    hint "Du hast nicht genug Geld um diese Kleidung zu kaufen";
};

XY_clothesPurchased = true;
closeDialog 0;

XY_forceSaveTime = time + 8;