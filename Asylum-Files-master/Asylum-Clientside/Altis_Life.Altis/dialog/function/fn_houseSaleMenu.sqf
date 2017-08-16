/*
	File: fn_houseSaleMenu.sqf
	Author: John "Paratus" VanderZwet
	
	Description:
	Shows house sale menu
*/
private["_display","_text","_edit","_price"];

disableSerialization;
if(isNull life_menu_house || !(life_menu_house isKindOf "House")) exitWith {systemChat "Bad House";};

waitUntil {!isNull (findDisplay 7700)};
_display = findDisplay 7700;
_text = _display displayCtrl 7701;
_edit = _display displayCtrl 7702;

_price = ([typeOf life_menu_house] call life_fnc_housePrice) * 0.75;
_text ctrlSetStructuredText parseText format["This house can be sold immediately to the bank for $%1, or you can list it on the market at any price you wish.", [_price] call life_fnc_numberText];

// Get number with no sci-notation
_digits = _price call bis_fnc_numberDigits;
_digitsCount = count _digits - 1;
_modBase = _digitsCount % 3;
_numberText = "";
{
	_numberText = _numberText + str _x;
} foreach _digits;
_edit ctrlSetText _numberText;