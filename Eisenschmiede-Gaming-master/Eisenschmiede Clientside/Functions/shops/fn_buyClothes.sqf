#include "..\script_macros.hpp"
/*
	File: fn_buyClothes.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Buys the current set of clothes and closes out of the shop interface.
*/
private["_price"];
if(EQUAL((lbCurSel 3101),-1)) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
	if(!(EQUAL(_x,-1))) then {
		_price = _price + _x;
	};
} foreach ES_clothing_purchase;

if(_price > ES_cash) exitWith {titleText[localize "STR_Shop_NotEnoughClothes","PLAIN"];};
ES_cash = ES_cash - _price;

["Kleidungkaufen"] call ES_fnc_xp_add;

playSound "kaufen";
ES_clothesPurchased = true;
closeDialog 0;
if (isClass(configFile >> "CfgPatches" >> "EisenschmiedeHighTextures")) then { [] spawn ES_fnc_updateClothing; }else{ [] spawn ES_fnc_updateClothing; };