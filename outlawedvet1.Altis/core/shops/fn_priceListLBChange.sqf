#include "..\..\script_macros.hpp"
/*
    File: fn_priceListLBChange.sqf
    Author: RPGforYOU based on original Tonics
*/
disableSerialization;
private["_className","_sellprice","_weight","_nameitemlocalized","_buyprice","_nameitem","_classNameLife","_initalPrice","_buyMultiplier","_rentMultiplier","_vehicleInfo","_colorArray","_ctrl","_trunkSpace","_maxspeed","_horsepower","_passengerseats","_fuel","_armor"];

//Fetch some information.
_className = (_this select 0) lbData (_this select 1);
_classNameLife = _className;

diag_log format["classnam 1: %1",_className];

_nameitem = M_CONFIG(getText,"VirtualItems",_classNameLife,"Displayname");
_nameitemlocalized = localize _nameitem;
_buyprice = M_CONFIG(getNumber,"VirtualItems",_classNameLife,"buyPrice");
_sellprice = M_CONFIG(getNumber,"VirtualItems",_classNameLife,"sellPrice");
_weight = M_CONFIG(getNumber,"VirtualItems",_classNameLife,"weight");

ctrlShow [3330,true];
(CONTROL(3300,3303)) ctrlSetStructuredText parseText format[
	("Name Item: ")+ "<t color='#8cff9b'>%3</t><br/>" +
    ("Buy price: ")+ "<t color='#8cff9b'>$%1</t><br/>" +
    ("Sell Price: ")+ "<t color='#8cff9b'>$%2</t><br/>" +
	("Weight: ")+ "<t color='#8cff9b'>%4 kg</t><br/>",
    [_buyprice] call life_fnc_numberText,
    [_sellprice] call life_fnc_numberText,
	_nameitemlocalized,
	_weight
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;
true;
