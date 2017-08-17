#include "..\..\script_macros.hpp"
/*
    File: fn_buyClothesDebit.sqf
    Author: Bryan "Tonic" Boardwine
	Edited by: Ilusionz

    Description:
    Buys the current set of clothes a debit card and closes out of the shop interface.
*/
private ["_price","_debitTax","_realTaxAmount","_priceAfterTax"];

if ((lbCurSel 3101) isEqualTo -1) exitWith {titleText[localize "STR_Shop_NoClothes","PLAIN"];};

_price = 0;
{
    if (!(_x isEqualTo -1)) then {
        _price = _price + _x;
    };
} forEach life_clothing_purchase;

try {
	if (civRDM < _price) then {
		if (civRDMed < _price) then {
			[localize "STR_Shop_NotEnoughClothes",true,"slow"] call life_fnc_notificationSystem;
			throw "No money";
		};
	};
			
	if ((civRDMed > _price) && (civRDM < _price)) then {
		if (LIFE_SETTINGS(getNumber,"debit_tax") isEqualTo 1) then {
			_debitTax = LIFE_SETTINGS(getNumber,"debit_taxAmount");
			_realTaxAmount = _debitTax * _price;
			_priceAfterTax = _price + _realTaxAmount;
			civRDMed = civRDMed - _priceAfterTax;
			[1] call SOCK_fnc_updatePartial;
			life_clothesPurchased = true;
			[] call life_fnc_playerSkins;
			closeDialog 0;
			hint parseText format [localize "STR_Debit_Clothing_BoughtItemTax",[_price] call life_fnc_numberText,[_realTaxAmount] call life_fnc_numberText];
		} else {
			civRDMed = civRDMed - _price;
			[1] call SOCK_fnc_updatePartial;
			life_clothesPurchased = true;
			[] call life_fnc_playerSkins;
			closeDialog 0;
			hint parseText format [localize "STR_Debit_Clothing_BoughtItem",[_price] call life_fnc_numberText];
		};
	} else {
		if (life_has_debit isEqualTo true) then {
			civRDM = civRDM - _price;
			[0] call SOCK_fnc_updatePartial;
			life_clothesPurchased = true;
			[] call life_fnc_playerSkins;
			closeDialog 0;
			hint parseText format [localize "STR_Debit_Clothing_UsedOnHandCash",[_price] call life_fnc_numberText];
		} else {
			civRDM = civRDM - _price;
			[0] call SOCK_fnc_updatePartial;
			life_clothesPurchased = true;
			[] call life_fnc_playerSkins;
			closeDialog 0;
		};
	};
} catch {
};