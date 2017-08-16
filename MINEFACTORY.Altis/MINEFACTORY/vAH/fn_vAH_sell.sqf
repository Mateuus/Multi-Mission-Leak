#include "..\..\script_macros.hpp"
/*
	File: fn_vAH_sell.sqf
	Author: Fresqo
	Description: sells items to our auction house and blah blah too much fml
*/

private["_able","_uid","_dialog","_myListbox","_myQuantity","_onGuy","_details","_tquantity","_myTotal","_price","_typeb","_type","_classname","_realName","_bad","_tax","_action","_selectedSell","_quantity","_tochangePriceText","_tochangePriceNumber","_tochangeQuantityText","_tochangeQuantityNumber","_invItem"];
disableSerialization;
_dialog = findDisplay 15600;
_myListbox = _dialog displayCtrl 15601;
_able = 10;

if (!vAH_loaded) exitWith {hint "Auction house is busy at the moment, please try again in a short while!"};

_bad = false;
_realName = "";

_uid = getPlayerUID player;
if (({_x select 5 == _uid} count all_ah_items) >= _able) exitWith {hint format["Du kannst nur %1 items einstellen!",_able];closeDialog 0;};

_price = ctrlText 15603;
_quantity = ctrlText 15602;

if(! ([_price] call TON_fnc_isnumber)) exitWith {hint "Du musst einen Preis eingeben";};
if(! ([_quantity] call TON_fnc_isnumber)) exitWith {hint "Du musst angeben wie viele zu Verkaufen möchtest";};
_price = parseNumber _price;
_quantity = parseNumber _quantity;

if (lbCurSel _myListbox < 0) exitWith {hint "Du musst ein Item auswählen";};
_selectedSell = call compile (_myListbox lbData (lbCurSel _myListbox));

_classname = _selectedSell select 0;
if (_classname == "yolo") exitWith {};
_typeb = _selectedSell select 1;
_invItem = [_selectedSell,2,3,[3]] call BIS_fnc_param;
if (_invItem != 3) exitWith {hint "You cannot sell an item that is already on the auction house, expired, or sold!"};
if(_typeb == "ymenu") then {_type = 0} else {_type = 1};

if (_price < 1) exitWith {hint "Invalid value"};
if (_price > 1500000) exitWith {hint "Zu großer Preis. Gib einen Realistischen Preis an!"};

_tax = round (_price * 0.03);

switch (_type) do
{
	case 0: {
				_realName =  ITEM_NAME(_classname);
				if (_quantity > 100) then {_bad = true; hint "Are you fucking kidding me, dont be a dickhead, put a proper amount in!"};
			};
	case 1: {if (_quantity > 1) then
			{
				_details = [_classname] call life_fnc_fetchCfgDetails;
				if (!(_details select 6 == "CfgMagazines")) then {
				hint "You can only sell 1 of any of this item!";_bad = true;};
				_onGuy = {_classname == _x} count (magazines player);
				if (_onGuy < _quantity) then {hint "You dont have that many!";_bad = true;}
			};
			_realName = ([_classname] call life_fnc_fetchCfgDetails) select 1;
			};
};

if (_bad) exitWith {closeDialog 0;};

_action = [format["Du musst $%1 bezahlen, um deine Items einzustellen. CONTINUE?",_tax],"MyBay Bestätigung","CONTINUE","CANCEL"] call BIS_fnc_guiMessage;
if(_action) then {
		if(BANK < _tax) exitWith {hint "You don't have enough money in the bank to pay the tax";_bad = true;};

	switch (_type) do {
		case 0: {if(!([false,_classname,_quantity] call life_fnc_handleInv)) then {hint "You dont have that many!";_bad = true;};};
		case 1: {
			_tquantity = _quantity +1;
			for [{_i=1}, {_i<_tquantity}, {_i=_i+1}] do
			{
				[_classname,false] spawn life_fnc_handleItem;
			};
		};
	};
	if (_bad) exitWith {closeDialog 0;};
	[4,_type,_quantity,_price,getPlayerUID player,_classname,_realName,name player] remoteExecCall ["TON_fnc_vAH_update",2];
	hint "Auction erfolgreich hinzugefügt. Es kann bis zu 10 Minuten dauern bis der Server die Liste Aktuallisiert.";
	BANK = BANK - _tax;
	closeDialog 0;
} else {
	closeDialog 0;
};

[1] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;
