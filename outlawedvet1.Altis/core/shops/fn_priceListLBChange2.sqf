#include "..\..\script_macros.hpp"
/*
    File: fn_priceListLBChange.sqf
    Author: RPGforYOU based on original Tonics
*/
disableSerialization;
private["_className","_sellprice","_weight","_namelicense","_namelicenselocalized","_purchaseprice","_playerside","_classNameLife","_initalPrice","_buyMultiplier","_rentMultiplier","_vehicleInfo","_colorArray","_ctrl","_trunkSpace","_maxspeed","_horsepower","_passengerseats","_fuel","_armor"];

//Fetch some information.
_className = (_this select 0) lbData (_this select 1);
_classNameLife = _className;

diag_log format["classnam 2: %1",_className];

_namelicense = M_CONFIG(getText,"Licenses",_classNameLife,"Displayname");
_namelicenselocalized = localize _namelicense;
_playerside = M_CONFIG(getText,"Licenses",_classNameLife,"side");
_purchaseprice = M_CONFIG(getNumber,"Licenses",_classNameLife,"price");

/*
_namelicense = getText((configClasses(_className)) >> "displayName");
_namelicenselocalized = localize _namelicense;
_playerside = getText((configfile(_className)) >> "side");
_purchaseprice = getnumber((configfile(_className)) >> "price");
*/

diag_log format["_namelicense2: %1",_namelicense];
diag_log format["_playerside: %1",_playerside];
diag_log format["_purchaseprice: %1",_purchaseprice];


ctrlShow [3330,true];
(CONTROL(3300,3303)) ctrlSetStructuredText parseText format[
	("Name license: ")+ "<t color='#8cff9b'>%1</t><br/>" +
    ("Purchase price: ")+ "<t color='#8cff9b'>$%3</t><br/>" +
	("Playerside: ")+ "<t color='#8cff9b'>%2 </t><br/>",
    _namelicenselocalized,
    _playerside,
	[_purchaseprice] call life_fnc_numberText
];

_ctrl = CONTROL(2300,2304);
lbClear _ctrl;
true;

