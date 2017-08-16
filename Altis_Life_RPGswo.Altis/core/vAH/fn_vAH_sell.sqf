#include "..\..\macros.hpp"
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = 1;

if (!vAH_loaded) exitWith {hint "Das Auktionshaus ist zurzeit ausgelastet, versuche es später erneut!"};

_bad = false;
_realName = "";
switch (__GETC__(DWEV_donator)) do {
	case 1: {_able = 5};
	case 2: {_able = 5};
	case 3: {_able = 5};
	case 4: {_able = 5};
	case 5: {_able = 5};
	default {_able = 5};
};

if(__GETC__(DWEV_adminlevel) == 4) then { _able = 100; };

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Du kannst nur %1 Items verkaufen",_able];closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call DWF_fnc_isnumber)) exitWith {hint "Du musst einen Preis eingeben.";};
if(! ([_quantity] call DWF_fnc_isnumber)) exitWith {hint "Du musst eine Anzahl angeben.";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Du musst ein Item auswählen!";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = _selectedSell select 0;
if (_classname == "yolo") exitWith {};
_typeb = _selectedSell select 1;
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "Du kannst kein Item verkaufen, was bereits im Auktionshaus gelistet ist!"};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Kein Preis"};
if (_price > 9000000) exitWith {hint "Preis muss niedriger als 9 Millionen sein!"};

_tax = round (_price * 0.1); // 10%

switch (_type) do
{
	case 0: {
				_realName = M_CONFIG(getText,"VirtualItems",_classname,"displayName");

				if (_quantity > 100) then {_bad = true; hint "Du kannst maximal 100 Items auf einmal verkaufen!"};
			};
	case 1: {
		if (_quantity > 1) then	{
			_details = [_classname] call DWEV_fnc_fetchCfgDetails;
			if (!(_details select 6 == "CfgMagazines")) then {
				hint "Du kannst von diesen Items nur 1 verkaufen!";_bad = true;
			};
			_onGuy = {_classname == _x} count (magazines player);
			if (_onGuy < _quantity) then {hint "Du besitzt nicht genügend, um so viel zu verkaufen!";_bad = true;}
		};
		_realName = ([_classname] call DWEV_fnc_fetchCfgDetails) select 1;
	};
};

if (_bad) exitWith {closeDialog 0;};

_action = [format["Die Steuer (10 Prozent) beträgt %1 €. Willst du fortfahren?",_tax],"Auktionshaus - Steuer","FORTFAHREN","ABBRECHEN"] call BIS_fnc_guiMessage;
if(_action) then {
		if(dwf_atmcash < _tax) exitWith {hint format ["Du hast nicht genügend geld um die Steuer in Höhe von %1 € zu bezahlen, dir fehlen %2 €!",_tax, _tax - dwf_atmcash];_bad = true;};

	switch (_type) do {
	
		case 0:
		{
			if(!([false,_classname,_quantity] call DWEV_fnc_handlelnv)) then
			{
				hint "Du hast nicht so viele Items!";_bad = true;
			};
		};
		case 1:
		{
			_tquantity = _quantity +1;
			for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do
			{
				[_classname,false] call DWEV_fnc_handleItem;
			};
		};
	};
	if (_bad) exitWith {closeDialog 0;};
	[4,_type,_quantity,_price,getPlayerUID player,_classname,_realName,getMyName] remoteexec ["DWF_fnc_vAH_update",2];
	hint "Item wurde erfolgreich zum Verkauf gelistet! Du wirst benachrichtigt, sobald es verkauft wurde!";
	dwf_atmcash = dwf_atmcash - _tax;
	closeDialog 0;
} else {
	closeDialog 0;
};

[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
