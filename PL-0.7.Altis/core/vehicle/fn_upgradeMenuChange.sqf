#include "..\..\script_macros.hpp"
/*---------------------------------------------------------------------------
	File: fn_upgradeMenuChange.sqf
	Author: Skrow & Skyfezzer
	Date: 06/03/2017
	Description:
		*************************
---------------------------------------------------------------------------*/
private["_mode","_price","_ins","_trunk","_gps","_hooks","_security","_display","_hooksctrl","_gpsctrl","_securityctrl","_oldtrunk","_oldins","_oldhooks","_oldsecurity","_oldgps","_vehicle","_pchange","_baseprice"];
private["_oldinsprice","_insprice","_gpsco","_hooksco","_trunkco","_securityco","_trunkprice","_gpsprice","_hooksprice","_securityprice","_oldtrunkprice","_oldgpsprice","_oldhooksprice","_oldsecurityprice"];
_mode = [_this,0,-1,[0]] call BIS_fnc_param;
if(_mode == -1 || _value == -1 || _type == -1) exitWith {};
disableSerialization;

_vehicle = upgradeVehicle;

if(isNil "_vehicle") exitWith {hint "Vous n'êtes pas le propriétaire de ce véhicule"};
if(isNull _vehicle) exitWith {};

_price = 0;
_gps = false;
_hooks = false;
_security = false;


_gpsco = 0.15;
_hooksco = 0.25;
_trunkco = 0.1;
_securityco = 0.2;
_insprice = 0;

_display = findDisplay 5500;

_baseprice = M_CONFIG(getNumber,CONFIG_VEHICLES,typeOf _vehicle,"price");

// Getting variables from car
_oldtrunk = _vehicle getVariable["trunklevel", 0];
_oldins = _vehicle getVariable["insurance", 0];
_oldhooks = _vehicle getVariable["hooks", false];
_oldsecurity = _vehicle getVariable["security", false];
_oldgps = _vehicle getVariable["gps", false];

//Setting sliders and checkboxes
_ins = round(sliderPosition 5502);
ctrlSetText[5512,format["%1",round(_ins)]];
_trunk = round(sliderPosition 5501);
ctrlSetText[5511,format["%1",round(_trunk)]];
_securityctrl = _display displayCtrl 5503;
_hooksctrl = _display displayCtrl 5504;
_gpsctrl = _display displayCtrl 5505;
_gps = cbChecked _gpsctrl;
_hooks = cbChecked _hooksctrl;
_security = cbChecked _securityctrl;

_trunkprice = round(_trunk * _baseprice * _trunkco);
_oldtrunkprice = round(_oldtrunk * _baseprice * _trunkco);

if (_gps) then {
	_gpsprice = round(_gpsco * _baseprice);
} else {
	_gpsprice = 0;
};

if (_hooks) then {
	_hooksprice = round(_hooksco * _baseprice);
} else {
	_hooksprice = 0;
};

if (_security) then {
	_securityprice = round(_securityco * _baseprice);
} else {
	_securityprice = 0;
};

if (_oldgps) then {
	_oldgpsprice = round(_gpsco * _baseprice);
} else {
	_oldgpsprice = 0;
};

if (_oldhooks) then {
	_oldhooksprice = round(_hooksco * _baseprice);
} else {
	_oldhooksprice = 0;
};

if (_oldsecurity) then {
	_oldsecurityprice = round(_securityco * _baseprice);
} else {
	_oldsecurityprice = 0;
};

switch (_ins) do {
	case 1:
	{
		_insprice = 0.5 * _baseprice;
	};
	case 2:
	{
		_insprice = 0.5 * _baseprice + 0.3 * (_hooksprice + _trunkprice + _gpsprice + _securityprice);
	};
	case 3:
	{
		_insprice = 0.95 * _baseprice + 0.3 * (_hooksprice + _trunkprice + _gpsprice + _securityprice);
	};
	default
	{
		_insprice = 0;
	};
};

switch (_oldins) do {
	case 1:
	{
		_oldinsprice = 0.5 * _baseprice;
	};
	case 2:
	{
		_oldinsprice = 0.5 * _baseprice + 0.3 * (_oldhooksprice + _oldtrunkprice + _oldgpsprice + _oldsecurityprice);
	};
	case 3:
	{
		_oldinsprice = 0.95 * _baseprice + 0.3 * (_oldhooksprice + _oldtrunkprice + _oldgpsprice + _oldsecurityprice);
	};
	default
	{
		_oldinsprice = 0;
	};
};

_insprice = round(_insprice);
_oldinsprice = round(_oldinsprice);

_pricechanges = [];
_pricechanges pushBack round(_gpsprice - _oldgpsprice);
_pricechanges pushBack round(_insprice - _oldinsprice);
_pricechanges pushBack round(_hooksprice - _oldhooksprice);
_pricechanges pushBack round(_securityprice - _oldsecurityprice);
_pricechanges pushBack round(_trunkprice - _oldtrunkprice);

{
	if (_x < 0) then {
		_price = round(0.5 * _x) + _price;
	} else {
		_price = _price + _x;
	};
} forEach _pricechanges;

ctrlSetText [5510, format[" %1€",([_price] call life_fnc_numberText)]];

upgrade_price = _price;