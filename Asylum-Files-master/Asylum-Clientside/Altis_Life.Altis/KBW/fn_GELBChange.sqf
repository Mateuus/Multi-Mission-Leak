#include <macro.h>
/*
	File: fn_GELBChange
	Author: Kevin Webb
	
	Description:
	Sets up our Grand Exchange UI When we click something else
	Copyright © 2015 Kevin Webb, All rights reserved
	Written for Asylum Entertainment ™
*/
disableSerialization;
private["_control","_index","_dataArr","_vehicleColor","_vehicleInfo","_trunkSpace","_sellPrice","_retrievePrice"];
_control = _this select 0;
_index = _this select 1;

/*Fetch some information.*/
_dataArr = _control lbData _index; 
_dataArr = call compile format["%1",_dataArr];
_displayName = _dataArr select 0;
_price = _dataArr select 1;
_price = [_price] call life_fnc_numberText;
_buySell = _dataArr select 2;
_type = _dataArr select 4;
_offeror = _dataArr select 7;
if(_type == "Virtual") then {_price = _price + " per unit"};
_word = if(_buySell == 0) then {"Product for Sale"} else {"Product Requested"};
if(_type == "Weapon" && typeName (_dataArr select 3) == "ARRAY") then {
_attachments = (_dataArr select 3) select 1;
_attachWord = "";
{
	if(_x != "") then {
		_attachWord = _attachWord + (([_x] call life_fnc_fetchCfgDetails) select 1) + ", ";
	};
} forEach _attachments;

(getControl(2800,2803)) ctrlSetStructuredText parseText format[
"%3: %1<br/>Attachments: %4<br/>Offeror: %5<br/>Offer Price: <t color='#8cff9b'>$%2",
_displayName,
_price,
_word,
if(_attachWord != "") then {_attachWord} else {"None"},
_offeror
];
} else {
(getControl(2800,2803)) ctrlSetStructuredText parseText format[
"%3: %1<br/>Offeror: %4<br/>Offer Price: <t color='#8cff9b'>$%2",
_displayName,
_price,
_word,
_offeror
];
};
ctrlShow [2803,true];
ctrlShow [2830,true];